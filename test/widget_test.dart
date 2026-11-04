import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WOW Pizza app opens successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const WOWPizzaApp());

    expect(find.byType(HomePage), findsOneWidget);
  });
}
