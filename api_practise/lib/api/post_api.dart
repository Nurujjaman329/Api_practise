import 'package:flutter/material.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post_Api"),
      ),
    );
  }
}
