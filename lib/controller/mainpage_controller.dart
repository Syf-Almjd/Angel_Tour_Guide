import 'package:Angel/Screens/main_pages/pageExplore.dart';
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
}
