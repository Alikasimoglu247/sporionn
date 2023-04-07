import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
        required this.buttontext,
        this.butoncolor: Colors.purple,
        this.textcolor,
        this.radius: 16,
        this.yukseklik,
        required this.butonIcon,
        this.onPressed});

  final String buttontext;
  final Color? butoncolor;
  final Color? textcolor;
  final double? radius;
  final double? yukseklik;
  final Widget butonIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: butoncolor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          butonIcon,
          Text(
            buttontext,
            style: TextStyle(color: textcolor),
          ),
          Opacity( // En sağda iconları göstermiyor.
            opacity: 0,
            child: butonIcon,
          )
        ],
      ),
    );
  }
}


