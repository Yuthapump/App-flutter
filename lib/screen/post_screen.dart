import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  Future<List> fetchPost() async {
    try {
      final resp =
          await Dio().get<List>("https://jsonplaceholder.typicode.com/posts");
      if (resp.statusCode == 200) {
        return resp.data ?? [];
      }
      return [];
    } catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("บทความ"),
      ),
      body: FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var d = snapshot.data![index];
                return ListTile(
                  leading: Text("${d["id"]}"),
                  title: Text("${d["title"]}"),
                  subtitle: Text("${d["body"]}"),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

/*
[
            ListTile(
              leading: Text("1"),
              title: Text("xxxxxxxx"),
              subtitle: Text("yyyyyyyyy"),
            )
          ]
*/