import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  static String emptyAdvice = 'No more advices left for today';
  final String advice;
  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themedata.colorScheme.onPrimary,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              advice.isNotEmpty ? ''' " $advice " ''' : emptyAdvice,
              style: themedata.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
