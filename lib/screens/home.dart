import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop/componment/app_bar.dart';
import 'package:shop/medels/product.dart';
import 'package:shop/share/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool selected_cat = false;
    return Scaffold(
      backgroundColor: app_colors.primarycolor,
      appBar: costom_App_bar(isBlackk: true),
      body: Stack(
        alignment: AlignmentGeometry.center,

        children: [
          // texts
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Text(
              "  18",
              style: TextStyle(color: Colors.grey.shade900, fontSize: 200),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Text(
              "         December",
              style: TextStyle(color: Colors.white, fontSize: 50),
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
                Gap(250),
                Image.asset("images/logo.png"),
                Gap(20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Product.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (itemBuilder, context) {
                    final item = Product.products[context];
                    return GestureDetector(
                      onTap: () {
                        if(context==0){
                          
                          setState(() {
                            selected_cat=true;
                          });
                          
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
                Gap(20),
                // description container
                Container(
                  height: 300,
                  color: app_colors.secondarycolor,
                  child: Center(
                    child: Text(
                      "Discover the latest trends in fashion and shop your favorite styles with our app.",
                      style: TextStyle(color:app_colors.primarycolor, fontSize: 16),
                    ),
                  ),
                  
                )
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
