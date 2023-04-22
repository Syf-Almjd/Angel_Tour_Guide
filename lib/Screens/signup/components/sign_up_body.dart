import 'package:Angel/controller/flow_controller.dart';
import 'package:Angel/screens/signup/components/flow_one.dart';
import 'package:Angel/screens/signup/components/flow_three.dart';
import 'package:Angel/screens/signup/components/flow_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpBodyScreen extends StatefulWidget {
  const SignUpBodyScreen({super.key});

  @override
  State<SignUpBodyScreen> createState() => _SignUpBodyScreenState();
}

class _SignUpBodyScreenState extends State<SignUpBodyScreen> {
  FlowController flowController = Get.put(FlowController());
  late int _currentFlow;

  @override
  void initState() {
    _currentFlow = FlowController().currentFlow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#fed8c3"),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          reverse: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: HexColor("#ffffff"),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: GetBuilder<FlowController>(
                          builder: (context) {
                            if (flowController.currentFlow == 1) {
                              return const SignUpOne();
                            } else if (flowController.currentFlow == 2) {
                              return const SignUpTwo();
                            } else {
                              return const SignUpThree();
                            }
                          },
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
