import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:planarity/main.dart';

void main() {
  test('score updates when a graph is solved', () {
    expect(scoreForSolvedLevel(level: 6, movesUsed: 2), 4);
    expect(scoreForSolvedLevel(level: 6, movesUsed: 6), 0);
    expect(scoreForSolvedLevel(level: 6, movesUsed: 8), 0);
  });

  testWidgets('Home page shows mobile leaderboard with global default', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const PlanarityApp());
    await tester.pumpAndSettle();

    expect(find.text('planarity'), findsAtLeastNWidgets(1));
    expect(find.text('start'), findsOneWidget);
    expect(find.text('leaderboard'), findsOneWidget);
    expect(find.text('Global'), findsOneWidget);
    expect(find.text('global top score'), findsOneWidget);
  });

  testWidgets('Home page shows leaderboard alongside hero on wide screens', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const PlanarityApp());
    await tester.pumpAndSettle();

    expect(find.text('leaderboard'), findsOneWidget);
    expect(find.text('start'), findsOneWidget);
  });
}
