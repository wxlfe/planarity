// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get account => 'アカウント';

  @override
  String get accountDeleted => 'アカウントを削除しました';

  @override
  String get accountExistsSignInInstead => 'アカウントは存在します - ログインしてください';

  @override
  String addedFriend(String friendName) {
    return '$friendName を追加しました';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '$inviterName を友達リストに追加しますか？';
  }

  @override
  String get addFriend => '友達を追加';

  @override
  String get alreadySignedUp => '登録済みですか？';

  @override
  String get anonymousPlayer => '匿名プレイヤー';

  @override
  String get appleSignInUnavailablePlatform => 'appleサインインはこのプラットフォームでは利用できません';

  @override
  String get appleSignInUnavailableRightNow => 'appleサインインは現在利用できません';

  @override
  String get authConfigurationInvalid => 'このアプリでは認証設定が無効です';

  @override
  String get authConfigurationMissing => '認証設定がありません';

  @override
  String get back => '戻る';

  @override
  String get cancel => 'キャンセル';

  @override
  String get continueLabel => '続ける';

  @override
  String continueWithScore(int totalScore) {
    return '続ける - $totalScore';
  }

  @override
  String get continueWithApple => 'Appleで続行';

  @override
  String get continueWithGoogle => 'Googleで続行';

  @override
  String get copyInviteLink => '招待リンク';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle => 'メールアドレスとパスワードでアカウントを作成します。';

  @override
  String get dailyGraphPuzzle => 'デイリーグラフパズル';

  @override
  String get dailyScore => 'デイリースコア';

  @override
  String get decline => '';

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String get details => '詳細';

  @override
  String get detailsTooLong => '詳細は1000文字以内で入力してください';

  @override
  String get displayName => '表示名';

  @override
  String get email => 'メール';

  @override
  String get enterEmailAndPassword => 'あなたのメールアドレスとパスワードを入力してください';

  @override
  String get enterEmailFirst => '最初にメールアドレスを入力してください';

  @override
  String get enterValidEmail => '有効なメールアドレスを入力してください';

  @override
  String failedNodes(int nodeCount) {
    return '$nodeCount ノード失敗';
  }

  @override
  String get friendInvite => '友達の招待';

  @override
  String get friends => '友達';

  @override
  String get global => 'グローバル';

  @override
  String get globalSnapshot => 'グローバルスナップショット';

  @override
  String get globalTopScore => 'グローバルトップスコア';

  @override
  String get googleSignInUnavailablePlatform =>
      'googleサインインはこのプラットフォームでは利用できません';

  @override
  String get googleSignInNotConfigured => 'このアプリにはgoogleサインインが設定されていません';

  @override
  String get googleSignInNotConfiguredIos => 'このiOSアプリにはgoogleサインインが設定されていません';

  @override
  String get home => 'ホーム';

  @override
  String get hideUserName => 'ユーザー名を非表示にする';

  @override
  String get ifEmailExistsResetLink => 'そのメールが存在する場合、リセットリンクを送信しました';

  @override
  String get invalidEmailOrPassword => '無効なメールアドレスまたはパスワードです';

  @override
  String get invalidNameTrySomethingElse => '名前が無効です-他のものをお試しください';

  @override
  String get invite => '招待';

  @override
  String get inviteLinkCopied => '招待リンクをコピーしました';

  @override
  String get leaderboard => 'ランキング';

  @override
  String get lifetimeScore => '生涯スコア';

  @override
  String lifetimeScoreValue(int score) {
    return '合計スコア $score';
  }

  @override
  String get locked => 'ロックされています';

  @override
  String get macosKeychainNotConfigured => 'macosキーチェーンアクセスが設定されていません';

  @override
  String get moreOptions => '更なるオプション';

  @override
  String get networkErrorCheckConnection => 'ネットワークエラー-接続を確認してください';

  @override
  String get newHere => 'はじめてですか？';

  @override
  String get noFriendsYet => 'まだ友達を追加していません';

  @override
  String get noFriendsLeaderboard => 'まだ友達を追加していません。プロフィールを開いて誰かを招待してください';

  @override
  String get noGlobalScoresYet => 'グローバルスコアはまだありません';

  @override
  String get originalByJohnTantalo => 'オリジナル： John Tantalo';

  @override
  String get password => 'パスワード';

  @override
  String get passwordMinLength => 'パスワードは6文字以上なければなりません';

  @override
  String get passwordTooWeak => 'パスワードが弱すぎます';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'wikipedia:平面グラフ';

  @override
  String get pressAgainToDelete => 'もう一度押すと削除されます';

  @override
  String get profile => 'プロフィール';

  @override
  String get profileSubtitle => 'プロフィールに表示される名前を更新する';

  @override
  String get reason => 'Reason';

  @override
  String get remove => '削除';

  @override
  String removeFriendQuestion(String displayName) {
    return '$displayName を友達リストから削除しますか？';
  }

  @override
  String get removeFriend => '友達を削除';

  @override
  String get reportPlayer => 'プレイヤーを通報';

  @override
  String get reportSubmitted => '新規レポートの提出';

  @override
  String get reportSubmittedUnableRemoveFriend => 'レポートが送信されました-友達を削除できません';

  @override
  String get resetPassword => 'パスワードのリセット';

  @override
  String get share => '共有';

  @override
  String get shareInvitePrompt => 'このQRコードまたはリンクをシェアして友達を招待しましょう';

  @override
  String get shareUnavailableBuild => '共有はこのビルドでは利用できません';

  @override
  String get signIn => 'ログイン';

  @override
  String get signInAgainBeforeDeleting => 'アカウントを削除する前に再度サインインしてください';

  @override
  String get signInMethodNotEnabled => 'このサインイン方法は有効ではありません';

  @override
  String get signInSubtitle => 'メールアドレスとパスワードでサインイン';

  @override
  String get signOut => 'ログアウト';

  @override
  String get signUp => '登録';

  @override
  String get signUpToCompete => ' 友達と競い合うために';

  @override
  String solvedNodes(int nodeCount) {
    return '$nodeCount ノード解決';
  }

  @override
  String get start => '開始';

  @override
  String get submit => '送信';

  @override
  String get thisPlayer => 'このプレイヤー';

  @override
  String get tooManyAttempts => '試行回数が多すぎます。しばらくしてからもう一度お試';

  @override
  String get unableAuthenticateRightNow => '現在認証できません';

  @override
  String get unableCreateAccountRightNow => '現在アカウントを作成できません';

  @override
  String get unableCreateProfileRightNow => '現在プロフィールを作成できません';

  @override
  String get unableDeleteAccountRightNow => '現在アカウントを削除できません';

  @override
  String get unableDeleteProfileRightNow => '現在プロフィールを削除できません';

  @override
  String get unableLoadFriendsLeaderboard => '現在フレンドリーリーダーボードを読み込めません';

  @override
  String get unableLoadGlobalLeaderboard => '現在グローバルリーダーボードを読み込めません';

  @override
  String get unableSendResetEmailRightNow => '現在リセットメールを送信できません';

  @override
  String get unableSubmitReportRightNow => '現在レポートを送信できません';

  @override
  String get unableUpdateHiddenNames => '非表示の名前を更新できません';

  @override
  String get unableCreateAccountNoUser => '現在アカウントを作成できません';

  @override
  String get unhideUserName => 'ユーザー名の非表示を解除';

  @override
  String get you => '問い合わせ';

  @override
  String get youAndYourFriends => 'あなたとあなたの友達Timeline Name';

  @override
  String get youAlreadyReportedPlayer => '通報済みのプレイヤーです';

  @override
  String get youCantAddYourself => '自分自身を追加することはできません';

  @override
  String get yourGlobalPosition => 'あなたのグローバルポジション';

  @override
  String get yourNewFriend => '新規のお友達';

  @override
  String get friendAlreadyInList => 'この友達は既にあなたのリストにあります';

  @override
  String get friendInviteNoLongerValid => 'その友達の招待は無効になりました';

  @override
  String get about => '説明';

  @override
  String get goal => '目標';

  @override
  String get goalDescription => 'できるだけ少ない動きで毎日できるだけ多くのグラフを解く';

  @override
  String get whyEveryPuzzleIsSolvable => 'すべてのパズルが解決可能な理由';

  @override
  String get planarGraphDescription =>
      '平面性のすべてのグラフは、平面グラフであるため解決可能です。平面グラフは、共有頂点で会う場合を除き、エッジが交差しないように平面上に描画できるグラフです。';

  @override
  String get reportReasonInappropriateDisplayName => '不適切な表示名';

  @override
  String get reportReasonAbuse => '虐待または嫌がらせ';

  @override
  String get reportReasonImpersonation => 'なりすまし';

  @override
  String get reportReasonSpam => 'スパムまたは詐欺';

  @override
  String get reportReasonOther => 'その他';
}
