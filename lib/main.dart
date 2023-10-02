import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:lot_size_calculator_app/db_model/favorite_currency_pair.dart';
import 'package:lot_size_calculator_app/db_model/user.dart';
import 'pages/app_home_page.dart';
// import 'pages/first_loading_rate_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/l10n/l10n.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
      [TestUserSchema, TestFavoriteCurrencyPairsListSchema],
      directory: dir.path);
  final testUsers = isar.testUsers;
  if (testUsers == null) {
    print('nooooooo');
  } else {
    //スキーマが作成済みの場合
    print('testUsers');
  }
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.all,
      locale: const Locale('ja'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark), // ダーク用テーマ
      //themeMode: ThemeMode.system, // モードをシステム設定にする
      // home: const FirstLoadingRatePage(),
      home: const AppHomePage(),
    );
  }
}
