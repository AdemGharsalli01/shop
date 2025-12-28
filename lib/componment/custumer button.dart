// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shop/medels/product.dart';
import 'package:shop/screens/place_order.dart';
import 'package:shop/share/app_colors.dart';

// nzid implements PreferredSizeWidget bech nejm nesta3ml el fichier ka app bar
class Custumer_button extends StatelessWidget implements PreferredSizeWidget {
  const Custumer_button({super.key,required this.event,required this.element,required this.adress,});
  final String event;
  final List adress;
  final List<Product> element;

  // ne3mlou override lel preferred size bech n7otou taille mta3 el app bar
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    String event=this.event;
    final List<Product> element=this.element;
    return Container(
      decoration: BoxDecoration(color: app_colors.secondarycolor),
      
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              
              if(event =="confirm order"){
                //nab3thou el lista mte3na l place order screen
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceOrder(element:element)));
              }
              
              
                    
            },
            child: Container(
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.grey.shade800),
              ),
              height: 90,
              width: double.infinity,
              child: Center(child: Text( event=="confirm order"? "cklick here to confirm your order".toUpperCase():event=="place order"?"place order".toUpperCase():"add adress".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),)),
            ),
          ),
        ],
      ),
    );
  }
}
