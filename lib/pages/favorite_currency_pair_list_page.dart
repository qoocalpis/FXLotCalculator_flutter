import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/pages/currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/favorite_currency_pair_list_cell.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/services/db_model/currency_pair.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';

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
  late List<GoogleSheetAPIModel> googleSheetAPIModelList = [];
  late List<CurrencyPair> currencyPairList = [];
  late List<String> currencyPairFullNameList = [];
  late int _index;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
        title:
            Text(AppLocalizations.of(context)!.favoriteCurrencyPairListTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (int i = 0; i < googleSheetAPIModelList.length; i++)
              FavoriteCurrencyPairListCell(
                title: googleSheetAPIModelList[i].currencyPair,
                subTitle: googleSheetAPIModelList[i].rate,
                selected: _index == i,
                onTap: (context) {
                  if (_index == i) {
                    return;
                  }
                  _index = i;
                  _tapTile(currencyPairList[i].pair, true);
                },
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: screenHeight * 0.075,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              AppLocalizations.of(context)!.lastUpdatedTime,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              googleSheet.date,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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

  Future<void> initialize() async {
    if (kDebugMode) {
      print('FavoriteCurrencyPairListPage initialize');
    }
    currencyPairList.clear();
    googleSheetAPIModelList.clear();
    currencyPairList = await isar.fechFavoriteCurrencyPairList();
    var index = 0;
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
}
