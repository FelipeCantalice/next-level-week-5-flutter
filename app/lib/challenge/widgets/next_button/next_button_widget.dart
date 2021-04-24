import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw_5/core/app_colors.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color color;
  final Color borderColor;
  final VoidCallback onTap;

  NextButtonWidget({
    required this.label,
    required this.backgroundColor,
    required this.color,
    required this.borderColor,
    required this.onTap,
  });

  NextButtonWidget.green({
    required String label,
    required VoidCallback onTap,
  })   : this.label = label,
        this.color = AppColors.white,
        this.backgroundColor = AppColors.darkGreen,
        this.borderColor = AppColors.green,
        this.onTap = onTap;

  NextButtonWidget.white({
    required String label,
    required VoidCallback onTap,
  })   : this.label = label,
        this.color = AppColors.grey,
        this.backgroundColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  NextButtonWidget.purple({
    required String label,
    required VoidCallback onTap,
  })   : this.label = label,
        this.color = AppColors.white,
        this.backgroundColor = AppColors.purple,
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, fontSize: 15, color: color),
        ),
        onPressed: onTap,
      ),
    );
  }
}
