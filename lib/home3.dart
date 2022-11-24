import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/widgets/drawer.dart';
import 'package:my_first_app/widgets/product_widget.dart';
// gives json decoder encoder
import 'dart:convert';

import 'models/catalog.dart';

//loading data from local json file in assets

// ignore: camel_case_types
class homePage3 extends StatefulWidget {
  const homePage3({super.key});

  @override
  State<homePage3> createState() => _homePageState3();
}

// ignore: camel_case_types
class _homePageState3 extends State<homePage3> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // catalogjson gives string
    // decoder data is giving object(in this case, it is map of whole catalog.json)
    final decoderData = jsonDecode(catalogJson);
    // ignore: avoid_print
    // print(catalogJson);
    // print(decoderData);
    var productData = decoderData["products"];
    // productData is giving only the map of products
    // print(productData);
    CatalogueModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.Items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog"),
        // backgroundColor: Colors.white,
        // elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            // ignore: unrelated_type_equality_checks
            (CatalogueModel.items != Null && CatalogueModel.items!.isNotEmpty)
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        item: CatalogueModel.items![index],
                      );
                    },
                    itemCount: CatalogueModel.items?.length,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
