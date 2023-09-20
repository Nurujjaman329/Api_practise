import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataPass extends StatefulWidget {
  var data;
  DataPass({super.key, required this.data});

  @override
  State<DataPass> createState() => _DataPassState();
}

class _DataPassState extends State<DataPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data.title.toString(),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              widget.data.title.toString(),
            ),
            subtitle: Text(
              widget.data.title.toString(),
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                widget.data.urlToImage.toString(),
              ),
            ),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * .20,
              child: Text(
                widget.data.publishedAt.toString(),
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
                image:
                    NetworkImage(widget.data.urlToImage.toString(), scale: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
