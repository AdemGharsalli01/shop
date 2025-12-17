import 'package:flutter/material.dart';

// ignore: camel_case_types
class nav_bar extends StatelessWidget {
  const nav_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: Row(
        
        children: [
          
          Text("data",style: TextStyle(color: Colors.white,fontSize: 20),)
        ],
      ),
    );
  }
}