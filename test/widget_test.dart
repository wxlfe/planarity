import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:planarity/main.dart';

String _todayKey() {
  final now = DateTime.now().toUtc();
  final year = now.year.toString().padLeft(4, '0');
  final month = now.month.toString().padLeft(2, '0');
  final day = now.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

String _graphSignature(PlanarityLevel level) {
  final nodeSignature = level.nodes
      .map((node) => '${node.dx.toStringAsFixed(6)},${node.dy.toStringAsFixed(6)}')
      .join('|');
  final edgeSignature = level.edges.map((edge) => '${edge.a}-${edge.b}').join('|');
  return '$nodeSignature::$edgeSignature';
}

void main() {
  test('score updates when a graph is solved', () {
    expect(scoreForSolvedLevel(level: 6, movesUsed: 2), 4);
    expect(scoreForSolvedLevel(level: 6, movesUsed: 6), 0);
    expect(scoreForSolvedLevel(level: 6, movesUsed: 8), 0);
  });

  test('daily graph generation is deterministic for the same day and node count', () {
    final first = PlanarityGenerator.generate(dayKey: '2026-03-18', level: 6);
    final second = PlanarityGenerator.generate(dayKey: '2026-03-18', level: 6);
    final equivalentNodeCount = PlanarityGenerator.generate(dayKey: '2026-03-18', level: 2);
    final equivalentNodeCountAgain = PlanarityGenerator.generate(dayKey: '2026-03-18', level: 1);

    expect(_graphSignature(first), _graphSignature(second));
    expect(_graphSignature(equivalentNodeCount), _graphSignature(equivalentNodeCountAgain));
  });

  test('daily graph generation changes when the day or node count changes', () {
    final baseline = PlanarityGenerator.generate(dayKey: '2026-03-18', level: 6);
    final differentDay = PlanarityGenerator.generate(dayKey: '2026-03-19', level: 6);
    final differentNodeCount = PlanarityGenerator.generate(dayKey: '2026-03-18', level: 7);

    expect(_graphSignature(baseline), isNot(_graphSignature(differentDay)));
    expect(_graphSignature(baseline), isNot(_graphSignature(differentNodeCount)));
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
    expect(find.text('daily score'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
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
    expect(find.text('daily score'), findsOneWidget);
  });

  testWidgets('Home page shows the saved daily score for today', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'daily_status': 'inProgress',
      'daily_level': 8,
      'daily_score': 7,
      'daily_day': _todayKey(),
    });

    await tester.pumpWidget(const PlanarityApp());
    await tester.pumpAndSettle();

    expect(find.text('daily score'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('continue'), findsOneWidget);
  });

  testWidgets('Home page resets expired daily score to zero', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'daily_status': 'locked',
      'daily_level': 10,
      'daily_score': 9,
      'daily_day': '1900-01-01',
    });

    await tester.pumpWidget(const PlanarityApp());
    await tester.pumpAndSettle();

    expect(find.text('daily score'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('start'), findsOneWidget);
  });
}
