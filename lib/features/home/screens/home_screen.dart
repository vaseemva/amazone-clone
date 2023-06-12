import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/features/home/widgets/address_box.dart';
import 'package:amazone_clone/features/home/widgets/carousel_images.dart';
import 'package:amazone_clone/features/home/widgets/deal_of_the_day.dart';
import 'package:amazone_clone/features/home/widgets/home_appbar.dart';
import 'package:amazone_clone/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60), child: HomeAppBAr()),
        body: SingleChildScrollView(
          child: Column(
            children: const[
              AddressBox(),
              SizedBox(
                height: 10,
              ),
              TopCategories(),
              SizedBox(
                height: 10,
              ),
              CarouselImages(),
              
              DealOfTheDay()
            ],
          ),
        ));
  }
}
