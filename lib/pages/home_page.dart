import 'package:elearning_app_ui/datas/course_json.dart';
import 'package:elearning_app_ui/datas/user_profile.dart';
import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/theme/padding.dart';
import 'package:elearning_app_ui/widgets/clipper.dart';
import 'package:elearning_app_ui/widgets/custom_category_card.dart';
import 'package:elearning_app_ui/widgets/custom_course_card.dart';
import 'package:elearning_app_ui/widgets/custom_heading.dart';
import 'package:elearning_app_ui/widgets/custom_promotion_card.dart';
import 'package:elearning_app_ui/widgets/custom_search_field.dart';
import 'package:elearning_app_ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userName = userProfile['full_name']!.split(' ');
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: spacer),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: secondary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: appPadding,
                  right: appPadding,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: spacer + 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHeading(
                          title: 'Hi, ${userName[0]}!',
                          subTitle: 'Let\'s start learning',
                          color: textWhite,
                        ),
                        SizedBox(
                          height: spacer,
                          width: spacer,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              userProfile['image'].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: spacer,
                    ),

                    // Search
                    const CustomSearchField(
                      hintField: 'Try "Web Design"',
                      backgroundColor: background,
                    ),
                    const SizedBox(
                      height: spacer - 30,
                    ),

                    // Category Card
                    const CustomCategoryCard(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: spacer,
          ),

          // Promotion Card
          const CustomPromotionCard(),
          const SizedBox(
            height: spacer,
          ),

          // Feature Course
          const Padding(
            padding: EdgeInsets.only(
              left: appPadding,
              right: appPadding,
            ),
            child: CustomTitle(
              title: 'Feature Course',
              arg: {
                'title': 'Feature Course!',
                'list': 'CoursesJson',
              },
            ),
          ),
          const SizedBox(
            height: smallSpacer,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: appPadding,
              right: appPadding - 10,
            ),
            child: Wrap(
              children: List.generate(
                courseJson.length,
                (index) {
                  var data = courseJson[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                      bottom: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: CustomCourseCardExpand(
                        thumbNail: data['image'],
                        videoAmount: data['video'],
                        title: data['title'],
                        userProfile: data['user_profile'],
                        userName: data['user_name'],
                        price: data['price'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
