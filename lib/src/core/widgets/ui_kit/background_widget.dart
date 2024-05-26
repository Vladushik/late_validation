import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFFF4F9FF),
            Color(0xFFE0EDFB),
          ],
        ),
      ),
      child: child,
    );
  }
}
