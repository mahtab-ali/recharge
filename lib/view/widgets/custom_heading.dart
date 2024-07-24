import 'package:flutter/material.dart';
import 'package:recharge_app/util/color.dart';
import 'package:recharge_app/util/text_styles.dart';

class CustomHeading extends StatelessWidget {
// Properties

  final String? title;
  final Color? color;
  final Widget? trailing;
  final Function? onTrailingClick;

// Constructor

  const CustomHeading({
    super.key,
    this.title,
    this.color,
    this.trailing,
    this.onTrailingClick,
  });

// Build
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Text(
                      title ?? "",
                      style: AppText.headingTwo(),
                    ),
                  ),
                  if (trailing != null)
                    InkWell(
                      onTap: () {
                        if (onTrailingClick != null) onTrailingClick!();
                      },
                      child: trailing!,
                    ),
                ],
              ),
              Positioned(
                top: 22,
                left: 0,
                width: 15,
                height: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color ?? AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
