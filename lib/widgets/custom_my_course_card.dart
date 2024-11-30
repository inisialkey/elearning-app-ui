import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomMyCourseCard extends StatelessWidget {
  final String image;
  final String title;
  final String instructor;
  final String videoAmount;
  final double percentage;
  const CustomMyCourseCard({
    super.key,
    required this.image,
    required this.title,
    required this.instructor,
    required this.videoAmount,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * .3,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.width * .14,
            child: Row(
              children: [
                SizedBox(
                  height: size.width * .13,
                  width: size.width * .13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: miniSpacer,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: secondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Instructor: $instructor',
                            style: const TextStyle(
                              fontSize: 11,
                              color: grey,
                            ),
                          ),
                          Text(
                            '6/ $videoAmount',
                            style: const TextStyle(
                              fontSize: 11,
                              color: grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: size.width,
                      height: 5,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Container(
                      width: percentage * 2.8,
                      height: 7,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: primary.withOpacity(0.5),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            )
                          ]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: miniSpacer * 2,
              ),
              Container(
                width: 50,
                alignment: Alignment.centerRight,
                child: Text(
                  '$percentage%',
                  style: const TextStyle(
                      fontSize: 13.0,
                      color: primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
