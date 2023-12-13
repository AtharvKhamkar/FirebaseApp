import 'dart:ffi';

import 'package:bwt_assignment/controller/variables.dart';
import 'package:bwt_assignment/routes/routes.dart';
import 'package:bwt_assignment/screens/homeScreen.dart';
import 'package:bwt_assignment/screens/loginPage.dart';
import 'package:bwt_assignment/utils/utils.dart';
import 'package:bwt_assignment/widgets/mobileInput.dart';
import 'package:bwt_assignment/widgets/roundButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String verify = "";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController mobileNumber = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.homePage);
              },
              child: const Text(
                "SKIP",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/salonImg.png",
            height: MediaQuery.of(context).size.height / 2.4,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            height: 30,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: mobileNumber,
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        suffixIcon: Icon(
                          Icons.call_outlined,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: mobileNumber.text,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            RegisterPage.verify = verificationId;
                            Get.to(const LoginNumber());
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                        Get.to(const homeScreen());
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromRGBO(2, 65, 99, 1),
                        ),
                        child: const Center(
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: RichText(
                        text: const TextSpan(
                            text: 'By continuing you are agree to our ',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Terms & Condition ',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                              TextSpan(
                                  text: 'and ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: -40,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 40,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_add_alt,
                      size: 40,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
