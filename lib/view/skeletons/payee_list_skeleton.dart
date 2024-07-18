import 'package:flutter/material.dart';
import 'package:recharge_app/util/color.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slideable/slideable.dart';

class PayeeListSkeleton extends StatelessWidget {
// props
  final Color color = AppColors.dark.withAlpha(80);

// const
  PayeeListSkeleton({super.key});

// build
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: color.withAlpha(10),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
          baseColor: AppColors.dark.withAlpha(80),
          highlightColor: AppColors.dark.withAlpha(10),
          child: Slideable(
            resetSlide: false,
            items: [],
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 15,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 40,
                            height: 10,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    width: 40,
                    height: 15,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
