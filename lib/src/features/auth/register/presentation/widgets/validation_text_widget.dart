import 'package:flutter/material.dart';

class ValidationTextWidget extends StatelessWidget {
  const ValidationTextWidget({
    required this.isContainsNumber,
    required this.isContainsBothRegisters,
    required this.isCorrectLength,
    required this.password,
    super.key,
  });

  final bool isContainsNumber;
  final bool isContainsBothRegisters;
  final bool isCorrectLength;
  final String password;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Color getColor(bool condition, String value) {
      if (value.isEmpty) return Colors.black;
      if (condition) return Colors.green;
      return theme.colorScheme.onError;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '8 characters or more (no spaces)',
          style: TextStyle(color: getColor(isCorrectLength, password)),
        ),
        const SizedBox(height: 8),
        Text(
          'Uppercase and lowercase letters',
          style: TextStyle(color: getColor(isContainsBothRegisters, password)),
        ),
        const SizedBox(height: 8),
        Text(
          'At least one digit',
          style: TextStyle(color: getColor(isContainsNumber, password)),
        ),
      ],
    );
    ;
  }
}
