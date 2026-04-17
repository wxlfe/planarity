// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get account => 'الحساب';

  @override
  String get accountDeleted => 'تم حذف الحساب';

  @override
  String get accountExistsSignInInstead =>
      'الحساب موجود - سجّل الدخول بدلًا من ذلك';

  @override
  String addedFriend(String friendName) {
    return 'تمت إضافة $friendName';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'هل تريد إضافة $inviterName إلى قائمة أصدقائك؟';
  }

  @override
  String get addFriend => 'إضافة صديق';

  @override
  String get alreadySignedUp => 'هل سجلت بالفعل؟';

  @override
  String get anonymousPlayer => 'لاعب مجهول';

  @override
  String get appleSignInUnavailablePlatform =>
      'تسجيل الدخول عبر Apple غير متاح على هذه المنصة';

  @override
  String get appleSignInUnavailableRightNow =>
      'تسجيل الدخول عبر Apple غير متاح الآن';

  @override
  String get authConfigurationInvalid =>
      'إعدادات المصادقة غير صالحة لهذا التطبيق';

  @override
  String get authConfigurationMissing => 'إعدادات المصادقة مفقودة';

  @override
  String get back => 'رجوع';

  @override
  String get cancel => 'إلغاء';

  @override
  String get continueLabel => 'متابعة';

  @override
  String continueWithScore(int totalScore) {
    return 'متابعة - $totalScore';
  }

  @override
  String get continueWithApple => 'المتابعة باستخدام Apple';

  @override
  String get continueWithGoogle => 'المتابعة باستخدام Google';

  @override
  String get copyInviteLink => 'نسخ رابط الدعوة';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'أنشئ حسابًا باستخدام بريدك الإلكتروني وكلمة المرور';

  @override
  String get dailyGraphPuzzle => 'لغز الرسم البياني اليومي';

  @override
  String get dailyScore => 'نتيجة اليوم';

  @override
  String get decline => 'رفض';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get details => 'التفاصيل';

  @override
  String get detailsTooLong => 'يجب أن تكون التفاصيل 1000 حرف أو أقل';

  @override
  String get displayName => 'اسم العرض';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get enterEmailAndPassword => 'أدخل البريد الإلكتروني وكلمة المرور';

  @override
  String get enterEmailFirst => 'أدخل بريدك الإلكتروني أولًا';

  @override
  String get enterValidEmail => 'أدخل بريدًا إلكترونيًا صالحًا';

  @override
  String failedNodes(int nodeCount) {
    return 'فشل $nodeCount عقد';
  }

  @override
  String get friendInvite => 'دعوة صداقة';

  @override
  String get friends => 'الأصدقاء';

  @override
  String get global => 'عالمي';

  @override
  String get globalSnapshot => 'لقطة عالمية';

  @override
  String get globalTopScore => 'أعلى نتيجة عالمية';

  @override
  String get googleSignInUnavailablePlatform =>
      'تسجيل الدخول عبر Google غير متاح على هذه المنصة';

  @override
  String get googleSignInNotConfigured =>
      'تسجيل الدخول عبر Google غير مهيأ لهذا التطبيق';

  @override
  String get googleSignInNotConfiguredIos =>
      'تسجيل الدخول عبر Google غير مهيأ لتطبيق iOS هذا';

  @override
  String get home => 'الرئيسية';

  @override
  String get hideUserName => 'إخفاء اسم المستخدم';

  @override
  String get ifEmailExistsResetLink =>
      'إذا كان هذا البريد موجودًا، فقد أرسلنا رابط إعادة التعيين';

  @override
  String get invalidEmailOrPassword =>
      'البريد الإلكتروني أو كلمة المرور غير صالحة';

  @override
  String get invalidNameTrySomethingElse => 'اسم غير صالح - جرّب اسمًا آخر';

  @override
  String get invite => 'دعوة';

  @override
  String get inviteLinkCopied => 'تم نسخ رابط الدعوة';

  @override
  String get leaderboard => 'لوحة الصدارة';

  @override
  String get lifetimeScore => 'النتيجة الكلية';

  @override
  String lifetimeScoreValue(int score) {
    return 'النتيجة الكلية $score';
  }

  @override
  String get locked => 'مقفل';

  @override
  String get macosKeychainNotConfigured => 'وصول سلسلة مفاتيح macOS غير مهيأ';

  @override
  String get moreOptions => 'خيارات أكثر';

  @override
  String get networkErrorCheckConnection => 'خطأ في الشبكة - تحقق من الاتصال';

  @override
  String get newHere => 'جديد هنا؟';

  @override
  String get noFriendsYet => 'لم تضف أي أصدقاء بعد';

  @override
  String get noFriendsLeaderboard =>
      'لم تضف أي أصدقاء بعد - افتح ملفك الشخصي لدعوة شخص ما';

  @override
  String get noGlobalScoresYet => 'لا توجد نتائج عالمية بعد';

  @override
  String get originalByJohnTantalo => 'الأصل من john tantalo';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordMinLength =>
      'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';

  @override
  String get passwordTooWeak => 'كلمة المرور ضعيفة جدًا';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'ويكيبيديا: رسم بياني مستوٍ';

  @override
  String get pressAgainToDelete => 'اضغط مرة أخرى للحذف';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get profileSubtitle => 'حدّث طريقة ظهور اسمك في ملفك الشخصي';

  @override
  String get reason => 'السبب';

  @override
  String get remove => 'إزالة';

  @override
  String removeFriendQuestion(String displayName) {
    return 'هل تريد إزالة $displayName من قائمة أصدقائك؟';
  }

  @override
  String get removeFriend => 'إزالة صديق';

  @override
  String get reportPlayer => 'الإبلاغ عن لاعب';

  @override
  String get reportSubmitted => 'تم إرسال البلاغ';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'تم إرسال البلاغ - تعذرت إزالة الصديق';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get share => 'مشاركة';

  @override
  String get shareInvitePrompt => 'شارك رمز QR أو الرابط هذا لدعوة صديق';

  @override
  String get shareUnavailableBuild => 'المشاركة غير متاحة في هذا الإصدار';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signInAgainBeforeDeleting => 'سجّل الدخول مرة أخرى قبل حذف حسابك';

  @override
  String get signInMethodNotEnabled => 'طريقة تسجيل الدخول هذه غير مفعلة';

  @override
  String get signInSubtitle => 'سجّل الدخول ببريدك الإلكتروني وكلمة المرور';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signUpToCompete => ' للمنافسة مع أصدقائك';

  @override
  String solvedNodes(int nodeCount) {
    return 'تم حل $nodeCount عقد';
  }

  @override
  String get start => 'ابدأ';

  @override
  String get submit => 'إرسال';

  @override
  String get thisPlayer => 'هذا اللاعب';

  @override
  String get tooManyAttempts => 'محاولات كثيرة جدًا - حاول لاحقًا';

  @override
  String get unableAuthenticateRightNow => 'تعذرت المصادقة الآن';

  @override
  String get unableCreateAccountRightNow => 'تعذر إنشاء الحساب الآن';

  @override
  String get unableCreateProfileRightNow => 'تعذر إنشاء ملفك الشخصي الآن';

  @override
  String get unableDeleteAccountRightNow => 'تعذر حذف حسابك الآن';

  @override
  String get unableDeleteProfileRightNow => 'تعذر حذف ملفك الشخصي الآن';

  @override
  String get unableLoadFriendsLeaderboard =>
      'تعذر تحميل لوحة أصدقاء الصدارة الآن';

  @override
  String get unableLoadGlobalLeaderboard =>
      'تعذر تحميل لوحة الصدارة العالمية الآن';

  @override
  String get unableSendResetEmailRightNow =>
      'تعذر إرسال بريد إعادة التعيين الآن';

  @override
  String get unableSubmitReportRightNow => 'تعذر إرسال البلاغ الآن';

  @override
  String get unableUpdateHiddenNames => 'تعذر تحديث الأسماء المخفية';

  @override
  String get unableCreateAccountNoUser => 'تعذر إنشاء الحساب الآن';

  @override
  String get unhideUserName => 'إظهار اسم المستخدم';

  @override
  String get you => 'أنت';

  @override
  String get youAndYourFriends => 'أنت وأصدقاؤك';

  @override
  String get youAlreadyReportedPlayer => 'لقد أبلغت عن هذا اللاعب بالفعل';

  @override
  String get youCantAddYourself => 'لا يمكنك إضافة نفسك';

  @override
  String get yourGlobalPosition => 'مركزك العالمي';

  @override
  String get yourNewFriend => 'صديقك الجديد';

  @override
  String get friendAlreadyInList => 'هذا الصديق موجود بالفعل في قائمتك';

  @override
  String get friendInviteNoLongerValid => 'دعوة الصداقة هذه لم تعد صالحة';

  @override
  String get about => 'حول';

  @override
  String get goal => 'الهدف';

  @override
  String get goalDescription =>
      'حل أكبر عدد ممكن من الرسوم البيانية كل يوم بأقل عدد ممكن من الحركات';

  @override
  String get whyEveryPuzzleIsSolvable => 'لماذا كل لغز قابل للحل';

  @override
  String get planarGraphDescription =>
      'كل رسم بياني في planarity قابل للحل لأنه رسم بياني مستوٍ. الرسم البياني المستوي يمكن رسمه على سطح مسطح بحيث لا تتقاطع الحواف إلا عند الرؤوس المشتركة.';

  @override
  String get reportReasonInappropriateDisplayName => 'اسم عرض غير مناسب';

  @override
  String get reportReasonAbuse => 'إساءة أو مضايقة';

  @override
  String get reportReasonImpersonation => 'انتحال شخصية';

  @override
  String get reportReasonSpam => 'رسائل مزعجة أو احتيال';

  @override
  String get reportReasonOther => 'أخرى';
}
