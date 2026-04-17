// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get account => 'tài khoản';

  @override
  String get accountDeleted => 'tài khoản đã bị xóa';

  @override
  String get accountExistsSignInInstead =>
      'tài khoản đã tồn tại - hãy đăng nhập';

  @override
  String addedFriend(String friendName) {
    return 'đã thêm $friendName';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'thêm $inviterName vào danh sách bạn bè?';
  }

  @override
  String get addFriend => 'thêm bạn';

  @override
  String get alreadySignedUp => 'đã đăng ký?';

  @override
  String get anonymousPlayer => 'người chơi ẩn danh';

  @override
  String get appleSignInUnavailablePlatform =>
      'Đăng nhập Apple không khả dụng trên nền tảng này';

  @override
  String get appleSignInUnavailableRightNow =>
      'Đăng nhập Apple hiện không khả dụng';

  @override
  String get authConfigurationInvalid =>
      'cấu hình xác thực không hợp lệ cho ứng dụng này';

  @override
  String get authConfigurationMissing => 'thiếu cấu hình xác thực';

  @override
  String get back => 'quay lại';

  @override
  String get cancel => 'hủy';

  @override
  String get continueLabel => 'tiếp tục';

  @override
  String continueWithScore(int totalScore) {
    return 'tiếp tục - $totalScore';
  }

  @override
  String get continueWithApple => 'tiếp tục với Apple';

  @override
  String get continueWithGoogle => 'tiếp tục với Google';

  @override
  String get copyInviteLink => 'sao chép liên kết mời';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'tạo một tài khoản với email và mật khẩu của bạn.';

  @override
  String get dailyGraphPuzzle => 'câu đố đồ thị hằng ngày';

  @override
  String get dailyScore => 'điểm hằng ngày';

  @override
  String get decline => 'sự suy sụp';

  @override
  String get deleteAccount => 'xóa tài khoản';

  @override
  String get details => 'chi tiết';

  @override
  String get detailsTooLong => 'chi tiết phải có 1000 ký tự trở xuống';

  @override
  String get displayName => 'tên hiển thị';

  @override
  String get email => 'email';

  @override
  String get enterEmailAndPassword => 'nhập email và mật khẩu';

  @override
  String get enterEmailFirst => 'nhập email của bạn trước';

  @override
  String get enterValidEmail => 'nhập một email hợp lệ';

  @override
  String failedNodes(int nodeCount) {
    return 'thất bại $nodeCount nút';
  }

  @override
  String get friendInvite => 'lời mời kết bạn';

  @override
  String get friends => 'bạn bè';

  @override
  String get global => 'toàn cầu';

  @override
  String get globalSnapshot => 'ảnh chụp nhanh toàn cầu';

  @override
  String get globalTopScore => 'điểm số cao nhất toàn cầu';

  @override
  String get googleSignInUnavailablePlatform =>
      'đăng nhập bằng google không khả dụng trên nền tảng này';

  @override
  String get googleSignInNotConfigured =>
      'đăng nhập bằng google không được định cấu hình cho ứng dụng này';

  @override
  String get googleSignInNotConfiguredIos =>
      'đăng nhập bằng google không được định cấu hình cho ứng dụng iOS này';

  @override
  String get home => 'trang chủ';

  @override
  String get hideUserName => 'ẩn tên người dùng';

  @override
  String get ifEmailExistsResetLink =>
      'nếu email đó tồn tại, chúng tôi đã gửi liên kết đặt lại';

  @override
  String get invalidEmailOrPassword => 'email hoặc mật khẩu không hợp lệ';

  @override
  String get invalidNameTrySomethingElse =>
      'tên không hợp lệ - hãy thử tên khác';

  @override
  String get invite => 'mời';

  @override
  String get inviteLinkCopied => 'đã sao chép liên kết mời';

  @override
  String get leaderboard => 'bảng xếp hạng';

  @override
  String get lifetimeScore => 'điểm trọn đời';

  @override
  String lifetimeScoreValue(int score) {
    return 'tổng điểm $score';
  }

  @override
  String get locked => 'bị khóa';

  @override
  String get macosKeychainNotConfigured =>
      'quyền truy cập móc khóa macos không được định cấu hình';

  @override
  String get moreOptions => 'nhiều lựa chọn hơn';

  @override
  String get networkErrorCheckConnection =>
      'lỗi mạng - kiểm tra kết nối của bạn';

  @override
  String get newHere => 'mới ở đây à?';

  @override
  String get noFriendsYet => 'bạn chưa thêm bạn bè nào';

  @override
  String get noFriendsLeaderboard =>
      'bạn chưa thêm bạn bè nào - hãy mở hồ sơ của bạn để mời ai đó';

  @override
  String get noGlobalScoresYet => 'chưa có điểm toàn cầu';

  @override
  String get originalByJohnTantalo => 'nguyên văn bởi John Tantalo';

  @override
  String get password => 'mật khẩu';

  @override
  String get passwordMinLength => 'mật khẩu phải có ít nhất 6 ký tự';

  @override
  String get passwordTooWeak => 'mật khẩu quá yếu';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'wikipedia: đồ thị phẳng';

  @override
  String get pressAgainToDelete => 'nhấn lại để xóa';

  @override
  String get profile => 'hồ sơ';

  @override
  String get profileSubtitle =>
      'cập nhật cách tên của bạn xuất hiện trong hồ sơ của bạn';

  @override
  String get reason => 'lý do';

  @override
  String get remove => 'xóa';

  @override
  String removeFriendQuestion(String displayName) {
    return 'xóa $displayName khỏi danh sách bạn bè?';
  }

  @override
  String get removeFriend => 'xóa bạn bè';

  @override
  String get reportPlayer => 'trình phát báo cáo';

  @override
  String get reportSubmitted => 'báo cáo đã gửi';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'đã gửi báo cáo - không thể xóa bạn bè';

  @override
  String get resetPassword => 'đặt lại mật khẩu';

  @override
  String get share => 'chia sẻ';

  @override
  String get shareInvitePrompt =>
      'chia sẻ mã QR hoặc liên kết này để mời bạn bè';

  @override
  String get shareUnavailableBuild => 'chia sẻ không có sẵn trên bản dựng này';

  @override
  String get signIn => 'đăng nhập';

  @override
  String get signInAgainBeforeDeleting =>
      'đăng nhập lại trước khi xóa tài khoản của bạn';

  @override
  String get signInMethodNotEnabled =>
      'phương thức đăng nhập này chưa được bật';

  @override
  String get signInSubtitle => 'đăng nhập bằng email và mật khẩu của bạn';

  @override
  String get signOut => 'đăng xuất';

  @override
  String get signUp => 'đăng ký';

  @override
  String get signUpToCompete => ' để cạnh tranh với bạn bè của bạn';

  @override
  String solvedNodes(int nodeCount) {
    return 'đã giải $nodeCount nút';
  }

  @override
  String get start => 'bắt đầu';

  @override
  String get submit => 'gửi';

  @override
  String get thisPlayer => 'người chơi này';

  @override
  String get tooManyAttempts => 'quá nhiều lần thử - hãy thử lại sau';

  @override
  String get unableAuthenticateRightNow => 'không thể xác thực ngay bây giờ';

  @override
  String get unableCreateAccountRightNow =>
      'không thể tạo tài khoản ngay bây giờ';

  @override
  String get unableCreateProfileRightNow =>
      'không thể tạo hồ sơ của bạn ngay bây giờ';

  @override
  String get unableDeleteAccountRightNow =>
      'không thể xóa tài khoản của bạn ngay bây giờ';

  @override
  String get unableDeleteProfileRightNow =>
      'không thể xóa hồ sơ của bạn ngay bây giờ';

  @override
  String get unableLoadFriendsLeaderboard =>
      'không thể tải bảng xếp hạng bạn bè ngay bây giờ';

  @override
  String get unableLoadGlobalLeaderboard =>
      'không thể tải bảng xếp hạng toàn cầu ngay bây giờ';

  @override
  String get unableSendResetEmailRightNow =>
      'không thể gửi email đặt lại ngay bây giờ';

  @override
  String get unableSubmitReportRightNow => 'không thể gửi báo cáo ngay bây giờ';

  @override
  String get unableUpdateHiddenNames => 'không thể cập nhật tên ẩn';

  @override
  String get unableCreateAccountNoUser =>
      'không thể tạo tài khoản ngay bây giờ';

  @override
  String get unhideUserName => 'hiện tên người dùng';

  @override
  String get you => 'Bạn';

  @override
  String get youAndYourFriends => 'bạn và bạn bè của bạn';

  @override
  String get youAlreadyReportedPlayer => 'bạn đã báo cáo người chơi này';

  @override
  String get youCantAddYourself => 'bạn không thể thêm chính mình';

  @override
  String get yourGlobalPosition => 'vị trí toàn cầu của bạn';

  @override
  String get yourNewFriend => 'người bạn mới của bạn';

  @override
  String get friendAlreadyInList =>
      'người bạn này đã có trong danh sách của bạn';

  @override
  String get friendInviteNoLongerValid =>
      'lời mời kết bạn đó không còn hiệu lực';

  @override
  String get about => 'Về';

  @override
  String get goal => 'mục tiêu';

  @override
  String get goalDescription =>
      'giải càng nhiều đồ thị càng tốt mỗi ngày với càng ít bước di chuyển càng tốt';

  @override
  String get whyEveryPuzzleIsSolvable =>
      'tại sao mọi câu đố đều có thể giải được';

  @override
  String get planarGraphDescription =>
      'mọi đồ thị trong mặt phẳng đều có thể giải được vì nó là đồ thị phẳng. đồ thị phẳng là đồ thị có thể vẽ trên một bề mặt phẳng sao cho không có cạnh nào cắt nhau, trừ khi chúng gặp nhau tại các đỉnh chung.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'tên hiển thị không phù hợp';

  @override
  String get reportReasonAbuse => 'lạm dụng hoặc quấy rối';

  @override
  String get reportReasonImpersonation => 'mạo danh';

  @override
  String get reportReasonSpam => 'spam hoặc lừa đảo';

  @override
  String get reportReasonOther => 'khác';
}
