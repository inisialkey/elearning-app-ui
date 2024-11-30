import 'package:elearning_app_ui/datas/category_json.dart';
import 'package:elearning_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          homePageCategoryJson.length,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: size.width * .25,
                width: size.width * .25,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: textWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: textBlack.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
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
                        homePageCategoryJson[index]['icon'],
                        colorFilter:
                            const ColorFilter.mode(textWhite, BlendMode.srcIn),
                        width: 15,
                      ),
                    ),
                    Text(
                      homePageCategoryJson[index]['title'],
                      style: const TextStyle(
                        color: secondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
