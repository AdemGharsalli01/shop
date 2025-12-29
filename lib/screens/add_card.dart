import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/componment/app_bar.dart';

class Addcard extends StatefulWidget {
  final List  savedData;

  const Addcard({super.key,required this.savedData});
  

  @override
  State<Addcard> createState() => _AddcardState();
  
}

class _AddcardState extends State<Addcard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardName = '';
  String cvvCode = '';
  bool showBackView = false;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (widget.savedData.isNotEmpty) {
      cardNumber = widget.savedData[0];
      expiryDate = widget.savedData[1];
      cardName = widget.savedData[2];
      cvvCode = widget.savedData[3];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: costom_App_bar(isBlackk: false, cards: []),
        body: Column(
          children: [
            // header decoration
            Text("add card", style: TextStyle(fontSize: 30, letterSpacing: 8)),
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
            // card whidget
            Gap(30),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              onCreditCardWidgetChange: (c) {},
              cardBgColor: Colors.grey.shade900,
              isHolderNameVisible: true,
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardName,
              cvvCode: cvvCode,
              onCreditCardModelChange: onCreditCardModelChange,
              formKey: formKey,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                final data = [cardNumber, expiryDate, cardName, cvvCode];

                Navigator.pop(context, data);
              },
              child: Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.grey.shade800),
                ),
                height: 90,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "add card".toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cardName = data.cardHolderName;
      cvvCode = data.cvvCode;
      showBackView = data.isCvvFocused;
    });
  }
}
