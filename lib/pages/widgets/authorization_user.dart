import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/isar_service.dart';
import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthorizationUser extends ConsumerStatefulWidget {
  const AuthorizationUser({super.key});

  @override
  ConsumerState<AuthorizationUser> createState() => _AuthorizationUserState();
}

class _AuthorizationUserState extends ConsumerState<AuthorizationUser> {
  String warningErrorText = AppConst.strEmpty;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final RevenueCatService revenueCatService = RevenueCatService.instance;
  final isar = IsarService.instance;
  static const googleText = "Google";
  // static const appleText = "Apple";

  @override
  Widget build(
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final userAuthType = ref.watch(userModelNotifierProvider).when(
          loading: () => AppConst.strEmpty,
          error: (e, s) => AppConst.strEmpty,
          data: (d) => d.user.userAuthType,
        );
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
    return AlertDialog(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ユーザー認証'),
          Text(
            '※購入情報の復元の際に必要になります',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
      content: SizedBox(
        height: screenHeight * 0.15,
        width: screenWidth * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignInButton(
                  Buttons.google,
                  text: googleText,
                  onPressed: () async {
                    final res = userAuthType == AppConst.strEmpty
                        ? await gooleSignIn(googleText)
                        : false;
                    if (res) {
                      ref
                          .read(inAppPurchaseNotifierProvider.notifier)
                          .setProperty(revenueCatService.isPurchased);

                      ref
                          .read(userModelNotifierProvider.notifier)
                          .updateUserAuthTypeProperty();
                    }
                  },
                ),
                Text(
                  userAuthType == googleText ? "認証済み" : AppConst.strEmpty,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SignInButton(
            //       Buttons.apple,
            //       text: appleText,
            //       onPressed: () async {
            //         userAuthType == AppConst.strEmpty ? null : null;
            //       },
            //     ),
            //     Text(
            //       userAuthType == appleText ? "認証済み" : AppConst.strEmpty,
            //       style: const TextStyle(fontSize: 10),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Back'),
          onPressed: () {
            final c1 = userModelProvider!.user.uid != AppConst.strEmpty;
            final c2 = userModelProvider.user.userAuthType != AppConst.strEmpty;
            if (c1 && c2) {
              Navigator.pop(context, true);
            } else {
              Navigator.pop(context, false);
            }
          },
        ),
      ],
    );
  }

  Future<bool> gooleSignIn(String userAuthType) async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // userCredentialには、Firebaseの認証情報が入っている
      final userCredential = await auth.signInWithCredential(credential);
      if (!mounted) return false;
      final uid = userCredential.user!.uid;
      if (uid != AppConst.strEmpty) {
        final result = await Purchases.logIn(uid);
        await revenueCatService.getPurchaserInfo(result.customerInfo);
        await isar.saveUid(uid, userAuthType);
        return true;
      }
      return false;
    } on PlatformException catch (e) {
      // ここで、エラー処理をする
      if (e.code == 'sign_in_canceled') {
        print('User canceled the Google sign-in process');
      } else {
        print(e.code);
        print(e.message);
      }
      warningErrorText = e.code;
      return false;
    }
  }
  // Future<bool> loginMailPass() async {
  //   try {
  //     final a1 = userEmail == AppConst.strEmpty;
  //     final a2 = userPass == AppConst.strEmpty;
  //     if (a1) warningEnptyEmail = true;
  //     if (a2) warningEnptyPass = true;
  //     if (a1 || a2) {
  //       setState(() {});
  //       return false;
  //     }
  //     // メール/パスワードでログイン
  //     final userCredential = await auth.signInWithEmailAndPassword(
  //       email: userEmail,
  //       password: userPass,
  //     );
  //     if (!mounted) return false;
  //     final result = await Purchases.logIn(userCredential.user!.uid);
  //     await revenueCatService.getPurchaserInfo(result.customerInfo);
  //     ref
  //         .read(inAppPurchaseNotifierProvider.notifier)
  //         .setProperty(revenueCatService.isPurchased);
  //     await isar.saveUid(userCredential.user!.uid);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "invalid-email") {
  //       warningErrorText = "メールアドレスが有効ではありません";
  //     } else {
  //       warningErrorText = "メールアドレスまたはパスワードが間違っています";
  //     }
  //     print(e.code);
  //     setState(() {});
  //     return false;
  //   }
  // }

  // Future<bool> createMailPass() async {
  //   try {
  //     final a1 = userEmail == AppConst.strEmpty;
  //     final a2 = userPass == AppConst.strEmpty;
  //     if (a1) {
  //       warningEnptyEmail = true;
  //       setState(() {});
  //     }
  //     if (a2) {
  //       warningEnptyPass = true;
  //       setState(() {});
  //     }
  //     if (a1 || a2) return false;

  //     // メール/パスワードで登録
  //     final userCredential = await auth.createUserWithEmailAndPassword(
  //       email: userEmail,
  //       password: userPass,
  //     );
  //     await revenueCatService.makePurchase(userCredential.user!.uid);
  //     ref
  //         .read(inAppPurchaseNotifierProvider.notifier)
  //         .setProperty(revenueCatService.isPurchased);
  //     await isar.saveUid(userCredential.user!.uid);
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "invalid-email") {
  //       warningErrorText = "メールアドレスが有効ではありません";
  //     } else if (e.code == "email-already-in-use") {
  //       warningErrorText = "メールアドレスが既に登録済みです";
  //     } else if (e.code == "weak-password") {
  //       warningErrorText = "より強いパスワードを設定してください";
  //     } else {
  //       warningErrorText = e.code;
  //     }
  //     print(e.code);
  //     setState(() {});
  //     return false;
  //   }
  // }
}
