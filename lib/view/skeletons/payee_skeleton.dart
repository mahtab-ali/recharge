import 'package:flutter/material.dart';
import 'package:recharge_app/util/color.dart';
import 'package:shimmer/shimmer.dart';

class PayeeSkeleton extends StatelessWidget {
  PayeeSkeleton({super.key});
  final Color color = AppColors.dark.withAlpha(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(5),
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
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 80,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: 100,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
