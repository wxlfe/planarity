import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';

export 'generated/app_localizations.dart' show AppLocalizations;

extension AppLocalizationsBuildContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AppLocalizationsReportReason on AppLocalizations {
  String reportReasonLabel(String value) {
    return switch (value) {
      'inappropriate_display_name' => reportReasonInappropriateDisplayName,
      'abuse' => reportReasonAbuse,
      'impersonation' => reportReasonImpersonation,
      'spam' => reportReasonSpam,
      'other' => reportReasonOther,
      _ => value,
    };
  }
}

extension AppLocalizationsLevelSubtitle on AppLocalizations {
  String levelSubtitle({required int score, required int moveCount}) {
    if (score >= 30) {
      return levelSubtitlePerfectSolve;
    }
    if (score >= 15) {
      return levelSubtitleKeepStreak;
    }
    if (score >= 5) {
      return levelSubtitleNoCrossings;
    }
    return levelSubtitleUntangleMoves(moveCount);
  }
}
