// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../theme.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
