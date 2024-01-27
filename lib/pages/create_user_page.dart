import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/pages/widgets/authorization_user.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  // 入力されたユーザーの名前
  String newUser = "";
  // 入力されたメールアドレス
  String newUserEmail = "";
  // 入力されたパスワード
  String newUserPassword = "";
  // 登録・ログインに関する情報を表示
  String infoText = "";
  // FireStoreにユーザー情報を登録する関数を定義
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> Register() {
    // 上で定義したメンバ変数を格納すると、usersコレクションに、
    // メールアドレスとパスワードも保存できる。
    return users
        .add({
          'name': newUser,
          'email': newUserEmail,
          'password': newUserPassword
        })
        .then((value) => print("新規登録に成功"))
        .catchError((error) => print("新規登録に失敗しました!: $error"));
  }

  // メールアドレスとパスワードを登録する関数を定義
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> createAuth() async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
      email: newUserEmail,
      password: newUserPassword,
    );
    final User user = result.user!;
    print(result.user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー登録'),
      ),
      // キーボードで隠れて、黄色エラーが出るので
      // SingleChildScrollViewで、Centerウイジットをラップする
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // かっこよくしたいので、画像を配置した!
                const CircleAvatar(
                  radius: 75,
                  // images.unsplash.comの画像のパスを貼り付ける
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1658033014478-cc3b36e31a5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  // テキスト入力のラベルを設定
                  decoration: InputDecoration(labelText: "ユーザー名"),
                  onChanged: (String value) {
                    setState(() {
                      newUser = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  // テキスト入力のラベルを設定
                  decoration: InputDecoration(labelText: "メールアドレス"),
                  onChanged: (String value) {
                    setState(() {
                      newUserEmail = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(labelText: "パスワード（６文字以上）"),
                  // パスワードが見えないようにする
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      newUserPassword = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // FireStoreにユーザー情報を登録する関数
                      Register();
                      // メール/パスワードでユーザー登録
                      createAuth();
                      // 登録したユーザー情報
                    } catch (e) {
                      // 登録に失敗した場合
                      setState(() {
                        infoText = "登録NG:${e.toString()}";
                      });
                    }
                  },
                  child: Text("ユーザー登録"),
                ),
                const SizedBox(height: 8),
                Text(infoText),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  // ログイン登録ボタン
                  child: OutlinedButton(
                    child: Text('ログイン'),
                    onPressed: () async {
                      try {
                        // メール/パスワードでログイン
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final result = await auth.signInWithEmailAndPassword(
                          email: newUserEmail,
                          password: newUserPassword,
                        );
                        // ログインに成功した場合
                        print("ログイン成功");
                        print(result.user!.uid);
                        //ni5vuGimHfOHwsCOQC0NyVdmpWq2
                      } catch (e) {
                        print("ログイン失敗");

                        /* --- 省略 --- */
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
