import 'package:Angel/Screens/main_pages/profiePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/mainpage_controller.dart';

class pageBudget extends StatefulWidget {
  const pageBudget({Key? key}) : super(key: key);

  @override
  State<pageBudget> createState() => _pageBudgetState();
}

class _pageBudgetState extends State<pageBudget> {
  @override
  mainpageController mainPageController = Get.put(mainpageController());
  final BUDlist = [
    '100RM',
    '200RM',
    '350RM',
    '500RM',
    '750RM',
    '1000RM',
    '2000RM',
    '5000RM',
    'Open Budget',
  ];

  @override
  Widget build(BuildContext context) {
    mainPageController.setDonePage(true);
    return Scaffold(
      backgroundColor: HexColor("#fed8c3"),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor("#9E98AF"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                "What is your Budget?",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          Expanded(
              child: Center(
            child: ListView.builder(
              itemCount: BUDlist.length,
              itemBuilder: (context, index) {
                return BudgetList(BUDlist[index]);
              },
            ),
          ))
        ],
      ),
    );
  }

  Widget BudgetList(index) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: InkWell(
            onTap: () {
              mainPageController.setBudget(index.toString());
              Get.snackbar("Saved", "Your choice was $index");
              Navigator.pop(context);
              if (mainPageController.destin != "No Location was selected" &&
                  mainPageController.bdgt != "No Budget was selected" &&
                  mainPageController.duration != "No Duration was selected") {
                Get.to(() => profies());
              }
            },
            child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: HexColor("#B9B3CA"),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  index,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                )))),
      ),
    );
  }
}
