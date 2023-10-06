import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onTap;
  const RoundButton(
      {super.key,
      required this.title,
      this.isLoading = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading ? const CircularProgressIndicator() : Text(title),
        ),
      ),
    );
  }
}
