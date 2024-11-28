import 'package:elearning_app_ui/pages/home_page.dart';
import 'package:elearning_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(context),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List bottomItems = [
      'assets/images/home_icon.svg',
      'assets/images/play_icon.svg',
      'assets/images/rocket_icon.svg',
      'assets/images/user_icon.svg',
    ];
    return Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(
        color: textWhite,
        boxShadow: [
          BoxShadow(
            color: textBlack.withOpacity(0.12),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            bottom: 10,
            top: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottomItems.length,
              (index) {
                return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomItems[index],
                        height: 17.5,
                        colorFilter: ColorFilter.mode(
                          pageIndex == index ? primary : secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      (pageIndex == index)
                          ? AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn,
                              child: Container(
                                height: 5,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          : const SizedBox(
                              width: 20,
                              height: 5,
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
