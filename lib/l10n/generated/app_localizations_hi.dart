// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get account => 'खाता';

  @override
  String get accountDeleted => 'खाता हटा दिया गया';

  @override
  String get accountExistsSignInInstead => 'खाता मौजूद है - साइन इन करें';

  @override
  String addedFriend(String friendName) {
    return '$friendName जोड़ा गया';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '$inviterName को अपनी मित्र सूची में जोड़ें?';
  }

  @override
  String get addFriend => 'मित्र जोड़ें';

  @override
  String get alreadySignedUp => 'पहले से साइन अप है?';

  @override
  String get anonymousPlayer => 'अनाम खिलाड़ी';

  @override
  String get appleSignInUnavailablePlatform =>
      'इस प्लेटफ़ॉर्म पर Apple साइन-इन उपलब्ध नहीं है';

  @override
  String get appleSignInUnavailableRightNow =>
      'Apple साइन-इन अभी उपलब्ध नहीं है';

  @override
  String get authConfigurationInvalid =>
      'इस ऐप के लिए प्रमाणीकरण कॉन्फ़िगरेशन अमान्य है';

  @override
  String get authConfigurationMissing =>
      'प्रमाणीकरण कॉन्फ़िगरेशन मौजूद नहीं है';

  @override
  String get back => 'वापस';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get continueLabel => 'जारी रखें';

  @override
  String continueWithScore(int totalScore) {
    return 'जारी रखें - $totalScore';
  }

  @override
  String get continueWithApple => 'Apple के साथ जारी रखें';

  @override
  String get continueWithGoogle => 'Google के साथ जारी रखें';

  @override
  String get copyInviteLink => 'आमंत्रण लिंक कॉपी करें';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle => 'अपने ईमेल और पासवर्ड से खाता बनाएँ';

  @override
  String get dailyGraphPuzzle => 'दैनिक ग्राफ पहेली';

  @override
  String get dailyScore => 'दैनिक स्कोर';

  @override
  String get decline => 'अस्वीकार करें';

  @override
  String get deleteAccount => 'खाता हटाएँ';

  @override
  String get details => 'विवरण';

  @override
  String get detailsTooLong => 'विवरण 1000 अक्षर या कम होना चाहिए';

  @override
  String get displayName => 'प्रदर्शित नाम';

  @override
  String get email => 'ईमेल';

  @override
  String get enterEmailAndPassword => 'ईमेल और पासवर्ड दर्ज करें';

  @override
  String get enterEmailFirst => 'पहले अपना ईमेल दर्ज करें';

  @override
  String get enterValidEmail => 'मान्य ईमेल दर्ज करें';

  @override
  String failedNodes(int nodeCount) {
    return '$nodeCount नोड विफल';
  }

  @override
  String get friendInvite => 'मित्र आमंत्रण';

  @override
  String get friends => 'मित्र';

  @override
  String get global => 'वैश्विक';

  @override
  String get globalSnapshot => 'वैश्विक झलक';

  @override
  String get globalTopScore => 'वैश्विक शीर्ष स्कोर';

  @override
  String get googleSignInUnavailablePlatform =>
      'इस प्लेटफ़ॉर्म पर Google साइन-इन उपलब्ध नहीं है';

  @override
  String get googleSignInNotConfigured =>
      'इस ऐप के लिए Google साइन-इन कॉन्फ़िगर नहीं है';

  @override
  String get googleSignInNotConfiguredIos =>
      'इस iOS ऐप के लिए Google साइन-इन कॉन्फ़िगर नहीं है';

  @override
  String get home => 'होम';

  @override
  String get hideUserName => 'उपयोगकर्ता नाम छिपाएँ';

  @override
  String get ifEmailExistsResetLink =>
      'यदि वह ईमेल मौजूद है, तो हमने रीसेट लिंक भेज दिया है';

  @override
  String get invalidEmailOrPassword => 'ईमेल या पासवर्ड अमान्य है';

  @override
  String get invalidNameTrySomethingElse => 'अमान्य नाम - कुछ और आज़माएँ';

  @override
  String get invite => 'आमंत्रित करें';

  @override
  String get inviteLinkCopied => 'आमंत्रण लिंक कॉपी किया गया';

  @override
  String get leaderboard => 'लीडरबोर्ड';

  @override
  String get lifetimeScore => 'कुल स्कोर';

  @override
  String lifetimeScoreValue(int score) {
    return 'कुल स्कोर $score';
  }

  @override
  String get locked => 'लॉक';

  @override
  String get macosKeychainNotConfigured =>
      'macOS कीचेन एक्सेस कॉन्फ़िगर नहीं है';

  @override
  String get moreOptions => 'अधिक विकल्प';

  @override
  String get networkErrorCheckConnection =>
      'नेटवर्क त्रुटि - अपना कनेक्शन जाँचें';

  @override
  String get newHere => 'नए हैं?';

  @override
  String get noFriendsYet => 'आपने अभी तक कोई मित्र नहीं जोड़ा है';

  @override
  String get noFriendsLeaderboard =>
      'आपने अभी तक कोई मित्र नहीं जोड़ा है - किसी को आमंत्रित करने के लिए अपना प्रोफ़ाइल खोलें';

  @override
  String get noGlobalScoresYet => 'अभी कोई वैश्विक स्कोर नहीं है';

  @override
  String get originalByJohnTantalo => 'john tantalo द्वारा मूल';

  @override
  String get password => 'पासवर्ड';

  @override
  String get passwordMinLength => 'पासवर्ड कम से कम 6 अक्षरों का होना चाहिए';

  @override
  String get passwordTooWeak => 'पासवर्ड बहुत कमजोर है';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'wikipedia: समतलीय ग्राफ';

  @override
  String get pressAgainToDelete => 'हटाने के लिए फिर दबाएँ';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String get profileSubtitle =>
      'अपना नाम प्रोफ़ाइल में कैसे दिखे, इसे अपडेट करें';

  @override
  String get reason => 'कारण';

  @override
  String get remove => 'हटाएँ';

  @override
  String removeFriendQuestion(String displayName) {
    return '$displayName को अपनी मित्र सूची से हटाएँ?';
  }

  @override
  String get removeFriend => 'मित्र हटाएँ';

  @override
  String get reportPlayer => 'खिलाड़ी की रिपोर्ट करें';

  @override
  String get reportSubmitted => 'रिपोर्ट भेजी गई';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'रिपोर्ट भेजी गई - मित्र को हटाया नहीं जा सका';

  @override
  String get resetPassword => 'पासवर्ड रीसेट करें';

  @override
  String get share => 'साझा करें';

  @override
  String get shareInvitePrompt =>
      'मित्र को आमंत्रित करने के लिए यह QR कोड या लिंक साझा करें';

  @override
  String get shareUnavailableBuild => 'इस बिल्ड में साझा करना उपलब्ध नहीं है';

  @override
  String get signIn => 'साइन इन';

  @override
  String get signInAgainBeforeDeleting =>
      'अपना खाता हटाने से पहले फिर से साइन इन करें';

  @override
  String get signInMethodNotEnabled => 'यह साइन-इन तरीका सक्षम नहीं है';

  @override
  String get signInSubtitle => 'अपने ईमेल और पासवर्ड से साइन इन करें';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get signUp => 'साइन अप';

  @override
  String get signUpToCompete => ' अपने मित्रों से प्रतिस्पर्धा करने के लिए';

  @override
  String solvedNodes(int nodeCount) {
    return '$nodeCount नोड हल किए';
  }

  @override
  String get start => 'शुरू करें';

  @override
  String get submit => 'भेजें';

  @override
  String get thisPlayer => 'यह खिलाड़ी';

  @override
  String get tooManyAttempts => 'बहुत अधिक प्रयास - बाद में फिर कोशिश करें';

  @override
  String get unableAuthenticateRightNow => 'अभी प्रमाणीकरण नहीं हो सका';

  @override
  String get unableCreateAccountRightNow => 'अभी खाता नहीं बनाया जा सका';

  @override
  String get unableCreateProfileRightNow =>
      'अभी आपका प्रोफ़ाइल नहीं बनाया जा सका';

  @override
  String get unableDeleteAccountRightNow => 'अभी आपका खाता हटाया नहीं जा सका';

  @override
  String get unableDeleteProfileRightNow =>
      'अभी आपका प्रोफ़ाइल हटाया नहीं जा सका';

  @override
  String get unableLoadFriendsLeaderboard =>
      'अभी मित्र लीडरबोर्ड लोड नहीं हो सका';

  @override
  String get unableLoadGlobalLeaderboard =>
      'अभी वैश्विक लीडरबोर्ड लोड नहीं हो सका';

  @override
  String get unableSendResetEmailRightNow => 'अभी रीसेट ईमेल नहीं भेजा जा सका';

  @override
  String get unableSubmitReportRightNow => 'अभी रिपोर्ट नहीं भेजी जा सकी';

  @override
  String get unableUpdateHiddenNames => 'छिपे नाम अपडेट नहीं किए जा सके';

  @override
  String get unableCreateAccountNoUser => 'अभी खाता नहीं बनाया जा सका';

  @override
  String get unhideUserName => 'उपयोगकर्ता नाम दिखाएँ';

  @override
  String get you => 'आप';

  @override
  String get youAndYourFriends => 'आप और आपके मित्र';

  @override
  String get youAlreadyReportedPlayer => 'आप इस खिलाड़ी की रिपोर्ट कर चुके हैं';

  @override
  String get youCantAddYourself => 'आप स्वयं को नहीं जोड़ सकते';

  @override
  String get yourGlobalPosition => 'आपकी वैश्विक स्थिति';

  @override
  String get yourNewFriend => 'आपका नया मित्र';

  @override
  String get friendAlreadyInList => 'यह मित्र पहले से आपकी सूची में है';

  @override
  String get friendInviteNoLongerValid => 'वह मित्र आमंत्रण अब मान्य नहीं है';

  @override
  String get about => 'परिचय';

  @override
  String get goal => 'लक्ष्य';

  @override
  String get goalDescription =>
      'हर दिन कम से कम चालों में जितने हो सकें उतने ग्राफ हल करें';

  @override
  String get whyEveryPuzzleIsSolvable => 'हर पहेली हल क्यों हो सकती है';

  @override
  String get planarGraphDescription =>
      'planarity में हर ग्राफ हल हो सकता है क्योंकि वह समतलीय ग्राफ है। समतलीय ग्राफ ऐसा ग्राफ है जिसे सपाट सतह पर इस तरह बनाया जा सकता है कि किनारे न कटें, सिवाय जहाँ वे साझा शीर्षों पर मिलते हैं।';

  @override
  String get reportReasonInappropriateDisplayName => 'अनुचित प्रदर्शित नाम';

  @override
  String get reportReasonAbuse => 'दुर्व्यवहार या उत्पीड़न';

  @override
  String get reportReasonImpersonation => 'प्रतिरूपण';

  @override
  String get reportReasonSpam => 'स्पैम या धोखाधड़ी';

  @override
  String get reportReasonOther => 'अन्य';
}
