import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lot_size_calculator_app/pages/widgets/comon_alert_dailog.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/services/isar_service.dart';
import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthorizationUser extends ConsumerStatefulWidget {
  const AuthorizationUser({super.key, required this.isCreateUser});

  final bool isCreateUser;
  @override
  ConsumerState<AuthorizationUser> createState() => _AuthorizationUserState();
}

class _AuthorizationUserState extends ConsumerState<AuthorizationUser> {
  String userEmail = AppConst.strEmpty;
  String userPass = AppConst.strEmpty;
  bool warningEnptyEmail = false;
  bool warningEnptyPass = false;
  String warningErrorText = AppConst.strEmpty;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final RevenueCatService revenueCatService = RevenueCatService.instance;
  final isar = IsarService.instance;
  @override
  Widget build(
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !widget.isCreateUser ? const Text('ログイン') : const Text('アカウント登録'),
          !widget.isCreateUser
              ? const Text(
                  '※購入情報の復元',
                  style: TextStyle(fontSize: 10),
                )
              : const Text(
                  '※購入情報の復元の際に必要になります',
                  style: TextStyle(fontSize: 10),
                ),
        ],
      ),
      content: SizedBox(
        height: screenHeight * 0.3,
        width: screenWidth * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              keyboardType: TextInputType.emailAddress,
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
              keyboardType: TextInputType.visiblePassword,
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
            Column(
              children: [
                SignInButton(
                  Buttons.google,
                  text: "Sign in with Google",
                  onPressed: () async {
                    await gooleSignIn(context, widget.isCreateUser);
                  },
                ),

                // SignInButton(
                //   Buttons.apple,
                //   text: !widget.isCreateUser
                //      ? "Sign in with Apple"
                //      : "Sign up with Apple",
                //  onPressed: () {},
                // )
              ],
            ),
            // with custom text
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
            final res = widget.isCreateUser
                ? await createMailPass()
                : await loginMailPass();
            if (!mounted) return;
            if (res) {
              Navigator.of(context).pop();
              widget.isCreateUser
                  ? Navigator.of(context).pop()
                  : null; // ダイアログを閉じる
            }
          },
        ),
      ],
    );
  }

  Future<void> gooleSignIn(BuildContext context, bool isPurchased) async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // userCredentialには、Firebaseの認証情報が入っている
      final userCredential = await auth.signInWithCredential(credential);
      if (!mounted) return;
      final uid = userCredential.user!.uid;
      if (uid != AppConst.strEmpty) {
        final result = await Purchases.logIn(uid);
        await revenueCatService.getPurchaserInfo(result.customerInfo);

        if (widget.isCreateUser && !revenueCatService.isPurchased) {
          await revenueCatService.makePurchase(uid);
        }

        if (widget.isCreateUser && revenueCatService.isPurchased) {
          if (!mounted) return;
          showDialog(
            context: context,
            builder: (_) {
              return const CommonAlertDialog(
                title: "確認",
                content: "既に購入済みの商品です。アプリに反映致しました。",
              );
            },
          );
        }
        ref
            .read(inAppPurchaseNotifierProvider.notifier)
            .setProperty(revenueCatService.isPurchased);
        await isar.saveUid(uid);
        if (!mounted) return;
        Navigator.of(context).pop();
        widget.isCreateUser ? Navigator.of(context).pop() : null; // ダイアログを閉じる
      }
    } on PlatformException catch (e) {
      // ここで、エラー処理をする
      if (e.code == 'sign_in_canceled') {
        print('User canceled the Google sign-in process');
      } else {
        print(e.code);
        print(e.message);
      }
      warningErrorText = e.code;
    }
  }

  Future<bool> loginMailPass() async {
    try {
      final a1 = userEmail == AppConst.strEmpty;
      final a2 = userPass == AppConst.strEmpty;
      if (a1) warningEnptyEmail = true;
      if (a2) warningEnptyPass = true;
      if (a1 || a2) {
        setState(() {});
        return false;
      }
      // メール/パスワードでログイン
      final userCredential = await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPass,
      );
      if (!mounted) return false;
      final result = await Purchases.logIn(userCredential.user!.uid);
      await revenueCatService.getPurchaserInfo(result.customerInfo);
      ref
          .read(inAppPurchaseNotifierProvider.notifier)
          .setProperty(revenueCatService.isPurchased);
      await isar.saveUid(userCredential.user!.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        warningErrorText = "メールアドレスが有効ではありません";
      } else {
        warningErrorText = "メールアドレスまたはパスワードが間違っています";
      }
      print(e.code);
      setState(() {});
      return false;
    }
  }

  Future<bool> createMailPass() async {
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
      if (a1 || a2) return false;

      // メール/パスワードで登録
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPass,
      );
      await revenueCatService.makePurchase(userCredential.user!.uid);
      ref
          .read(inAppPurchaseNotifierProvider.notifier)
          .setProperty(revenueCatService.isPurchased);
      await isar.saveUid(userCredential.user!.uid);
      return true;
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
      return false;
    }
  }
}
