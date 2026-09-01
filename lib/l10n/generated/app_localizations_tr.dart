// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get account => 'hesap';

  @override
  String get accountDeleted => 'Hesap Silindi';

  @override
  String get accountExistsSignInInstead =>
      'hesap mevcut - bunun yerine oturum açın';

  @override
  String addedFriend(String friendName) {
    return '$friendName eklendi';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '$inviterName arkadaş listenize eklensin mi?';
  }

  @override
  String get addFriend => 'Arkadaş Ekle';

  @override
  String get alreadySignedUp => 'Zaten kaydoldunuz mu?';

  @override
  String get anonymousPlayer => 'anonim oyuncu';

  @override
  String get appleSignInUnavailablePlatform =>
      'apple oturumu bu platformda mevcut değil';

  @override
  String get appleSignInUnavailableRightNow =>
      'apple oturum açma özelliği şu anda kullanılamıyor';

  @override
  String get authConfigurationInvalid =>
      'auth yapılandırması bu uygulama için geçersiz';

  @override
  String get authConfigurationMissing => 'auth yapılandırması eksik';

  @override
  String get back => 'geri';

  @override
  String get cancel => 'iptal';

  @override
  String get continueLabel => 'devam et';

  @override
  String continueWithScore(int totalScore) {
    return 'devam et - $totalScore';
  }

  @override
  String get continueWithApple => 'Apple ile devam edin';

  @override
  String get continueWithGoogle => 'Google ile devam edin';

  @override
  String get copyInviteLink => 'Davet Linki Kopyala';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'e - posta adresiniz ve şifrenizle bir hesap oluşturun.';

  @override
  String get dailyGraphPuzzle => 'günlük grafik bulmacası';

  @override
  String levelSubtitleUntangleMoves(int moveCount) {
    return 'grafı $moveCount hamlede çöz';
  }

  @override
  String get levelSubtitleNoCrossings => 'tüm kesişimleri kaldır';

  @override
  String get levelSubtitleKeepStreak => 'seriyi sürdür';

  @override
  String get levelSubtitlePerfectSolve => 'mükemmel çözümü kovala';

  @override
  String get dailyScore => 'günlük skor';

  @override
  String get decline => 'reddetmek';

  @override
  String get deleteAccount => 'hesabı sil';

  @override
  String get details => 'detaylar';

  @override
  String get detailsTooLong =>
      'ayrıntılar 1000 karakter veya daha kısa olmalıdır';

  @override
  String get displayName => 'görünen ad';

  @override
  String get downloadOnAppStore => 'App Store\'dan indir';

  @override
  String get email => 'e-posta';

  @override
  String get enterEmailAndPassword => 'Lütfen e-posta ve şifre girin.';

  @override
  String get enterEmailFirst => 'önce e - postanızı girin';

  @override
  String get enterValidEmail => 'Geçerli bir e-posta adresi girin';

  @override
  String failedNodes(int nodeCount) {
    return 'graf $nodeCount başarısız';
  }

  @override
  String get friendInvite => 'arkadaş daveti';

  @override
  String get friends => 'arkadaşlar';

  @override
  String get global => 'global';

  @override
  String get globalSnapshot => 'genel anlık görüntü';

  @override
  String get globalTopScore => 'global en yüksek puan';

  @override
  String get googleSignInUnavailablePlatform =>
      'google oturum açma özelliği bu platformda kullanılamıyor';

  @override
  String get googleSignInNotConfigured =>
      'google oturum açma bu uygulama için yapılandırılmamış';

  @override
  String get googleSignInNotConfiguredIos =>
      'google oturumu bu iOS uygulaması için yapılandırılmamış';

  @override
  String get home => 'ana sayfa';

  @override
  String get hideUserName => 'Kullanıcı Adını gizle';

  @override
  String get ifEmailExistsResetLink =>
      'bu e - posta mevcutsa, bir sıfırlama bağlantısı gönderdik';

  @override
  String get invalidEmailOrPassword => 'Geçersiz e-posta veya şifre';

  @override
  String get invalidNameTrySomethingElse =>
      'geçersiz ad - başka bir şey deneyin';

  @override
  String get invite => 'davet et';

  @override
  String get inviteLinkCopied => 'davet bağlantısı kopyalandı';

  @override
  String get leaderboard => 'liderlik tablosu';

  @override
  String get lifetimeScore => 'yaşam boyu puanı';

  @override
  String lifetimeScoreValue(int score) {
    return 'toplam skor $score';
  }

  @override
  String get locked => 'kilitli';

  @override
  String get macosKeychainNotConfigured =>
      'macos anahtarlık erişimi yapılandırılmadı';

  @override
  String get moreOptions => 'daha fazla seçenek';

  @override
  String get networkErrorCheckConnection =>
      'ağ hatası - bağlantınızı kontrol edin';

  @override
  String get newHere => 'Burada yeni misiniz?';

  @override
  String get noFriendsYet => 'Henüz hiç arkadaş eklemediniz.';

  @override
  String get noFriendsLeaderboard =>
      'henüz hiç arkadaş eklemediniz - birini davet etmek için profilinizi açın';

  @override
  String get noGlobalScoresYet => 'henüz global skor yok';

  @override
  String get originalByJohnTantalo => 'orijinal: John Tantalo';

  @override
  String get password => 'şifre';

  @override
  String get passwordMinLength =>
      'şifreniz en az 6 karakter uzunluğunda olmalıdır';

  @override
  String get passwordTooWeak => 'Şifre çok zayıf';

  @override
  String get planarity => 'planarity';

  @override
  String get privacyOptions => 'gizlilik seçenekleri';

  @override
  String get rankingUpdate => 'sıralama güncellemesi';

  @override
  String rankingGlobalResult(int globalRank, DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString tarihinde global sıralamada #$globalRank oldun';
  }

  @override
  String rankingFriendsAndGlobalResult(
    int friendRank,
    int globalRank,
    DateTime date,
  ) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString tarihinde arkadaşların arasında #$friendRank, global sıralamada #$globalRank oldun';
  }

  @override
  String get planarGraphWikipedia => 'wikipedia: düzlemsel grafik';

  @override
  String get pressAgainToDelete => 'silmek için tekrar basın';

  @override
  String get profile => 'profil';

  @override
  String get profileSubtitle =>
      'adınızın profilinizde nasıl göründüğünü güncelleyin';

  @override
  String get reason => 'sebep';

  @override
  String get remove => 'kaldır';

  @override
  String removeFriendQuestion(String displayName) {
    return '$displayName arkadaş listenizden kaldırılsın mı?';
  }

  @override
  String get removeFriend => 'Arkadaşı kaldır';

  @override
  String get reportPlayer => 'oyuncuyu şikayet et';

  @override
  String get reportSubmitted => 'Raporu Ekleyen';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'rapor gönderildi - arkadaş kaldırılamıyor';

  @override
  String get resetPassword => 'şifreyi yenile';

  @override
  String get share => 'paylaş';

  @override
  String get shareInvitePrompt =>
      'bir arkadaşınızı davet etmek için bu QR kodunu veya bağlantıyı paylaşın';

  @override
  String get shareUnavailableBuild => 'paylaşım bu derlemede kullanılamıyor';

  @override
  String get signIn => 'giriş yap';

  @override
  String get signInAgainBeforeDeleting =>
      'hesabınızı silmeden önce tekrar oturum açın';

  @override
  String get signInMethodNotEnabled =>
      'bu oturum açma yöntemi etkinleştirilmedi';

  @override
  String get signInSubtitle => 'e - posta adresiniz ve şifrenizle oturum açın';

  @override
  String get signOut => 'çıkış yap';

  @override
  String get signUp => 'kaydol';

  @override
  String get signUpToCompete => ' arkadaşlarınızla rekabet etmek için';

  @override
  String solvedNodes(int nodeCount) {
    return 'graf $nodeCount çözüldü';
  }

  @override
  String get start => 'başla';

  @override
  String get submit => 'gönder';

  @override
  String get thisPlayer => 'bu oyuncu';

  @override
  String get tooManyAttempts =>
      'Çok fazla deneme, lütfen daha sonra tekrar deneyin';

  @override
  String get unableAuthenticateRightNow =>
      'şu anda kimlik doğrulaması yapılamıyor';

  @override
  String get unableCreateAccountRightNow => 'şu anda hesap oluşturulamıyor';

  @override
  String get unableCreateProfileRightNow =>
      'şu anda profiliniz oluşturulamıyor';

  @override
  String get unableDeleteAccountRightNow => 'hesabınız şu anda silinemiyor';

  @override
  String get unableDeleteProfileRightNow => 'şu anda profiliniz silinemiyor';

  @override
  String get unableLoadFriendsLeaderboard =>
      'şu anda arkadaş liderlik tablosu yüklenemiyor';

  @override
  String get unableLoadGlobalLeaderboard =>
      'şu anda küresel liderlik tablosu yüklenemiyor';

  @override
  String get unableSendResetEmailRightNow =>
      'şu anda sıfırlama e - postası gönderilemiyor';

  @override
  String get unableSubmitReportRightNow => 'şu anda rapor gönderilemiyor';

  @override
  String get unableUpdateHiddenNames => 'gizli adlar güncellenemiyor';

  @override
  String get unableCreateAccountNoUser => 'şu anda hesap oluşturulamıyor';

  @override
  String get unhideUserName => 'kullanıcı adını göster';

  @override
  String get you => 'sen';

  @override
  String get youAndYourFriends => 'Siz ve arkadaşlarınızTimeline Name';

  @override
  String get youAlreadyReportedPlayer => 'bu oyuncuyu zaten şikayet ettiniz';

  @override
  String get youCantAddYourself => 'Üzgünüz, kendinizi ekleyemezsiniz!';

  @override
  String get yourGlobalPosition => 'küresel konumunuz';

  @override
  String get yourNewFriend => 'Yeni arkadaş';

  @override
  String get friendAlreadyInList => 'bu arkadaş zaten listenizde var';

  @override
  String get friendInviteNoLongerValid =>
      'bu arkadaş daveti artık geçerli değil';

  @override
  String get about => 'hakkında';

  @override
  String get goal => 'hedef';

  @override
  String get goalDescription =>
      'mümkün olduğunca az hamle ile her gün mümkün olduğunca çok grafik çözün';

  @override
  String get whyEveryPuzzleIsSolvable => 'neden her bulmaca çözülebilir';

  @override
  String get planarGraphDescription =>
      'düzlemsellikteki her grafik çözülebilir çünkü düzlemsel bir grafiktir. Düzlemsel bir grafik, paylaşılan köşelerde buluştukları yerler dışında hiçbir kenarın kesişmemesi için düz bir yüzeye çizilebilen bir grafiktir.';

  @override
  String get reportReasonInappropriateDisplayName => 'uygunsuz görünen ad';

  @override
  String get reportReasonAbuse => 'istismar veya taciz';

  @override
  String get reportReasonImpersonation => 'kimliğe bürünme';

  @override
  String get reportReasonSpam => 'istenmeyen e - posta veya dolandırıcılık';

  @override
  String get reportReasonOther => 'bağımsız';

  @override
  String nodesCount(int count) {
    return '$count düğüm';
  }

  @override
  String movesCount(int count) {
    return '$count hamle';
  }

  @override
  String scoreValue(int score) {
    return 'puan $score';
  }

  @override
  String graphUnsolvedSemantics(int level) {
    return 'graf $level, çözülmedi, oyna';
  }

  @override
  String graphSolvedSemantics(int level, int moves, int score) {
    return 'graf $level, $moves hamlede çözüldü, puan $score, yeniden oyna';
  }

  @override
  String graphBlockedSemantics(int level) {
    return 'graf $level, kilitli';
  }

  @override
  String graphReplayInProgressSemantics(int level) {
    return 'graf $level, yeniden oynama sürüyor, devam et';
  }

  @override
  String get replay => 'yeniden oyna';

  @override
  String replayGraphQuestion(int level) {
    return '$level. grafi yeniden oyna';
  }

  @override
  String get replayWarning =>
      'çözülene kadar - puan 0\'a sıfırlanacak ve sonraki grafikler kilitlenecek';

  @override
  String get resetAndReplay => 'sıfırla ve yeniden oyna';

  @override
  String get unableSaveProgress => 'ilerleme şu anda kaydedilemiyor';

  @override
  String get saveYourProgress => 'ilerlemeni kaydet';

  @override
  String get saveProgressDescription =>
      'bugünün grafiklerini ve başarılarını tüm cihazlarında saklamak için ücretsiz kaydol.';

  @override
  String get achievements => 'başarılar';

  @override
  String get achievementFirstStepTitle => 'ilk adım';

  @override
  String get achievementFirstStepDescription => 'ilk grafini çöz';

  @override
  String get achievementPracticeTitle => 'pratik';

  @override
  String get achievementPracticeDescription => '8 grafik çöz';

  @override
  String get achievementPersistenceTitle => 'azim';

  @override
  String get achievementPersistenceDescription => '16 grafik çöz';

  @override
  String get achievementDedicationTitle => 'adanmışlık';

  @override
  String get achievementDedicationDescription => '32 grafik çöz';

  @override
  String get achievementPlanarityTitle => 'düzlemsellik';

  @override
  String get achievementPlanarityDescription => '64 grafik çöz';

  @override
  String get achievementEfficientTitle => 'verimli';

  @override
  String get achievementEfficientDescription =>
      'en az 2 hamle kala bir grafik çöz';

  @override
  String get achievementPreciseTitle => 'hassas';

  @override
  String get achievementPreciseDescription =>
      'en az 4 hamle kala bir grafik çöz';

  @override
  String get achievementOptimalTitle => 'optimum';

  @override
  String get achievementOptimalDescription =>
      'mümkün olan en fazla hamle kala bir grafik çöz';

  @override
  String get achievementCloseCallTitle => 'kıl payı';

  @override
  String get achievementCloseCallDescription =>
      'hiç hamle kalmadan bir grafik çöz';

  @override
  String get achievementSecondAttemptTitle => 'ikinci deneme';

  @override
  String get achievementSecondAttemptDescription =>
      'çözülmüş bir grafiği yeniden oyna';

  @override
  String get achievementImprovementTitle => 'gelişim';

  @override
  String get achievementImprovementDescription =>
      'yeniden oynarken önceki puanını geç';

  @override
  String get achievementRedemptionTitle => 'telafi';

  @override
  String get achievementRedemptionDescription =>
      'daha önce 0 puan aldığın bir grafiği yeniden oynayıp sıfırdan yüksek puan al';

  @override
  String get achievementPerfectedTitle => 'mükemmelleştirildi';

  @override
  String get achievementPerfectedDescription =>
      'çözülmüş bir grafiği yeniden oynayarak mümkün olan en yüksek puana çıkar';

  @override
  String get unableLoadProfile => 'profilin şu anda yüklenemiyor';

  @override
  String get unableShareRightNow => 'şu anda paylaşılamıyor';

  @override
  String get restart => 'yeniden başlat';

  @override
  String get tutorialNodeInstruction =>
      'bu bir düğüm onu istediğin yere sürükle';

  @override
  String get tutorialEdgesInstruction =>
      'düğümler kenarlarla bağlıdır kenarlar bağlı kalır';

  @override
  String get tutorialSolvedInstruction =>
      'hiçbir kenar kesişmediğinde grafik çözülür bu grafik zaten çözülmüş';
}
