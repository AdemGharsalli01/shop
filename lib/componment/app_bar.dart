// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop/share/app_colors.dart';

// nzid implements PreferredSizeWidget bech nejm nesta3ml el fichier ka app bar 
class costom_App_bar extends StatelessWidget implements PreferredSizeWidget {
  // constructor bech na3ti valeur lel variable isblackk eli jeya ml home
  const costom_App_bar({super.key,required this.isBlackk });
  // ne5ou el variable isblackk
  final bool isBlackk;

// ne3mlou override lel preferred size bech n7otou taille mta3 el app bar
 @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {

    // ndeclari variable n7ot fiha el value eli jeya ml home
    bool isBlack=isBlackk;
    return Padding(
      
      padding: const EdgeInsets.all(8.0),
      child: AppBar(backgroundColor:isBlack==true? app_colors.primarycolor:app_colors.secondarycolor,
      centerTitle: true,
      leading: Icon(Icons.menu,color:isBlack==true?app_colors.secondarycolor:app_colors.primarycolor,size: 50,),
      title: Text("shope",style: TextStyle(color:isBlack==true?app_colors.secondarycolor:app_colors.primarycolor,fontSize: 60),),
      actions: [
        Icon(Icons.search,color:isBlack==true?app_colors.secondarycolor:app_colors.primarycolor,size: 40,),
        Gap(10),
        Icon(Icons.badge_sharp,color:isBlack==true?app_colors.secondarycolor:app_colors.primarycolor,size: 40,),
        Gap(10)
      ],
      
      ),
    );
  }
  
 
  

}