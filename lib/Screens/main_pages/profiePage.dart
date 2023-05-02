import 'package:Angel/Screens/main_pages/paymentPage.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/mainpage_controller.dart';
import 'components/EachProfile.dart';

class profies extends StatefulWidget {
  const profies({Key? key}) : super(key: key);

  @override
  State<profies> createState() => _profiesState();
}

class _profiesState extends State<profies> {
  mainpageController mainPageController = Get.put(mainpageController());

  final names = [
    'Mr. Hakkinen',
    'Ms. Mardiana',
    'Mr. Robert',
    'Ms. Elyana',
  ];

  final info = [
    'He is a licensed tour guide from Angle Travel Agency, 28 years old and Dusun ethnicity',
    'A muslim intern student from Angle Travel Agency, live in Kundasang and she knows the place so much better even though she is a practical student ',
    'He is a local from Kundasang, 32 years old and has experience in guided tourist',
    'A very smart local, and capable of guiding people around easily all over Malaysia.',
  ];
  final imgs = [
    'https://i.pinimg.com/736x/b9/a1/0b/b9a10b6f3e2e9153e688cec0d45c1610.jpg',
    'https://pm1.narvii.com/6497/f61afd481f01415bc36805125881538a81e24a0b_00.jpg',
    'https://pm1.narvii.com/6826/731e11904562dd643793af8498beecabed442fe5v2_hq.jpg',
    'https://devforum-uploads.s3.dualstack.us-east-2.amazonaws.com/uploads/original/4X/d/7/9/d79976f98becc26397450b449d6127fb1cb2f272.jpeg',
  ];
  final phone = [
    '601129389626',
    '601129389626',
    '601129389626',
    '601129389626',
  ];
  final email = [
    'elyanaroseli851@gmail.com',
    'elyanaroseli851@gmail.com',
    'elyanaroseli851@gmail.com',
    'elyanaroseli851@gmail.com',
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
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                  child: Column(
                children: [
                  const Text(
                    "Choose Your Tour Guide:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Text(
                                  "Dont forget to turn it off once Done.",
                                  style: TextStyle(
                                      fontSize: 7, color: Colors.black54),
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
            itemCount: names.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    mainPageController
                        .setSelectedProfile(names[index].toString());
                    Get.to(() => const payment());
                  },
                  child: SelectProfiles(
                    names[index],
                    info[index],
                    imgs[index],
                    phone[index],
                    email[index],
                  ));
            },
          ))
        ],
      ),
    );
  }
}
