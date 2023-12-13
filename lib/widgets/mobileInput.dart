// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MobileInput extends StatefulWidget {
  final IconData displayIcon;
  final String pageRoute;
  final TextEditingController controller;
  MobileInput({
    Key? key,
    required this.displayIcon,
    required this.pageRoute,
    required this.controller,
  }) : super(key: key);

  @override
  State<MobileInput> createState() => _MobileInputState();
}

class _MobileInputState extends State<MobileInput> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                controller: _controller,
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
                onTap: () {
                  Get.toNamed(widget.pageRoute);
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
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                        TextSpan(
                            text: 'and ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                      ]),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -40,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(
                widget.displayIcon,
                size: 40,
              ),
            ),
          ),
        )
      ],
    );
  }
}
