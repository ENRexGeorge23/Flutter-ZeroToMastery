import 'package:adviser_app/2_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget widgetUnderTest({required String adviceText}) {
  return MaterialApp(
    home: AdviceField(advice: adviceText),
  );
}

void main() {
  group('AdviceField', () {
    group('should be displayed correctly', () {
      testWidgets('when a short text is given', (widgetTester) async {
        const text = 'a';

        await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining('a');

        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when a long text is given', (widgetTester) async {
        const text =
            'Learning a little each day adds up. Research shows that students who make learning a habit are more likely to reach their goals. Set time aside to learn and get reminders using your learning scheduler. ';

        await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(AdviceField);

        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when no text is given', (widgetTester) async {
        const text = '';

        await widgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.text(AdviceField.emptyAdvice);
        final adviceText =
            widgetTester.widget<AdviceField>(find.byType(AdviceField)).advice;

        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, '');
      });
    });
  });
}
