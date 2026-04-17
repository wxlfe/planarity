// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get account => 'compte';

  @override
  String get accountDeleted => 'compte supprimé';

  @override
  String get accountExistsSignInInstead => 'le compte existe - connectez-vous';

  @override
  String addedFriend(String friendName) {
    return '$friendName ajouté';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'ajouter $inviterName à votre liste d’amis ?';
  }

  @override
  String get addFriend => 'ajouter un ami';

  @override
  String get alreadySignedUp => 'déjà inscrit ?';

  @override
  String get anonymousPlayer => 'joueur anonyme';

  @override
  String get appleSignInUnavailablePlatform =>
      'la connexion Apple n\'est pas disponible sur cette plateforme';

  @override
  String get appleSignInUnavailableRightNow =>
      'la connexion Apple n\'est pas disponible pour le moment';

  @override
  String get authConfigurationInvalid =>
      'la configuration d\'authentification n\'est pas valide pour cette application';

  @override
  String get authConfigurationMissing =>
      'la configuration d\'authentification est manquante';

  @override
  String get back => 'retour';

  @override
  String get cancel => 'annuler';

  @override
  String get continueLabel => 'continuer';

  @override
  String continueWithScore(int totalScore) {
    return 'continuer - $totalScore';
  }

  @override
  String get continueWithApple => 'continuer avec Apple';

  @override
  String get continueWithGoogle => 'continuer avec Google';

  @override
  String get copyInviteLink => 'copier le lien d\'invitation';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'créez un compte avec votre email et votre mot de passe.';

  @override
  String get dailyGraphPuzzle => 'casse-tête graphique quotidien';

  @override
  String get dailyScore => 'score du jour';

  @override
  String get decline => 'déclin';

  @override
  String get deleteAccount => 'supprimer le compte';

  @override
  String get details => 'détails';

  @override
  String get detailsTooLong =>
      'les détails doivent comporter 1 000 caractères ou moins';

  @override
  String get displayName => 'nom d\'affichage';

  @override
  String get email => 'e-mail';

  @override
  String get enterEmailAndPassword => 'entrez l\'email et le mot de passe';

  @override
  String get enterEmailFirst => 'entrez d\'abord votre email';

  @override
  String get enterValidEmail => 'entrez un email valide';

  @override
  String failedNodes(int nodeCount) {
    return '$nodeCount nœuds échoués';
  }

  @override
  String get friendInvite => 'invitation d\'un ami';

  @override
  String get friends => 'amis';

  @override
  String get global => 'mondial';

  @override
  String get globalSnapshot => 'instantané global';

  @override
  String get globalTopScore => 'meilleur score mondial';

  @override
  String get googleSignInUnavailablePlatform =>
      'La connexion Google n\'est pas disponible sur cette plateforme';

  @override
  String get googleSignInNotConfigured =>
      'La connexion Google n\'est pas configurée pour cette application';

  @override
  String get googleSignInNotConfiguredIos =>
      'La connexion Google n\'est pas configurée pour cette application iOS';

  @override
  String get home => 'accueil';

  @override
  String get hideUserName => 'masquer le nom d\'utilisateur';

  @override
  String get ifEmailExistsResetLink =>
      'si cet e-mail existe, nous avons envoyé un lien de réinitialisation';

  @override
  String get invalidEmailOrPassword => 'email ou mot de passe invalide';

  @override
  String get invalidNameTrySomethingElse =>
      'nom invalide - essayez autre chose';

  @override
  String get invite => 'inviter';

  @override
  String get inviteLinkCopied => 'lien d\'invitation copié';

  @override
  String get leaderboard => 'classement';

  @override
  String get lifetimeScore => 'score à vie';

  @override
  String lifetimeScoreValue(int score) {
    return 'score total $score';
  }

  @override
  String get locked => 'fermé';

  @override
  String get macosKeychainNotConfigured =>
      'L\'accès au trousseau Macos n\'est pas configuré';

  @override
  String get moreOptions => 'plus d\'options';

  @override
  String get networkErrorCheckConnection =>
      'erreur réseau - vérifiez votre connexion';

  @override
  String get newHere => 'nouveau ici ?';

  @override
  String get noFriendsYet => 'tu n\'as pas encore ajouté d\'amis';

  @override
  String get noFriendsLeaderboard =>
      'vous n\'avez pas encore ajouté d\'amis - ouvrez votre profil pour inviter quelqu\'un';

  @override
  String get noGlobalScoresYet => 'aucun score mondial pour le moment';

  @override
  String get originalByJohnTantalo => 'original de John Tantalo';

  @override
  String get password => 'mot de passe';

  @override
  String get passwordMinLength =>
      'le mot de passe doit contenir au moins 6 caractères';

  @override
  String get passwordTooWeak => 'le mot de passe est trop faible';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'wikipedia : graphe planaire';

  @override
  String get pressAgainToDelete => 'appuyez à nouveau pour supprimer';

  @override
  String get profile => 'profil';

  @override
  String get profileSubtitle =>
      'mettre à jour la façon dont votre nom apparaît dans votre profil';

  @override
  String get reason => 'raison';

  @override
  String get remove => 'supprimer';

  @override
  String removeFriendQuestion(String displayName) {
    return 'retirer $displayName de votre liste d’amis ?';
  }

  @override
  String get removeFriend => 'supprimer un ami';

  @override
  String get reportPlayer => 'rapporter le joueur';

  @override
  String get reportSubmitted => 'rapport soumis';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'rapport soumis - impossible de supprimer un ami';

  @override
  String get resetPassword => 'réinitialiser le mot de passe';

  @override
  String get share => 'partager';

  @override
  String get shareInvitePrompt =>
      'partagez ce QR code ou ce lien pour inviter un ami';

  @override
  String get shareUnavailableBuild =>
      'le partage n\'est pas disponible sur cette version';

  @override
  String get signIn => 'se connecter';

  @override
  String get signInAgainBeforeDeleting =>
      'reconnectez-vous avant de supprimer votre compte';

  @override
  String get signInMethodNotEnabled =>
      'cette méthode de connexion n\'est pas activée';

  @override
  String get signInSubtitle =>
      'connectez-vous avec votre email et votre mot de passe';

  @override
  String get signOut => 'se déconnecter';

  @override
  String get signUp => 's\'inscrire';

  @override
  String get signUpToCompete => ' rivaliser avec tes amis';

  @override
  String solvedNodes(int nodeCount) {
    return '$nodeCount nœuds résolus';
  }

  @override
  String get start => 'commencer';

  @override
  String get submit => 'envoyer';

  @override
  String get thisPlayer => 'ce joueur';

  @override
  String get tooManyAttempts => 'trop de tentatives - réessayez plus tard';

  @override
  String get unableAuthenticateRightNow =>
      'impossible de s\'authentifier pour le moment';

  @override
  String get unableCreateAccountRightNow =>
      'impossible de créer un compte pour le moment';

  @override
  String get unableCreateProfileRightNow =>
      'impossible de créer votre profil pour le moment';

  @override
  String get unableDeleteAccountRightNow =>
      'impossible de supprimer votre compte pour le moment';

  @override
  String get unableDeleteProfileRightNow =>
      'impossible de supprimer votre profil pour le moment';

  @override
  String get unableLoadFriendsLeaderboard =>
      'impossible de charger le classement des amis pour le moment';

  @override
  String get unableLoadGlobalLeaderboard =>
      'impossible de charger le classement mondial pour le moment';

  @override
  String get unableSendResetEmailRightNow =>
      'impossible d\'envoyer un e-mail de réinitialisation pour le moment';

  @override
  String get unableSubmitReportRightNow =>
      'impossible de soumettre le rapport pour le moment';

  @override
  String get unableUpdateHiddenNames =>
      'impossible de mettre à jour les noms cachés';

  @override
  String get unableCreateAccountNoUser =>
      'impossible de créer un compte pour le moment';

  @override
  String get unhideUserName => 'afficher le nom d\'utilisateur';

  @override
  String get you => 'toi';

  @override
  String get youAndYourFriends => 'toi et tes amis';

  @override
  String get youAlreadyReportedPlayer => 'tu as déjà signalé ce joueur';

  @override
  String get youCantAddYourself => 'tu ne peux pas t\'ajouter';

  @override
  String get yourGlobalPosition => 'votre position globale';

  @override
  String get yourNewFriend => 'ton nouvel ami';

  @override
  String get friendAlreadyInList => 'cet ami est déjà dans votre liste';

  @override
  String get friendInviteNoLongerValid =>
      'cette invitation d\'ami n\'est plus valide';

  @override
  String get about => 'à propos';

  @override
  String get goal => 'but';

  @override
  String get goalDescription =>
      'résolvez autant de graphiques que possible chaque jour avec le moins de mouvements possible';

  @override
  String get whyEveryPuzzleIsSolvable =>
      'pourquoi chaque puzzle peut être résolu';

  @override
  String get planarGraphDescription =>
      'chaque graphe en planarité peut être résolu car c\'est un graphe planaire. un graphe planaire est un graphe qui peut être dessiné sur une surface plane de manière à ce qu\'aucune arête ne se croise, sauf là où elles se rencontrent aux sommets partagés.';

  @override
  String get reportReasonInappropriateDisplayName => 'nom affiché inapproprié';

  @override
  String get reportReasonAbuse => 'abus ou harcèlement';

  @override
  String get reportReasonImpersonation => 'usurpation d’identité';

  @override
  String get reportReasonSpam => 'spam ou arnaque';

  @override
  String get reportReasonOther => 'autre';
}
