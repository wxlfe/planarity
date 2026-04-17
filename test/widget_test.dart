import 'dart:ui';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:planarity/main.dart';

String _todayKey() {
  final now = DateTime.now();
  final year = now.year.toString().padLeft(4, '0');
  final month = now.month.toString().padLeft(2, '0');
  final day = now.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

String _graphSignature(PlanarityLevel level) {
  final nodeSignature = level.nodes
      .map(
        (node) => '${node.dx.toStringAsFixed(6)},${node.dy.toStringAsFixed(6)}',
      )
      .join('|');
  final edgeSignature = level.edges
      .map((edge) => '${edge.a}-${edge.b}')
      .join('|');
  return '$nodeSignature::$edgeSignature';
}

void main() {
  test('score updates when a graph is solved', () {
    expect(scoreForSolvedLevel(level: 6, movesUsed: 2), 4);
    expect(scoreForSolvedLevel(level: 6, movesUsed: 6), 0);
    expect(scoreForSolvedLevel(level: 6, movesUsed: 8), 0);
  });

  test('display name validation blocks unsafe personal info and profanity', () {
    const invalidMessage = 'invalid name - try something else';

    expect(displayNameValidationMessage('Ada Lovelace'), isNull);
    expect(displayNameValidationMessage('Ada ada@example.com'), invalidMessage);
    expect(displayNameValidationMessage('Ada 555-867-5309'), invalidMessage);
    expect(displayNameValidationMessage('Ada example.com'), invalidMessage);
    expect(displayNameValidationMessage('Ada 123 Main St'), invalidMessage);
    expect(displayNameValidationMessage('Ada PO Box 123'), invalidMessage);
    expect(displayNameValidationMessage('Ada f.u.c.k'), invalidMessage);
  });

  test(
    'daily graph generation is deterministic for the same day and node count',
    () {
      final first = PlanarityGenerator.generate(dayKey: '2026-03-18', level: 6);
      final second = PlanarityGenerator.generate(
        dayKey: '2026-03-18',
        level: 6,
      );
      final equivalentNodeCount = PlanarityGenerator.generate(
        dayKey: '2026-03-18',
        level: 2,
      );
      final equivalentNodeCountAgain = PlanarityGenerator.generate(
        dayKey: '2026-03-18',
        level: 1,
      );

      expect(_graphSignature(first), _graphSignature(second));
      expect(
        _graphSignature(equivalentNodeCount),
        _graphSignature(equivalentNodeCountAgain),
      );
    },
  );

  test('daily graph generation changes when the day or node count changes', () {
    final baseline = PlanarityGenerator.generate(
      dayKey: '2026-03-18',
      level: 6,
    );
    final differentDay = PlanarityGenerator.generate(
      dayKey: '2026-03-19',
      level: 6,
    );
    final differentNodeCount = PlanarityGenerator.generate(
      dayKey: '2026-03-18',
      level: 7,
    );

    expect(_graphSignature(baseline), isNot(_graphSignature(differentDay)));
    expect(
      _graphSignature(baseline),
      isNot(_graphSignature(differentNodeCount)),
    );
  });

  testWidgets('Home page shows mobile leaderboard with global default', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const PlanarityApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('planarity'), findsAtLeastNWidgets(1));
    expect(find.text('start'), findsOneWidget);
    expect(find.text('leaderboard'), findsOneWidget);
    expect(find.text('global'), findsOneWidget);
    expect(find.text('no global scores yet'), findsOneWidget);
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
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('leaderboard'), findsOneWidget);
    expect(find.text('start'), findsOneWidget);
    expect(find.text('daily score'), findsOneWidget);
  });

  testWidgets('Home page follows a Spanish system locale', (
    WidgetTester tester,
  ) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('es')];
    addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);

    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const PlanarityApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('planarity'), findsAtLeastNWidgets(1));
    expect(find.text('comenzar'), findsOneWidget);
    expect(find.text('clasificación'), findsOneWidget);
    expect(find.text('global'), findsOneWidget);
    expect(find.text('puntuación diaria'), findsOneWidget);
    expect(find.text('aún no hay puntuaciones globales'), findsOneWidget);
  });

  testWidgets('Home page follows a Chinese system locale', (
    WidgetTester tester,
  ) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('zh')];
    addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);

    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const PlanarityApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('planarity'), findsAtLeastNWidgets(1));
    expect(find.text('开始'), findsOneWidget);
    expect(find.text('排行榜'), findsOneWidget);
    expect(find.text('全球'), findsOneWidget);
    expect(find.text('每日得分'), findsOneWidget);
    expect(find.text('还没有全球得分'), findsOneWidget);
  });

  testWidgets('Home page follows a Hindi system locale', (
    WidgetTester tester,
  ) async {
    tester.binding.platformDispatcher.localesTestValue = const [Locale('hi')];
    addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);

    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const PlanarityApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('planarity'), findsAtLeastNWidgets(1));
    expect(find.text('शुरू करें'), findsOneWidget);
    expect(find.text('लीडरबोर्ड'), findsOneWidget);
    expect(find.text('वैश्विक'), findsOneWidget);
    expect(find.text('दैनिक स्कोर'), findsOneWidget);
    expect(find.text('अभी कोई वैश्विक स्कोर नहीं है'), findsOneWidget);
  });

  testWidgets('Home page follows additional major system locales', (
    WidgetTester tester,
  ) async {
    addTearDown(tester.binding.platformDispatcher.clearLocalesTestValue);
    const localizedExpectations = <String, List<String>>{
      'ar': [
        'ابدأ',
        'لوحة الصدارة',
        'عالمي',
        'نتيجة اليوم',
        'لا توجد نتائج عالمية بعد',
      ],
      'bn': [
        'শুরু',
        'লিডারবোর্ড',
        'বিশ্বব্যাপী',
        'দৈনিক স্কোর',
        'এখনও কোনো বিশ্বব্যাপী স্কোর নেই',
      ],
      'de': [
        'starten',
        'rangliste',
        'global',
        'tagesscore',
        'noch keine globalen scores',
      ],
      'fr': [
        'commencer',
        'classement',
        'mondial',
        'score du jour',
        'aucun score mondial pour le moment',
      ],
      'id': [
        'mulai',
        'papan peringkat',
        'global',
        'skor harian',
        'belum ada skor global',
      ],
      'it': [
        'inizia',
        'classifica',
        'globale',
        'punteggio giornaliero',
        'nessun punteggio globale ancora',
      ],
      'ja': ['開始', 'ランキング', 'グローバル', 'デイリースコア', 'グローバルスコアはまだありません'],
      'ko': ['시작', '순위표', '글로벌', '일일 점수', '아직 글로벌 점수가 없습니다'],
      'pt': [
        'começar',
        'classificação',
        'global',
        'pontuação diária',
        'ainda não há pontuações globais',
      ],
      'ru': [
        'начать',
        'таблица лидеров',
        'глобально',
        'дневной счет',
        'глобальных результатов пока нет',
      ],
      'tr': [
        'başla',
        'liderlik tablosu',
        'global',
        'günlük skor',
        'henüz global skor yok',
      ],
      'ur': [
        'شروع کریں',
        'لیڈر بورڈ',
        'عالمی',
        'روزانہ اسکور',
        'ابھی کوئی عالمی اسکور نہیں',
      ],
      'vi': [
        'bắt đầu',
        'bảng xếp hạng',
        'toàn cầu',
        'điểm hằng ngày',
        'chưa có điểm toàn cầu',
      ],
    };

    for (final entry in localizedExpectations.entries) {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      tester.binding.platformDispatcher.localesTestValue = [Locale(entry.key)];

      SharedPreferences.setMockInitialValues({});
      await tester.pumpWidget(const PlanarityApp());
      await tester.pump(const Duration(milliseconds: 100));

      expect(
        find.text('planarity'),
        findsAtLeastNWidgets(1),
        reason: 'expected ${entry.key} to show the app name',
      );
      for (final expectedText in entry.value) {
        expect(
          find.text(expectedText),
          findsOneWidget,
          reason: 'expected ${entry.key} to show "$expectedText"',
        );
      }
    }
  });

  testWidgets('Home page shows the saved daily score for today', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'local_guest_user_document': jsonEncode({
        'currentLevel': 8,
        'lastPlayed': _todayKey(),
        'locked': false,
        'score': 7,
      }),
    });

    await tester.pumpWidget(const PlanarityApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('daily score'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('continue'), findsOneWidget);
  });

  testWidgets('Home page resets expired daily score to zero', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'local_guest_user_document': jsonEncode({
        'currentLevel': 10,
        'lastPlayed': '1900-01-01',
        'locked': true,
        'score': 9,
      }),
    });

    await tester.pumpWidget(const PlanarityApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('daily score'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('start'), findsOneWidget);
  });
}
