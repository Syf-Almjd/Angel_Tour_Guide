import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  String? _userType;

  String? get userType => _userType;

  void setUserType(String? text) {
    _userType = text;
    debugPrint("Updated userType: $userType");
    update();
  }

  String? User_name;

  String? get name => User_name;

  void setName(String? text) {
    User_name = text;
    debugPrint("Updated name: $User_name");
    update();
  }

  String? _email;

  String? get email => _email;

  void setEmail(String? text) {
    _email = text;
    debugPrint("Updated email: $email");
    update();
  }

  String? _mobileNumber;

  String? get mobileNumber => _mobileNumber;

  void setMobileNumber(String? text) {
    _mobileNumber = text;
    debugPrint("Updated mobileNumber: $mobileNumber");
    update();
  }

  String? _useremergContact;

  String? get emergencyContact => _useremergContact;

  void setEmergencyContact(String? text) {
    _useremergContact = text;
    debugPrint("Updated emergencyContact: $emergencyContact");
    update();
  }

  String? _disabilityType;
  String? get disabilityType => _disabilityType;

  void setDisabilityType(String? text) {
    if (text==null){
      _disabilityType = "Healthy";
    }
    else{
    _disabilityType = text;
    }
    update();
  }

  Future postSignUpDetails() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "userType": userType,
      "name": name,
      "email": email,
      "mobileNumber": mobileNumber,
      "EmergencyContact": emergencyContact,
      "Disability": disabilityType,
    });
  }

  Future<bool> registerUser(String email, String password) async {
    try {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (error) {
      if (error is FirebaseAuthException) {
        Get.showSnackbar(GetSnackBar(
          message: error.toString(),
        ));
      }
    }
    return false;
  }
}
