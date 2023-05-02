import 'dart:math';

import 'package:Angel/Screens/main_pages/feedbackPage.dart';
import 'package:Angel/controller/mainpage_controller.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../components/my_button.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController num = TextEditingController();

  String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  GeneCode() => String.fromCharCodes(Iterable.generate(
      12, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  @override
  Widget build(BuildContext context) {
    String generatedCode = GeneCode();
    final TextEditingController code =
        TextEditingController(text: generatedCode);
    mainpageController mainPageController = Get.put(mainpageController());

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
                      "Please Deposit the Payment before proceeding",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Once the payment has been done the chosen agent will contact you",
                      style: TextStyle(fontSize: 10, color: Colors.black45),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Please fill in these Details:",
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: HexColor("#948fa1"),
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
                    height: 15,
                  ),
                  TextFormField(
                    controller: num,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: HexColor("#948fa1"),
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
                    height: 15,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: HexColor("#948fa1"),
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
                    height: 15,
                  ),
                  TextFormField(
                    controller: code,
                    decoration: InputDecoration(
                      labelText: 'Generated Code',
                      labelStyle: TextStyle(
                        color: HexColor("#948fa1"),
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
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      FlutterClipboard.copy(generatedCode);
                      Get.snackbar(
                          "Successful!", "Copied into your device clipboard");
                    },
                    child: Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code,
                            color: Colors.black45,
                            size: 100,
                          ),
                          const Text(
                            "Your Receipt Generated Code:",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            generatedCode,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black45),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            "Please make a payment of at least 20RM",
                            style:
                                TextStyle(fontSize: 8, color: Colors.black45),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Payment Account:"),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          FlutterClipboard.copy("NURUL ELYANA BINTI ROSELI");
                          Get.snackbar("Successful!",
                              "Account name was copied into your device clipboard");
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CupertinoColors.systemGrey2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                            child: Center(
                              child: Row(
                                children: const [
                                  Text(
                                    "NURUL ELYANA BINTI ROSELI ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Expanded(child: SizedBox.expand()),
                                  Icon(Icons.copy)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          FlutterClipboard.copy("171576378096");
                          Get.snackbar("Successful!",
                              "Account number was copied into your device clipboard");
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CupertinoColors.systemGrey2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                            child: Center(
                              child: Row(
                                children: const [
                                  Text(
                                    "171576378096",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Expanded(child: SizedBox.expand()),
                                  Icon(Icons.copy)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          FlutterClipboard.copy("Touch 'n Go eWallet");
                          Get.snackbar("Successful!",
                              "Account bank was copied into your device clipboard");
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CupertinoColors.systemGrey2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
                            child: Center(
                              child: Row(
                                children: const [
                                  Text(
                                    "Touch 'n Go eWallet",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Expanded(child: SizedBox.expand()),
                                  Icon(Icons.copy)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Please make sure that the generated code is mentioned in your receipt and information is matching with your own details, make sure to clarify in the receipt message.\nThank you!",
                    style: TextStyle(color: Colors.black45, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    onPressed: () {
                      if (name.text.isEmpty ||
                          num.text.isEmpty ||
                          email.text.isEmpty ||
                          code.text.isEmpty) {
                        showErrorMessage("No Empty Boxes Allowed! :(");
                      } else {
                        mainPageController.setReceiptName(name.text);
                        mainPageController.setReceiptNum(num.text);
                        mainPageController.setReceiptEmail(email.text);
                        mainPageController.setReceiptCode(code.text);
                        Get.to(() => const feedback());
                      }
                    },
                    buttonText: "Finished!",
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
