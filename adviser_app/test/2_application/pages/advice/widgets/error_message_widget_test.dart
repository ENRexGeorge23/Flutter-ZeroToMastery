import 'package:adviser_app/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String message}) {
    return MaterialApp(
      home: ErrorMessage(
        message: message,
      ),
    );
  }

  group('ErrorMessage', () {
    group('should be displayed correctly', () {
      testWidgets(
        'when a short text is given',
        (widgetTester) async {
          await widgetTester.pumpWidget(widgetUnderTest(message: 'a'));
          await widgetTester.pumpAndSettle();

          final errorMessageFinder = find.byType(ErrorMessage);

          expect(errorMessageFinder, findsOneWidget);
        },
      );
    });
  });
}
