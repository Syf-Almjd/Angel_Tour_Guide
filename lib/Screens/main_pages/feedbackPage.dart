import 'package:Angel/Screens/homepage/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/my_button.dart';
import '../../controller/mainpage_controller.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final TextEditingController feedbackform = TextEditingController();
  mainpageController mainPageController = Get.put(mainpageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#fed8c3"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                child: Column(
                  children: const [
                    Text(
                      "Thank you so much!",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Our Agent will contact you soon please keep an eye on your phone",
                      style: TextStyle(fontSize: 10, color: Colors.black45),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Help us improve",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: feedbackform,
                    maxLines: null,
                    minLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Feedback',
                      labelStyle: const TextStyle(
                        color: Colors.brown,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("#2C3E35")),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Thanks for using our app! We appreciate your support and hope you continue to find it useful.\nSee you soon!",
                    style: TextStyle(color: Colors.black45, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                      onPressed: () async {

                        const url =
                            'https://play.google.com/store/apps/details?id=com.mjd.angel&showAllReviews=true';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          showErrorMessage(
                              "Couldn't Access Google Play but Thank you for using Angel Tour Guide Malaysia.");
                          mainPageController.postFinishDetails();
                          Get.offAll(() => const HomeScreenBody());
                        }
                      },
                      buttonText: "Rate Us on GP!"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () async {
                      if (feedbackform.text.isEmpty) {
                        showErrorMessage("Please give us a simple feedback :)");
                      } else {
                        Get.snackbar("Thank you",
                            "We have got your feedback \nEnjoy using the App!");
                        mainPageController
                            .setReceiptFeedback(feedbackform.text);
                        mainPageController.postFinishDetails();
                        Get.offAll(() => const HomeScreenBody());
                      }
                    },
                    child: const Text("Finish!"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }
}

