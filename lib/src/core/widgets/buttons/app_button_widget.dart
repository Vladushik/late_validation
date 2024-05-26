import 'package:flutter/material.dart';

import 'package:clario_test/src/core/resources/app_text_styles.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isValid = true,
    super.key,
  });

  final String title;
  final void Function()? onPressed;
  final bool isLoading;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF70C3FF),
            Color(0xFF4B65FF),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(36)),
      ),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(36)),
          ),
        ),
        onPressed: (isLoading || !isValid) ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: AppTextStyles.buttonTitleStyle,
              ),
      ),
    );
  }
}
