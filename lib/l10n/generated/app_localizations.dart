import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'account'**
  String get account;

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'account deleted'**
  String get accountDeleted;

  /// No description provided for @accountExistsSignInInstead.
  ///
  /// In en, this message translates to:
  /// **'account exists - sign in instead'**
  String get accountExistsSignInInstead;

  /// No description provided for @addedFriend.
  ///
  /// In en, this message translates to:
  /// **'added {friendName}'**
  String addedFriend(String friendName);

  /// No description provided for @addFriendQuestion.
  ///
  /// In en, this message translates to:
  /// **'add {inviterName} to your friends list?'**
  String addFriendQuestion(String inviterName);

  /// No description provided for @addFriend.
  ///
  /// In en, this message translates to:
  /// **'add friend'**
  String get addFriend;

  /// No description provided for @alreadySignedUp.
  ///
  /// In en, this message translates to:
  /// **'already signed up?'**
  String get alreadySignedUp;

  /// No description provided for @anonymousPlayer.
  ///
  /// In en, this message translates to:
  /// **'anonymous player'**
  String get anonymousPlayer;

  /// No description provided for @appleSignInUnavailablePlatform.
  ///
  /// In en, this message translates to:
  /// **'apple sign-in is not available on this platform'**
  String get appleSignInUnavailablePlatform;

  /// No description provided for @appleSignInUnavailableRightNow.
  ///
  /// In en, this message translates to:
  /// **'apple sign-in is not available right now'**
  String get appleSignInUnavailableRightNow;

  /// No description provided for @authConfigurationInvalid.
  ///
  /// In en, this message translates to:
  /// **'auth configuration is invalid for this app'**
  String get authConfigurationInvalid;

  /// No description provided for @authConfigurationMissing.
  ///
  /// In en, this message translates to:
  /// **'auth configuration is missing'**
  String get authConfigurationMissing;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'back'**
  String get back;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get continueLabel;

  /// No description provided for @continueWithScore.
  ///
  /// In en, this message translates to:
  /// **'continue - {totalScore}'**
  String continueWithScore(int totalScore);

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @copyInviteLink.
  ///
  /// In en, this message translates to:
  /// **'copy invite link'**
  String get copyInviteLink;

  /// No description provided for @copyrightNateWolfe.
  ///
  /// In en, this message translates to:
  /// **'© nate wolfe'**
  String get copyrightNateWolfe;

  /// No description provided for @createAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'create an account with your email and password.'**
  String get createAccountSubtitle;

  /// No description provided for @dailyGraphPuzzle.
  ///
  /// In en, this message translates to:
  /// **'daily graph puzzle'**
  String get dailyGraphPuzzle;

  /// No description provided for @dailyScore.
  ///
  /// In en, this message translates to:
  /// **'daily score'**
  String get dailyScore;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'decline'**
  String get decline;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'delete account'**
  String get deleteAccount;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'details'**
  String get details;

  /// No description provided for @detailsTooLong.
  ///
  /// In en, this message translates to:
  /// **'details must be 1000 characters or less'**
  String get detailsTooLong;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'display name'**
  String get displayName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @enterEmailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'enter email and password'**
  String get enterEmailAndPassword;

  /// No description provided for @enterEmailFirst.
  ///
  /// In en, this message translates to:
  /// **'enter your email first'**
  String get enterEmailFirst;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'enter a valid email'**
  String get enterValidEmail;

  /// No description provided for @failedNodes.
  ///
  /// In en, this message translates to:
  /// **'failed {nodeCount} nodes'**
  String failedNodes(int nodeCount);

  /// No description provided for @friendInvite.
  ///
  /// In en, this message translates to:
  /// **'friend invite'**
  String get friendInvite;

  /// No description provided for @friends.
  ///
  /// In en, this message translates to:
  /// **'friends'**
  String get friends;

  /// No description provided for @global.
  ///
  /// In en, this message translates to:
  /// **'global'**
  String get global;

  /// No description provided for @globalSnapshot.
  ///
  /// In en, this message translates to:
  /// **'global snapshot'**
  String get globalSnapshot;

  /// No description provided for @globalTopScore.
  ///
  /// In en, this message translates to:
  /// **'global top score'**
  String get globalTopScore;

  /// No description provided for @googleSignInUnavailablePlatform.
  ///
  /// In en, this message translates to:
  /// **'google sign-in is not available on this platform'**
  String get googleSignInUnavailablePlatform;

  /// No description provided for @googleSignInNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'google sign-in is not configured for this app'**
  String get googleSignInNotConfigured;

  /// No description provided for @googleSignInNotConfiguredIos.
  ///
  /// In en, this message translates to:
  /// **'google sign-in is not configured for this iOS app'**
  String get googleSignInNotConfiguredIos;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get home;

  /// No description provided for @hideUserName.
  ///
  /// In en, this message translates to:
  /// **'hide user name'**
  String get hideUserName;

  /// No description provided for @ifEmailExistsResetLink.
  ///
  /// In en, this message translates to:
  /// **'if that email exists, we sent a reset link'**
  String get ifEmailExistsResetLink;

  /// No description provided for @invalidEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'invalid email or password'**
  String get invalidEmailOrPassword;

  /// No description provided for @invalidNameTrySomethingElse.
  ///
  /// In en, this message translates to:
  /// **'invalid name - try something else'**
  String get invalidNameTrySomethingElse;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'invite'**
  String get invite;

  /// No description provided for @inviteLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'invite link copied'**
  String get inviteLinkCopied;

  /// No description provided for @leaderboard.
  ///
  /// In en, this message translates to:
  /// **'leaderboard'**
  String get leaderboard;

  /// No description provided for @lifetimeScore.
  ///
  /// In en, this message translates to:
  /// **'lifetime score'**
  String get lifetimeScore;

  /// No description provided for @lifetimeScoreValue.
  ///
  /// In en, this message translates to:
  /// **'lifetime score {score}'**
  String lifetimeScoreValue(int score);

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'locked'**
  String get locked;

  /// No description provided for @macosKeychainNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'macos keychain access is not configured'**
  String get macosKeychainNotConfigured;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'more options'**
  String get moreOptions;

  /// No description provided for @networkErrorCheckConnection.
  ///
  /// In en, this message translates to:
  /// **'network error - check your connection'**
  String get networkErrorCheckConnection;

  /// No description provided for @newHere.
  ///
  /// In en, this message translates to:
  /// **'new here?'**
  String get newHere;

  /// No description provided for @noFriendsYet.
  ///
  /// In en, this message translates to:
  /// **'you haven\'t added any friends yet'**
  String get noFriendsYet;

  /// No description provided for @noFriendsLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'you haven\'t added any friends yet - open your profile to invite someone'**
  String get noFriendsLeaderboard;

  /// No description provided for @noGlobalScoresYet.
  ///
  /// In en, this message translates to:
  /// **'no global scores yet'**
  String get noGlobalScoresYet;

  /// No description provided for @originalByJohnTantalo.
  ///
  /// In en, this message translates to:
  /// **'original by john tantalo'**
  String get originalByJohnTantalo;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordTooWeak.
  ///
  /// In en, this message translates to:
  /// **'password is too weak'**
  String get passwordTooWeak;

  /// No description provided for @planarity.
  ///
  /// In en, this message translates to:
  /// **'planarity'**
  String get planarity;

  /// No description provided for @planarGraphWikipedia.
  ///
  /// In en, this message translates to:
  /// **'wikipedia: planar graph'**
  String get planarGraphWikipedia;

  /// No description provided for @pressAgainToDelete.
  ///
  /// In en, this message translates to:
  /// **'press again to delete'**
  String get pressAgainToDelete;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'profile'**
  String get profile;

  /// No description provided for @profileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'update how your name appears in your profile'**
  String get profileSubtitle;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'reason'**
  String get reason;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'remove'**
  String get remove;

  /// No description provided for @removeFriendQuestion.
  ///
  /// In en, this message translates to:
  /// **'remove {displayName} from your friends list?'**
  String removeFriendQuestion(String displayName);

  /// No description provided for @removeFriend.
  ///
  /// In en, this message translates to:
  /// **'remove friend'**
  String get removeFriend;

  /// No description provided for @reportPlayer.
  ///
  /// In en, this message translates to:
  /// **'report player'**
  String get reportPlayer;

  /// No description provided for @reportSubmitted.
  ///
  /// In en, this message translates to:
  /// **'report submitted'**
  String get reportSubmitted;

  /// No description provided for @reportSubmittedUnableRemoveFriend.
  ///
  /// In en, this message translates to:
  /// **'report submitted - unable to remove friend'**
  String get reportSubmittedUnableRemoveFriend;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'reset password'**
  String get resetPassword;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'share'**
  String get share;

  /// No description provided for @shareInvitePrompt.
  ///
  /// In en, this message translates to:
  /// **'share this QR code or link to invite a friend'**
  String get shareInvitePrompt;

  /// No description provided for @shareUnavailableBuild.
  ///
  /// In en, this message translates to:
  /// **'share is unavailable on this build'**
  String get shareUnavailableBuild;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'sign in'**
  String get signIn;

  /// No description provided for @signInAgainBeforeDeleting.
  ///
  /// In en, this message translates to:
  /// **'sign in again before deleting your account'**
  String get signInAgainBeforeDeleting;

  /// No description provided for @signInMethodNotEnabled.
  ///
  /// In en, this message translates to:
  /// **'this sign-in method is not enabled'**
  String get signInMethodNotEnabled;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'sign in with your email and password'**
  String get signInSubtitle;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'sign out'**
  String get signOut;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'sign up'**
  String get signUp;

  /// No description provided for @signUpToCompete.
  ///
  /// In en, this message translates to:
  /// **' to compete with your friends'**
  String get signUpToCompete;

  /// No description provided for @solvedNodes.
  ///
  /// In en, this message translates to:
  /// **'solved {nodeCount} nodes'**
  String solvedNodes(int nodeCount);

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'start'**
  String get start;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'submit'**
  String get submit;

  /// No description provided for @thisPlayer.
  ///
  /// In en, this message translates to:
  /// **'this player'**
  String get thisPlayer;

  /// No description provided for @tooManyAttempts.
  ///
  /// In en, this message translates to:
  /// **'too many attempts - try again later'**
  String get tooManyAttempts;

  /// No description provided for @unableAuthenticateRightNow.
  ///
  /// In en, this message translates to:
  /// **'unable to authenticate right now'**
  String get unableAuthenticateRightNow;

  /// No description provided for @unableCreateAccountRightNow.
  ///
  /// In en, this message translates to:
  /// **'unable to create account right now'**
  String get unableCreateAccountRightNow;

  /// No description provided for @unableCreateProfileRightNow.
  ///
  /// In en, this message translates to:
  /// **'unable to create your profile right now'**
  String get unableCreateProfileRightNow;

  /// No description provided for @unableDeleteAccountRightNow.
  ///
  /// In en, this message translates to:
  /// **'unable to delete your account right now'**
  String get unableDeleteAccountRightNow;

  /// No description provided for @unableDeleteProfileRightNow.
  ///
  /// In en, this message translates to:
  /// **'unable to delete your profile right now'**
  String get unableDeleteProfileRightNow;

  /// No description provided for @unableLoadFriendsLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'unable to load friends leaderboard right now'**
  String get unableLoadFriendsLeaderboard;

  /// No description provided for @unableLoadGlobalLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'unable to load global leaderboard right now'**
  String get unableLoadGlobalLeaderboard;

  /// No description provided for @unableSendResetEmailRightNow.
  ///
  /// In en, this message translates to:
  /// **'unable to send reset email right now'**
  String get unableSendResetEmailRightNow;

  /// No description provided for @unableSubmitReportRightNow.
  ///
  /// In en, this message translates to:
  /// **'unable to submit report right now'**
  String get unableSubmitReportRightNow;

  /// No description provided for @unableUpdateHiddenNames.
  ///
  /// In en, this message translates to:
  /// **'unable to update hidden names'**
  String get unableUpdateHiddenNames;

  /// No description provided for @unableCreateAccountNoUser.
  ///
  /// In en, this message translates to:
  /// **'unable to create account right now'**
  String get unableCreateAccountNoUser;

  /// No description provided for @unhideUserName.
  ///
  /// In en, this message translates to:
  /// **'unhide user name'**
  String get unhideUserName;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'you'**
  String get you;

  /// No description provided for @youAndYourFriends.
  ///
  /// In en, this message translates to:
  /// **'you and your friends'**
  String get youAndYourFriends;

  /// No description provided for @youAlreadyReportedPlayer.
  ///
  /// In en, this message translates to:
  /// **'you already reported this player'**
  String get youAlreadyReportedPlayer;

  /// No description provided for @youCantAddYourself.
  ///
  /// In en, this message translates to:
  /// **'you can\'t add yourself'**
  String get youCantAddYourself;

  /// No description provided for @yourGlobalPosition.
  ///
  /// In en, this message translates to:
  /// **'your global position'**
  String get yourGlobalPosition;

  /// No description provided for @yourNewFriend.
  ///
  /// In en, this message translates to:
  /// **'your new friend'**
  String get yourNewFriend;

  /// No description provided for @friendAlreadyInList.
  ///
  /// In en, this message translates to:
  /// **'this friend is already in your list'**
  String get friendAlreadyInList;

  /// No description provided for @friendInviteNoLongerValid.
  ///
  /// In en, this message translates to:
  /// **'that friend invite is no longer valid'**
  String get friendInviteNoLongerValid;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'about'**
  String get about;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'goal'**
  String get goal;

  /// No description provided for @goalDescription.
  ///
  /// In en, this message translates to:
  /// **'solve as many graphs as you can each day with as few moves as possible'**
  String get goalDescription;

  /// No description provided for @whyEveryPuzzleIsSolvable.
  ///
  /// In en, this message translates to:
  /// **'why every puzzle is solvable'**
  String get whyEveryPuzzleIsSolvable;

  /// No description provided for @planarGraphDescription.
  ///
  /// In en, this message translates to:
  /// **'every graph in planarity is solvable because it\'s a planar graph. a planar graph is a graph that can be drawn on a flat surface so that no edges cross, except where they meet at shared vertices.'**
  String get planarGraphDescription;

  /// No description provided for @reportReasonInappropriateDisplayName.
  ///
  /// In en, this message translates to:
  /// **'inappropriate display name'**
  String get reportReasonInappropriateDisplayName;

  /// No description provided for @reportReasonAbuse.
  ///
  /// In en, this message translates to:
  /// **'abuse or harassment'**
  String get reportReasonAbuse;

  /// No description provided for @reportReasonImpersonation.
  ///
  /// In en, this message translates to:
  /// **'impersonation'**
  String get reportReasonImpersonation;

  /// No description provided for @reportReasonSpam.
  ///
  /// In en, this message translates to:
  /// **'spam or scam'**
  String get reportReasonSpam;

  /// No description provided for @reportReasonOther.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get reportReasonOther;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'tr',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
