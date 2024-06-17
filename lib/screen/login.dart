import 'package:flutter/material.dart';
import '../ui/my_input.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../app/login_provider.dart';

class Login extends HookConsumerWidget {
  // ประกาศตัวแปร
  final _form = GlobalKey<FormState>();
  final _userCode = TextEditingController();
  final _password = TextEditingController();

  // validator
  String? validateUserCode(String? value) {
    if (value!.isEmpty) {
      return "กรุณาระบุรหัสพนักงาน";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "กรุณาระบุรหัสผ่าน";
    }
    if (value.length < 8) {
      return "รหัสผ่านต้องมากกว่าหรือเท่ากับ 8 ตัวอักษร";
    }
    return null;
  }

  // custom function
  void doLogin(BuildContext context, WidgetRef ref) async {
    if (_form.currentState!.validate()) {
      try {
        final resp = await Dio().post(
          "https://bde299da1f63db3df1d7b4eb536ecf0b.serveo.net/login",
          data: {
            "userCode": _userCode.text,
            "password": _password.text,
          },
        );
        if (resp.data["success"]) {
          // navigate to /main
          ref.read(firstNameProvider.notifier).state = resp.data["firstName"];
          ref.read(lastNameProvider.notifier).state = resp.data["lastName"];
          Navigator.of(context).pushReplacementNamed("/main");
        } else {
          // show warning
          showDialog(
            context: context,
            builder: (BuildContext buildContext) {
              return const AlertDialog(
                title: Text("แจ้งเตือน"),
                content: Text("เข้าระบบไม่สำเร็จ กรุณาลองอีกครั้ง"),
              );
            },
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  // go to register screen
  void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }

  // แสดงผล
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                SizedBox(height: 100),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100, // กำหนดขนาดความกว้าง
                        height: 100, // กำหนดขนาดความสูง
                        child: Image.asset("images/logo.jpg"),
                      ),
                      SizedBox(
                          height: 40), // เพิ่มความห่างระหว่างโลโก้และ Input
                      Form(
                        key: _form,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: MyInput(
                                label: 'รหัสพนักงาน',
                                icon: const Icon(Icons.person),
                                iconColor: Colors.blue.shade800,
                                validator: validateUserCode,
                                controller: _userCode,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: MyInput(
                                label: 'รหัสผ่าน',
                                obscureText: true,
                                icon: const Icon(Icons.lock),
                                iconColor: Colors.orange.shade800,
                                validator: validatePassword,
                                controller: _password,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade600,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () => doLogin(context, ref),
                                      child: const Text("เข้าสู่ระบบ"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey.shade400,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text("ยกเลิก"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () => goToRegister(context),
                                child: Text(
                                  "ลงทะเบียนผู้ใช้ใหม่",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue.shade600,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
