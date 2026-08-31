// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get account => 'akun';

  @override
  String get accountDeleted => 'akun dihapus';

  @override
  String get accountExistsSignInInstead => 'akun sudah ada - masuk saja';

  @override
  String addedFriend(String friendName) {
    return '$friendName ditambahkan';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'tambahkan $inviterName ke daftar temanmu?';
  }

  @override
  String get addFriend => 'tambah teman';

  @override
  String get alreadySignedUp => 'sudah daftar?';

  @override
  String get anonymousPlayer => 'pemain anonim';

  @override
  String get appleSignInUnavailablePlatform =>
      'masuk apel tidak tersedia di platform ini';

  @override
  String get appleSignInUnavailableRightNow =>
      'masuk dengan apple tidak tersedia saat ini';

  @override
  String get authConfigurationInvalid =>
      'konfigurasi autentikasi tidak valid untuk aplikasi ini';

  @override
  String get authConfigurationMissing => 'konfigurasi autentikasi tidak ada';

  @override
  String get back => 'kembali';

  @override
  String get cancel => 'batal';

  @override
  String get continueLabel => 'lanjutkan';

  @override
  String continueWithScore(int totalScore) {
    return 'lanjutkan - $totalScore';
  }

  @override
  String get continueWithApple => 'lanjutkan dengan Apple';

  @override
  String get continueWithGoogle => 'lanjutkan dengan Google';

  @override
  String get copyInviteLink => 'salin tautan undangan';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'buat akun dengan email dan kata sandi Anda.';

  @override
  String get dailyGraphPuzzle => 'teka-teki graf harian';

  @override
  String levelSubtitleUntangleMoves(int moveCount) {
    return 'urai graf dalam $moveCount langkah';
  }

  @override
  String get levelSubtitleNoCrossings => 'hilangkan semua persilangan';

  @override
  String get levelSubtitleKeepStreak => 'pertahankan rentetannya';

  @override
  String get levelSubtitlePerfectSolve => 'kejar penyelesaian sempurna';

  @override
  String get dailyScore => 'skor harian';

  @override
  String get decline => 'menolak';

  @override
  String get deleteAccount => 'hapus akun';

  @override
  String get details => 'detail';

  @override
  String get detailsTooLong => 'detailnya harus 1000 karakter atau kurang';

  @override
  String get displayName => 'nama tampilan';

  @override
  String get downloadOnAppStore => 'unduh di App Store';

  @override
  String get email => 'email';

  @override
  String get enterEmailAndPassword => 'masukkan email dan kata sandi';

  @override
  String get enterEmailFirst => 'masukkan emailmu terlebih dahulu';

  @override
  String get enterValidEmail => 'masukkan email yang valid';

  @override
  String failedNodes(int nodeCount) {
    return 'graf $nodeCount gagal';
  }

  @override
  String get friendInvite => 'undangan teman';

  @override
  String get friends => 'teman';

  @override
  String get global => 'global';

  @override
  String get globalSnapshot => 'gambaran global';

  @override
  String get globalTopScore => 'skor tertinggi global';

  @override
  String get googleSignInUnavailablePlatform =>
      'masuk dengan Google tidak tersedia di platform ini';

  @override
  String get googleSignInNotConfigured =>
      'login Google tidak dikonfigurasi untuk aplikasi ini';

  @override
  String get googleSignInNotConfiguredIos =>
      'login Google tidak dikonfigurasi untuk aplikasi iOS ini';

  @override
  String get home => 'beranda';

  @override
  String get hideUserName => 'sembunyikan nama pengguna';

  @override
  String get ifEmailExistsResetLink =>
      'jika email itu ada, kami mengirimkan tautan reset';

  @override
  String get invalidEmailOrPassword => 'email atau kata sandi tidak valid';

  @override
  String get invalidNameTrySomethingElse => 'nama tidak valid - coba yang lain';

  @override
  String get invite => 'undang';

  @override
  String get inviteLinkCopied => 'tautan undangan disalin';

  @override
  String get leaderboard => 'papan peringkat';

  @override
  String get lifetimeScore => 'skor seumur hidup';

  @override
  String lifetimeScoreValue(int score) {
    return 'skor total $score';
  }

  @override
  String get locked => 'terkunci';

  @override
  String get macosKeychainNotConfigured =>
      'akses gantungan kunci macos tidak dikonfigurasi';

  @override
  String get moreOptions => 'lebih banyak pilihan';

  @override
  String get networkErrorCheckConnection =>
      'kesalahan jaringan - periksa koneksi Anda';

  @override
  String get newHere => 'baru di sini?';

  @override
  String get noFriendsYet => 'kamu belum menambah teman';

  @override
  String get noFriendsLeaderboard =>
      'Anda belum menambahkan teman - buka profil Anda untuk mengundang seseorang';

  @override
  String get noGlobalScoresYet => 'belum ada skor global';

  @override
  String get originalByJohnTantalo => 'asli oleh john tantalo';

  @override
  String get password => 'kata sandi';

  @override
  String get passwordMinLength => 'kata sandi harus minimal 6 karakter';

  @override
  String get passwordTooWeak => 'kata sandi terlalu lemah';

  @override
  String get planarity => 'planarity';

  @override
  String get privacyOptions => 'opsi privasi';

  @override
  String get planarGraphWikipedia => 'wikipedia: grafik planar';

  @override
  String get pressAgainToDelete => 'tekan lagi untuk menghapus';

  @override
  String get profile => 'profil';

  @override
  String get profileSubtitle => 'perbarui tampilan nama Anda di profil Anda';

  @override
  String get reason => 'alasan';

  @override
  String get remove => 'hapus';

  @override
  String removeFriendQuestion(String displayName) {
    return 'hapus $displayName dari daftar temanmu?';
  }

  @override
  String get removeFriend => 'hapus teman';

  @override
  String get reportPlayer => 'pemutar laporan';

  @override
  String get reportSubmitted => 'laporan diserahkan';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'laporan terkirim - tidak dapat menghapus teman';

  @override
  String get resetPassword => 'mengatur ulang kata sandi';

  @override
  String get share => 'bagikan';

  @override
  String get shareInvitePrompt =>
      'bagikan kode QR atau tautan ini untuk mengundang teman';

  @override
  String get shareUnavailableBuild => 'share tidak tersedia pada build ini';

  @override
  String get signIn => 'masuk';

  @override
  String get signInAgainBeforeDeleting =>
      'masuk lagi sebelum menghapus akun Anda';

  @override
  String get signInMethodNotEnabled => 'metode masuk ini tidak diaktifkan';

  @override
  String get signInSubtitle => 'masuk dengan email dan kata sandi Anda';

  @override
  String get signOut => 'keluar';

  @override
  String get signUp => 'daftar';

  @override
  String get signUpToCompete => ' untuk bersaing dengan teman-temanmu';

  @override
  String solvedNodes(int nodeCount) {
    return 'graf $nodeCount selesai';
  }

  @override
  String get start => 'mulai';

  @override
  String get submit => 'kirim';

  @override
  String get thisPlayer => 'pemain ini';

  @override
  String get tooManyAttempts => 'terlalu banyak upaya - coba lagi nanti';

  @override
  String get unableAuthenticateRightNow =>
      'tidak dapat mengautentikasi saat ini';

  @override
  String get unableCreateAccountRightNow => 'tidak dapat membuat akun saat ini';

  @override
  String get unableCreateProfileRightNow =>
      'tidak dapat membuat profil Anda sekarang';

  @override
  String get unableDeleteAccountRightNow =>
      'tidak dapat menghapus akun Anda saat ini';

  @override
  String get unableDeleteProfileRightNow =>
      'tidak dapat menghapus profil Anda saat ini';

  @override
  String get unableLoadFriendsLeaderboard =>
      'tidak dapat memuat papan peringkat teman saat ini';

  @override
  String get unableLoadGlobalLeaderboard =>
      'tidak dapat memuat papan peringkat global saat ini';

  @override
  String get unableSendResetEmailRightNow =>
      'tidak dapat mengirim email pengaturan ulang saat ini';

  @override
  String get unableSubmitReportRightNow =>
      'tidak dapat mengirimkan laporan saat ini';

  @override
  String get unableUpdateHiddenNames =>
      'tidak dapat memperbarui nama yang tersembunyi';

  @override
  String get unableCreateAccountNoUser => 'tidak dapat membuat akun saat ini';

  @override
  String get unhideUserName => 'sembunyikan nama pengguna';

  @override
  String get you => 'Anda';

  @override
  String get youAndYourFriends => 'kamu dan temanmu';

  @override
  String get youAlreadyReportedPlayer => 'Anda sudah melaporkan pemain ini';

  @override
  String get youCantAddYourself =>
      'Anda tidak dapat menambahkan diri Anda sendiri';

  @override
  String get yourGlobalPosition => 'posisi global Anda';

  @override
  String get yourNewFriend => 'teman barumu';

  @override
  String get friendAlreadyInList => 'teman ini sudah ada dalam daftar Anda';

  @override
  String get friendInviteNoLongerValid =>
      'undangan pertemanan itu tidak berlaku lagi';

  @override
  String get about => 'tentang';

  @override
  String get goal => 'sasaran';

  @override
  String get goalDescription =>
      'selesaikan grafik sebanyak yang Anda bisa setiap hari dengan gerakan sesedikit mungkin';

  @override
  String get whyEveryPuzzleIsSolvable =>
      'mengapa setiap teka-teki bisa dipecahkan';

  @override
  String get planarGraphDescription =>
      'setiap grafik dalam planar dapat dipecahkan karena merupakan grafik planar. graf planar adalah graf yang dapat digambar pada bidang datar sehingga tidak ada sisi yang berpotongan, kecuali sisi-sisi tersebut bertemu pada simpul-simpul yang sama.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'nama tampilan tidak pantas';

  @override
  String get reportReasonAbuse => 'pelecehan atau perundungan';

  @override
  String get reportReasonImpersonation => 'peniruan identitas';

  @override
  String get reportReasonSpam => 'spam atau penipuan';

  @override
  String get reportReasonOther => 'lainnya';

  @override
  String nodesCount(int count) {
    return '$count simpul';
  }

  @override
  String movesCount(int count) {
    return '$count langkah';
  }

  @override
  String scoreValue(int score) {
    return 'skor $score';
  }

  @override
  String graphUnsolvedSemantics(int level) {
    return 'graf $level, belum diselesaikan, mainkan';
  }

  @override
  String graphSolvedSemantics(int level, int moves, int score) {
    return 'graf $level, diselesaikan dalam $moves langkah, skor $score, mainkan ulang';
  }

  @override
  String graphBlockedSemantics(int level) {
    return 'graf $level, terkunci';
  }

  @override
  String graphReplayInProgressSemantics(int level) {
    return 'graf $level, permainan ulang sedang berlangsung, lanjutkan';
  }

  @override
  String get replay => 'mainkan ulang';

  @override
  String replayGraphQuestion(int level) {
    return 'mainkan ulang graf $level?';
  }

  @override
  String get replayWarning =>
      'skor Anda akan kembali ke 0 sampai Anda menyelesaikan graf ini lagi. graf yang lebih tinggi tidak akan tersedia jika Anda membiarkannya belum selesai.';

  @override
  String get resetAndReplay => 'atur ulang dan mainkan lagi';

  @override
  String get unableSaveProgress => 'tidak dapat menyimpan progres saat ini';

  @override
  String get saveYourProgress => 'simpan progres Anda';

  @override
  String get saveProgressDescription =>
      'daftar gratis untuk menyimpan graf hari ini dan pencapaian Anda di semua perangkat.';

  @override
  String get achievements => 'pencapaian';

  @override
  String get achievementFirstStepTitle => 'langkah pertama';

  @override
  String get achievementFirstStepDescription => 'selesaikan graf pertama Anda';

  @override
  String get achievementPracticeTitle => 'latihan';

  @override
  String get achievementPracticeDescription => 'selesaikan 8 graf';

  @override
  String get achievementPersistenceTitle => 'kegigihan';

  @override
  String get achievementPersistenceDescription => 'selesaikan 16 graf';

  @override
  String get achievementDedicationTitle => 'dedikasi';

  @override
  String get achievementDedicationDescription => 'selesaikan 32 graf';

  @override
  String get achievementPlanarityTitle => 'planaritas';

  @override
  String get achievementPlanarityDescription => 'selesaikan 64 graf';

  @override
  String get achievementEfficientTitle => 'efisien';

  @override
  String get achievementEfficientDescription =>
      'selesaikan graf dengan setidaknya 2 langkah tersisa';

  @override
  String get achievementPreciseTitle => 'presisi';

  @override
  String get achievementPreciseDescription =>
      'selesaikan graf dengan setidaknya 4 langkah tersisa';

  @override
  String get achievementOptimalTitle => 'optimal';

  @override
  String get achievementOptimalDescription =>
      'selesaikan graf dengan jumlah langkah tersisa sebanyak mungkin';

  @override
  String get achievementCloseCallTitle => 'nyaris';

  @override
  String get achievementCloseCallDescription =>
      'selesaikan graf tanpa langkah tersisa';

  @override
  String get achievementSecondAttemptTitle => 'percobaan kedua';

  @override
  String get achievementSecondAttemptDescription =>
      'mainkan ulang graf yang sudah selesai';

  @override
  String get achievementImprovementTitle => 'peningkatan';

  @override
  String get achievementImprovementDescription =>
      'lampaui skor Anda sebelumnya saat bermain ulang';

  @override
  String get achievementRedemptionTitle => 'penebusan';

  @override
  String get achievementRedemptionDescription =>
      'dapatkan skor di atas nol saat memainkan ulang graf yang sebelumnya mendapat skor 0';

  @override
  String get achievementPerfectedTitle => 'disempurnakan';

  @override
  String get achievementPerfectedDescription =>
      'tingkatkan graf yang telah selesai hingga skor maksimalnya saat bermain ulang';

  @override
  String get unableLoadProfile => 'tidak dapat memuat profil Anda saat ini';

  @override
  String get unableShareRightNow => 'tidak dapat membagikan saat ini';

  @override
  String get restart => 'mulai ulang';

  @override
  String get tutorialNodeInstruction => 'ini adalah simpul seret ke mana saja';

  @override
  String get tutorialEdgesInstruction =>
      'simpul terhubung oleh sisi sisi tetap terhubung';

  @override
  String get tutorialSolvedInstruction =>
      'graf selesai ketika tidak ada sisi yang berpotongan graf ini sudah selesai';
}
