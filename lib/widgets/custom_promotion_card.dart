import 'package:elearning_app_ui/datas/promotion.dart';
import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomPromotionCard extends StatelessWidget {
  const CustomPromotionCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: appPadding,
        right: appPadding,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width,
            height: size.width * .425,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promotion['title']!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: textWhite,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: size.width * .425,
                  child: Text(
                    promotion['subTitle']!,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: textWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 100,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Enroll Now',
                    style: TextStyle(
                      fontSize: 15,
                      color: textWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            right: 20,
            child: SizedBox(
              height: size.width * .4,
              child: SvgPicture.asset(promotion['image']!),
            ),
          ),
        ],
      ),
    );
  }
}
