// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/medels/product.dart';
import 'package:shop/screens/checkout.dart';
import 'package:shop/share/app_colors.dart';

// nzid implements PreferredSizeWidget bech nejm nesta3ml el fichier ka app bar
class costom_App_bar extends StatefulWidget implements PreferredSizeWidget {
  // constructor bech na3ti valeur lel variable isblackk eli jeya ml home
  const costom_App_bar({
    super.key,
    required this.isBlackk,
    required this.cards,
  });
  // ne5ou el  isblackk w cards
  final bool isBlackk;
  final List<Product> cards;

  @override
  State<costom_App_bar> createState() => _costom_App_barState();
  // ne3mlou override lel preferred size bech n7otou taille mta3 el app bar
  
  @override
  Size get preferredSize => const Size.fromHeight(80);
}
int calculateSum(List<Product> cards){
  int sum = 0;
  for(int i=0;i<cards.length;i++){
    sum+=cards[i].qty* (cards[i].price as int);
  }
  return sum;
}
class _costom_App_barState extends State<costom_App_bar> {

  @override
  Widget build(BuildContext context) {
    // ndeclari variable n7ot fiha el value eli jeya ml home
    bool isBlack = widget.isBlackk;
    final List<Product> cards = widget.cards;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: isBlack == true
            ? app_colors.primarycolor
            : app_colors.secondarycolor,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: isBlack == true
              ? app_colors.secondarycolor
              : app_colors.primarycolor,
          size: 50,
        ),
        title: Text(
          "shope",
          style: TextStyle(
            color: isBlack == true
                ? app_colors.secondarycolor
                : app_colors.primarycolor,
            fontSize: 60,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: isBlack == true
                ? app_colors.secondarycolor
                : app_colors.primarycolor,
            size: 40,
          ),
          Gap(10),
          GestureDetector(
            onTap:(){
              setState(() {
                
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Checkout(element: cards),
                ),
              );
              });
              
              
            },
            
            child: Badge(
              backgroundColor: Colors.red,
              label: Text(5.toString(),
                
                
                style: TextStyle(fontSize: 13),
              ),
              
              largeSize: 13,
              // ignore: deprecated_member_use
              child:Icon(Ionicons.basket_sharp,color: isBlack == true
                    ? app_colors.secondarycolor
                    : app_colors.primarycolor,
                size: 40,),
            ),
          ),
          /* GestureDetector(
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Checkout(element: cards),
                ),
              );
              
            },
            child: Icon(
              Icons.badge_sharp,
              color: isBlack == true
                  ? app_colors.secondarycolor
                  : app_colors.primarycolor,
              size: 40,
            ),
          ), */
          Gap(10),
        ],
      ),
    );
  }
}
