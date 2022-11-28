// ignore_for_file: file_names

// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/homeDetail_page.dart';
import 'package:my_first_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

// import '../../home.dart';
import '../../models/catalog.dart';
import '../theme.dart';
import 'catalogImage.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogueModel.items![index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(
                // catalog: CatalogueModel.getById(2),
                catalog: catalog));
      },
      itemCount: CatalogueModel.items!.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        // tells that image has a relationship and will show aniation accordingly
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              // jitna space h utne m aapas ki devide krlo
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _addToCart(catalog: catalog),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class _addToCart extends StatefulWidget {
  final Item catalog;
  const _addToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<_addToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogueModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: isAdded ? const Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
