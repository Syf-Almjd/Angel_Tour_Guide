import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class mainpageController extends GetxController {
  static mainpageController get instance => Get.find();

  bool statePage = false;

  bool? get donePage => statePage;

  void setDonePage(bool done) {
    statePage = done;
    update();
  }

  String destin = "No Location was selected";

  String get userDestin => destin;

  void setDestin(String location) {
    destin = location;
    update();
  }

  String bdgt = "No Budget was selected";

  String get userBudget => bdgt;

  void setBudget(String budget) {
    bdgt = budget;
    update();
  }

  String duration = "No Duration was selected";

  String get userDuration => duration;

  void setDuration(String dura) {
    duration = dura;
    update();
  }

  String package = "No Package was selected";

  String get userPackage => package;

  void setPackage(String pack) {
    package = pack;
    update();
  }

  String select_profile = "No Profile was selected";

  String get userSelectedProfile => select_profile;

  void setSelectedProfile(String prof) {
    select_profile = prof;
    update();
  }

  String receiptName = "No receipt name was given";

  String get userReceiptName => receiptName;

  void setReceiptName(String name) {
    receiptName = name;
    update();
  }

  String receiptNum = "No receipt number was given";

  String get userReceiptNum => receiptNum;

  void setReceiptNum(String num) {
    receiptNum = num;
    update();
  }

  String receiptEmail = "No receipt email was given";

  String get userReceiptEmail => receiptEmail;

  void setReceiptEmail(String email) {
    receiptEmail = email;
    update();
  }

  String receiptCode = "Error in receipt Code";

  String get userReceiptCode => receiptCode;

  void setReceiptCode(String code) {
    receiptCode = code;
    update();
  }

  String receiptFeedback = "No feedback";

  String get userReceiptFeedback => receiptFeedback;

  void setReceiptFeedback(String feedback) {
    receiptFeedback = feedback;
    update();
  }

  String checkOrder() {
    if (package == "No Package was selected") {
      return "Custom order";
    } else {
      return "Package order";
    }
  }

  String? _disabilityType;
  String? get thedisabilityType => _disabilityType;

  void setDisabilityType(String? text) {
    if (text==null){
      _disabilityType = "Healthy";
    }
    else{
      _disabilityType = text;
    }
    update();
  }

  Future postFinishDetails() async {
    String orderDetials = checkOrder();
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "receipt Code": receiptCode,
      "receipt Name": receiptName,
      "receipt Phone Number": receiptNum,
      "receipt Email": receiptEmail,
      "Order Details": orderDetials,
      "Destination": destin,
      "Budget": bdgt,
      "Duration": duration,
      "Package Name": package,
      "Agent Requested": select_profile,
      "Disability": thedisabilityType,
    });
  }
}
