import 'package:flutter/material.dart';

class EachPage extends StatefulWidget {
  final String message;
  final String titlemessage;
  final String image;

  EachPage(this.titlemessage, this.message, this.image);

  @override
  State<EachPage> createState() => _EachPageState();
}

class _EachPageState extends State<EachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: Center(
                child: Text(
                  widget.titlemessage,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              )),
              Image.asset(
                widget.image,
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                    child: Text(
                      widget.message,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
