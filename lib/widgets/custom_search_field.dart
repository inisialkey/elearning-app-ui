import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/theme/padding.dart';
import 'package:elearning_app_ui/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchField extends StatelessWidget {
  final String hintField;
  final Color? backgroundColor;
  const CustomSearchField({
    super.key,
    required this.hintField,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: spacer,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: SizedBox(
              child: SvgPicture.asset(
                '${assetImg}search_icon.svg',
                colorFilter: ColorFilter.mode(
                  secondary.withOpacity(0.5),
                  BlendMode.srcIn,
                ),
                height: 15,
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: size.width,
              height: 38,
              alignment: Alignment.topCenter,
              child: TextField(
                style: const TextStyle(fontSize: 15),
                cursorColor: textBlack,
                decoration: InputDecoration(
                  hintText: hintField,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: secondary.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primary.withOpacity(0.7),
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: primary.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SvgPicture.asset(
              '${assetImg}filter_icon.svg',
              colorFilter: const ColorFilter.mode(
                textWhite,
                BlendMode.srcIn,
              ),
              height: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
