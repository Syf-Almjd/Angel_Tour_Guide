// ignore: unused_import
import 'package:Angel/components/my_button.dart';
import 'package:Angel/controller/flow_controller.dart';
import 'package:Angel/controller/sign_up_controller.dart';
import 'package:Angel/screens/login/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

List<String> list = <String>[
  'Male',
  'Female',
];

class SignUpOne extends StatefulWidget {
  const SignUpOne({super.key});

  @override
  State<SignUpOne> createState() => _SignUpOneState();
}

class _SignUpOneState extends State<SignUpOne> {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  SignUpController signUpController = Get.put(SignUpController());
  FlowController flowController = Get.put(FlowController());

  bool isLoading = false;
  String dropdownValue = 'Choose Gender:';
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    debugPrint(signUpController.userType);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => const LoginBodyScreen());
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 67,
                  ),
                  Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#4f4f4f"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: HexColor("#8d8d8d"),
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: HexColor("#8d8d8d"),
                      ),
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: HexColor("#ffffff"),
                      ),
                      iconSize: 30,
                      borderRadius: BorderRadius.circular(20),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                          signUpController.setUserType(value);
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: HexColor("#8d8d8d"),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: emailController.value,
                      onChanged: (value) {
                        validateEmail(value);
                        signUpController.setEmail(value);
                      },
                      onSubmitted: (value) {
                        signUpController.setEmail(value);
                      },
                      cursorColor: HexColor("#4f4f4f"),
                      decoration: InputDecoration(
                        hintText: "Elyana@gmail.com",
                        fillColor: HexColor("#f0f3f1"),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: HexColor("#8d8d8d"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        _errorMessage,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: HexColor("#8d8d8d"),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onChanged: (value) {
                        signUpController.setPassword(value);
                      },
                      onSubmitted: (value) {
                        signUpController.setPassword(value);
                      },
                      obscureText: true,
                      controller: passwordController.value,
                      cursorColor: HexColor("#4f4f4f"),
                      decoration: InputDecoration(
                        hintText: "*************",
                        fillColor: HexColor("#f0f3f1"),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: HexColor("#8d8d8d"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        focusColor: HexColor("#44564a"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : MyButton(
                            buttonText: 'Process',
                            onPressed: () async {
                              if (signUpController.userType != null &&
                                  signUpController.email != null &&
                                  signUpController.password != null) {
                                Get.snackbar("Signing you to the Database",
                                    "Loading, Please wait..");
                                try {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await signUpController.registerUser(
                                      signUpController.email.toString(),
                                      signUpController.password.toString());
                                  Get.snackbar("Success",
                                      "Please complete Registration");
                                  flowController.setFlow(2);
                                } on FirebaseAuthException catch (ex) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Get.snackbar("Error", "${ex.message}");
                                }
                              }
                            }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        child: Text(
                          "Log In",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: HexColor("#44564a"),
                          ),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginBodyScreen(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}
