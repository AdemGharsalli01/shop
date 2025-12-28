import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop/componment/app_bar.dart';
import 'package:shop/componment/text_field_costmer.dart';

class AdressDetails extends StatefulWidget {
  const AdressDetails({super.key, this.editData ,required this.event });

  final dynamic editData;
   final dynamic event; 

  @override
  State<AdressDetails> createState() => _AddAddressState();
}

class _AddAddressState extends State<AdressDetails> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    
    
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose(); 
    super.dispose();
  }

  //final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
       if (widget .event.isNotEmpty) {
        firstNameController.text = widget.event[0];
        lastNameController.text = widget.event[1];
        addressController.text = widget.event[2];
        cityController.text = widget.event[3];
        stateController.text = widget.event[4];
        zipCodeController.text = widget.event[5];
        phoneController.text = widget.event[6];
      } 
    return Scaffold(
      appBar: costom_App_bar(isBlackk: false, cards: []),

      body: Column(
        children: [
          Gap(20),
          Text(
            "Adress Details",
            style: TextStyle(fontSize: 30, letterSpacing: 8),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              //key: _formkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldCostmer(
                          label: 'First name',
                          controller: firstNameController,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFieldCostmer(
                          label: 'Last name',
                          controller: lastNameController,
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  TextFieldCostmer(
                    label: 'Address',
                    controller: addressController,
                  ),
                  Gap(30),
                  TextFieldCostmer(label: 'City', controller: cityController),
                  Gap(30),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldCostmer(
                          label: 'State',
                          controller: stateController,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFieldCostmer(
                          label: 'ZIP Code',
                          controller: zipCodeController,
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  TextFieldCostmer(
                    label: 'Phone Number',
                    controller: phoneController,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
         /*  Custumer_button(
            event: "add adress",
            element: [],
            adress: [
              firstNameController.text,
              lastNameController.text,
              addressController.text,
              cityController.text,
              stateController.text,
              zipCodeController.text,
              phoneController.text,
            ],
          ), */
          GestureDetector(
            onTap: () {
              final data=[
                  firstNameController.text,
                  lastNameController.text,
                  addressController.text,
                  cityController.text,
                  stateController.text,
                  zipCodeController.text,
                  phoneController.text,
                ];
                






                Navigator.pop(context,data);
            },
            child: Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.grey.shade800),
                ),
                height: 90,
                width: double.infinity,
                child: Center(child: Text("add adress".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
          ),
        
        
        
        ],
      ),
    );
  }
}
