// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get account => 'account';

  @override
  String get accountDeleted => 'account deleted';

  @override
  String get accountExistsSignInInstead => 'account exists - sign in instead';

  @override
  String addedFriend(String friendName) {
    return 'added $friendName';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'add $inviterName to your friends list?';
  }

  @override
  String get addFriend => 'add friend';

  @override
  String get alreadySignedUp => 'already signed up?';

  @override
  String get anonymousPlayer => 'anonymous player';

  @override
  String get appleSignInUnavailablePlatform =>
      'apple sign-in is not available on this platform';

  @override
  String get appleSignInUnavailableRightNow =>
      'apple sign-in is not available right now';

  @override
  String get authConfigurationInvalid =>
      'auth configuration is invalid for this app';

  @override
  String get authConfigurationMissing => 'auth configuration is missing';

  @override
  String get back => 'back';

  @override
  String get cancel => 'cancel';

  @override
  String get continueLabel => 'continue';

  @override
  String continueWithScore(int totalScore) {
    return 'continue - $totalScore';
  }

  @override
  String get continueWithApple => 'continue with Apple';

  @override
  String get continueWithGoogle => 'continue with Google';

  @override
  String get copyInviteLink => 'copy invite link';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'create an account with your email and password.';

  @override
  String get dailyGraphPuzzle => 'daily graph puzzle';

  @override
  String get dailyScore => 'daily score';

  @override
  String get decline => 'decline';

  @override
  String get deleteAccount => 'delete account';

  @override
  String get details => 'details';

  @override
  String get detailsTooLong => 'details must be 1000 characters or less';

  @override
  String get displayName => 'display name';

  @override
  String get email => 'email';

  @override
  String get enterEmailAndPassword => 'enter email and password';

  @override
  String get enterEmailFirst => 'enter your email first';

  @override
  String get enterValidEmail => 'enter a valid email';

  @override
  String failedNodes(int nodeCount) {
    return 'failed $nodeCount nodes';
  }

  @override
  String get friendInvite => 'friend invite';

  @override
  String get friends => 'friends';

  @override
  String get global => 'global';

  @override
  String get globalSnapshot => 'global snapshot';

  @override
  String get globalTopScore => 'global top score';

  @override
  String get googleSignInUnavailablePlatform =>
      'google sign-in is not available on this platform';

  @override
  String get googleSignInNotConfigured =>
      'google sign-in is not configured for this app';

  @override
  String get googleSignInNotConfiguredIos =>
      'google sign-in is not configured for this iOS app';

  @override
  String get home => 'home';

  @override
  String get hideUserName => 'hide user name';

  @override
  String get ifEmailExistsResetLink =>
      'if that email exists, we sent a reset link';

  @override
  String get invalidEmailOrPassword => 'invalid email or password';

  @override
  String get invalidNameTrySomethingElse => 'invalid name - try something else';

  @override
  String get invite => 'invite';

  @override
  String get inviteLinkCopied => 'invite link copied';

  @override
  String get leaderboard => 'leaderboard';

  @override
  String get lifetimeScore => 'lifetime score';

  @override
  String lifetimeScoreValue(int score) {
    return 'lifetime score $score';
  }

  @override
  String get locked => 'locked';

  @override
  String get macosKeychainNotConfigured =>
      'macos keychain access is not configured';

  @override
  String get moreOptions => 'more options';

  @override
  String get networkErrorCheckConnection =>
      'network error - check your connection';

  @override
  String get newHere => 'new here?';

  @override
  String get noFriendsYet => 'you haven\'t added any friends yet';

  @override
  String get noFriendsLeaderboard =>
      'you haven\'t added any friends yet - open your profile to invite someone';

  @override
  String get noGlobalScoresYet => 'no global scores yet';

  @override
  String get originalByJohnTantalo => 'original by john tantalo';

  @override
  String get password => 'password';

  @override
  String get passwordMinLength => 'password must be at least 6 characters';

  @override
  String get passwordTooWeak => 'password is too weak';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'wikipedia: planar graph';

  @override
  String get pressAgainToDelete => 'press again to delete';

  @override
  String get profile => 'profile';

  @override
  String get profileSubtitle => 'update how your name appears in your profile';

  @override
  String get reason => 'reason';

  @override
  String get remove => 'remove';

  @override
  String removeFriendQuestion(String displayName) {
    return 'remove $displayName from your friends list?';
  }

  @override
  String get removeFriend => 'remove friend';

  @override
  String get reportPlayer => 'report player';

  @override
  String get reportSubmitted => 'report submitted';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'report submitted - unable to remove friend';

  @override
  String get resetPassword => 'reset password';

  @override
  String get share => 'share';

  @override
  String get shareInvitePrompt =>
      'share this QR code or link to invite a friend';

  @override
  String get shareUnavailableBuild => 'share is unavailable on this build';

  @override
  String get signIn => 'sign in';

  @override
  String get signInAgainBeforeDeleting =>
      'sign in again before deleting your account';

  @override
  String get signInMethodNotEnabled => 'this sign-in method is not enabled';

  @override
  String get signInSubtitle => 'sign in with your email and password';

  @override
  String get signOut => 'sign out';

  @override
  String get signUp => 'sign up';

  @override
  String get signUpToCompete => ' to compete with your friends';

  @override
  String solvedNodes(int nodeCount) {
    return 'solved $nodeCount nodes';
  }

  @override
  String get start => 'start';

  @override
  String get submit => 'submit';

  @override
  String get thisPlayer => 'this player';

  @override
  String get tooManyAttempts => 'too many attempts - try again later';

  @override
  String get unableAuthenticateRightNow => 'unable to authenticate right now';

  @override
  String get unableCreateAccountRightNow =>
      'unable to create account right now';

  @override
  String get unableCreateProfileRightNow =>
      'unable to create your profile right now';

  @override
  String get unableDeleteAccountRightNow =>
      'unable to delete your account right now';

  @override
  String get unableDeleteProfileRightNow =>
      'unable to delete your profile right now';

  @override
  String get unableLoadFriendsLeaderboard =>
      'unable to load friends leaderboard right now';

  @override
  String get unableLoadGlobalLeaderboard =>
      'unable to load global leaderboard right now';

  @override
  String get unableSendResetEmailRightNow =>
      'unable to send reset email right now';

  @override
  String get unableSubmitReportRightNow => 'unable to submit report right now';

  @override
  String get unableUpdateHiddenNames => 'unable to update hidden names';

  @override
  String get unableCreateAccountNoUser => 'unable to create account right now';

  @override
  String get unhideUserName => 'unhide user name';

  @override
  String get you => 'you';

  @override
  String get youAndYourFriends => 'you and your friends';

  @override
  String get youAlreadyReportedPlayer => 'you already reported this player';

  @override
  String get youCantAddYourself => 'you can\'t add yourself';

  @override
  String get yourGlobalPosition => 'your global position';

  @override
  String get yourNewFriend => 'your new friend';

  @override
  String get friendAlreadyInList => 'this friend is already in your list';

  @override
  String get friendInviteNoLongerValid =>
      'that friend invite is no longer valid';

  @override
  String get about => 'about';

  @override
  String get goal => 'goal';

  @override
  String get goalDescription =>
      'solve as many graphs as you can each day with as few moves as possible';

  @override
  String get whyEveryPuzzleIsSolvable => 'why every puzzle is solvable';

  @override
  String get planarGraphDescription =>
      'every graph in planarity is solvable because it\'s a planar graph. a planar graph is a graph that can be drawn on a flat surface so that no edges cross, except where they meet at shared vertices.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'inappropriate display name';

  @override
  String get reportReasonAbuse => 'abuse or harassment';

  @override
  String get reportReasonImpersonation => 'impersonation';

  @override
  String get reportReasonSpam => 'spam or scam';

  @override
  String get reportReasonOther => 'other';
}
