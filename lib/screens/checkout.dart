import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/componment/app_bar.dart';
import 'package:shop/componment/custumer%20button.dart';
import 'package:shop/medels/product.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, required this.element});

  final List<Product> element;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final List<Product> element = widget.element;

    double totalPrice = (element.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (double.parse(element.price) * element.qty),
    ));

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: costom_App_bar(isBlackk: false, cards: element),
      
        body: Column(
          children: [
            // header decoration
            Text("checkout", style: TextStyle(fontSize: 30, letterSpacing: 8)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800),
                  ),
                  height: 2,
                  width: 100,
                ),
                Icon(Ionicons.star_outline),
                Container(
                  decoration: BoxDecoration(border:Border.all(color: Colors.grey.shade800,)),
                  height: 2,width:100),
              ],
            ),
            Gap(10),
            // products selected
            SizedBox(
              height: 430,
              child: ListView.builder(
                itemCount: element.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(element[i].image, width: 200),
                              Gap(10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    element[i].name,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(10),
                                  Text(
                                    element[i].description,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(10),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (element[i].qty >= 2) {
                                            element[i].qty -= 1;
                                            setState(() {});
                                          }
                                        },
                                        child: Icon(
                                          Ionicons.remove_circle_outline,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "${element[i].qty}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Gap(10),
                                      GestureDetector(
                                        onTap: () {
                                          element[i].qty += 1;
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Ionicons.add_circle_outline,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(10),
                                  Text(
                                    "${element[i].price} TND",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // add promo code
            Gap(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Gap(10),
                  Icon(Ionicons.pricetag_sharp, color: Colors.grey),
                  Gap(10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add promo code",
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      /* if (discount ==true) {
                        for (var dsct in element) {
                          dsct.price = (double.parse(dsct.price) * 0.9)
                              .toString();
                        }
      
                        discount = false;
                        setState(() {});
                      }  */
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      child: Text("Apply", style: TextStyle(color: Colors.white)),
                    ),
                  ),
      
                  Gap(10),
                ],
              ),
            ),
            Gap(20),
            // delevry methode
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delevry price",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Free",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            // total price
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total price",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$totalPrice TND",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //spacer
            Spacer(),
            // botton
            Custumer_button(event: "confirm order", element: element, adress: [],),
          ],
        ),
      ),
    );
  }
}
