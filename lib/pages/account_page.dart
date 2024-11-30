import 'package:elearning_app_ui/datas/account_menu_json.dart';
import 'package:elearning_app_ui/datas/user_profile.dart';
import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/theme/padding.dart';
import 'package:elearning_app_ui/widgets/custom_button_box.dart';
import 'package:elearning_app_ui/widgets/custom_heading.dart';
import 'package:elearning_app_ui/widgets/custom_place_holder.dart';
import 'package:elearning_app_ui/widgets/custom_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          const SizedBox(
            height: spacer - 1,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomHeading(
                title: 'Account',
                subTitle: 'Student',
                color: secondary,
              ),
              Text(
                'Become an Instructor?',
                style: TextStyle(
                  color: primary,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: spacer,
          ),

          // Profile
          SizedBox(
            height: size.width * .3,
            width: size.width * .3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                userProfile['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: smallSpacer,
          ),
          Text(
            userProfile['full_name']!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: secondary,
            ),
          ),
          const SizedBox(
            height: miniSpacer,
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 15,
                color: primary,
              ),
            ),
          ),

          const SizedBox(
            height: spacer,
          ),

          Column(
            children: List.generate(
              accountMenuJson.length,
              (index) {
                List data = accountMenuJson[index]['categories'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: spacer),
                  child: Column(
                    children: [
                      CustomTitle(
                        title: accountMenuJson[index]['title'],
                        extend: false,
                      ),
                      const SizedBox(height: smallSpacer),
                      Column(
                        children: List.generate(
                          data.length,
                          (j) {
                            return CustomPlaceHolder(
                              title: data[j]['title'],
                              isSwitch: data[j]['isSwitch'],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => getPopUp(context),
              );
            },
            child: const CustomButtonBox(title: 'Sign Out'),
          ),
          const SizedBox(
            height: smallSpacer,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'v1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: secondary.withOpacity(.5),
              ),
            ),
          ),
          const SizedBox(height: spacer),
        ],
      ),
    );
  }

  Widget getPopUp(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Are you sure want to logout?'),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {},
          child: const Text(
            'Sign Out',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
