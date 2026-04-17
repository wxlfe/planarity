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
  String get email => 'correo';

  @override
  String get enterEmailAndPassword => 'ingresa correo y contraseña';

  @override
  String get enterEmailFirst => 'ingresa tu correo primero';

  @override
  String get enterValidEmail => 'ingresa un correo válido';

  @override
  String failedNodes(int nodeCount) {
    return 'fallaste $nodeCount nodos';
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
    return 'resolviste $nodeCount nodos';
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
}
