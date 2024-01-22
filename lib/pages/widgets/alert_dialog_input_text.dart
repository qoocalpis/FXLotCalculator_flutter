import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class AlertDialogInputText extends ConsumerStatefulWidget {
  const AlertDialogInputText({super.key, required this.isCreateUser});

  final bool isCreateUser;
  @override
  ConsumerState<AlertDialogInputText> createState() =>
      _AlertDialogInputTextState();
}

class _AlertDialogInputTextState extends ConsumerState<AlertDialogInputText> {
  String userEmail = AppConst.strEmpty;
  String userPass = AppConst.strEmpty;
  bool warningEnptyEmail = false;
  bool warningEnptyPass = false;
  String warningErrorText = AppConst.strEmpty;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: !widget.isCreateUser ? const Text('サインイン') : const Text('アカウント登録'),
      content: SizedBox(
        height: screenHeight * 0.2,
        width: screenWidth * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            warningErrorText == AppConst.strEmpty
                ? const SizedBox()
                : Text(
                    warningErrorText,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
            TextField(
              decoration: InputDecoration(
                hintText: "メールアドレス",
                hintStyle: TextStyle(
                  color: warningEnptyEmail
                      ? Colors.red
                      : Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                ),
              ),
              onChanged: (value) {
                userEmail = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "パスワード",
                hintStyle: TextStyle(
                  color: warningEnptyPass
                      ? Colors.red
                      : Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                ),
              ),
              onChanged: (value) {
                userPass = value;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('キャンセル'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('OK'),
          //OKを押したあとの処理
          onPressed: () async {
            widget.isCreateUser ? create() : login();
          },
        ),
      ],
    );
  }

  void login() async {
    try {
      final a1 = userEmail == AppConst.strEmpty;
      final a2 = userPass == AppConst.strEmpty;
      if (a1) warningEnptyEmail = true;
      if (a2) warningEnptyPass = true;
      if (a1 || a2) {
        setState(() {});
        return;
      }
      // メール/パスワードでログイン
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPass,
      );
      if (!mounted) return;
      ref.read(inAppPurchaseNotifierProvider.notifier).setProperty(true);
      Navigator.of(context).pop(); // ダイアログを閉じる
      Navigator.of(context).pop(); // 一つ前の画面に戻る
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        warningErrorText = "メールアドレスが有効ではありません";
      } else {
        warningErrorText = "メールアドレスまたはパスワードが間違っています";
      }
      print(e.code);
      setState(() {});
    }
  }

  void create() async {
    try {
      final a1 = userEmail == AppConst.strEmpty;
      final a2 = userPass == AppConst.strEmpty;
      if (a1) {
        warningEnptyEmail = true;
        setState(() {});
      }
      if (a2) {
        warningEnptyPass = true;
        setState(() {});
      }
      if (a1 || a2) return;

      // メール/パスワードでログイン
      final FirebaseAuth auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPass,
      );
      if (!mounted) return;
      ref.read(inAppPurchaseNotifierProvider.notifier).setProperty(true);
      // ログインに成功した場合
      print("ログイン成功");
      Navigator.of(context).pop(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        warningErrorText = "メールアドレスが有効ではありません";
      } else if (e.code == "email-already-in-use") {
        warningErrorText = "メールアドレスが既に登録済みです";
      } else if (e.code == "weak-password") {
        warningErrorText = "より強いパスワードを設定してください";
      } else {
        warningErrorText = e.code;
      }
      print(e.code);
      setState(() {});
    }
  }
}
