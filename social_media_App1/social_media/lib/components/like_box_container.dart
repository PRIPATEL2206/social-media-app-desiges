import 'package:flutter/material.dart';
import 'package:social_media/components/app_text.dart';

class LikeBoxContainer extends StatelessWidget {
  final Color color;
  final String text;

  const LikeBoxContainer(
      {super.key, this.color = Colors.black, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(75, 255, 255, 255),
          border: Border.all(color: color, width: 4),
          borderRadius: const BorderRadius.all(Radius.elliptical(9, 9))),
      child: AppText(
        text: text,
        fontSize: 30,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
