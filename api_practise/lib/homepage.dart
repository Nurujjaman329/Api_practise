import 'dart:convert';

import 'package:api_practise/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> user = [];

  Future<List<Users>> getpostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        user.add(Users.fromJson(i));
      }
      return user;
    } else {
      return user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Api_Practise",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getpostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return Text(index.toString());
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
