import 'package:flutter/material.dart';

class wrongOtp extends StatefulWidget {
  const wrongOtp({super.key});

  @override
  State<wrongOtp> createState() => _wrongOtpState();
}

class _wrongOtpState extends State<wrongOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrong"),
      ),
    );
  }
}