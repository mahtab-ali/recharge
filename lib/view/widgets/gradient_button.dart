import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final List<Color> colors;

  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textColor: Colors.white,
        splashColor: Colors.white.withOpacity(0.3),
        child: child,
      ),
    );
  }
}
