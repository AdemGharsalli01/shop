import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop/componment/app_bar.dart';
import 'package:shop/share/app_colors.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.primarycolor,
      appBar: costom_App_bar(isBlackk: true,),
      body: Stack(
        alignment: AlignmentGeometry.center,
        
        children: [
          // texts
          Positioned(
            top: 0,
            left:0,
            right: 0,
            child: Text("  10",style: TextStyle(color:Colors.grey.shade900,fontSize:200),)),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Text("         December",style: TextStyle(color:Colors.white,fontSize:50),)
            ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: Text("             collections",style: TextStyle(color:Colors.grey.shade400,fontSize:40),)),
          //content
          Column(
            children: [
              Gap(250),
              Image.asset("images/logo.png")
            ],
          ),

        ],
      ),
    );
  }
}