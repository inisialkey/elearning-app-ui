import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  const CustomHeading({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: color,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
