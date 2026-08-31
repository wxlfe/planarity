// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get account => 'conta';

  @override
  String get accountDeleted => 'conta excluída';

  @override
  String get accountExistsSignInInstead => 'a conta existe - entre';

  @override
  String addedFriend(String friendName) {
    return '$friendName adicionado';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'adicionar $inviterName à sua lista de amigos?';
  }

  @override
  String get addFriend => 'adicionar amigo';

  @override
  String get alreadySignedUp => 'já se cadastrou?';

  @override
  String get anonymousPlayer => 'jogador anônimo';

  @override
  String get appleSignInUnavailablePlatform =>
      'o início de sessão da apple não está disponível nesta plataforma';

  @override
  String get appleSignInUnavailableRightNow =>
      'o início de sessão da apple não está disponível de momento';

  @override
  String get authConfigurationInvalid =>
      'a configuração de autenticação é inválida para este aplicativo';

  @override
  String get authConfigurationMissing => 'configuração de autenticação ausente';

  @override
  String get back => 'voltar';

  @override
  String get cancel => 'cancelar';

  @override
  String get continueLabel => 'continuar';

  @override
  String continueWithScore(int totalScore) {
    return 'continuar - $totalScore';
  }

  @override
  String get continueWithApple => 'Continuar com conta Apple';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get copyInviteLink => 'copiar link de convite';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'crie uma conta com o seu e-mail e palavra-passe.';

  @override
  String get dailyGraphPuzzle => 'quebra-cabeça diário de grafos';

  @override
  String levelSubtitleUntangleMoves(int moveCount) {
    return 'desembarace o grafo em $moveCount movimentos';
  }

  @override
  String get levelSubtitleNoCrossings => 'elimine todos os cruzamentos';

  @override
  String get levelSubtitleKeepStreak => 'mantenha a sequência';

  @override
  String get levelSubtitlePerfectSolve => 'busque uma solução perfeita';

  @override
  String get dailyScore => 'pontuação diária';

  @override
  String get decline => 'declínio';

  @override
  String get deleteAccount => 'excluir conta';

  @override
  String get details => 'detalhes';

  @override
  String get detailsTooLong => 'os detalhes devem ter 1000 caracteres ou menos';

  @override
  String get displayName => 'Nome a apresentar';

  @override
  String get downloadOnAppStore => 'baixar na App Store';

  @override
  String get email => 'email';

  @override
  String get enterEmailAndPassword => 'Introduza o seu e-mail e palavra-passe';

  @override
  String get enterEmailFirst => 'introduza o seu e-mail primeiro';

  @override
  String get enterValidEmail => 'Digite um e-mail válido';

  @override
  String failedNodes(int nodeCount) {
    return 'grafo $nodeCount falhou';
  }

  @override
  String get friendInvite => 'convite de amigo';

  @override
  String get friends => 'amigos';

  @override
  String get global => 'global';

  @override
  String get globalSnapshot => 'instantâneo global';

  @override
  String get globalTopScore => 'pontuação máxima global';

  @override
  String get googleSignInUnavailablePlatform =>
      'o login do google não está disponível nesta plataforma';

  @override
  String get googleSignInNotConfigured =>
      'o login do google não está configurado para este aplicativo';

  @override
  String get googleSignInNotConfiguredIos =>
      'o login do google não está configurado para este aplicativo para iOS';

  @override
  String get home => 'início';

  @override
  String get hideUserName => 'Ocultar o nome do utilizador';

  @override
  String get ifEmailExistsResetLink =>
      'se esse e-mail existir, enviamos um link de redefinição';

  @override
  String get invalidEmailOrPassword => 'E-mail ou senha inválidos.';

  @override
  String get invalidNameTrySomethingElse => 'nome inválido - tente outra coisa';

  @override
  String get invite => 'convidar';

  @override
  String get inviteLinkCopied => 'link de convite copiado';

  @override
  String get leaderboard => 'classificação';

  @override
  String get lifetimeScore => 'pontuação ao longo da vida';

  @override
  String lifetimeScoreValue(int score) {
    return 'pontuação total $score';
  }

  @override
  String get locked => 'bloqueado';

  @override
  String get macosKeychainNotConfigured =>
      'o acesso ao chaveiro macos não está configurado';

  @override
  String get moreOptions => 'mais opções';

  @override
  String get networkErrorCheckConnection =>
      'erro de rede - verifique a sua ligação';

  @override
  String get newHere => 'É novo aqui?';

  @override
  String get noFriendsYet => 'ainda não adicionou nenhum amigo';

  @override
  String get noFriendsLeaderboard =>
      'ainda não adicionou nenhum amigo - abra o seu perfil para convidar alguém';

  @override
  String get noGlobalScoresYet => 'ainda não há pontuações globais';

  @override
  String get originalByJohnTantalo => 'original por john tantalo';

  @override
  String get password => 'senha';

  @override
  String get passwordMinLength =>
      'A palavra-passe deve ter pelo menos 6 caracteres';

  @override
  String get passwordTooWeak => 'A senha é fraca demais!';

  @override
  String get planarity => 'planarity';

  @override
  String get privacyOptions => 'opções de privacidade';

  @override
  String get planarGraphWikipedia => 'wikipedia: grafo planar';

  @override
  String get pressAgainToDelete => 'prima novamente para eliminar';

  @override
  String get profile => 'perfil';

  @override
  String get profileSubtitle =>
      'atualize a forma como o seu nome aparece no seu perfil';

  @override
  String get reason => 'motivo';

  @override
  String get remove => 'remover';

  @override
  String removeFriendQuestion(String displayName) {
    return 'remover $displayName da sua lista de amigos?';
  }

  @override
  String get removeFriend => 'Remover amigo';

  @override
  String get reportPlayer => 'Denunciar o nome do jogador?';

  @override
  String get reportSubmitted => 'Relaório enviado';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'relatório enviado - não foi possível remover amigo';

  @override
  String get resetPassword => 'redefinir a palavra-passe';

  @override
  String get share => 'compartilhar';

  @override
  String get shareInvitePrompt =>
      'compartilhar este código QR ou link para convidar um amigo';

  @override
  String get shareUnavailableBuild =>
      'a partilha não está disponível nesta compilação';

  @override
  String get signIn => 'entrar';

  @override
  String get signInAgainBeforeDeleting =>
      'iniciar sessão novamente antes de eliminar a sua conta';

  @override
  String get signInMethodNotEnabled =>
      'este método de início de sessão não está ativado';

  @override
  String get signInSubtitle =>
      'iniciar sessão com o seu e-mail e palavra-passe';

  @override
  String get signOut => 'sair';

  @override
  String get signUp => 'cadastrar';

  @override
  String get signUpToCompete => ' para competir com os seus amigos';

  @override
  String solvedNodes(int nodeCount) {
    return 'grafo $nodeCount resolvido';
  }

  @override
  String get start => 'começar';

  @override
  String get submit => 'enviar';

  @override
  String get thisPlayer => 'este jogador';

  @override
  String get tooManyAttempts =>
      'muitas tentativas, por favor, tente novamente mais tarde';

  @override
  String get unableAuthenticateRightNow => 'não é possível autenticar agora';

  @override
  String get unableCreateAccountRightNow => 'incapaz de criar conta agora';

  @override
  String get unableCreateProfileRightNow =>
      'não é possível criar o seu perfil agora';

  @override
  String get unableDeleteAccountRightNow =>
      'não é possível eliminar a sua conta neste momento';

  @override
  String get unableDeleteProfileRightNow =>
      'não é possível eliminar o seu perfil neste momento';

  @override
  String get unableLoadFriendsLeaderboard =>
      'incapaz de carregar a tabela de classificação de amigos agora';

  @override
  String get unableLoadGlobalLeaderboard =>
      'incapaz de carregar a tabela de classificação global agora';

  @override
  String get unableSendResetEmailRightNow =>
      'não foi possível enviar o e-mail de redefinição no momento';

  @override
  String get unableSubmitReportRightNow =>
      'não é possível enviar o relatório agora';

  @override
  String get unableUpdateHiddenNames => 'incapaz de atualizar nomes ocultos';

  @override
  String get unableCreateAccountNoUser => 'incapaz de criar conta agora';

  @override
  String get unhideUserName => 'unside nome de utilizador';

  @override
  String get you => 'você';

  @override
  String get youAndYourFriends => 'Você e os seus amigosTimeline Name';

  @override
  String get youAlreadyReportedPlayer => 'já denunciou este jogador';

  @override
  String get youCantAddYourself => 'Não se pode adicionar a si mesmo!';

  @override
  String get yourGlobalPosition => 'a sua posição global';

  @override
  String get yourNewFriend => 'o seu novo amigo';

  @override
  String get friendAlreadyInList => 'este amigo já está na sua lista';

  @override
  String get friendInviteNoLongerValid =>
      'esse convite de amigo já não é válido';

  @override
  String get about => 'abaut';

  @override
  String get goal => 'objetivo';

  @override
  String get goalDescription =>
      'resolva o maior número possível de gráficos todos os dias com o menor número possível de movimentos';

  @override
  String get whyEveryPuzzleIsSolvable =>
      'por que cada quebra-cabeça é solucionável';

  @override
  String get planarGraphDescription =>
      'cada grafo em planaridade é solúvel porque é um grafo planar. Um grafo planar é um grafo que pode ser desenhado em uma superfície plana para que nenhuma aresta se cruze, exceto onde eles se encontram em vértices compartilhados.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'nome de exibição inapropriado';

  @override
  String get reportReasonAbuse => 'abuso ou assédio';

  @override
  String get reportReasonImpersonation => 'falsificação de identidade';

  @override
  String get reportReasonSpam => 'spam ou golpe';

  @override
  String get reportReasonOther => 'outro';

  @override
  String nodesCount(int count) {
    return '$count nós';
  }

  @override
  String movesCount(int count) {
    return '$count movimentos';
  }

  @override
  String scoreValue(int score) {
    return 'pontuação $score';
  }

  @override
  String graphUnsolvedSemantics(int level) {
    return 'grafo $level, não resolvido, jogar';
  }

  @override
  String graphSolvedSemantics(int level, int moves, int score) {
    return 'grafo $level, resolvido em $moves movimentos, pontuação $score, jogar novamente';
  }

  @override
  String graphBlockedSemantics(int level) {
    return 'grafo $level, bloqueado';
  }

  @override
  String graphReplayInProgressSemantics(int level) {
    return 'grafo $level, repetição em andamento, continuar';
  }

  @override
  String get replay => 'jogar novamente';

  @override
  String replayGraphQuestion(int level) {
    return 'jogar novamente o grafo $level?';
  }

  @override
  String get replayWarning =>
      'a sua pontuação será reposta para 0 até resolver este grafo novamente. os grafos seguintes ficarão indisponíveis se o deixar por resolver.';

  @override
  String get resetAndReplay => 'repor e jogar novamente';

  @override
  String get unableSaveProgress =>
      'não é possível guardar o progresso neste momento';

  @override
  String get saveYourProgress => 'guarde o seu progresso';

  @override
  String get saveProgressDescription =>
      'registe-se gratuitamente para manter os grafos de hoje e as suas conquistas em todos os dispositivos.';

  @override
  String get achievements => 'conquistas';

  @override
  String get achievementFirstStepTitle => 'primeiro passo';

  @override
  String get achievementFirstStepDescription => 'resolva o seu primeiro grafo';

  @override
  String get achievementPracticeTitle => 'prática';

  @override
  String get achievementPracticeDescription => 'resolva 8 grafos';

  @override
  String get achievementPersistenceTitle => 'persistência';

  @override
  String get achievementPersistenceDescription => 'resolva 16 grafos';

  @override
  String get achievementDedicationTitle => 'dedicação';

  @override
  String get achievementDedicationDescription => 'resolva 32 grafos';

  @override
  String get achievementPlanarityTitle => 'planaridade';

  @override
  String get achievementPlanarityDescription => 'resolva 64 grafos';

  @override
  String get achievementEfficientTitle => 'eficiente';

  @override
  String get achievementEfficientDescription =>
      'resolva um grafo com pelo menos 2 movimentos restantes';

  @override
  String get achievementPreciseTitle => 'preciso';

  @override
  String get achievementPreciseDescription =>
      'resolva um grafo com pelo menos 4 movimentos restantes';

  @override
  String get achievementOptimalTitle => 'ótimo';

  @override
  String get achievementOptimalDescription =>
      'resolva um grafo com o máximo possível de movimentos restantes';

  @override
  String get achievementCloseCallTitle => 'por pouco';

  @override
  String get achievementCloseCallDescription =>
      'resolva um grafo sem movimentos restantes';

  @override
  String get achievementSecondAttemptTitle => 'segunda tentativa';

  @override
  String get achievementSecondAttemptDescription =>
      'jogue novamente um grafo resolvido';

  @override
  String get achievementImprovementTitle => 'melhoria';

  @override
  String get achievementImprovementDescription =>
      'supere a sua pontuação anterior ao jogar novamente';

  @override
  String get achievementRedemptionTitle => 'redenção';

  @override
  String get achievementRedemptionDescription =>
      'obtenha uma pontuação superior a zero ao jogar novamente um grafo em que antes obteve 0';

  @override
  String get achievementPerfectedTitle => 'aperfeiçoado';

  @override
  String get achievementPerfectedDescription =>
      'melhore um grafo resolvido até à pontuação máxima possível ao jogar novamente';

  @override
  String get unableLoadProfile =>
      'não é possível carregar o seu perfil neste momento';

  @override
  String get unableShareRightNow => 'não é possível partilhar neste momento';

  @override
  String get restart => 'recomeçar';

  @override
  String get tutorialNodeInstruction =>
      'isto é um vértice arraste-o para qualquer lugar';

  @override
  String get tutorialEdgesInstruction =>
      'os vértices estão ligados por arestas as arestas permanecem ligadas';

  @override
  String get tutorialSolvedInstruction =>
      'um grafo está resolvido quando nenhuma aresta se cruza este já está resolvido';
}
