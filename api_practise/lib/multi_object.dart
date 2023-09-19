import 'dart:convert';

import 'package:api_practise/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MultiObject extends StatefulWidget {
  const MultiObject({super.key});

  @override
  State<MultiObject> createState() => _MultiObjectState();
}

class _MultiObjectState extends State<MultiObject> {
  List<Users> userList = [];

  Future<List<Users>> getusersApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(Users.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi_Object"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getusersApi(),
              builder: ((context, snapshot) {
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        return Card(
                          child: Column(
                            children: [
                              ReUseableRow(
                                title: "Name",
                                value: snapshot.data![index].name.toString(),
                              ),
                              ReUseableRow(
                                title: "Email",
                                value: snapshot.data![index].email.toString(),
                              ),
                              ReUseableRow(
                                title: "Name",
                                value: snapshot.data![index].name.toString(),
                              ),
                              ReUseableRow(
                                title: "Name",
                                value: snapshot.data![index].name.toString(),
                              ),
                            ],
                          ),
                        );
                      }
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ReUseableRow extends StatelessWidget {
  String title, value;
  ReUseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * .20,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width * .70,
          child: Text(value),
        ),
      ],
    );
  }
}
