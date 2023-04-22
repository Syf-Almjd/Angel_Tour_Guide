import 'package:Angel/Screens/homepage/components/MainFrame_Wedget_builder.dart';
import 'package:Angel/components/AlanAITalk.dart';
import 'package:Angel/controller/mainpage_controller.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  mainpageController mainPageController = Get.put(mainpageController());

  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  _HomeScreenBodyState() {
    alan_ai();
  }

  void _activateAlan() {
    AlanVoice.activate();
  }

  bool _isClickedbtn1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#fed8c3"),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: HexColor('#ffffff'),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                    child: Column(
                      children: [
                        const Text(
                          "Welcome to Angle Tour Guide 𓆩♡𓆪",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTapDown: (_) =>
                              setState(() => _isClickedbtn1 = true),
                          onTapCancel: () =>
                              setState(() => _isClickedbtn1 = false),
                          onTapUp: (_) =>
                              setState(() => _isClickedbtn1 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeIn,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: _isClickedbtn1 == false
                                  ? Colors.amber
                                  : HexColor("#ffffff"),
                              border: Border.all(
                                  strokeAlign: StrokeAlign.center,
                                  color: _isClickedbtn1 == false
                                      ? Colors.amber
                                      : Colors.green.withOpacity(1),
                                  style: BorderStyle.solid,
                                  width: 0.75),
                              // color: HexColor("#44564a"),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                                onTap: () => {_activateAlan()},
                                child: Column(
                                  children: const [
                                    Text(
                                      "Let's Find Your Dream TRAVEL!",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black54),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(padding: EdgeInsets.all(2)),
                                    Text(
                                      "Click to activate AI Assistance!",
                                      style: TextStyle(
                                          fontSize: 7, color: Colors.black54),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        const Text(
                          "Where is your next Journey?",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: MFbuilder(
                            name: "Destination",
                            img: "assets/map.jpg",
                            pageNum: 1)),
                    const Padding(padding: EdgeInsets.all(20)),
                    Expanded(
                        child: MFbuilder(
                            name: "Budget",
                            img: "assets/card.jpg",
                            pageNum: 2)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: MFbuilder(
                            name: "Travel Duration",
                            img: "assets/travel.jpg",
                            pageNum: 3)),
                    const Padding(padding: EdgeInsets.all(20)),
                    Expanded(
                        child: MFbuilder(
                            name: "Explore More...",
                            img: "assets/explore.jpg",
                            pageNum: 4)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
