import 'package:flutter/material.dart';

import '../../../route/route_list.dart';
import '../../../theme/theme_color.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //khai bao bien
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool ShowPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue001D37,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                'https://vieclamnhamay.vn/uploads/images/2021/12/30-09/LOGO.jpg',
                scale: 3,
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Đăng nhập',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            const Text(
              'Tên đăng nhập',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            //Text Field Username
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 25),
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: _usernameController,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: 'Tên đăng nhập',
                  hintStyle: TextStyle(
                    color: AppColor.gray767676,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Text(
              'Mật khẩu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            //Text field Password
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              padding: const EdgeInsets.only(left: 10),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    controller: _passwordController,
                    obscureText: ShowPass,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Mật khẩu',
                      hintStyle: TextStyle(
                        color: AppColor.gray767676,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: ShowPass
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                ShowPass = false;
                              });
                            },
                            icon: const Icon(Icons.visibility_off),
                            iconSize: 20,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                ShowPass = true;
                              });
                            },
                            icon: const Icon(Icons.visibility),
                            iconSize: 20,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                  ),
                ],
              ),
            ),
            // nut sign in
            SignInButton(),
          ],
        ),
      ),
    );
  }

  Center SignInButton() {
    final _signInBtn = TextButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteList.home);
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(15),
      ),
      child: const Text(
        'Đăng nhập',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: _signInBtn,
        ),
      ),
    );
  }
}
