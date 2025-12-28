// ignore_for_file: no_leading_underscores_for_local_identifiers, strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/componment/app_bar.dart';
import 'package:shop/componment/custumer%20button.dart';
import 'package:shop/medels/product.dart';
import 'package:shop/screens/adress_details.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key, required this.element});
  final List<Product> element;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  List _saved_adress=[];

  void _opneadress(context) async {
    final _adressDatails = await Navigator.push(
      context,
      MaterialPageRoute(builder: (builder) => AdressDetails(event:_saved_adress)),
    );
    if (_adressDatails != null) {
      setState(() {
        _saved_adress = _adressDatails;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> element = widget.element;
    double totalPrice = (element.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (double.parse(element.price) * element.qty),
    ));
    return Scaffold(
      appBar: costom_App_bar(isBlackk: false, cards: element),
      body: Column(
        children: [
          Text("checkout", style: TextStyle(fontSize: 30, letterSpacing: 8)),
          // header decoration
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                ),
                height: 2,
                width: 100,
              ),
              Icon(Ionicons.star_outline, color: Colors.grey.shade600),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                ),
                height: 2,
                width: 100,
              ),
            ],
          ),
          Gap(10),
          // adress details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [


                _saved_adress.isNotEmpty
               ?Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      children: [
                        Text(
                          "shipping adress".toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            letterSpacing: 3,
                          ),
                        ),
                        Gap(10),
                        Row(
                          children: [
                            Gap(20),
                            Text(
                              _saved_adress.isNotEmpty
                                  ? "${_saved_adress[0]} ${_saved_adress[1].toString().toUpperCase()}"
                                  : "adem gharsalli",
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Gap(20),
                            Text(
                              _saved_adress.isNotEmpty
                                  ? _saved_adress[2].toString().toUpperCase()
                                  : "adem gharsalli",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Gap(20),
                            Text(
                              _saved_adress.isNotEmpty
                                  ? _saved_adress[3].toString().toUpperCase()
                                  : "adem gharsalli",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Gap(20),
                            Text(
                              _saved_adress.isNotEmpty
                                  ? _saved_adress[4].toString().toUpperCase()
                                  : "adem gharsalli",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // na7ineha 5ater bech ne5dhou m3loumet moch bech na3tiw ma3loumet
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>AdressDetails()));
                        _opneadress(context);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.grey.shade500,
                        size: 40,
                      ),
                    ),
                    Gap(10),
                  ],
                )
              :Gap(20),
              _saved_adress.isEmpty
              ?GestureDetector(
                  onTap: () {
                    _opneadress(context);
                    
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "add shipping adess",
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                        Gap(40),
                        Icon(
                          Ionicons.add_circle_outline,
                          color: Colors.black,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ):SizedBox.shrink(),
              ],
            ),
          ),
          Gap(30),
          // shipping method
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      children: [
                        Text(
                          "shipping method".toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            letterSpacing: 3,
                          ),
                        ),
                        Gap(10),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 50,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(20),
                      Center(
                        child: Text(
                          "pickup at store",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Text(
                          "Free",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                      Gap(10),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      Gap(30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(30),
          //payment methode
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      children: [
                        Text(
                          "payment method".toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            letterSpacing: 3,
                          ),
                        ),
                        Gap(10),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 50,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(20),
                      Center(
                        child: Text(
                          "select payment methode",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                      Spacer(),

                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      Gap(30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          //total price
          Row(
            children: [
              Gap(20),
              Text(
                "total :",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  letterSpacing: 3,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Text(
                "$totalPrice TND",
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 3,
                  fontSize: 20,
                ),
              ),
              Gap(20),
            ],
          ),

          Custumer_button(event: "place order", element: element, adress: []),
        ],
      ),
    );
  }
}
