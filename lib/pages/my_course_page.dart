import 'package:elearning_app_ui/datas/course_json.dart';
import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/theme/padding.dart';
import 'package:elearning_app_ui/widgets/custom_heading.dart';
import 'package:elearning_app_ui/widgets/custom_my_course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          const SizedBox(
            height: spacer - 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomHeading(
                title: 'My Course',
                subTitle: 'Let\'s continue, shall we?',
                color: secondary,
              ),
              Text(
                '${myCourseJson.length} Courses',
                style: const TextStyle(
                  color: secondary,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: spacer,
          ),
          Column(
            children: List.generate(
              myCourseJson.length,
              (index) {
                var data = myCourseJson[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: CustomMyCourseCard(
                      image: data['image'],
                      title: data['title'],
                      instructor: data['user_name'],
                      videoAmount: data['video'],
                      percentage: data['percentage'],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
