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
  String get email => 'email';

  @override
  String get enterEmailAndPassword => 'masukkan email dan kata sandi';

  @override
  String get enterEmailFirst => 'masukkan emailmu terlebih dahulu';

  @override
  String get enterValidEmail => 'masukkan email yang valid';

  @override
  String failedNodes(int nodeCount) {
    return 'gagal $nodeCount node';
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
    return 'menyelesaikan $nodeCount node';
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
}
