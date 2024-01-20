import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';

class AlertDialogInputText extends StatefulWidget {
  const AlertDialogInputText({super.key});

  @override
  State<AlertDialogInputText> createState() => _AlertDialogInputTextState();
}

class _AlertDialogInputTextState extends State<AlertDialogInputText> {
  String userEmail = "";
  String userPass = "";
  bool warningEnptyEmail = false;
  bool warningEnptyPass = false;
  bool warningError = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: const Text('サインイン'),
      content: SizedBox(
        height: screenHeight * 0.2,
        width: screenWidth * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            !warningError
                ? const SizedBox()
                : const Text(
                    "メールアドレスまたはパスワードが間違っています",
                    style: TextStyle(
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
              if (a1 || a2) {
                return;
              }
              // メール/パスワードでログイン
              final FirebaseAuth auth = FirebaseAuth.instance;
              final result = await auth.signInWithEmailAndPassword(
                email: userEmail,
                password: userPass,
              );
              if (!mounted) return;

              // ログインに成功した場合
              print("ログイン成功");
              Navigator.pop(context);
            } catch (e) {
              /* --- 省略 --- */
              print("ログイン失敗");
              warningError = true;
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
