import 'package:elearning_app_ui/datas/category_json.dart';
import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/theme/padding.dart';
import 'package:elearning_app_ui/widgets/custom_heading.dart';
import 'package:elearning_app_ui/widgets/custom_place_holder.dart';
import 'package:elearning_app_ui/widgets/custom_search_field.dart';
import 'package:elearning_app_ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

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
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: spacer - 1,
          ),

          // header
          const CustomHeading(
            title: 'Explore',
            subTitle: 'Seek for your preference',
            color: secondary,
          ),
          const SizedBox(
            height: spacer,
          ),
          // search
          const CustomSearchField(
            hintField: 'Try Web Design',
            backgroundColor: textWhite,
          ),

          const SizedBox(
            height: spacer,
          ),

          // title
          const CustomTitle(
            title: 'Top Search',
            extend: false,
          ),
          const SizedBox(
            height: smallSpacer,
          ),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              categoryJson.length,
              (index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
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
                  child: Text(
                    categoryJson[index]['title'],
                    style: const TextStyle(
                      color: textWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: spacer,
          ),
          const CustomTitle(
            title: 'Categories',
            extend: false,
          ),
          const SizedBox(
            height: smallSpacer,
          ),
          Column(
            children: List.generate(allCategories.length, (index) {
              var data = allCategories[index];
              var getData = data['data'];
              return Padding(
                padding: const EdgeInsets.only(bottom: miniSpacer),
                child: GestureDetector(
                  onTap: () {},
                  child: CustomPlaceHolder(
                    title: data['title'],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
