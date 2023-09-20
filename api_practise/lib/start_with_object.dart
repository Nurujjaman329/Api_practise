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
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.articles!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            snapshot.data!.articles![index].source!.name
                                .toString(),
                          ),
                          subtitle: Text(
                            snapshot.data!.articles![index].title.toString(),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              snapshot.data!.articles![index].urlToImage
                                  .toString(),
                            ),
                          ),
                          trailing: SizedBox(
                            width: MediaQuery.of(context).size.width * .20,
                            child: Text(
                              snapshot.data!.articles![index].publishedAt
                                  .toString(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .011,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .8 / 3.4,
                          //width: MediaQuery.of(context).size.width * 10,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  snapshot.data!.articles![index].urlToImage
                                      .toString(),
                                  scale: 1),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Text("Loading");
            }
          }),
    );
  }
}
