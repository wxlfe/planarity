import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('deploy workflow', () {
    test('builds web and prepares Vercel deployment files', () {
      final workflow = File(
        '.github/workflows/deploy-web-to-vercel.yml',
      ).readAsStringSync();

      expect(workflow, contains('run: flutter pub get'));
      expect(workflow, contains('run: flutter build web'));
      expect(workflow, contains('cp vercel.json build/web/vercel.json'));
      expect(workflow, contains('mkdir -p build/web/.well-known'));
      expect(
        workflow,
        contains(
          'cp web/.well-known/apple-app-site-association '
          'build/web/.well-known/apple-app-site-association',
        ),
      );
      expect(
        workflow,
        contains(
          'cp web/.well-known/assetlinks.json '
          'build/web/.well-known/assetlinks.json',
        ),
      );
      expect(workflow, contains('vercel --cwd build/web deploy'));
    });

    test(
      'Vercel routing files copied by deploy workflow exist and are valid',
      () {
        final deployFiles = <String>[
          'vercel.json',
          'web/.well-known/apple-app-site-association',
          'web/.well-known/assetlinks.json',
        ];

        for (final path in deployFiles) {
          final file = File(path);
          expect(file.existsSync(), isTrue, reason: '$path must exist');
          expect(
            () => jsonDecode(file.readAsStringSync()),
            returnsNormally,
            reason: '$path must contain valid JSON',
          );
        }
      },
    );
  });
}
