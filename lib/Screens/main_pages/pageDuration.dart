import 'package:Angel/Screens/main_pages/pageExplore.dart';
import 'package:Angel/Screens/main_pages/profiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/mainpage_controller.dart';


class pageDuration extends StatefulWidget {
  const pageDuration({Key? key}) : super(key: key);

  @override
  State<pageDuration> createState() => _pageDurationState();
}

class _pageDurationState extends State<pageDuration> {
  mainpageController mainPageController = Get.put(mainpageController());
  double hight = 50.0;
  final Duralist = [
    'One Day',
    'Two Days',
    'Three Days',
    'One Week',
    'Two Weeks',
    'Three Weeks',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    mainPageController.setDonePage(true);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor("#128201"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                    "How long is your Trip?",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: Duralist.length,
                  itemBuilder: (context, index) {
                    return BudgetList(Duralist[index]);
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget BudgetList(index) {
    hight += 10.0;
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: InkWell(
            onTap: () {
              mainPageController.setDuration(index.toString());
              Get.snackbar("Saved", "Your choice was $index");
              Navigator.pop(context);
              hight =50;
              if (mainPageController.destin != "No Location was selected" && mainPageController.bdgt != "No Budget was selected" && mainPageController.duration  != "No Duration was selected")
              {
                Get.off(() => profiePage());
              }
            },
            child: Container(
                height: hight,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.more_time_rounded),
                    Text(index, style: TextStyle(color: Colors.white, fontSize: 17),textAlign: TextAlign.center,),
                    Icon(Icons.drag_indicator_sharp),
                  ],
                ))),
      ),
    );
  }
}