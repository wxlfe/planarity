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
