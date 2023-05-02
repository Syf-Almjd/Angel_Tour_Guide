import 'package:Angel/controller/mainpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PicItem extends StatefulWidget {
  final String name;
  final String img;
  final String info;

  const PicItem(this.name, this.img, this.info);

  @override
  State<PicItem> createState() => _PicItemState();
}

class _PicItemState extends State<PicItem> {
  mainpageController mainPageController = Get.put(mainpageController());

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  children: const [
                    Icon(
                      Icons.downloading_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Loading...",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    widget.img,
                    width: double.infinity,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.info,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
