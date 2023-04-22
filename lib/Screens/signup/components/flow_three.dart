import 'package:Angel/Screens/homepage/home_page.dart';
import 'package:Angel/controller/flow_controller.dart';
import 'package:Angel/controller/sign_up_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpThree extends StatefulWidget {
  const SignUpThree({super.key});

  @override
  State<SignUpThree> createState() => _SignUpThreeState();
}

class _SignUpThreeState extends State<SignUpThree> {
  FlowController flowController = Get.put(FlowController());
  var selectedCard = 'Healthy';
  SignUpController signUpController = Get.put(SignUpController());

  String _errorMessage = "";

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    flowController.setFlow(2);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 27,
                ),
                Center(
                  child: Text(
                    "Finishing...",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#4f4f4f"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        _buildInfoCard(
                            "assets/healthy.png", "Healthy", "I am all OK!"),
                        SizedBox(
                          height: 20,
                        ),
                        _buildInfoCard("assets/blind.png", "Sightlessness",
                            "Unable to see clearly."),
                        SizedBox(
                          height: 20,
                        ),
                        _buildInfoCard("assets/deaf.png", "Deafness",
                            "Can't hear clearly."),
                        SizedBox(
                          height: 20,
                        ),
                        _buildInfoCard("assets/paralysis.png", "Paralysis",
                            "Loss in muscle function."),
                        SizedBox(
                          height: 20,
                        ),
                        _buildInfoCard("assets/intellectual.png",
                            "Intellectual", "Mentality built different."),
                        SizedBox(
                          height: 20,
                        ),
                        _buildInfoCard("assets/disabled.png", "Other",
                            "Other disability. "),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 300,
                          height: 60.0,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: HexColor("#44564a"),

                                primary: Colors.white,
                                elevation: 20, //<-- SEE HERE
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                              onPressed: () async {
                                try {
                                  signUpController.postSignUpDetails();
                                  Get.snackbar("Success",
                                      "Thank you");
                                  Get.offAll(HomeScreen());
                                } on FirebaseAuthException catch (ex) {
                                  Get.snackbar("Error", "${ex.message}");
                                }
                              },
                              child: Text(
                                "Finish & Sign Up!",
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String photo, String name, String info) {
    return InkWell(
        onTap: () {
          selectCard(name);
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: name == selectedCard
                  ? Colors.lightGreenAccent
                  : Color(0xCDC7C1FF),
              border: Border.all(
                  color: photo == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 90.0,
            width: double.infinity,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Center(
                    child: Image.asset(photo,
                        alignment: Alignment.center, height: 50)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 5,
                      ),
                      Text(name,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25.0,
                              color: name == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(info,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0,
                            color: name == selectedCard
                                ? Colors.white
                                : Colors.black,
                          ))
                    ],
                  ),
                ),
              )
            ])));
  }

  selectCard(name) {
    setState(() {
      selectedCard = name;
      signUpController.setDisabilityType(name);
    });
  }
}
