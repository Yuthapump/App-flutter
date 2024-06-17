import 'package:flutter/material.dart';
import '/ui/my_input.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // variable declare
  final _registerForm = GlobalKey<FormState>();
  final _userName = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _password = TextEditingController();
  final _age = TextEditingController();

  // custom function
  void whenRegister() async {
    if (_registerForm.currentState!.validate()) {
      try {
        final resp = await Dio().post(
          "https://bde299da1f63db3df1d7b4eb536ecf0b.serveo.net/register",
          data: {
            "userCode": _userName.text,
            "firstName": _firstName.text,
            "lastName": _lastName.text,
            "password": _password.text,
            "age": int.parse(_age.text),
          },
        );
        if (resp.data["success"]) {
          // when success is true
          // navigate to /login
          Navigator.pop(context);
        } else {
          // when success is false
          // show alert dialog
          showDialog(
            context: context,
            builder: (BuildContext buildContext) {
              return const AlertDialog(
                title: Text("แจ้งเตือน"),
                content: Text("ลงทะเบียนไม่สำเร็จ กรุณาลองอีกครั้ง"),
              );
            },
          );
        }
      } catch (e) {
        print(
          e.toString(),
        );
      }
    }
  }

  // reset form
  void whenReset() {
    _registerForm.currentState!.reset();
  }

  // validator
  String? _myValidator(String? value, String label, int min, int max) {
    if (value!.isEmpty) {
      return "กรุณาระบุ$label";
    }
    if (value.length < min) {
      return "ระบุ$labelขั้นต่ำ $min ตัวอักษร";
    }
    if (value.length > max) {
      return "รหัส$labelห้ามเกิน $max ตัวอักษร";
    }
    return null;
  }

  String? _myIntValidator(
      String? value, String label, int minValue, int maxValue) {
    if (value!.isEmpty) {
      return "กรุณาระบุ$label";
    }
    int intValue = int.parse(value);
    if (intValue < minValue) {
      return "$label ต้องมากกว่า $minValue";
    }
    if (intValue > maxValue) {
      return "$label ต้องน้อยกว่า $maxValue";
    }
    return null;
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ลงทะเบียน"),
        backgroundColor: Colors.indigo.shade800,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _registerForm,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInput(
                  label: "รหัสพนักงาน",
                  controller: _userName,
                  validator: (value) =>
                      _myValidator(value, 'รหัสพนักงาน', 5, 150),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInput(
                  label: "ชื่อ",
                  controller: _firstName,
                  validator: (value) => _myValidator(value, 'ชื่อ', 1, 150),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInput(
                  label: "นามสกุล",
                  controller: _lastName,
                  validator: (value) => _myValidator(value, 'นามสกุล', 1, 150),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInput(
                  label: "รหัสผ่าน",
                  controller: _password,
                  validator: (value) => _myValidator(value, 'รหัสผ่าน', 8, 25),
                ),
              ),
              MyInput(
                label: "อายุ",
                controller: _age,
                validator: (value) => _myIntValidator(value, "อายุ", 18, 99),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: whenRegister,
                        child: Text("ลงทะเบียน"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: whenReset,
                        child: const Text("ยกเลิก"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
