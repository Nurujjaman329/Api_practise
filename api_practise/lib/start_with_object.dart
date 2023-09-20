import 'dart:convert';

import 'package:api_practise/start_with_object_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StartWithObject extends StatefulWidget {
  const StartWithObject({super.key});

  @override
  State<StartWithObject> createState() => _StartWithObjectState();
}

class _StartWithObjectState extends State<StartWithObject> {
  Future<StartWithObj> getApi() async {
    final response = await http.get(
      Uri.parse("https://webhook.site/5c3efa35-c2b2-4e66-8d78-9f991e584a0c"),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return StartWithObj.fromJson(data);
    } else {
      return StartWithObj.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Start_With_Object",
        ),
      ),
      body: FutureBuilder<StartWithObj>(
          future: getApi(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        index.toString(),
                      ),
                    ],
                  );
                });
          }),
    );
  }
}
