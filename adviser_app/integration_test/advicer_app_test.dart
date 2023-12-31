import 'package:adviser_app/2_application/pages/advice/widgets/advice_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:adviser_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on custom button, verify advice will be loaded',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      // Verify that no advice has been loaded

      expect(find.text('Your Advice is waiting for you!'), findsOneWidget);

      // Find custom button
      final customButtonFinder = find.text('Get Advice');

      // emulate a tap on the custom button
      await widgetTester.tap(customButtonFinder);

      // Trigger a frame and wait until its setttled
      await widgetTester.pumpAndSettle();

      // Verify that a advice was loaded
      expect(find.byType(AdviceField), findsOneWidget);
      expect(find.textContaining('" '), findsOneWidget);
      expect(find.textContaining(' "'), findsOneWidget);
    });
  });
}
