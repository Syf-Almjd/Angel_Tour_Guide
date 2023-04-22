import 'package:Angel/Screens/main_pages/profiles.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/mainpage_controller.dart';
import 'WidgtsMaking/pickPackage.dart';

class pageExplore extends StatefulWidget {
  const pageExplore({Key? key}) : super(key: key);

  @override
  State<pageExplore> createState() => _pageExploreState();
}

class _pageExploreState extends State<pageExplore> {
  mainpageController mainPageController = Get.put(mainpageController());
  final NameList = [
    'Package A',
    'Package B',
    'Package C',
    'Package D',
    'Package E',
  ];
  final dateList = [
    '5 Days & 4 Nights',
    '9 Days & 8 Nights',
    '4 Days & 3 Nights',
    '3 Days & 2 Nights',
    '4 Days & 3 Nights',
  ];
  final timeList = [
    '8:00 AM',
    '7:00 AM',
    '3:00 PM',
    '3:00 PM',
    '10:00 PM',
  ];
  final priceList = [
    'RM 1,890',
    'RM 1,377',
    'RM 333',
    'RM 435',
    'RM 550',
  ];
  final rateList = [
    '5',
    '4.8',
    '4.5',
    '4.2',
    '4.5',
  ];
  final ImgsList = [
    'https://emseventsandtours.com/wp-content/uploads/2022/06/Malaysia.jpg',
    'https://www.travelmate.com.pk/wp-content/uploads/2019/05/malaysia-tour-package.png',
    'https://pbs.twimg.com/media/C6egF87WUAMe_S7.jpg',
    'https://realbreezedavaotours.com/wp-content/uploads/2018/05/InternationalTourPackage.Malaysia.png',
    'https://i.pinimg.com/originals/57/48/dc/5748dcc2e9f3e38204f4571c17b3ed9f.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#fed8c3"),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor("#9E98AF"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: Column(
                children: [
                  const Text(
                    "You can choose one of our packages:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                            onTap: () => {
                                  AlanVoice.activate(),
                                },
                            child: Column(
                              children: const [
                                Text(
                                  "Click to activate AI Assistance!",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.black54),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Text(
                                  "Dont forget to turn it off once Done.",
                                  style:
                                      TextStyle(fontSize: 7, color: Colors.black54),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: ImgsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    mainPageController.setPackage(NameList[index].toString());
                    Get.off(() => profiePage());
                  },
                  child: PicPackage(
                    ImgsList[index],
                    NameList[index],
                    dateList[index],
                    timeList[index],
                    priceList[index],
                    rateList[index],
                  ));
            },
          ))
        ],
      ),
    );
  }
}
