import 'package:ativo/layers/ui/pages/pages.dart';
import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import '../mocks/mocks.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late SplashPresenterSpy presenter;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = SplashPresenterSpy();
    await tester.pumpWidget(makePage(path: '/', page: () => SplashPage(presenter)));
  }

  tearDown(() {
    presenter.dispose();
  });

  testWidgets('Should present spinner on page load', (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Should change page', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNavigateTo({'/any_route': true});
    await tester.pumpAndSettle();

    expect(currentRoute, '/any_route');
    expect(find.text('fake page'), findsOneWidget);
  });

  testWidgets('Should not change page', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNavigateTo({'': false});
    await tester.pump();
    expect(currentRoute, '/');
  });
}
