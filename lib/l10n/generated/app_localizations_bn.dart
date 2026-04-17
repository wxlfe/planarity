// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get accountDeleted => 'অ্যাকাউন্ট মুছে ফেলা হয়েছে';

  @override
  String get accountExistsSignInInstead => 'অ্যাকাউন্ট আছে - সাইন ইন করুন';

  @override
  String addedFriend(String friendName) {
    return '$friendName যোগ করা হয়েছে';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '$inviterName কে আপনার বন্ধু তালিকায় যোগ করবেন?';
  }

  @override
  String get addFriend => 'বন্ধু যোগ করুন';

  @override
  String get alreadySignedUp => 'আগেই সাইন আপ করেছেন?';

  @override
  String get anonymousPlayer => 'বেনামী খেলোয়াড়';

  @override
  String get appleSignInUnavailablePlatform =>
      'অ্যাপল সাইন-ইন এই প্ল্যাটফর্মে উপলব্ধ নয়';

  @override
  String get appleSignInUnavailableRightNow => 'অ্যাপল সাইন-ইন এখন উপলব্ধ নয়';

  @override
  String get authConfigurationInvalid =>
      'এই অ্যাপের জন্য প্রমাণীকরণ কনফিগারেশন অবৈধ';

  @override
  String get authConfigurationMissing => 'প্রমাণ কনফিগারেশন অনুপস্থিত';

  @override
  String get back => 'ফিরে যান';

  @override
  String get cancel => 'বাতিল';

  @override
  String get continueLabel => 'চালিয়ে যান';

  @override
  String continueWithScore(int totalScore) {
    return 'চালিয়ে যান - $totalScore';
  }

  @override
  String get continueWithApple => 'অ্যাপলের সাথে চালিয়ে যান';

  @override
  String get continueWithGoogle => 'Google এর সাথে চালিয়ে যান';

  @override
  String get copyInviteLink => 'আমন্ত্রণ লিঙ্ক কপি করুন';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'আপনার ইমেল এবং পাসওয়ার্ড দিয়ে একটি অ্যাকাউন্ট তৈরি করুন।';

  @override
  String get dailyGraphPuzzle => 'দৈনিক গ্রাফ ধাঁধা';

  @override
  String get dailyScore => 'দৈনিক স্কোর';

  @override
  String get decline => 'হ্রাস';

  @override
  String get deleteAccount => 'অ্যাকাউন্ট মুছুন';

  @override
  String get details => 'বিস্তারিত';

  @override
  String get detailsTooLong => 'বিবরণ 1000 অক্ষর বা তার কম হতে হবে';

  @override
  String get displayName => 'প্রদর্শনের নাম';

  @override
  String get email => 'ইমেল';

  @override
  String get enterEmailAndPassword => 'ইমেইল এবং পাসওয়ার্ড লিখুন';

  @override
  String get enterEmailFirst => 'প্রথমে আপনার ইমেইল লিখুন';

  @override
  String get enterValidEmail => 'একটি বৈধ ইমেইল লিখুন';

  @override
  String failedNodes(int nodeCount) {
    return '$nodeCount নোড ব্যর্থ';
  }

  @override
  String get friendInvite => 'বন্ধু আমন্ত্রণ';

  @override
  String get friends => 'বন্ধু';

  @override
  String get global => 'বিশ্বব্যাপী';

  @override
  String get globalSnapshot => 'বিশ্বব্যাপী স্ন্যাপশট';

  @override
  String get globalTopScore => 'বিশ্বব্যাপী শীর্ষ স্কোর';

  @override
  String get googleSignInUnavailablePlatform =>
      'এই প্ল্যাটফর্মে google সাইন-ইন উপলব্ধ নেই৷';

  @override
  String get googleSignInNotConfigured =>
      'এই অ্যাপের জন্য google সাইন-ইন কনফিগার করা নেই';

  @override
  String get googleSignInNotConfiguredIos =>
      'এই iOS অ্যাপের জন্য google সাইন-ইন কনফিগার করা নেই';

  @override
  String get home => 'হোম';

  @override
  String get hideUserName => 'ব্যবহারকারীর নাম লুকান';

  @override
  String get ifEmailExistsResetLink =>
      'যদি সেই ইমেলটি বিদ্যমান থাকে, আমরা একটি রিসেট লিঙ্ক পাঠিয়েছি';

  @override
  String get invalidEmailOrPassword => 'অবৈধ ইমেল বা পাসওয়ার্ড';

  @override
  String get invalidNameTrySomethingElse => 'অবৈধ নাম - অন্য কিছু চেষ্টা করুন';

  @override
  String get invite => 'আমন্ত্রণ';

  @override
  String get inviteLinkCopied => 'আমন্ত্রণ লিঙ্ক কপি করা হয়েছে';

  @override
  String get leaderboard => 'লিডারবোর্ড';

  @override
  String get lifetimeScore => 'আজীবন স্কোর';

  @override
  String lifetimeScoreValue(int score) {
    return 'মোট স্কোর $score';
  }

  @override
  String get locked => 'তালাবদ্ধ';

  @override
  String get macosKeychainNotConfigured =>
      'macos কীচেন অ্যাক্সেস কনফিগার করা নেই';

  @override
  String get moreOptions => 'আরও বিকল্প';

  @override
  String get networkErrorCheckConnection =>
      'নেটওয়ার্ক ত্রুটি - আপনার সংযোগ পরীক্ষা করুন';

  @override
  String get newHere => 'এখানে নতুন?';

  @override
  String get noFriendsYet => 'আপনি এখনও কোনো বন্ধু যোগ করেননি';

  @override
  String get noFriendsLeaderboard =>
      'আপনি এখনও কোনো বন্ধু যোগ করেননি - কাউকে আমন্ত্রণ জানাতে আপনার প্রোফাইল খুলুন৷';

  @override
  String get noGlobalScoresYet => 'এখনও কোনো বিশ্বব্যাপী স্কোর নেই';

  @override
  String get originalByJohnTantalo => 'জন তান্টালো দ্বারা মূল';

  @override
  String get password => 'পাসওয়ার্ড';

  @override
  String get passwordMinLength => 'পাসওয়ার্ড কমপক্ষে 6 অক্ষরের হতে হবে';

  @override
  String get passwordTooWeak => 'পাসওয়ার্ড খুব দুর্বল';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'উইকিপিডিয়া: প্ল্যানার গ্রাফ';

  @override
  String get pressAgainToDelete => 'মুছে ফেলার জন্য আবার টিপুন';

  @override
  String get profile => 'প্রোফাইল';

  @override
  String get profileSubtitle =>
      'আপনার প্রোফাইলে আপনার নাম কীভাবে প্রদর্শিত হবে তা আপডেট করুন';

  @override
  String get reason => 'কারণ';

  @override
  String get remove => 'সরান';

  @override
  String removeFriendQuestion(String displayName) {
    return '$displayName কে আপনার বন্ধু তালিকা থেকে সরাবেন?';
  }

  @override
  String get removeFriend => 'বন্ধুকে সরিয়ে দাও';

  @override
  String get reportPlayer => 'রিপোর্ট প্লেয়ার';

  @override
  String get reportSubmitted => 'প্রতিবেদন জমা';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'রিপোর্ট জমা - বন্ধু অপসারণ করতে অক্ষম';

  @override
  String get resetPassword => 'পাসওয়ার্ড রিসেট করুন';

  @override
  String get share => 'শেয়ার';

  @override
  String get shareInvitePrompt =>
      'বন্ধুকে আমন্ত্রণ জানাতে এই QR কোড বা লিঙ্কটি শেয়ার করুন';

  @override
  String get shareUnavailableBuild => 'শেয়ার এই বিল্ডে অনুপলব্ধ';

  @override
  String get signIn => 'সাইন ইন';

  @override
  String get signInAgainBeforeDeleting =>
      'আপনার অ্যাকাউন্ট মুছে ফেলার আগে আবার সাইন ইন করুন';

  @override
  String get signInMethodNotEnabled => 'এই সাইন-ইন পদ্ধতি সক্রিয় করা নেই';

  @override
  String get signInSubtitle => 'আপনার ইমেইল এবং পাসওয়ার্ড দিয়ে সাইন ইন করুন';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get signUp => 'সাইন আপ';

  @override
  String get signUpToCompete => ' আপনার বন্ধুদের সাথে প্রতিযোগিতা করতে';

  @override
  String solvedNodes(int nodeCount) {
    return '$nodeCount নোড সমাধান হয়েছে';
  }

  @override
  String get start => 'শুরু';

  @override
  String get submit => 'জমা দিন';

  @override
  String get thisPlayer => 'এই খেলোয়াড়';

  @override
  String get tooManyAttempts => 'অনেক বেশি প্রচেষ্টা - পরে আবার চেষ্টা করুন';

  @override
  String get unableAuthenticateRightNow => 'এই মুহূর্তে প্রমাণীকরণ করতে অক্ষম';

  @override
  String get unableCreateAccountRightNow =>
      'এই মুহূর্তে অ্যাকাউন্ট তৈরি করতে অক্ষম';

  @override
  String get unableCreateProfileRightNow =>
      'এই মুহূর্তে আপনার প্রোফাইল তৈরি করতে অক্ষম';

  @override
  String get unableDeleteAccountRightNow =>
      'এই মুহূর্তে আপনার অ্যাকাউন্ট মুছে ফেলতে অক্ষম';

  @override
  String get unableDeleteProfileRightNow =>
      'এই মুহূর্তে আপনার প্রোফাইল মুছে ফেলতে অক্ষম';

  @override
  String get unableLoadFriendsLeaderboard =>
      'এই মুহূর্তে বন্ধুদের লিডারবোর্ড লোড করতে অক্ষম৷';

  @override
  String get unableLoadGlobalLeaderboard =>
      'এই মুহূর্তে গ্লোবাল লিডারবোর্ড লোড করতে অক্ষম৷';

  @override
  String get unableSendResetEmailRightNow =>
      'এই মুহূর্তে রিসেট ইমেল পাঠাতে অক্ষম';

  @override
  String get unableSubmitReportRightNow => 'এই মুহূর্তে রিপোর্ট জমা দিতে অক্ষম';

  @override
  String get unableUpdateHiddenNames => 'লুকানো নাম আপডেট করতে অক্ষম';

  @override
  String get unableCreateAccountNoUser =>
      'এই মুহূর্তে অ্যাকাউন্ট তৈরি করতে অক্ষম';

  @override
  String get unhideUserName => 'ব্যবহারকারীর নাম লুকান';

  @override
  String get you => 'আপনি';

  @override
  String get youAndYourFriends => 'আপনি এবং আপনার বন্ধুরা';

  @override
  String get youAlreadyReportedPlayer => 'আপনি ইতিমধ্যে এই প্লেয়ার রিপোর্ট';

  @override
  String get youCantAddYourself => 'আপনি নিজেকে যোগ করতে পারবেন না';

  @override
  String get yourGlobalPosition => 'আপনার বিশ্বব্যাপী অবস্থান';

  @override
  String get yourNewFriend => 'আপনার নতুন বন্ধু';

  @override
  String get friendAlreadyInList => 'এই বন্ধু ইতিমধ্যে আপনার তালিকায় আছে';

  @override
  String get friendInviteNoLongerValid => 'সেই বন্ধুর আমন্ত্রণটি আর বৈধ নয়';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get goal => 'লক্ষ্য';

  @override
  String get goalDescription =>
      'যতটা সম্ভব কম চাল দিয়ে আপনি প্রতিদিন যত গ্রাফ সমাধান করতে পারেন';

  @override
  String get whyEveryPuzzleIsSolvable => 'কেন প্রতিটি ধাঁধা সমাধানযোগ্য';

  @override
  String get planarGraphDescription =>
      'প্ল্যানারিটির প্রতিটি গ্রাফ সমাধানযোগ্য কারণ এটি একটি প্ল্যানার গ্রাফ। একটি প্ল্যানার গ্রাফ হল একটি গ্রাফ যা একটি সমতল পৃষ্ঠে আঁকা যায় যাতে কোন প্রান্ত অতিক্রম না হয়, যেখানে তারা ভাগ করা শীর্ষে মিলিত হয়।';

  @override
  String get reportReasonInappropriateDisplayName => 'অনুপযুক্ত প্রদর্শন নাম';

  @override
  String get reportReasonAbuse => 'অপব্যবহার বা হয়রানি';

  @override
  String get reportReasonImpersonation => 'ছদ্মবেশ ধারণ';

  @override
  String get reportReasonSpam => 'স্প্যাম বা প্রতারণা';

  @override
  String get reportReasonOther => 'অন্যান্য';
}
