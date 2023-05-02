import 'package:Angel/Screens/main_pages/pageBudget.dart';
import 'package:Angel/Screens/main_pages/pageDestination.dart';
import 'package:Angel/Screens/main_pages/pageDuration.dart';
import 'package:Angel/Screens/main_pages/pageExplore.dart';
import 'package:Angel/controller/mainpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MFbuilder extends StatefulWidget {
  final String name, img;
  final int pageNum;

  MFbuilder(
      {Key? key, required this.name, required this.img, required this.pageNum})
      : super(key: key);

  @override
  State<MFbuilder> createState() => _MFbuilderState();
}

class _MFbuilderState extends State<MFbuilder> {
  bool isClicked = false;
  mainpageController mainPageController = Get.put(mainpageController());

  @override
  Widget build(BuildContext context) {
    // mainPageController.setDonePage(false);

    return GestureDetector(
      onTapDown: (_) {
        setState(
          () {
            isClicked = true;
          },
        );
      },
      onTapCancel: () => setState(() => isClicked = false),
      onTapUp: (_) => setState(() => isClicked = false),
      onTap: () {
        if (widget.pageNum == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const pageDestination()));
        } else if (widget.pageNum == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const pageBudget()));
        } else if (widget.pageNum == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const pageDuration()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const pageExplore()));
        }
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: mainPageController.statePage == false
                ? Colors.grey
                : HexColor("#44564a"),
            border: Border.all(
                color: isClicked == false
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 0.75),
            // color: HexColor("#44564a"),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(widget.img),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
    );
  }
}
