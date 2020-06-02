import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:highvibe/modules/home/home_page.dart';
import 'package:highvibe/modules/home/home_module.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/values/Strings.dart';

class MockHomeController extends HomeController {
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(HomeModule(), changeBinds: [
    Bind<HomeController>((i) => MockHomeController()),
  ]);

  testWidgets('Home page', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(const HomePage()));

    final quoteFinder = find.text(Strings.defaultQuote);

    expect(quoteFinder, findsOneWidget);
  });
}
