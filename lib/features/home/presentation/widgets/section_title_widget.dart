import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w500,
        height: 0,
      ),
    );
  }
}