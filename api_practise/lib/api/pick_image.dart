import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PickImages extends StatefulWidget {
  const PickImages({super.key});

  @override
  State<PickImages> createState() => _PickImagesState();
}

class _PickImagesState extends State<PickImages> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final PickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (PickedFile != null) {
      image = File(PickedFile.path);
      setState(() {});
    } else {
      print("No Image Selected");
    }
  }

  Future<void> upLoadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    // var length = await image!.length();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pick_Image"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: image == null
                  ? const Center(
                      child: Text("Pick Image"),
                    )
                  : Center(
                      child: Image.file(
                        File(image!.path).absolute,
                        height: 100,
                        width: 100,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
