import 'package:elearning_app_ui/theme/colors.dart';
import 'package:elearning_app_ui/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomPlaceHolder extends StatefulWidget {
  final String title;
  final bool isSwitch;
  const CustomPlaceHolder({
    super.key,
    required this.title,
    this.isSwitch = false,
  });

  @override
  State<CustomPlaceHolder> createState() => _CustomPlaceHolderState();
}

class _CustomPlaceHolderState extends State<CustomPlaceHolder> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.width * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 15,
              color: grey,
            ),
          ),
          (widget.isSwitch)
              ? CupertinoSwitch(
                  value: switchValue,
                  activeColor: primary,
                  onChanged: (bool newValue) {
                    setState(() {
                      switchValue = newValue;
                    });
                  },
                )
              : SvgPicture.asset(
                  '${assetImg}arrow_up_icon.svg',
                ),
        ],
      ),
    );
  }
}
