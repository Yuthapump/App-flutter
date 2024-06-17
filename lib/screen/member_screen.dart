import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../app/login_provider.dart';

class MemberScreen extends HookConsumerWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.read(firstNameProvider);
    final lastName = ref.read(lastNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Membercard"),
        backgroundColor: Color.fromARGB(255, 8, 233, 83),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // เพิ่มการกระทำเมื่อคลิกที่ปุ่มการตั้งค่า
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 233, 83),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/1464577453398056966/EObLOPIk_400x400.jpg", // URL ของรูปโปรไฟล์
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "สวัสดี คุณ $firstName $lastName",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue.shade600),
                title: Text("ข้อมูลส่วนตัว"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // เพิ่มการกระทำเมื่อคลิกที่รายการนี้
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.book, color: Colors.orange.shade600),
                title: Text("คอร์สของฉัน"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // เพิ่มการกระทำเมื่อคลิกที่รายการนี้
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.house, color: Colors.green.shade600),
                title: Text("บริการอื่นๆของฉัน"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // เพิ่มการกระทำเมื่อคลิกที่รายการนี้
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.grey.shade600),
                title: Text("แก้ไขโปรไฟล์"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // เพิ่มการกระทำเมื่อคลิกที่รายการนี้
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
