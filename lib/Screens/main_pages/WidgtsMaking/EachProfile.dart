import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../../controller/mainpage_controller.dart';

class SelectProfiles extends StatefulWidget {
  final String name;
  final String info;
  final String img;
  final String phone;
  final String email;

  const SelectProfiles(this.name, this.info, this.img, this.phone, this.email);

  @override
  State<SelectProfiles> createState() => _SelectProfilesState();
}

class _SelectProfilesState extends State<SelectProfiles> {
  mainpageController mainPageController = Get.put(mainpageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: HexColor("#B9B3CA"),
            borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        UrlLauncher.launch('mailto:${widget.email.toString()}');
                      },
                      child: Icon(
                        Icons.send,
                        size: 35,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        UrlLauncher.launch('tel:+${widget.phone.toString()}');
                      },
                      child: Icon(Icons.call_outlined, size: 35)),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Column(
                            children: const [
                              Icon(
                                Icons.downloading_outlined,
                                size: 80,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Loading...", style: TextStyle(fontSize: 10, color: Colors.white),),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              widget.img,
                              width: 120.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                    widget.info,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
