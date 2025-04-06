import 'package:flutter/material.dart';
import 'package:awesome_notes/core/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.9),
            blurRadius: 0,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: black),
        ),
        onPressed: () {
          // Add your onPressed functionality here
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}