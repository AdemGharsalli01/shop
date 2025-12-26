import 'package:flutter/material.dart';
import 'package:shop/share/app_colors.dart';

// nzid implements PreferredSizeWidget bech nejm nesta3ml el fichier ka app bar
class Custumer_button extends StatelessWidget implements PreferredSizeWidget {
  const Custumer_button({super.key,required this.event});
  final String event;

  // ne3mlou override lel preferred size bech n7otou taille mta3 el app bar
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    String event=this.event;
    return Container(
      decoration: BoxDecoration(color: app_colors.secondarycolor),
      
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if(event =="confirm order"){
                //nab3thou el lista mte3na l place order screen
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
              child: Center(child: Text( event=="confirm order"? "cklick here to confirm your order":"place order",style: TextStyle(color: Colors.white,fontSize: 20),)),
            ),
          ),
        ],
      ),
    );
  }
}
