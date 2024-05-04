// import 'dart:js';

import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/ProgressBar/profileSetUpProgressBar.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/accountHolderName.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/addShopImages.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/bankAccountDetails.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/chairsSelection.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/proofSubmission.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/serviceCostAndTime.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/shopDetails.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/shopLocation.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/shopOpeningHours.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/ShopServices/shopServices.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/shopType.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Registration Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white38,
        padding: EdgeInsets.all(12.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        
            ProfileSetUpProgressBar(
              currentStep: _currentStep,
              totalSteps: 10,
            ),
        
            SizedBox(height: 20.0),
        
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: _buildCurrentStep()
              ),
        
            SizedBox(height: 20.0),
        
            Container(
              // height: MediaQuery.of(context).size.width * 0.6,
              // color: Colors.blueAccent,
              child: Row(
                
                mainAxisAlignment:(_currentStep != 10 && _currentStep!=0)
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.spaceEvenly,
                children: [
                  if (_currentStep != 0)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentStep--;
                        });
                      },
                      child: Icon(Icons.arrow_back_outlined,size: 25,),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<CircleBorder>(
                          CircleBorder(), // Makes the button circular
                        ),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(50,50), // Adjust width as needed
                        ),
                      ),
                    ),
                  if(_currentStep!=10)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentStep < 10 ? _currentStep += 1 : null;
                      });
                    },
                    child: Icon(Icons.arrow_forward,size: 25,),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<CircleBorder>(
                          CircleBorder(), // Makes the button circular
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(50,50), // Adjust width as needed
                      ),
                    ),
                  ),
                ],

              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
      switch (_currentStep) {
        case 0:
          return AccountHolderName();
        case 1:
          return ShopDetails();
        case 2:
          return ShopType();
        case 3:
          return ShopLocation();
        case 4:
          return AddShopImages();
        case 5:
          return ChairsSelection();
        case 6:
          return ShopOpeningHours();
        case 7:
          return ShopServices();
        case 8:
          return ServiceCostAndTime();
        case 9:
          return BankAccountDetails();
        case 10:
          return ProofSubmission();
        default:
          return Container();
      }
  }
}




















