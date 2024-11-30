import 'package:elearning_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String route;
  final bool extend;
  final double fontSize;
  final dynamic arg;
  const CustomTitle({
    super.key,
    required this.title,
    this.route = '/404',
    this.extend = true,
    this.fontSize = 20,
    this.arg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        (extend)
            ? GestureDetector(
                onTap: () {},
                child: const Text(
                  'See More',
                  style: TextStyle(
                    color: primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
