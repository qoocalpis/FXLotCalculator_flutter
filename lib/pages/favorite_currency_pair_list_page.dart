import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/pages/currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/first_loading_rate_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/favorite_currency_pair_list_cell.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class FavoriteCurrencyPairListPage extends ConsumerStatefulWidget {
  const FavoriteCurrencyPairListPage({super.key});

  @override
  FavoriteCurrencyPairListState createState() =>
      FavoriteCurrencyPairListState();
}

class FavoriteCurrencyPairListState
    extends ConsumerState<FavoriteCurrencyPairListPage> {
  final isar = IsarService.instance;
  final googleSheet = GoogleSheetService.instance;
  List<GoogleSheetAPIModel> googleSheetAPIModelList = [];
  List<CurrencyPair> currencyPairList = [];
  late List<String> currencyPairFullNameList = [];
  late int _index;
  bool _isVisible = false;
  bool _dataLoading = false;

  String _textDate = AppConst.strEmpty;
  @override
  void initState() {
    super.initState();
    initialize();
    _updateStateIfNeeded();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    _updateStateIfNeeded();

    final screenHeight = MediaQuery.of(context).size.height;
    final List<CurrencyPairModel> currencyPairListProvider = ref
        .watch(currencyPairModelNotifierProvider)
        .when(
          loading: () => [],
          error: (e, s) => [],
          data: (d) =>
              d.where((element) => element.addedToFavorite == true).toList(),
        );
    return _dataLoading
        ? const FirstLoadingRatePage()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.mainBgColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.first_page,
                  size: 35,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              title: Text(
                  AppLocalizations.of(context)!.favoriteCurrencyPairListTitle),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < currencyPairListProvider.length; i++)
                    FavoriteCurrencyPairListCell(
                      title: currencyPairListProvider[i].currencyPair,
                      subTitle: currencyPairListProvider[i].rate,
                      selected: currencyPairListProvider[i].selected,
                      onTap: (context) {
                        if (currencyPairListProvider[i].selected) {
                          return;
                        }
                        final notifier = ref
                            .read(currencyPairModelNotifierProvider.notifier);

                        notifier.onChangeSelectedProperty(
                            currencyPairListProvider[i].currencyPair, true);
                        Navigator.of(context).pop(true);
                      },
                    ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: screenHeight * 0.087,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.refresh,
                    color: Color.fromARGB(0, 33, 149, 243),
                    size: 35,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.lastUpdatedTime,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        _textDate,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  !_isVisible
                      ? const SizedBox()
                      : IconButton(
                          onPressed: () async {
                            _dataLoading = true;

                            final notifier = ref.read(
                                currencyPairModelNotifierProvider.notifier);
                            notifier.onChangeRateProperty();
                            setState(() {
                              _textDate = googleSheet.date;
                              _isVisible = false;
                            });
                            _dataLoading = false;
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.blue,
                            size: 35,
                          ),
                        ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CurrencyPairListPage(),
                  ),
                ).then(
                  (result) {
                    initialize();
                  },
                );
              },
            ),
          );
  }

  List<Widget> favoriteCurrencyPairWidgetList(List<CurrencyPairModel> list) {
    if (googleSheetAPIModelList.isEmpty || list.isEmpty) {
      return [];
    } else {
      List<FavoriteCurrencyPairListCell> widgetList = [];

      for (int i = 0; i < googleSheetAPIModelList.length; i++) {
        final cell = FavoriteCurrencyPairListCell(
          title: googleSheetAPIModelList[i].currencyPair,
          subTitle: list[i].rate,
          selected: _index == i,
          onTap: (context) {
            if (_index == i) {
              return;
            }
            _index = i;
            _tapTile(currencyPairList[i].pair, true);
            Navigator.of(context).pop(true);
          },
        );
        widgetList.add(cell);
      }
      return widgetList;
    }
  }

  Future<void> initialize() async {
    if (kDebugMode) {
      print('FavoriteCurrencyPairListPage initialize');
    }
    currencyPairList.clear();
    googleSheetAPIModelList.clear();
    currencyPairList = await isar.fechFavoriteCurrencyPairList();
    var index = 0;
    _textDate = googleSheet.date;

    for (var i in currencyPairList) {
      for (var j in googleSheet.list) {
        if (i.pair == j.currencyPair) {
          if (i.selected) {
            _index = index;
          }
          googleSheetAPIModelList.add(j);
        }
      }
      index++;
    }
    setState(() {});
  }

  Future<void> _tapTile(String pair, bool selected) async {
    final notifier = ref.read(currencyPairModelNotifierProvider.notifier);
    notifier.onChangeSelectedProperty(pair, selected);
    setState(() {});
  }

  void _updateStateIfNeeded() {
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(googleSheet.now!);

    // differenceが2分以上経過していればsetStateを実行
    if (difference.inMinutes >= 2) {
      setState(() {
        // ここに状態を更新するロジックを書く
        // 例えば、_lastUpdateTimeを現在の時間に更新するなど
        _isVisible = true;
      });
    }
  }
}
