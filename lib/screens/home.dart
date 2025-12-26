import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:shop/componment/app_bar.dart';
import 'package:shop/medels/cover.dart';
import 'package:shop/medels/product.dart';
import 'package:shop/componment/description.dart';
import 'package:shop/share/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Product> selected = [];
    DateTime now = DateTime.now();
    int day = now.day;
    String month = DateFormat('MMMM', 'en_us').format(now);

    //bool selected_cat = false;
    return Scaffold(
      backgroundColor: app_colors.primarycolor,
      appBar: costom_App_bar(isBlackk: true,cards: selected,),
      body: Stack(
        alignment: AlignmentGeometry.center,

        children: [
          // date text
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Text(
              "  $day",
              style: TextStyle(color: Colors.grey.shade900, fontSize: 200),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Text(
              "         $month",
              style: TextStyle(color: app_colors.secondarycolor, fontSize: 50),
            ),
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: Text(
              "             collections",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 40),
            ),
          ),
          //content
          SingleChildScrollView(
            child: Column(
              children: [
                // spacer
                Gap(250),
                //logo
                Image.asset("images/logo.png"),
                //spacer
                Gap(20),
                // grid vieu
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Product.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,

                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (itemBuilder, i) {
                    final item = Product.products[i];
                    return GestureDetector(
                      onTap: () {
                        if (selected.contains(item)) {
                          selected[selected.indexOf(item)].qty += 1;
                        } else {
                          selected.add(item);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(item.image),
                            Gap(10),
                            Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),

                            Text(
                              "${item.price} tnd ",
                              style: TextStyle(color: Colors.white),
                            ),

                            Text(
                              item.description,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                //spacer
                Gap(10),
                // covers list view
                SizedBox(
                  height: 390,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cover.covers.length,
                    itemBuilder: (context, index) {
                      final coveritem = cover.covers[index];
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(coveritem.image, height: 300),
                            Gap(10),
                            Text(
                              coveritem.name.toUpperCase(),
                              style: TextStyle(
                                color: app_colors.secondarycolor,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //description
                Description(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
