import 'package:flutter/material.dart';

class PickImages extends StatefulWidget {
  const PickImages({super.key});

  @override
  State<PickImages> createState() => _PickImagesState();
}

class _PickImagesState extends State<PickImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pick_Image"),
      ),
    );
  }
}
