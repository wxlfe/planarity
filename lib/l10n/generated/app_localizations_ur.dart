// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get account => 'اکاؤنٹ';

  @override
  String get accountDeleted => 'اکاؤنٹ حذف کر دیا گیا';

  @override
  String get accountExistsSignInInstead =>
      'اکاؤنٹ موجود ہے - اس کے بجائے سائن ان کریں';

  @override
  String addedFriend(String friendName) {
    return '$friendName کو شامل کر دیا گیا';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'کیا $inviterName کو اپنی دوستوں کی فہرست میں شامل کریں؟';
  }

  @override
  String get addFriend => 'دوست کا ا ضافہ کریں';

  @override
  String get alreadySignedUp => 'پہلے ہی سائن اپ کر چکے ہیں ؟';

  @override
  String get anonymousPlayer => 'گمنام کھلاڑی';

  @override
  String get appleSignInUnavailablePlatform =>
      'ایپل سائن ان اس پلیٹ فارم پر دستیاب نہیں ہے';

  @override
  String get appleSignInUnavailableRightNow =>
      'ایپل سائن ان ابھی دستیاب نہیں ہے';

  @override
  String get authConfigurationInvalid => 'اس ایپ کے لیے AUTH کنفیگریشن غلط ہے';

  @override
  String get authConfigurationMissing => 'aUTH کنفیگریشن موجود نہیں ہے';

  @override
  String get back => 'واپس';

  @override
  String get cancel => 'منسوخ';

  @override
  String get continueLabel => 'جاری رکھیں';

  @override
  String continueWithScore(int totalScore) {
    return 'جاری رکھیں - $totalScore';
  }

  @override
  String get continueWithApple => 'apple کے ساتھ جاری رکھیں';

  @override
  String get continueWithGoogle => 'گوگل کے ساتھ جاری رکھیں';

  @override
  String get copyInviteLink => 'دعوت نامہ کا لنک کاپی کریں';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'اپنے ای میل اور پاس ورڈ کے ساتھ ایک اکاؤنٹ بنائیں ۔';

  @override
  String get dailyGraphPuzzle => 'روزانہ گراف پہیلی';

  @override
  String levelSubtitleUntangleMoves(int moveCount) {
    return 'گراف کو $moveCount چالوں میں سلجھائیں';
  }

  @override
  String get levelSubtitleNoCrossings => 'تمام کراسنگ ختم کریں';

  @override
  String get levelSubtitleKeepStreak => 'سلسلہ جاری رکھیں';

  @override
  String get levelSubtitlePerfectSolve => 'بہترین حل کی کوشش کریں';

  @override
  String get dailyScore => 'روزانہ اسکور';

  @override
  String get decline => 'مسترد کرنا';

  @override
  String get deleteAccount => 'اکاؤنٹ حذف کریں';

  @override
  String get details => 'تفصیلات';

  @override
  String get detailsTooLong => 'تفصیلات 1000 حروف یا اس سے کم ہونی چاہئیں';

  @override
  String get displayName => 'ڈسپلے نام';

  @override
  String get downloadOnAppStore => 'App Store سے ڈاؤن لوڈ کریں';

  @override
  String get email => 'ای میل';

  @override
  String get enterEmailAndPassword => 'ای میل اور پاس ورڈ درج کریں';

  @override
  String get enterEmailFirst => 'پہلے اپنا ای میل درج کریں';

  @override
  String get enterValidEmail => ' مہربانی کریتھ کریو صحیح ای میل درج ۔';

  @override
  String failedNodes(int nodeCount) {
    return 'گراف $nodeCount ناکام ہوا';
  }

  @override
  String get friendInvite => 'دوست کو مدعو کریں';

  @override
  String get friends => 'دوست';

  @override
  String get global => 'عالمی';

  @override
  String get globalSnapshot => 'عالمی سنیپ شاٹ';

  @override
  String get globalTopScore => 'عالمی ٹاپ اسکور';

  @override
  String get googleSignInUnavailablePlatform =>
      'گوگل سائن ان اس پلیٹ فارم پر دستیاب نہیں ہے';

  @override
  String get googleSignInNotConfigured =>
      'گوگل سائن ان اس ایپ کے لیے تشکیل شدہ نہیں ہے';

  @override
  String get googleSignInNotConfiguredIos =>
      'گوگل سائن ان اس iOS ایپ کے لیے تشکیل شدہ نہیں ہے';

  @override
  String get home => 'ہوم';

  @override
  String get hideUserName => 'صارف کا نام چھپائیں';

  @override
  String get ifEmailExistsResetLink =>
      'اگر وہ ای میل موجود ہے تو ہم نے ایک ری سیٹ لنک بھیجا ہے';

  @override
  String get invalidEmailOrPassword => 'ناکارہ ای میل یا پاس ورڈ';

  @override
  String get invalidNameTrySomethingElse => 'غلط نام - کچھ اور آزمائیں';

  @override
  String get invite => 'دعوت دیں';

  @override
  String get inviteLinkCopied => 'دعوت نامہ کا لنک کاپی ہو گیا';

  @override
  String get leaderboard => 'لیڈر بورڈ';

  @override
  String get lifetimeScore => 'لائف ٹائم اسکور';

  @override
  String lifetimeScoreValue(int score) {
    return 'کل اسکور $score';
  }

  @override
  String get locked => 'لاک';

  @override
  String get macosKeychainNotConfigured =>
      'macos کیچین تک رسائی تشکیل شدہ نہیں ہے';

  @override
  String get moreOptions => 'مزید آپشنز';

  @override
  String get networkErrorCheckConnection =>
      'نیٹ ورک کی خرابی - اپنا کنکشن چیک کریں';

  @override
  String get newHere => 'یہاں نئے ہیں؟';

  @override
  String get noFriendsYet => 'آپ نے ابھی تک کوئی دوست شامل نہیں کیا ہے';

  @override
  String get noFriendsLeaderboard =>
      'آپ نے ابھی تک کوئی دوست شامل نہیں کیا ہے - کسی کو مدعو کرنے کے لیے اپنی پروفائل کھولیں';

  @override
  String get noGlobalScoresYet => 'ابھی کوئی عالمی اسکور نہیں';

  @override
  String get originalByJohnTantalo => 'اصل از جان ٹینٹالو';

  @override
  String get password => 'پاس ورڈ';

  @override
  String get passwordMinLength =>
      'پاس ورڈ لازماً کم از کم 6 حروف و علامات پر مشتمل ہو';

  @override
  String get passwordTooWeak => 'پاس ورڈ بہت کمزور ہے';

  @override
  String get planarity => 'planarity';

  @override
  String get privacyOptions => 'رازداری کے اختیارات';

  @override
  String get rankingUpdate => 'درجہ بندی کی تازہ کاری';

  @override
  String rankingGlobalResult(int globalRank, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'آپ نے $dateString کو عالمی سطح پر #$globalRank مقام حاصل کیا';
  }

  @override
  String rankingFriendsAndGlobalResult(
    int friendRank,
    int globalRank,
    DateTime date,
  ) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'آپ نے $dateString کو دوستوں میں #$friendRank اور عالمی سطح پر #$globalRank مقام حاصل کیا';
  }

  @override
  String get planarGraphWikipedia => 'ویکیپیڈیا: پلینار گراف';

  @override
  String get pressAgainToDelete => 'حذف کرنے کے لیے دوبارہ دبائیں';

  @override
  String get profile => 'پروفائل';

  @override
  String get profileSubtitle =>
      'اپ ڈیٹ کریں کہ آپ کا نام آپ کی پروفائل میں کیسے ظاہر ہوتا ہے';

  @override
  String get reason => 'وجہ';

  @override
  String get remove => 'ہٹائیں';

  @override
  String removeFriendQuestion(String displayName) {
    return 'کیا $displayName کو اپنی دوستوں کی فہرست سے ہٹائیں؟';
  }

  @override
  String get removeFriend => 'دوست کو ہٹائیں';

  @override
  String get reportPlayer => 'رپورٹ پلیئر';

  @override
  String get reportSubmitted => 'رپورٹ جمع کرائی گئی';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'رپورٹ جمع کرائی گئی - دوست کو ہٹانے سے قاصر';

  @override
  String get resetPassword => 'پاس ورڈ ری سیٹ کریں';

  @override
  String get share => 'شیئر کریں';

  @override
  String get shareInvitePrompt =>
      'کسی دوست کو مدعو کرنے کے لیے یہ QR کوڈ یا لنک شیئر کریں';

  @override
  String get shareUnavailableBuild => 'اس بلڈ پر شیئر دستیاب نہیں ہے';

  @override
  String get signIn => 'سائن ان';

  @override
  String get signInAgainBeforeDeleting =>
      'اپنا اکاؤنٹ حذف کرنے سے پہلے دوبارہ سائن ان کریں';

  @override
  String get signInMethodNotEnabled => 'سائن ان کا یہ طریقہ فعال نہیں ہے';

  @override
  String get signInSubtitle => 'اپنے ای میل اور پاس ورڈ کے ساتھ سائن ان کریں';

  @override
  String get signOut => 'سائن آؤٹ';

  @override
  String get signUp => 'سائن اپ';

  @override
  String get signUpToCompete => ' اپنے دوستوں کے ساتھ مقابلہ کرنے کے لیے';

  @override
  String solvedNodes(int nodeCount) {
    return 'گراف $nodeCount حل ہوا';
  }

  @override
  String get start => 'شروع کریں';

  @override
  String get submit => 'جمع کریں';

  @override
  String get thisPlayer => 'یہ کھلاڑی';

  @override
  String get tooManyAttempts => 'بہت زیادہ کوششیں - بعد میں دوبارہ کوشش کریں';

  @override
  String get unableAuthenticateRightNow => 'ابھی توثیق کرنے سے قاصر';

  @override
  String get unableCreateAccountRightNow => 'ابھی اکاؤنٹ بنانے سے قاصر';

  @override
  String get unableCreateProfileRightNow => 'ابھی آپ کی پروفائل بنانے سے قاصر';

  @override
  String get unableDeleteAccountRightNow =>
      'ابھی آپ کا اکاؤنٹ حذف کرنے سے قاصر';

  @override
  String get unableDeleteProfileRightNow =>
      'ابھی آپ کی پروفائل حذف کرنے سے قاصر';

  @override
  String get unableLoadFriendsLeaderboard =>
      'ابھی دوستوں کے لیڈر بورڈ کو لوڈ کرنے سے قاصر';

  @override
  String get unableLoadGlobalLeaderboard =>
      'عالمی لیڈر بورڈ کو ابھی لوڈ کرنے سے قاصر';

  @override
  String get unableSendResetEmailRightNow =>
      'ابھی ری سیٹ ای میل بھیجنے سے قاصر';

  @override
  String get unableSubmitReportRightNow => 'ابھی رپورٹ جمع کرانے سے قاصر';

  @override
  String get unableUpdateHiddenNames => 'پوشیدہ ناموں کو اپ ڈیٹ کرنے سے قاصر';

  @override
  String get unableCreateAccountNoUser => 'ابھی اکاؤنٹ بنانے سے قاصر';

  @override
  String get unhideUserName => 'صارف کا نام ظاہر نہ کریں';

  @override
  String get you => 'آپ';

  @override
  String get youAndYourFriends => 'آپ اور آپ کے دوست';

  @override
  String get youAlreadyReportedPlayer =>
      'آپ پہلے ہی اس کھلاڑی کی اطلاع دے چکے ہیں';

  @override
  String get youCantAddYourself => 'آپ خود کو شامل نہیں کر سکتے';

  @override
  String get yourGlobalPosition => 'آپ کی عالمی پوزیشن';

  @override
  String get yourNewFriend => 'آپ کا نیا دوست';

  @override
  String get friendAlreadyInList => 'یہ دوست پہلے ہی آپ کی فہرست میں شامل ہے';

  @override
  String get friendInviteNoLongerValid =>
      'یہ دوست کا دعوت نامہ اب درست نہیں ہے';

  @override
  String get about => 'بارے میں';

  @override
  String get goal => 'ہدف';

  @override
  String get goalDescription =>
      'زیادہ سے زیادہ گراف حل کریں جتنا آپ ہر دن کر سکتے ہیں زیادہ سے زیادہ چند چالوں کے ساتھ';

  @override
  String get whyEveryPuzzleIsSolvable => 'کیوں ہر پہیلی حل کرنے کے قابل ہے';

  @override
  String get planarGraphDescription =>
      'پلینارٹی میں ہر گراف حل کرنے کے قابل ہے کیونکہ یہ پلینار گراف ہے ۔ پلینار گراف ایک گراف ہے جسے ایک فلیٹ سطح پر کھینچا جا سکتا ہے تاکہ کوئی کنارہ کراس نہ ہو، سوائے اس کے کہ جہاں وہ مشترکہ چوٹیوں پر ملتے ہیں ۔';

  @override
  String get reportReasonInappropriateDisplayName => 'نامناسب ڈسپلے کا نام';

  @override
  String get reportReasonAbuse => 'بدسلوکی یا ہراساں کرنا';

  @override
  String get reportReasonImpersonation => 'نقالی';

  @override
  String get reportReasonSpam => 'سپیم یا دھوکہ دہی';

  @override
  String get reportReasonOther => 'دیگر';

  @override
  String nodesCount(int count) {
    return '$count نوڈز';
  }

  @override
  String movesCount(int count) {
    return '$count چالیں';
  }

  @override
  String scoreValue(int score) {
    return 'اسکور $score';
  }

  @override
  String graphUnsolvedSemantics(int level) {
    return 'گراف $level، حل نہیں ہوا، کھیلیں';
  }

  @override
  String graphSolvedSemantics(int level, int moves, int score) {
    return 'گراف $level، $moves چالوں میں حل ہوا، اسکور $score، دوبارہ کھیلیں';
  }

  @override
  String graphBlockedSemantics(int level) {
    return 'گراف $level، مقفل';
  }

  @override
  String graphReplayInProgressSemantics(int level) {
    return 'گراف $level، دوبارہ کھیل جاری ہے، جاری رکھیں';
  }

  @override
  String get replay => 'دوبارہ کھیلیں';

  @override
  String replayGraphQuestion(int level) {
    return 'گراف $level دوبارہ کھیلیں';
  }

  @override
  String get replayWarning =>
      'حل ہونے تک - اسکور 0 پر ری سیٹ ہو جائے گا اور اگلے گراف مقفل رہیں گے';

  @override
  String get resetAndReplay => 'ری سیٹ کرکے دوبارہ کھیلیں';

  @override
  String get unableSaveProgress => 'اس وقت پیش رفت محفوظ نہیں کی جا سکتی';

  @override
  String get saveYourProgress => 'اپنی پیش رفت محفوظ کریں';

  @override
  String get saveProgressDescription =>
      'آج کے گراف اور کامیابیاں اپنے تمام آلات پر رکھنے کے لیے مفت سائن اپ کریں۔';

  @override
  String get achievements => 'کامیابیاں';

  @override
  String get achievementFirstStepTitle => 'پہلا قدم';

  @override
  String get achievementFirstStepDescription => 'اپنا پہلا گراف حل کریں';

  @override
  String get achievementPracticeTitle => 'مشق';

  @override
  String get achievementPracticeDescription => '8 گراف حل کریں';

  @override
  String get achievementPersistenceTitle => 'ثابت قدمی';

  @override
  String get achievementPersistenceDescription => '16 گراف حل کریں';

  @override
  String get achievementDedicationTitle => 'لگن';

  @override
  String get achievementDedicationDescription => '32 گراف حل کریں';

  @override
  String get achievementPlanarityTitle => 'پلینارٹی';

  @override
  String get achievementPlanarityDescription => '64 گراف حل کریں';

  @override
  String get achievementEfficientTitle => 'موثر';

  @override
  String get achievementEfficientDescription =>
      'کم از کم 2 چالیں باقی رکھتے ہوئے گراف حل کریں';

  @override
  String get achievementPreciseTitle => 'درست';

  @override
  String get achievementPreciseDescription =>
      'کم از کم 4 چالیں باقی رکھتے ہوئے گراف حل کریں';

  @override
  String get achievementOptimalTitle => 'بہترین';

  @override
  String get achievementOptimalDescription =>
      'زیادہ سے زیادہ ممکنہ چالیں باقی رکھتے ہوئے گراف حل کریں';

  @override
  String get achievementCloseCallTitle => 'بال بال';

  @override
  String get achievementCloseCallDescription =>
      'کوئی چال باقی رکھے بغیر گراف حل کریں';

  @override
  String get achievementSecondAttemptTitle => 'دوسری کوشش';

  @override
  String get achievementSecondAttemptDescription => 'حل شدہ گراف دوبارہ کھیلیں';

  @override
  String get achievementImprovementTitle => 'بہتری';

  @override
  String get achievementImprovementDescription =>
      'دوبارہ کھیل کر اپنا پچھلا اسکور توڑیں';

  @override
  String get achievementRedemptionTitle => 'ازالہ';

  @override
  String get achievementRedemptionDescription =>
      'جس گراف پر پہلے 0 اسکور ہوا تھا اسے دوبارہ کھیل کر صفر سے زیادہ اسکور حاصل کریں';

  @override
  String get achievementPerfectedTitle => 'کمال';

  @override
  String get achievementPerfectedDescription =>
      'حل شدہ گراف کو دوبارہ کھیل کر اس کے زیادہ سے زیادہ ممکنہ اسکور تک بہتر کریں';

  @override
  String get unableLoadProfile => 'اس وقت آپ کی پروفائل لوڈ نہیں کی جا سکتی';

  @override
  String get unableShareRightNow => 'اس وقت شیئر نہیں کیا جا سکتا';

  @override
  String get restart => 'دوبارہ شروع کریں';

  @override
  String get tutorialNodeInstruction => 'یہ ایک نوڈ ہے اسے کہیں بھی گھسیٹیں';

  @override
  String get tutorialEdgesInstruction =>
      'نوڈ کناروں سے جڑے ہوتے ہیں کنارے نوڈ سے جڑے رہتے ہیں';

  @override
  String get tutorialSolvedInstruction =>
      'جب کنارے ایک دوسرے کو نہ کاٹیں تو گراف حل ہو جاتا ہے یہ گراف پہلے ہی حل شدہ ہے';
}
