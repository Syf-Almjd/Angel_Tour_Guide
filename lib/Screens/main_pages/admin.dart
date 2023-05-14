import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

List ORDERSdataID = [];

// Future<void> getDataFB() async {
//   FirebaseFirestore.instance.collection('Orders').get().then(
//     (value) {
//       value.docs.forEach((element) {
//         ORDERSdataID.add(element.id);
//         // asd.addAll(element.data());
//       });
//     },
//     onError: (e) => () {
//       print("Error getting data: $e");
//     },
//   );
// }

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
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
                    "Admin Page",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Please Double click on the order to deleted it!\nThank you",
              style: TextStyle(fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          )),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Orders').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.data!.docs.length == 1) {
                  return const Center(child: Text('No new orders to display'));
                }
                for (var element in snapshot.data!.docs) {
                  ORDERSdataID.add(element.id);
                }
                List<Map<String, dynamic>> items = snapshot.data!.docs
                    .where((doc) => doc.id !="test")
                    .map((doc) => doc.data() as Map<String, dynamic>)
                    .toList();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onDoubleTap: () async {
                          await FirebaseFirestore.instance
                              .collection('Orders')
                              .doc('${ORDERSdataID[index]}')
                              .delete();
                        },
                        child: ListTile(
                          title: Center(child: Text('Order number: ${index + 1}')),
                          subtitle: Column(
                            children: [
                              Text(
                                "User ID: ${ORDERSdataID[index].toString()}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(items[index]
                                  .toString()
                                  .replaceAll(",", "\n\n")),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
