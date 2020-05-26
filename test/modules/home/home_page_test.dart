import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:highvibe/modules/home/home_page.dart';
import 'package:highvibe/modules/home/home_module.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/values/Strings.dart';

class MockHomeController extends HomeController {
  @override
  Future<List<Video>> getVideos() => Future.value([mockVideo]);

  @override
  Future<List<User>> getAuthors() => Future.value([mockUser]);
}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(HomeModule(), changeBinds: [
    Bind<HomeController>((i) => MockHomeController()),
  ]);

  testWidgets('Home page', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));

    var quoteFinder = find.text(Strings.defaultQuote);
    var videosFinder = find.text(Strings.recommendedForYou);

    expect(quoteFinder, findsOneWidget);
    expect(videosFinder, findsNothing);

    await tester.pump(Duration.zero);

    expect(videosFinder, findsOneWidget);
  });
}
