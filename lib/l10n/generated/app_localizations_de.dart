// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get account => 'konto';

  @override
  String get accountDeleted => 'konto gelöscht';

  @override
  String get accountExistsSignInInstead => 'konto existiert - bitte anmelden';

  @override
  String addedFriend(String friendName) {
    return '$friendName hinzugefügt';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '$inviterName zur freundesliste hinzufügen?';
  }

  @override
  String get addFriend => 'freund hinzufügen';

  @override
  String get alreadySignedUp => 'schon registriert?';

  @override
  String get anonymousPlayer => 'anonymer spieler';

  @override
  String get appleSignInUnavailablePlatform =>
      'Die Apple-Anmeldung ist auf dieser Plattform nicht verfügbar';

  @override
  String get appleSignInUnavailableRightNow =>
      'Die Apple-Anmeldung ist derzeit nicht verfügbar';

  @override
  String get authConfigurationInvalid =>
      'Die Authentifizierungskonfiguration ist für diese App ungültig';

  @override
  String get authConfigurationMissing =>
      'Authentifizierungskonfiguration fehlt';

  @override
  String get back => 'zurück';

  @override
  String get cancel => 'abbrechen';

  @override
  String get continueLabel => 'weiter';

  @override
  String continueWithScore(int totalScore) {
    return 'weiter - $totalScore';
  }

  @override
  String get continueWithApple => 'weiter mit Apple';

  @override
  String get continueWithGoogle => 'weiter mit Google';

  @override
  String get copyInviteLink => 'Einladungslink kopieren';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'Erstellen Sie ein Konto mit Ihrer E-Mail-Adresse und Ihrem Passwort.';

  @override
  String get dailyGraphPuzzle => 'tägliches graphenrätsel';

  @override
  String get dailyScore => 'tagesscore';

  @override
  String get decline => 'Abfall';

  @override
  String get deleteAccount => 'konto löschen';

  @override
  String get details => 'Details';

  @override
  String get detailsTooLong => 'Details dürfen maximal 1000 Zeichen lang sein';

  @override
  String get displayName => 'Anzeigename';

  @override
  String get email => 'e-mail';

  @override
  String get enterEmailAndPassword => 'Geben Sie E-Mail und Passwort ein';

  @override
  String get enterEmailFirst => 'Geben Sie zuerst Ihre E-Mail-Adresse ein';

  @override
  String get enterValidEmail => 'Geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String failedNodes(int nodeCount) {
    return '$nodeCount knoten fehlgeschlagen';
  }

  @override
  String get friendInvite => 'Freund einladen';

  @override
  String get friends => 'freunde';

  @override
  String get global => 'global';

  @override
  String get globalSnapshot => 'globale Momentaufnahme';

  @override
  String get globalTopScore => 'weltweite Bestnote';

  @override
  String get googleSignInUnavailablePlatform =>
      'Die Google-Anmeldung ist auf dieser Plattform nicht verfügbar';

  @override
  String get googleSignInNotConfigured =>
      'Die Google-Anmeldung ist für diese App nicht konfiguriert';

  @override
  String get googleSignInNotConfiguredIos =>
      'Die Google-Anmeldung ist für diese iOS-App nicht konfiguriert';

  @override
  String get home => 'startseite';

  @override
  String get hideUserName => 'Benutzernamen ausblenden';

  @override
  String get ifEmailExistsResetLink =>
      'Wenn diese E-Mail existiert, haben wir einen Link zum Zurücksetzen gesendet';

  @override
  String get invalidEmailOrPassword =>
      'Ungültige E-Mail-Adresse oder ungültiges Passwort';

  @override
  String get invalidNameTrySomethingElse =>
      'Ungültiger Name – versuchen Sie es mit etwas anderem';

  @override
  String get invite => 'einladen';

  @override
  String get inviteLinkCopied => 'Einladungslink kopiert';

  @override
  String get leaderboard => 'rangliste';

  @override
  String get lifetimeScore => 'Lifetime-Score';

  @override
  String lifetimeScoreValue(int score) {
    return 'gesamtpunktzahl $score';
  }

  @override
  String get locked => 'gesperrt';

  @override
  String get macosKeychainNotConfigured =>
      'Der Zugriff auf den macOS-Schlüsselbund ist nicht konfiguriert';

  @override
  String get moreOptions => 'mehr Optionen';

  @override
  String get networkErrorCheckConnection =>
      'Netzwerkfehler – überprüfen Sie Ihre Verbindung';

  @override
  String get newHere => 'Neu hier?';

  @override
  String get noFriendsYet => 'Du hast noch keine Freunde hinzugefügt';

  @override
  String get noFriendsLeaderboard =>
      'Sie haben noch keine Freunde hinzugefügt – öffnen Sie Ihr Profil, um jemanden einzuladen';

  @override
  String get noGlobalScoresYet => 'noch keine globalen scores';

  @override
  String get originalByJohnTantalo => 'Original von John Tantalo';

  @override
  String get password => 'passwort';

  @override
  String get passwordMinLength =>
      'Das Passwort muss mindestens 6 Zeichen lang sein';

  @override
  String get passwordTooWeak => 'Passwort ist zu schwach';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'Wikipedia: Planarer Graph';

  @override
  String get pressAgainToDelete => 'Zum Löschen erneut drücken';

  @override
  String get profile => 'profil';

  @override
  String get profileSubtitle =>
      'Aktualisieren Sie die Darstellung Ihres Namens in Ihrem Profil';

  @override
  String get reason => 'Grund';

  @override
  String get remove => 'entfernen';

  @override
  String removeFriendQuestion(String displayName) {
    return '$displayName aus deiner freundesliste entfernen?';
  }

  @override
  String get removeFriend => 'Freund entfernen';

  @override
  String get reportPlayer => 'Spieler melden';

  @override
  String get reportSubmitted => 'Bericht vorgelegt';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'Bericht eingereicht – Freund konnte nicht entfernt werden';

  @override
  String get resetPassword => 'Passwort zurücksetzen';

  @override
  String get share => 'teilen';

  @override
  String get shareInvitePrompt =>
      'Teilen Sie diesen QR-Code oder Link, um einen Freund einzuladen';

  @override
  String get shareUnavailableBuild =>
      'Die Freigabe ist für diesen Build nicht verfügbar';

  @override
  String get signIn => 'anmelden';

  @override
  String get signInAgainBeforeDeleting =>
      'Melden Sie sich erneut an, bevor Sie Ihr Konto löschen';

  @override
  String get signInMethodNotEnabled =>
      'Diese Anmeldemethode ist nicht aktiviert';

  @override
  String get signInSubtitle =>
      'Melden Sie sich mit Ihrer E-Mail-Adresse und Ihrem Passwort an';

  @override
  String get signOut => 'abmelden';

  @override
  String get signUp => 'registrieren';

  @override
  String get signUpToCompete => ' um mit deinen Freunden zu konkurrieren';

  @override
  String solvedNodes(int nodeCount) {
    return '$nodeCount knoten gelöst';
  }

  @override
  String get start => 'starten';

  @override
  String get submit => 'senden';

  @override
  String get thisPlayer => 'dieser Spieler';

  @override
  String get tooManyAttempts =>
      'Zu viele Versuche – versuchen Sie es später noch einmal';

  @override
  String get unableAuthenticateRightNow =>
      'Die Authentifizierung ist derzeit nicht möglich';

  @override
  String get unableCreateAccountRightNow =>
      'Ich kann derzeit kein Konto erstellen';

  @override
  String get unableCreateProfileRightNow =>
      'Ihr Profil kann derzeit nicht erstellt werden';

  @override
  String get unableDeleteAccountRightNow =>
      'Ihr Konto kann derzeit nicht gelöscht werden';

  @override
  String get unableDeleteProfileRightNow =>
      'Ihr Profil kann derzeit nicht gelöscht werden';

  @override
  String get unableLoadFriendsLeaderboard =>
      'Die Bestenliste der Freunde kann derzeit nicht geladen werden';

  @override
  String get unableLoadGlobalLeaderboard =>
      'Die globale Bestenliste kann derzeit nicht geladen werden';

  @override
  String get unableSendResetEmailRightNow =>
      'Es ist momentan nicht möglich, eine E-Mail zum Zurücksetzen zu senden';

  @override
  String get unableSubmitReportRightNow =>
      'Der Bericht kann derzeit nicht eingereicht werden';

  @override
  String get unableUpdateHiddenNames =>
      'Ausgeblendete Namen können nicht aktualisiert werden';

  @override
  String get unableCreateAccountNoUser =>
      'Ich kann derzeit kein Konto erstellen';

  @override
  String get unhideUserName => 'Benutzernamen einblenden';

  @override
  String get you => 'Du';

  @override
  String get youAndYourFriends => 'Du und deine Freunde';

  @override
  String get youAlreadyReportedPlayer =>
      'Du hast diesen Spieler bereits gemeldet';

  @override
  String get youCantAddYourself => 'Du kannst dich nicht selbst hinzufügen';

  @override
  String get yourGlobalPosition => 'Ihre globale Position';

  @override
  String get yourNewFriend => 'Dein neuer Freund';

  @override
  String get friendAlreadyInList => 'Dieser Freund ist bereits in Ihrer Liste';

  @override
  String get friendInviteNoLongerValid =>
      'Diese Freundschaftseinladung ist nicht mehr gültig';

  @override
  String get about => 'um';

  @override
  String get goal => 'Ziel';

  @override
  String get goalDescription =>
      'Lösen Sie jeden Tag so viele Diagramme wie möglich mit möglichst wenigen Zügen';

  @override
  String get whyEveryPuzzleIsSolvable => 'warum jedes Rätsel lösbar ist';

  @override
  String get planarGraphDescription =>
      'Jeder planare Graph ist lösbar, weil es ein planarer Graph ist. Ein planarer Graph ist ein Graph, der auf einer flachen Oberfläche gezeichnet werden kann, sodass sich keine Kanten kreuzen, außer dort, wo sie sich an gemeinsamen Eckpunkten treffen.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'unangemessener anzeigename';

  @override
  String get reportReasonAbuse => 'missbrauch oder belästigung';

  @override
  String get reportReasonImpersonation => 'identitätsmissbrauch';

  @override
  String get reportReasonSpam => 'spam oder betrug';

  @override
  String get reportReasonOther => 'anderes';
}
