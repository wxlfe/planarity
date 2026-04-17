// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get account => '계정';

  @override
  String get accountDeleted => '계정이 삭제되었습니다';

  @override
  String get accountExistsSignInInstead => '계정이 있습니다 - 로그인하세요';

  @override
  String addedFriend(String friendName) {
    return '$friendName 추가됨';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '$inviterName을 친구 목록에 추가할까요?';
  }

  @override
  String get addFriend => '친구 추가';

  @override
  String get alreadySignedUp => '이미 가입했나요?';

  @override
  String get anonymousPlayer => '익명 플레이어';

  @override
  String get appleSignInUnavailablePlatform => '이 플랫폼에서는 Apple 로그인을 사용할 수 없습니다';

  @override
  String get appleSignInUnavailableRightNow => '현재 Apple 로그인을 사용할 수 없습니다';

  @override
  String get authConfigurationInvalid => '이 앱에 대한 인증 구성이 유효하지 않습니다';

  @override
  String get authConfigurationMissing => '인증 구성이 누락되었습니다';

  @override
  String get back => '뒤로';

  @override
  String get cancel => '취소';

  @override
  String get continueLabel => '계속';

  @override
  String continueWithScore(int totalScore) {
    return '계속 - $totalScore';
  }

  @override
  String get continueWithApple => 'Apple로 계속하기';

  @override
  String get continueWithGoogle => 'Google로 계속하기';

  @override
  String get copyInviteLink => '초대 링크 복사';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle => '이메일과 비밀번호로 계정을 만드세요.';

  @override
  String get dailyGraphPuzzle => '일일 그래프 퍼즐';

  @override
  String get dailyScore => '일일 점수';

  @override
  String get decline => '거부';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get details => '상세 정보';

  @override
  String get detailsTooLong => '세부 정보는 1000자 이하여야 합니다';

  @override
  String get displayName => '표시 이름';

  @override
  String get email => '이메일';

  @override
  String get enterEmailAndPassword => '이메일과 비밀번호를 입력하세요';

  @override
  String get enterEmailFirst => '먼저 이메일을 입력하세요';

  @override
  String get enterValidEmail => '올바른 이메일을 입력해 주세요.';

  @override
  String failedNodes(int nodeCount) {
    return '$nodeCount개 노드 실패';
  }

  @override
  String get friendInvite => '친구 초대';

  @override
  String get friends => '친구';

  @override
  String get global => '글로벌';

  @override
  String get globalSnapshot => '글로벌 스냅샷';

  @override
  String get globalTopScore => '글로벌 최고 점수';

  @override
  String get googleSignInUnavailablePlatform =>
      '이 플랫폼에서는 Google 로그인을 사용할 수 없습니다';

  @override
  String get googleSignInNotConfigured => '이 앱에 대해 Google 로그인이 구성되지 않았습니다';

  @override
  String get googleSignInNotConfiguredIos =>
      '이 iOS 앱에 대해 Google 로그인이 구성되지 않았습니다';

  @override
  String get home => '홈';

  @override
  String get hideUserName => '사용자 이름 숨기기';

  @override
  String get ifEmailExistsResetLink => '해당 이메일이 있는 경우, 재설정 링크를 보내드렸습니다.';

  @override
  String get invalidEmailOrPassword => '유효하지 않은 이메일 또는 비밀번호입니다';

  @override
  String get invalidNameTrySomethingElse => '유효하지 않은 이름 - 다른 이름으로 시도하십시오';

  @override
  String get invite => '초대';

  @override
  String get inviteLinkCopied => '초대 링크 복사 완료';

  @override
  String get leaderboard => '순위표';

  @override
  String get lifetimeScore => '평생 점수';

  @override
  String lifetimeScoreValue(int score) {
    return '총점 $score';
  }

  @override
  String get locked => '잠김';

  @override
  String get macosKeychainNotConfigured => 'macos 키체인 액세스가 구성되지 않았습니다';

  @override
  String get moreOptions => '추가 옵션';

  @override
  String get networkErrorCheckConnection => '네트워크 오류 - 연결 확인';

  @override
  String get newHere => '처음이신가요?';

  @override
  String get noFriendsYet => '아직 친구를 추가하지 않았습니다';

  @override
  String get noFriendsLeaderboard => '아직 친구를 추가하지 않았습니다. 프로필을 열어 친구를 초대하세요.';

  @override
  String get noGlobalScoresYet => '아직 글로벌 점수가 없습니다';

  @override
  String get originalByJohnTantalo => '원저자명: John Tantalo';

  @override
  String get password => '비밀번호';

  @override
  String get passwordMinLength => '비밀번호는 최소 6자 이상이어야 합니다';

  @override
  String get passwordTooWeak => '안전하지 않은 비밀번호입니다';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => '위키백과: 평면 그래프';

  @override
  String get pressAgainToDelete => '삭제하려면 다시 누르세요.';

  @override
  String get profile => '프로필';

  @override
  String get profileSubtitle => '프로필에 회원님의 이름이 어떻게 표시되는지 업데이트하세요.';

  @override
  String get reason => '이유';

  @override
  String get remove => '삭제';

  @override
  String removeFriendQuestion(String displayName) {
    return '친구 목록에서 $displayName을 삭제할까요?';
  }

  @override
  String get removeFriend => '친구 삭제';

  @override
  String get reportPlayer => '플레이어 신고';

  @override
  String get reportSubmitted => '보고서 제출 완료';

  @override
  String get reportSubmittedUnableRemoveFriend => '제출된 보고서 - 친구를 제거할 수 없음';

  @override
  String get resetPassword => '비밀번호 재설정';

  @override
  String get share => '공유';

  @override
  String get shareInvitePrompt => '이 QR 코드 또는 링크를 공유하여 친구를 초대하세요';

  @override
  String get shareUnavailableBuild => '이 빌드에서는 공유를 사용할 수 없습니다';

  @override
  String get signIn => '로그인';

  @override
  String get signInAgainBeforeDeleting => '계정을 삭제하기 전에 다시 로그인하세요.';

  @override
  String get signInMethodNotEnabled => '이 로그인 방법은 활성화되지 않았습니다';

  @override
  String get signInSubtitle => '이메일과 비밀번호로 로그인';

  @override
  String get signOut => '로그아웃';

  @override
  String get signUp => '가입';

  @override
  String get signUpToCompete => ' 친구들과 경쟁하기 위해';

  @override
  String solvedNodes(int nodeCount) {
    return '$nodeCount개 노드 해결';
  }

  @override
  String get start => '시작';

  @override
  String get submit => '제출';

  @override
  String get thisPlayer => '이 플레이어';

  @override
  String get tooManyAttempts => '활성화 시도가 너무 많았습니다. 나중에 다시 시도해 주세요';

  @override
  String get unableAuthenticateRightNow => '현재 인증할 수 없습니다';

  @override
  String get unableCreateAccountRightNow => '지금 계정을 생성할 수 없습니다';

  @override
  String get unableCreateProfileRightNow => '현재 프로필을 생성할 수 없습니다';

  @override
  String get unableDeleteAccountRightNow => '지금 계정을 삭제할 수 없습니다';

  @override
  String get unableDeleteProfileRightNow => '지금 프로필을 삭제할 수 없습니다';

  @override
  String get unableLoadFriendsLeaderboard => '지금 친구 순위표를 로드할 수 없습니다';

  @override
  String get unableLoadGlobalLeaderboard => '지금 글로벌 리더보드를 로드할 수 없습니다';

  @override
  String get unableSendResetEmailRightNow => '지금 재설정 이메일을 보낼 수 없습니다';

  @override
  String get unableSubmitReportRightNow => '현재 보고서를 제출할 수 없습니다';

  @override
  String get unableUpdateHiddenNames => '숨겨진 이름을 업데이트할 수 없습니다';

  @override
  String get unableCreateAccountNoUser => '지금 계정을 생성할 수 없습니다';

  @override
  String get unhideUserName => '사용자 이름 숨기기 취소';

  @override
  String get you => '응답자 본인 ';

  @override
  String get youAndYourFriends => '당신과 당신의 친구들';

  @override
  String get youAlreadyReportedPlayer => '이 플레이어를 이미 신고하셨습니다';

  @override
  String get youCantAddYourself => '본인을 추가할 수 없습니다';

  @override
  String get yourGlobalPosition => '글로벌 포지션';

  @override
  String get yourNewFriend => '새 친구';

  @override
  String get friendAlreadyInList => '이 친구는 이미 목록에 있습니다';

  @override
  String get friendInviteNoLongerValid => '친구 초대가 더 이상 유효하지 않습니다';

  @override
  String get about => '약';

  @override
  String get goal => '목표';

  @override
  String get goalDescription => '가능한 한 적은 움직임으로 매일 가능한 한 많은 그래프를 풀 수 있습니다.';

  @override
  String get whyEveryPuzzleIsSolvable => '모든 퍼즐을 풀 수 있는 이유';

  @override
  String get planarGraphDescription =>
      '평면도의 모든 그래프는 평면 그래프이기 때문에 해결할 수 있습니다. 평면 그래프는 평평한 표면에 그릴 수 있는 그래프입니다. 공유된 꼭지점에서 만나는 곳을 제외하고는 가장자리가 교차하지 않습니다.';

  @override
  String get reportReasonInappropriateDisplayName => '부적절한 표시 이름';

  @override
  String get reportReasonAbuse => '학대 또는 괴롭힘';

  @override
  String get reportReasonImpersonation => '사칭';

  @override
  String get reportReasonSpam => '스팸 또는 사기';

  @override
  String get reportReasonOther => '기타';
}
