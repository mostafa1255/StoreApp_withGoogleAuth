import 'package:flutter/material.dart';

import '../../cubit/auth_cubit.dart';

// ignore: must_be_immutable
class CustomAuthGoogleFacebook extends StatelessWidget {
  CustomAuthGoogleFacebook(
      {super.key,
      required this.googleonPressed,
      required this.facebookonPressed,
      required this.device,
      required this.authcubit});

  void Function()? googleonPressed;
  void Function()? facebookonPressed;
  final Size device;
  final AuthCubit authcubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: device.width * 0.28,
        ),
        Container(
          width: device.width * 0.17,
          height: device.height * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey),
          child: IconButton(
            onPressed: googleonPressed,
            icon: Image.asset("assets/google.png"),
            iconSize: 35,
          ),
        ),
        SizedBox(
          width: device.width * 0.1,
        ),
        Container(
          width: device.width * 0.18,
          height: device.height * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey),
          child: IconButton(
            onPressed: facebookonPressed,
            icon: Image.asset("assets/facebook (2).png"),
            iconSize: 35,
          ),
        ),
      ],
    );
  }
}
