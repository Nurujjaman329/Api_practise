import 'dart:convert';

import 'package:api_practise/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelfClass extends StatefulWidget {
  const SelfClass({super.key});

  @override
  State<SelfClass> createState() => _SelfClassState();
}

class _SelfClassState extends State<SelfClass> {
  List<Welcome> photoList = [];
  Future<List<Welcome>> getPhotos() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    );
    var data = jsonDecode(
      response.body.toString(),
    );

    if (response.statusCode == 200) {
      for (Map i in data) {
        photoList.add(Welcome.fromJson(i));
      }
      return photoList;
    } else {
      return photoList;
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
                future: getPhotos(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: photoList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          title: Text(photoList[index].title.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

//class Photos {
//  String title, url;
//  int id;

//  Photos({required this.title, required this.url});
//}
