// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get account => 'cuenta';

  @override
  String get accountDeleted => 'cuenta eliminada';

  @override
  String get accountExistsSignInInstead => 'la cuenta existe - inicia sesión';

  @override
  String addedFriend(String friendName) {
    return '$friendName agregado';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return '¿agregar a $inviterName a tu lista de amigos?';
  }

  @override
  String get addFriend => 'agregar amigo';

  @override
  String get alreadySignedUp => '¿ya tienes cuenta?';

  @override
  String get anonymousPlayer => 'jugador anónimo';

  @override
  String get appleSignInUnavailablePlatform =>
      'iniciar sesión con Apple no está disponible en esta plataforma';

  @override
  String get appleSignInUnavailableRightNow =>
      'iniciar sesión con Apple no está disponible ahora';

  @override
  String get authConfigurationInvalid =>
      'la configuración de autenticación no es válida para esta app';

  @override
  String get authConfigurationMissing =>
      'falta la configuración de autenticación';

  @override
  String get back => 'volver';

  @override
  String get cancel => 'cancelar';

  @override
  String get continueLabel => 'continuar';

  @override
  String continueWithScore(int totalScore) {
    return 'continuar - $totalScore';
  }

  @override
  String get continueWithApple => 'continuar con Apple';

  @override
  String get continueWithGoogle => 'continuar con Google';

  @override
  String get copyInviteLink => 'copiar enlace de invitación';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'crea una cuenta con tu correo y contraseña';

  @override
  String get dailyGraphPuzzle => 'rompecabezas diario de grafos';

  @override
  String levelSubtitleUntangleMoves(int moveCount) {
    return 'desenreda el grafo en $moveCount movimientos';
  }

  @override
  String get levelSubtitleNoCrossings => 'elimina todos los cruces';

  @override
  String get levelSubtitleKeepStreak => 'mantén la racha';

  @override
  String get levelSubtitlePerfectSolve => 'busca una solución perfecta';

  @override
  String get dailyScore => 'puntuación diaria';

  @override
  String get decline => 'rechazar';

  @override
  String get deleteAccount => 'eliminar cuenta';

  @override
  String get details => 'detalles';

  @override
  String get detailsTooLong =>
      'los detalles deben tener 1000 caracteres o menos';

  @override
  String get displayName => 'nombre visible';

  @override
  String get downloadOnAppStore => 'descargar en App Store';

  @override
  String get email => 'correo';

  @override
  String get enterEmailAndPassword => 'ingresa correo y contraseña';

  @override
  String get enterEmailFirst => 'ingresa tu correo primero';

  @override
  String get enterValidEmail => 'ingresa un correo válido';

  @override
  String failedNodes(int nodeCount) {
    return 'grafo $nodeCount fallido';
  }

  @override
  String get friendInvite => 'invitación de amistad';

  @override
  String get friends => 'amigos';

  @override
  String get global => 'global';

  @override
  String get globalSnapshot => 'vista global';

  @override
  String get globalTopScore => 'mejor puntuación global';

  @override
  String get googleSignInUnavailablePlatform =>
      'iniciar sesión con Google no está disponible en esta plataforma';

  @override
  String get googleSignInNotConfigured =>
      'iniciar sesión con Google no está configurado para esta app';

  @override
  String get googleSignInNotConfiguredIos =>
      'iniciar sesión con Google no está configurado para esta app de iOS';

  @override
  String get home => 'inicio';

  @override
  String get hideUserName => 'ocultar nombre de usuario';

  @override
  String get ifEmailExistsResetLink =>
      'si ese correo existe, enviamos un enlace de restablecimiento';

  @override
  String get invalidEmailOrPassword => 'correo o contraseña inválidos';

  @override
  String get invalidNameTrySomethingElse =>
      'nombre inválido - prueba otra cosa';

  @override
  String get invite => 'invitar';

  @override
  String get inviteLinkCopied => 'enlace de invitación copiado';

  @override
  String get leaderboard => 'clasificación';

  @override
  String get lifetimeScore => 'puntuación total';

  @override
  String lifetimeScoreValue(int score) {
    return 'puntuación total $score';
  }

  @override
  String get locked => 'bloqueado';

  @override
  String get macosKeychainNotConfigured =>
      'el acceso al llavero de macOS no está configurado';

  @override
  String get moreOptions => 'más opciones';

  @override
  String get networkErrorCheckConnection => 'error de red - revisa tu conexión';

  @override
  String get newHere => '¿eres nuevo?';

  @override
  String get noFriendsYet => 'aún no has agregado amigos';

  @override
  String get noFriendsLeaderboard =>
      'aún no has agregado amigos - abre tu perfil para invitar a alguien';

  @override
  String get noGlobalScoresYet => 'aún no hay puntuaciones globales';

  @override
  String get originalByJohnTantalo => 'original de john tantalo';

  @override
  String get password => 'contraseña';

  @override
  String get passwordMinLength =>
      'la contraseña debe tener al menos 6 caracteres';

  @override
  String get passwordTooWeak => 'la contraseña es demasiado débil';

  @override
  String get planarity => 'planarity';

  @override
  String get privacyOptions => 'opciones de privacidad';

  @override
  String get planarGraphWikipedia => 'wikipedia: grafo planar';

  @override
  String get pressAgainToDelete => 'presiona de nuevo para eliminar';

  @override
  String get profile => 'perfil';

  @override
  String get profileSubtitle => 'actualiza cómo aparece tu nombre en tu perfil';

  @override
  String get reason => 'motivo';

  @override
  String get remove => 'eliminar';

  @override
  String removeFriendQuestion(String displayName) {
    return '¿eliminar a $displayName de tu lista de amigos?';
  }

  @override
  String get removeFriend => 'eliminar amigo';

  @override
  String get reportPlayer => 'reportar jugador';

  @override
  String get reportSubmitted => 'reporte enviado';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'reporte enviado - no se pudo eliminar al amigo';

  @override
  String get resetPassword => 'restablecer contraseña';

  @override
  String get share => 'compartir';

  @override
  String get shareInvitePrompt =>
      'comparte este código QR o enlace para invitar a un amigo';

  @override
  String get shareUnavailableBuild =>
      'compartir no está disponible en esta versión';

  @override
  String get signIn => 'iniciar sesión';

  @override
  String get signInAgainBeforeDeleting =>
      'inicia sesión de nuevo antes de eliminar tu cuenta';

  @override
  String get signInMethodNotEnabled =>
      'este método de inicio de sesión no está activado';

  @override
  String get signInSubtitle => 'inicia sesión con tu correo y contraseña';

  @override
  String get signOut => 'cerrar sesión';

  @override
  String get signUp => 'registrarse';

  @override
  String get signUpToCompete => ' para competir con tus amigos';

  @override
  String solvedNodes(int nodeCount) {
    return 'grafo $nodeCount resuelto';
  }

  @override
  String get start => 'comenzar';

  @override
  String get submit => 'enviar';

  @override
  String get thisPlayer => 'este jugador';

  @override
  String get tooManyAttempts => 'demasiados intentos - inténtalo más tarde';

  @override
  String get unableAuthenticateRightNow =>
      'no se puede autenticar en este momento';

  @override
  String get unableCreateAccountRightNow =>
      'no se puede crear la cuenta en este momento';

  @override
  String get unableCreateProfileRightNow =>
      'no se puede crear tu perfil en este momento';

  @override
  String get unableDeleteAccountRightNow =>
      'no se puede eliminar tu cuenta en este momento';

  @override
  String get unableDeleteProfileRightNow =>
      'no se puede eliminar tu perfil en este momento';

  @override
  String get unableLoadFriendsLeaderboard =>
      'no se puede cargar la clasificación de amigos en este momento';

  @override
  String get unableLoadGlobalLeaderboard =>
      'no se puede cargar la clasificación global en este momento';

  @override
  String get unableSendResetEmailRightNow =>
      'no se puede enviar el correo de restablecimiento ahora';

  @override
  String get unableSubmitReportRightNow =>
      'no se puede enviar el reporte en este momento';

  @override
  String get unableUpdateHiddenNames =>
      'no se pueden actualizar los nombres ocultos';

  @override
  String get unableCreateAccountNoUser =>
      'no se puede crear la cuenta en este momento';

  @override
  String get unhideUserName => 'mostrar nombre de usuario';

  @override
  String get you => 'tú';

  @override
  String get youAndYourFriends => 'tú y tus amigos';

  @override
  String get youAlreadyReportedPlayer => 'ya reportaste a este jugador';

  @override
  String get youCantAddYourself => 'no puedes agregarte a ti mismo';

  @override
  String get yourGlobalPosition => 'tu posición global';

  @override
  String get yourNewFriend => 'tu nuevo amigo';

  @override
  String get friendAlreadyInList => 'este amigo ya está en tu lista';

  @override
  String get friendInviteNoLongerValid =>
      'esa invitación de amistad ya no es válida';

  @override
  String get about => 'acerca de';

  @override
  String get goal => 'objetivo';

  @override
  String get goalDescription =>
      'resuelve tantos grafos como puedas cada día con la menor cantidad de movimientos posible';

  @override
  String get whyEveryPuzzleIsSolvable =>
      'por qué cada rompecabezas tiene solución';

  @override
  String get planarGraphDescription =>
      'cada grafo en planarity tiene solución porque es un grafo planar. un grafo planar es un grafo que se puede dibujar en una superficie plana sin que sus aristas se crucen, excepto donde se encuentran en vértices compartidos.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'nombre visible inapropiado';

  @override
  String get reportReasonAbuse => 'abuso o acoso';

  @override
  String get reportReasonImpersonation => 'suplantación';

  @override
  String get reportReasonSpam => 'spam o estafa';

  @override
  String get reportReasonOther => 'otro';

  @override
  String nodesCount(int count) {
    return '$count nodos';
  }

  @override
  String movesCount(int count) {
    return '$count movimientos';
  }

  @override
  String scoreValue(int score) {
    return 'puntuación $score';
  }

  @override
  String graphUnsolvedSemantics(int level) {
    return 'grafo $level, sin resolver, jugar';
  }

  @override
  String graphSolvedSemantics(int level, int moves, int score) {
    return 'grafo $level, resuelto en $moves movimientos, puntuación $score, volver a jugar';
  }

  @override
  String graphBlockedSemantics(int level) {
    return 'grafo $level, bloqueado';
  }

  @override
  String graphReplayInProgressSemantics(int level) {
    return 'grafo $level, repetición en curso, continuar';
  }

  @override
  String get replay => 'volver a jugar';

  @override
  String replayGraphQuestion(int level) {
    return '¿volver a jugar el grafo $level?';
  }

  @override
  String get replayWarning =>
      'tu puntuación volverá a 0 hasta que resuelvas este grafo de nuevo. los grafos superiores no estarán disponibles si lo dejas sin resolver.';

  @override
  String get resetAndReplay => 'reiniciar y volver a jugar';

  @override
  String get unableSaveProgress =>
      'no se puede guardar el progreso en este momento';

  @override
  String get saveYourProgress => 'guarda tu progreso';

  @override
  String get saveProgressDescription =>
      'regístrate gratis para conservar los grafos de hoy y tus logros en todos tus dispositivos.';

  @override
  String get achievements => 'logros';

  @override
  String get achievementFirstStepTitle => 'primer paso';

  @override
  String get achievementFirstStepDescription => 'resuelve tu primer grafo';

  @override
  String get achievementPracticeTitle => 'práctica';

  @override
  String get achievementPracticeDescription => 'resuelve 8 grafos';

  @override
  String get achievementPersistenceTitle => 'perseverancia';

  @override
  String get achievementPersistenceDescription => 'resuelve 16 grafos';

  @override
  String get achievementDedicationTitle => 'dedicación';

  @override
  String get achievementDedicationDescription => 'resuelve 32 grafos';

  @override
  String get achievementPlanarityTitle => 'planaridad';

  @override
  String get achievementPlanarityDescription => 'resuelve 64 grafos';

  @override
  String get achievementEfficientTitle => 'eficiente';

  @override
  String get achievementEfficientDescription =>
      'resuelve un grafo con al menos 2 movimientos restantes';

  @override
  String get achievementPreciseTitle => 'preciso';

  @override
  String get achievementPreciseDescription =>
      'resuelve un grafo con al menos 4 movimientos restantes';

  @override
  String get achievementOptimalTitle => 'óptimo';

  @override
  String get achievementOptimalDescription =>
      'resuelve un grafo con el máximo número posible de movimientos restantes';

  @override
  String get achievementCloseCallTitle => 'por los pelos';

  @override
  String get achievementCloseCallDescription =>
      'resuelve un grafo sin movimientos restantes';

  @override
  String get achievementSecondAttemptTitle => 'segundo intento';

  @override
  String get achievementSecondAttemptDescription =>
      'vuelve a jugar un grafo resuelto';

  @override
  String get achievementImprovementTitle => 'superación';

  @override
  String get achievementImprovementDescription =>
      'supera tu puntuación anterior al volver a jugar';

  @override
  String get achievementRedemptionTitle => 'redención';

  @override
  String get achievementRedemptionDescription =>
      'consigue una puntuación mayor que cero al volver a jugar un grafo en el que antes obtuviste 0';

  @override
  String get achievementPerfectedTitle => 'perfeccionado';

  @override
  String get achievementPerfectedDescription =>
      'mejora un grafo resuelto hasta su máxima puntuación posible al volver a jugar';

  @override
  String get unableLoadProfile =>
      'no se puede cargar tu perfil en este momento';

  @override
  String get unableShareRightNow => 'no se puede compartir en este momento';

  @override
  String get restart => 'reiniciar';

  @override
  String get tutorialNodeInstruction =>
      'esto es un nodo arrástralo a cualquier lugar';

  @override
  String get tutorialEdgesInstruction =>
      'los nodos están conectados por aristas las aristas permanecen unidas';

  @override
  String get tutorialSolvedInstruction =>
      'un grafo está resuelto cuando ninguna arista se cruza este ya está resuelto';
}
