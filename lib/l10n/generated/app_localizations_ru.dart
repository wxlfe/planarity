// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get account => 'аккаунт';

  @override
  String get accountDeleted => 'аккаунт удален';

  @override
  String get accountExistsSignInInstead => 'аккаунт уже существует - войдите';

  @override
  String addedFriend(String friendName) {
    return '$friendName добавлен';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'добавить $inviterName в список друзей?';
  }

  @override
  String get addFriend => 'добавить друга';

  @override
  String get alreadySignedUp => 'уже зарегистрированы?';

  @override
  String get anonymousPlayer => 'анонимный игрок';

  @override
  String get appleSignInUnavailablePlatform =>
      'вход в систему через Apple недоступен на этой платформе';

  @override
  String get appleSignInUnavailableRightNow => 'вход в Apple сейчас недоступен';

  @override
  String get authConfigurationInvalid =>
      'Конфигурация аутентификации недействительна для этого приложения';

  @override
  String get authConfigurationMissing =>
      'конфигурация аутентификации отсутствует';

  @override
  String get back => 'назад';

  @override
  String get cancel => 'отмена';

  @override
  String get continueLabel => 'продолжить';

  @override
  String continueWithScore(int totalScore) {
    return 'продолжить - $totalScore';
  }

  @override
  String get continueWithApple => 'продолжить с Apple';

  @override
  String get continueWithGoogle => 'продолжить с Google';

  @override
  String get copyInviteLink => 'скопировать ссылку-приглашение';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'создайте учетную запись с вашим адресом электронной почты и паролем.';

  @override
  String get dailyGraphPuzzle => 'ежедневная головоломка с графами';

  @override
  String get dailyScore => 'дневной счет';

  @override
  String get decline => 'отклонить';

  @override
  String get deleteAccount => 'удалить аккаунт';

  @override
  String get details => 'подробности';

  @override
  String get detailsTooLong =>
      'Подробности должны содержать не более 1000 символов.';

  @override
  String get displayName => 'отображаемое имя';

  @override
  String get email => 'эл. почта';

  @override
  String get enterEmailAndPassword =>
      'введите адрес электронной почты и пароль';

  @override
  String get enterEmailFirst => 'сначала введите свой адрес электронной почты';

  @override
  String get enterValidEmail =>
      'введите действительный адрес электронной почты';

  @override
  String failedNodes(int nodeCount) {
    return 'не удалось $nodeCount узлов';
  }

  @override
  String get friendInvite => 'приглашение друга';

  @override
  String get friends => 'друзья';

  @override
  String get global => 'глобально';

  @override
  String get globalSnapshot => 'глобальный снимок';

  @override
  String get globalTopScore => 'глобальный лучший результат';

  @override
  String get googleSignInUnavailablePlatform =>
      'вход в Google недоступен на этой платформе';

  @override
  String get googleSignInNotConfigured =>
      'Вход в Google не настроен для этого приложения';

  @override
  String get googleSignInNotConfiguredIos =>
      'Вход в Google не настроен для этого приложения iOS';

  @override
  String get home => 'главная';

  @override
  String get hideUserName => 'скрыть имя пользователя';

  @override
  String get ifEmailExistsResetLink =>
      'если этот адрес электронной почты существует, мы отправили ссылку для сброса';

  @override
  String get invalidEmailOrPassword =>
      'неверный адрес электронной почты или пароль';

  @override
  String get invalidNameTrySomethingElse =>
      'неверное имя – попробуйте что-нибудь другое';

  @override
  String get invite => 'пригласить';

  @override
  String get inviteLinkCopied => 'ссылка для приглашения скопирована';

  @override
  String get leaderboard => 'таблица лидеров';

  @override
  String get lifetimeScore => 'оценка за всю жизнь';

  @override
  String lifetimeScoreValue(int score) {
    return 'общий счет $score';
  }

  @override
  String get locked => 'заперто';

  @override
  String get macosKeychainNotConfigured =>
      'доступ к связке ключей Macos не настроен';

  @override
  String get moreOptions => 'больше возможностей';

  @override
  String get networkErrorCheckConnection =>
      'ошибка сети - проверьте подключение';

  @override
  String get newHere => 'новенький здесь?';

  @override
  String get noFriendsYet => 'ты еще не добавил друзей';

  @override
  String get noFriendsLeaderboard =>
      'вы еще не добавили друзей - откройте свой профиль, чтобы пригласить кого-нибудь';

  @override
  String get noGlobalScoresYet => 'глобальных результатов пока нет';

  @override
  String get originalByJohnTantalo => 'оригинал Джона Тантало';

  @override
  String get password => 'пароль';

  @override
  String get passwordMinLength => 'пароль должен быть не менее 6 символов';

  @override
  String get passwordTooWeak => 'пароль слишком слабый';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'википедия: планарный граф';

  @override
  String get pressAgainToDelete => 'нажмите еще раз, чтобы удалить';

  @override
  String get profile => 'профиль';

  @override
  String get profileSubtitle =>
      'обновить то, как ваше имя отображается в вашем профиле';

  @override
  String get reason => 'причина';

  @override
  String get remove => 'удалить';

  @override
  String removeFriendQuestion(String displayName) {
    return 'удалить $displayName из списка друзей?';
  }

  @override
  String get removeFriend => 'удалить друга';

  @override
  String get reportPlayer => 'пожаловаться на игрока';

  @override
  String get reportSubmitted => 'отчет отправлен';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'отчет отправлен – невозможно удалить друга';

  @override
  String get resetPassword => 'сбросить пароль';

  @override
  String get share => 'поделиться';

  @override
  String get shareInvitePrompt =>
      'поделитесь этим QR-кодом или ссылкой, чтобы пригласить друга';

  @override
  String get shareUnavailableBuild => 'общий доступ недоступен в этой сборке';

  @override
  String get signIn => 'войти';

  @override
  String get signInAgainBeforeDeleting =>
      'войдите в систему еще раз, прежде чем удалять свою учетную запись';

  @override
  String get signInMethodNotEnabled => 'этот метод входа не включен';

  @override
  String get signInSubtitle =>
      'войдите, используя свой адрес электронной почты и пароль';

  @override
  String get signOut => 'выйти';

  @override
  String get signUp => 'зарегистрироваться';

  @override
  String get signUpToCompete => ' соревноваться с друзьями';

  @override
  String solvedNodes(int nodeCount) {
    return 'решено $nodeCount узлов';
  }

  @override
  String get start => 'начать';

  @override
  String get submit => 'отправить';

  @override
  String get thisPlayer => 'этот игрок';

  @override
  String get tooManyAttempts =>
      'слишком много попыток – повторите попытку позже';

  @override
  String get unableAuthenticateRightNow =>
      'сейчас не могу пройти аутентификацию';

  @override
  String get unableCreateAccountRightNow => 'сейчас не могу создать аккаунт';

  @override
  String get unableCreateProfileRightNow =>
      'не могу сейчас создать свой профиль';

  @override
  String get unableDeleteAccountRightNow =>
      'не могу удалить свой аккаунт прямо сейчас';

  @override
  String get unableDeleteProfileRightNow =>
      'не могу удалить свой профиль прямо сейчас';

  @override
  String get unableLoadFriendsLeaderboard =>
      'сейчас невозможно загрузить таблицу лидеров друзей';

  @override
  String get unableLoadGlobalLeaderboard =>
      'сейчас невозможно загрузить глобальную таблицу лидеров';

  @override
  String get unableSendResetEmailRightNow =>
      'сейчас невозможно отправить электронное письмо для сброса';

  @override
  String get unableSubmitReportRightNow => 'сейчас невозможно отправить отчет';

  @override
  String get unableUpdateHiddenNames => 'невозможно обновить скрытые имена';

  @override
  String get unableCreateAccountNoUser => 'сейчас не могу создать аккаунт';

  @override
  String get unhideUserName => 'показать имя пользователя';

  @override
  String get you => 'ты';

  @override
  String get youAndYourFriends => 'ты и твои друзья';

  @override
  String get youAlreadyReportedPlayer => 'вы уже пожаловались на этого игрока';

  @override
  String get youCantAddYourself => 'ты не можешь добавить себя';

  @override
  String get yourGlobalPosition => 'ваша глобальная позиция';

  @override
  String get yourNewFriend => 'твой новый друг';

  @override
  String get friendAlreadyInList => 'этот друг уже в твоем списке';

  @override
  String get friendInviteNoLongerValid =>
      'это приглашение в друзья больше не действительно';

  @override
  String get about => 'о';

  @override
  String get goal => 'цель';

  @override
  String get goalDescription =>
      'решайте как можно больше графиков каждый день, используя как можно меньше ходов';

  @override
  String get whyEveryPuzzleIsSolvable => 'почему каждая головоломка разрешима';

  @override
  String get planarGraphDescription =>
      'любой планарный граф разрешим, потому что это планарный граф. Планарный граф — это граф, который можно нарисовать на плоской поверхности так, чтобы никакие ребра не пересекались, за исключением тех мест, где они встречаются в общих вершинах.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'неподходящее отображаемое имя';

  @override
  String get reportReasonAbuse => 'оскорбления или домогательства';

  @override
  String get reportReasonImpersonation => 'выдача себя за другого';

  @override
  String get reportReasonSpam => 'спам или мошенничество';

  @override
  String get reportReasonOther => 'другое';
}
