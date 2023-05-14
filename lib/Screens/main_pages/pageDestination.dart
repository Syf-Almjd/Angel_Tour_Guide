import 'package:Angel/Screens/main_pages/components//PicItemList.dart';
import 'package:Angel/Screens/main_pages/profiePage.dart';
import 'package:Angel/controller/mainpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class pageDestination extends StatefulWidget {
  const pageDestination({Key? key}) : super(key: key);

  @override
  State<pageDestination> createState() => _pageDestinationState();
}

class _pageDestinationState extends State<pageDestination> {
  mainpageController mainPageController = Get.put(mainpageController());
  final DestinList = [
    'Kundasang, Sabah',
    'Kuching, Sarawak',
    'Penang',
    'Pulau Langkawi',
    'Keningau, Sabah',
    'Miri, Sarawak',
    'Negeri Sembilan'
  ];
  final DestinListInfo = [
    'Kundasang is a hill station in the district of Ranau in Sabah, Malaysia that lies along the bank of Kundasang Valley within the Crocker Range, and also neighboring the town of Pekan Nabalu.',
    'Kuching, officially the City of Kuching, is the capital and the most populous city in the state of Sarawak in Malaysia. It is also the capital of Kuching Division.',
    'George Town is the colorful, multicultural capital of the Malaysian island of Penang. Once an important Straits of Malacca trading hub, the city is known for its British colonial buildings, Chinese shophouses and mosques.',
    'Langkawi, officially known by its sobriquet Langkawi, the Jewel of Kedah, is a duty-free island and an archipelago of 99 islands located some 30 km off the coast of northwestern Malaysia and a few kilometres south of Ko Tarutao, adjacent to the Thai border.',
    'Keningau is the capital of the Keningau District in the Interior Division of Sabah, Malaysia. It is the fifth-largest town in Sabah, as well one of the oldest. Keningau is between Tambunan and Tenom. The town had an estimated population of 173,130.',
    'Miri is a Malaysian city on the northwest coast of the island of Borneo. At the Petroleum Museum, on Canada Hill, hands-on exhibits explore the region’s oil history. Outside is the Grand Old Lady, a 1910 oil well and local landmark',
    'Negeri Sembilan is a Malaysian state on the Malay Peninsulas southwest coast, known for its beaches, nature parks and palaces. To the west, on the Malacca Strait, the area around Port Dickson has seaside resorts, the Wan Loong Chinese Temple and the Kota Lukut hilltop fort.',
  ];
  final DestinImgs = [
    'https://ik.imagekit.io/tvlk/blog/2018/02/Kundasang-1.jpg',
    'https://discoverist.changirecommends.com/wp-content/uploads/2019/10/shutterstock_1161272326-1000x580.jpg',
    'https://misstourist.com/wp-content/uploads/2022/01/0%20Where%20to%20Stay%20in%20Penang.jpg',
    'https://assets.hmetro.com.my/images/articles/IMG_07D1E4289B7D-2_1631746809.jpg',
    'https://www.sabahpost.net/wp-content/uploads/2019/03/bandukan.jpg',
    'https://img.traveltriangle.com/blog/wp-content/uploads/2019/09/Miri.jpg',
    'https://2.bp.blogspot.com/-y0L-ce6k05o/Xo11UMrbwKI/AAAAAAAAhxk/c_fmvBmcaJARPY4v-k-2j9pb1CUGgq8AgCLcBGAsYHQ/d/muzium-negeri-sembilan-seremban.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    mainPageController.setDonePage(true);
    return Scaffold(
      backgroundColor: HexColor("#fed8c3"),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexColor("#9E98AF"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                "What is your Destination?",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: DestinList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                child: InkWell(
                    onTap: () {
                      mainPageController
                          .setDestin(DestinList[index].toString());
                      Get.snackbar("Saved",
                          "Your choice was ${DestinList[index]}, Great Choice!");
                      Navigator.pop(context);
                      if (mainPageController.destin !=
                              "No Location was selected" &&
                          mainPageController.bdgt != "No Budget was selected" &&
                          mainPageController.duration !=
                              "No Duration was selected") {
                        Get.to(() => profies());
                      }
                    },
                    child: PicItem(
                      DestinList[index],
                      DestinImgs[index],
                      DestinListInfo[index],
                    )),
              );
            },
          ))
        ],
      ),
    );
  }
}
