// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:airwaycompanion/screens/home_screen.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}




class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  int GetRandomNumber()
  {
      var rand=Random();
      int otp=rand.nextInt(999999)+100000;
      return otp;
  }

var Phones=new Map();




  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if(authCredential.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }

    // ignore: avoid_types_as_parameter_names
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

    _scaffoldKey.currentState!
        // ignore:
        .showSnackBar(SnackBar(content: Text(e.message?? "Default value")));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(
            hintText: "Phone Number",
          ),
        ),



        const SizedBox(
          height: 16,
        ),


      
        FlatButton(
          
          onPressed: () async {
            int val=GetRandomNumber();
            print("Random Number is: ${val}");
            while(Phones[val]==true)
            {
              val=GetRandomNumber();
            }
            Phones[val]=true;
            print("Random Number is: ${val}");
            setState(() {
              showLoading = true;
            });


           
            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              // ignore: duplicate_ignore
              verificationFailed: ( verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                // ignore: unnecessary_null_comparison
                if(verificationFailed==null)
                {
                  return;
                }
                // ignore: 
                _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(content: Text(verificationFailed.message??"")));
                // }
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );

            PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: val.toString());
          },
          child: const Text("SEND"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        const Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpController,
          decoration: const InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: const Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}