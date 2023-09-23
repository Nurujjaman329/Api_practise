import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void Login(String email, password) async {
    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        print(data["token"]);
        print("Account Create Successful");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post_Api"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Sign Up",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
