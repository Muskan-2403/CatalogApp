import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/drawer.dart';
import 'package:my_first_app/widgets/product_widget.dart';
// ignore: unused_import

// copying list items multiple times in dummy list and showing them.

// ignore: camel_case_types
class homePage2 extends StatelessWidget {
  const homePage2({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => CatalogModel2.items2[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog"),
        // backgroundColor: Colors.white,
        // elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
          itemCount: dummyList.length,
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

//class from catalog.dart
class CatalogModel2 {
  static final items2 = [
    items(
        id: 1,
        name: "MI 12 pro",
        desc:
            "android 12th generation xiomi mobile android 12th generation xiomi mobile",
        price: 999,
        color: "#33505a",
        imgurl: "https://tenor.com/bkILS.gif")
  ];

  static items(
      {required int id,
      required String name,
      required String desc,
      required int price,
      required String color,
      required String imgurl}) {}
}
