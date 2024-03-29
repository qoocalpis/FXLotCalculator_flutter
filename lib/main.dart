import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/pages/first_loading_rate_page.dart';
import 'package:lot_size_calculator_app/services/google_sheet_service.dart';
import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:lot_size_calculator_app/services/isar_service.dart';
import 'package:onepref/onepref.dart';
import 'pages/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lot_size_calculator_app/l10n/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnePref.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool dataLoaded = false;

  Future<void> fetchData() async {
    final googleSheetService = GoogleSheetService.instance;
    final isarService = IsarService.instance;
    final purchaseApi = RevenueCatService.instance;
    // 非同期処理を実行
    final res1 = await googleSheetService.callGoogleSheetAPI();
    if (res1) {
      await isarService.createUser(googleSheetService.list);
      await purchaseApi.initInAppPurchase();

      // データを取得した後、画面を更新
      setState(() {
        dataLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark), // ダーク用テーマ
      //themeMode: ThemeMode.system, // モードをシステム設定にする
      home: dataLoaded ? const MainScreen() : const FirstLoadingRatePage(),
    );
  }
}
