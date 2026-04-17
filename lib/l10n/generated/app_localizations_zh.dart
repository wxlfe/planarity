// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get account => '账户';

  @override
  String get accountDeleted => '账户已删除';

  @override
  String get accountExistsSignInInstead => '账户已存在 - 请登录';

  @override
  String addedFriend(String friendName) {
    return '已添加 $friendName';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '将 $inviterName 添加到好友列表？';
  }

  @override
  String get addFriend => '添加好友';

  @override
  String get alreadySignedUp => '已经注册了？';

  @override
  String get anonymousPlayer => '匿名玩家';

  @override
  String get appleSignInUnavailablePlatform => '此平台不支持 Apple 登录';

  @override
  String get appleSignInUnavailableRightNow => 'Apple 登录暂时不可用';

  @override
  String get authConfigurationInvalid => '此应用的身份验证配置无效';

  @override
  String get authConfigurationMissing => '缺少身份验证配置';

  @override
  String get back => '返回';

  @override
  String get cancel => '取消';

  @override
  String get continueLabel => '继续';

  @override
  String continueWithScore(int totalScore) {
    return '继续 - $totalScore';
  }

  @override
  String get continueWithApple => '使用 Apple 继续';

  @override
  String get continueWithGoogle => '使用 Google 继续';

  @override
  String get copyInviteLink => '复制邀请链接';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle => '使用邮箱和密码创建账户';

  @override
  String get dailyGraphPuzzle => '每日图形谜题';

  @override
  String get dailyScore => '每日得分';

  @override
  String get decline => '拒绝';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get details => '详情';

  @override
  String get detailsTooLong => '详情必须不超过 1000 个字符';

  @override
  String get displayName => '显示名称';

  @override
  String get email => '邮箱';

  @override
  String get enterEmailAndPassword => '请输入邮箱和密码';

  @override
  String get enterEmailFirst => '请先输入邮箱';

  @override
  String get enterValidEmail => '请输入有效邮箱';

  @override
  String failedNodes(int nodeCount) {
    return '$nodeCount 个节点失败';
  }

  @override
  String get friendInvite => '好友邀请';

  @override
  String get friends => '好友';

  @override
  String get global => '全球';

  @override
  String get globalSnapshot => '全球概览';

  @override
  String get globalTopScore => '全球最高分';

  @override
  String get googleSignInUnavailablePlatform => '此平台不支持 Google 登录';

  @override
  String get googleSignInNotConfigured => '此应用未配置 Google 登录';

  @override
  String get googleSignInNotConfiguredIos => '此 iOS 应用未配置 Google 登录';

  @override
  String get home => '主页';

  @override
  String get hideUserName => '隐藏用户名';

  @override
  String get ifEmailExistsResetLink => '如果该邮箱存在，我们已发送重置链接';

  @override
  String get invalidEmailOrPassword => '邮箱或密码无效';

  @override
  String get invalidNameTrySomethingElse => '名称无效 - 请换一个';

  @override
  String get invite => '邀请';

  @override
  String get inviteLinkCopied => '邀请链接已复制';

  @override
  String get leaderboard => '排行榜';

  @override
  String get lifetimeScore => '总得分';

  @override
  String lifetimeScoreValue(int score) {
    return '总得分 $score';
  }

  @override
  String get locked => '已锁定';

  @override
  String get macosKeychainNotConfigured => 'macOS 钥匙串访问未配置';

  @override
  String get moreOptions => '更多选项';

  @override
  String get networkErrorCheckConnection => '网络错误 - 请检查连接';

  @override
  String get newHere => '新用户？';

  @override
  String get noFriendsYet => '你还没有添加任何好友';

  @override
  String get noFriendsLeaderboard => '你还没有添加任何好友 - 打开个人资料邀请别人';

  @override
  String get noGlobalScoresYet => '还没有全球得分';

  @override
  String get originalByJohnTantalo => 'john tantalo 原作';

  @override
  String get password => '密码';

  @override
  String get passwordMinLength => '密码至少需要 6 个字符';

  @override
  String get passwordTooWeak => '密码太弱';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => '维基百科：平面图';

  @override
  String get pressAgainToDelete => '再次按下以删除';

  @override
  String get profile => '个人资料';

  @override
  String get profileSubtitle => '更新你的名字在个人资料中的显示方式';

  @override
  String get reason => '原因';

  @override
  String get remove => '移除';

  @override
  String removeFriendQuestion(String displayName) {
    return '从好友列表中移除 $displayName？';
  }

  @override
  String get removeFriend => '移除好友';

  @override
  String get reportPlayer => '举报玩家';

  @override
  String get reportSubmitted => '举报已提交';

  @override
  String get reportSubmittedUnableRemoveFriend => '举报已提交 - 无法移除好友';

  @override
  String get resetPassword => '重置密码';

  @override
  String get share => '分享';

  @override
  String get shareInvitePrompt => '分享此二维码或链接来邀请好友';

  @override
  String get shareUnavailableBuild => '此版本无法分享';

  @override
  String get signIn => '登录';

  @override
  String get signInAgainBeforeDeleting => '删除账户前请重新登录';

  @override
  String get signInMethodNotEnabled => '此登录方式未启用';

  @override
  String get signInSubtitle => '使用邮箱和密码登录';

  @override
  String get signOut => '退出登录';

  @override
  String get signUp => '注册';

  @override
  String get signUpToCompete => ' 来和好友竞争';

  @override
  String solvedNodes(int nodeCount) {
    return '已解决 $nodeCount 个节点';
  }

  @override
  String get start => '开始';

  @override
  String get submit => '提交';

  @override
  String get thisPlayer => '这位玩家';

  @override
  String get tooManyAttempts => '尝试次数过多 - 请稍后再试';

  @override
  String get unableAuthenticateRightNow => '现在无法验证身份';

  @override
  String get unableCreateAccountRightNow => '现在无法创建账户';

  @override
  String get unableCreateProfileRightNow => '现在无法创建你的个人资料';

  @override
  String get unableDeleteAccountRightNow => '现在无法删除你的账户';

  @override
  String get unableDeleteProfileRightNow => '现在无法删除你的个人资料';

  @override
  String get unableLoadFriendsLeaderboard => '现在无法加载好友排行榜';

  @override
  String get unableLoadGlobalLeaderboard => '现在无法加载全球排行榜';

  @override
  String get unableSendResetEmailRightNow => '现在无法发送重置邮件';

  @override
  String get unableSubmitReportRightNow => '现在无法提交举报';

  @override
  String get unableUpdateHiddenNames => '无法更新隐藏名称';

  @override
  String get unableCreateAccountNoUser => '现在无法创建账户';

  @override
  String get unhideUserName => '显示用户名';

  @override
  String get you => '你';

  @override
  String get youAndYourFriends => '你和你的好友';

  @override
  String get youAlreadyReportedPlayer => '你已经举报过这位玩家';

  @override
  String get youCantAddYourself => '你不能添加自己';

  @override
  String get yourGlobalPosition => '你的全球排名';

  @override
  String get yourNewFriend => '你的新好友';

  @override
  String get friendAlreadyInList => '这位好友已在你的列表中';

  @override
  String get friendInviteNoLongerValid => '该好友邀请已失效';

  @override
  String get about => '关于';

  @override
  String get goal => '目标';

  @override
  String get goalDescription => '每天用尽可能少的步数解决尽可能多的图形';

  @override
  String get whyEveryPuzzleIsSolvable => '为什么每个谜题都有解';

  @override
  String get planarGraphDescription =>
      'planarity 中的每个图都有解，因为它是平面图。平面图是可以画在平面上且边不会相交的图，除非它们在共同顶点处相遇。';

  @override
  String get reportReasonInappropriateDisplayName => '显示名称不当';

  @override
  String get reportReasonAbuse => '辱骂或骚扰';

  @override
  String get reportReasonImpersonation => '冒充他人';

  @override
  String get reportReasonSpam => '垃圾信息或诈骗';

  @override
  String get reportReasonOther => '其他';
}
