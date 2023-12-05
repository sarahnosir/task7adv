import 'package:flutter/material.dart';
import 'package:shopify_app/seeder/data.seeder.dart';
import 'package:shopify_app/widgets/carousel_slider_ex.widget.dart';
import 'package:shopify_app/widgets/headline.widget.dart';
import 'package:shopify_app/widgets/home/categories_row.home.widget.dart';

import '../widgets/carouselwidget.dart';
import '../widgets/prodouct_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await DataSeeder.loadData();
    setState(() {});
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
            child: Column(children: [
          HeadlineWidget(title: 'Categories'),
          CategoriesRowHome(),
          CarouselSliderWithIndicator(
            items: DataSeeder.advertisements
                .map((e) => CarouselWidget(
                      adverItem: e,
                    ))
                .toList(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ...DataSeeder.products.map((prod) => ProductWidget(product: prod))
            ]),
          )
        ])));
  }
}
