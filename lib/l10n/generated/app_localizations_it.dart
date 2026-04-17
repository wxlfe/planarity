// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get account => 'account';

  @override
  String get accountDeleted => 'account eliminato';

  @override
  String get accountExistsSignInInstead => 'account esistente - accedi';

  @override
  String addedFriend(String friendName) {
    return '$friendName aggiunto';
  }

  @override
  String addFriendQuestion(String inviterName) {
    return 'aggiungere $inviterName alla tua lista amici?';
  }

  @override
  String get addFriend => 'aggiungi amico';

  @override
  String get alreadySignedUp => 'già registrato?';

  @override
  String get anonymousPlayer => 'giocatore anonimo';

  @override
  String get appleSignInUnavailablePlatform =>
      'l\'accesso Apple non è disponibile su questa piattaforma';

  @override
  String get appleSignInUnavailableRightNow =>
      'l\'accesso ad Apple non è disponibile al momento';

  @override
  String get authConfigurationInvalid =>
      'la configurazione di autenticazione non è valida per questa app';

  @override
  String get authConfigurationMissing =>
      'manca la configurazione di autenticazione';

  @override
  String get back => 'indietro';

  @override
  String get cancel => 'annulla';

  @override
  String get continueLabel => 'continua';

  @override
  String continueWithScore(int totalScore) {
    return 'continua - $totalScore';
  }

  @override
  String get continueWithApple => 'continuare con Apple';

  @override
  String get continueWithGoogle => 'continuare con Google';

  @override
  String get copyInviteLink => 'copiare il collegamento di invito';

  @override
  String get copyrightNateWolfe => '© nate wolfe';

  @override
  String get createAccountSubtitle =>
      'crea un account con la tua email e password.';

  @override
  String get dailyGraphPuzzle => 'rompicapo grafico quotidiano';

  @override
  String get dailyScore => 'punteggio giornaliero';

  @override
  String get decline => 'declino';

  @override
  String get deleteAccount => 'elimina account';

  @override
  String get details => 'dettagli';

  @override
  String get detailsTooLong =>
      'i dettagli devono contenere 1000 caratteri o meno';

  @override
  String get displayName => 'nome da visualizzare';

  @override
  String get email => 'email';

  @override
  String get enterEmailAndPassword => 'inserisci email e password';

  @override
  String get enterEmailFirst => 'inserisci prima la tua email';

  @override
  String get enterValidEmail => 'inserisci una email valida';

  @override
  String failedNodes(int nodeCount) {
    return 'falliti $nodeCount nodi';
  }

  @override
  String get friendInvite => 'invito ad un amico';

  @override
  String get friends => 'amici';

  @override
  String get global => 'globale';

  @override
  String get globalSnapshot => 'istantanea globale';

  @override
  String get globalTopScore => 'punteggio massimo mondiale';

  @override
  String get googleSignInUnavailablePlatform =>
      'L\'accesso a Google non è disponibile su questa piattaforma';

  @override
  String get googleSignInNotConfigured =>
      'L\'accesso a Google non è configurato per questa app';

  @override
  String get googleSignInNotConfiguredIos =>
      'l\'accesso a Google non è configurato per questa app iOS';

  @override
  String get home => 'home';

  @override
  String get hideUserName => 'nascondere il nome utente';

  @override
  String get ifEmailExistsResetLink =>
      'se l\'e-mail esiste, abbiamo inviato un collegamento di reimpostazione';

  @override
  String get invalidEmailOrPassword => 'email o password non valide';

  @override
  String get invalidNameTrySomethingElse =>
      'nome non valido: prova qualcos\'altro';

  @override
  String get invite => 'invita';

  @override
  String get inviteLinkCopied => 'link di invito copiato';

  @override
  String get leaderboard => 'classifica';

  @override
  String get lifetimeScore => 'punteggio a vita';

  @override
  String lifetimeScoreValue(int score) {
    return 'punteggio totale $score';
  }

  @override
  String get locked => 'bloccato';

  @override
  String get macosKeychainNotConfigured =>
      'L\'accesso al portachiavi macos non è configurato';

  @override
  String get moreOptions => 'più opzioni';

  @override
  String get networkErrorCheckConnection =>
      'errore di rete: controlla la connessione';

  @override
  String get newHere => 'nuovo qui?';

  @override
  String get noFriendsYet => 'non hai ancora aggiunto nessun amico';

  @override
  String get noFriendsLeaderboard =>
      'non hai ancora aggiunto nessun amico: apri il tuo profilo per invitare qualcuno';

  @override
  String get noGlobalScoresYet => 'nessun punteggio globale ancora';

  @override
  String get originalByJohnTantalo => 'originale di John Tantalo';

  @override
  String get password => 'password';

  @override
  String get passwordMinLength =>
      'la password deve contenere almeno 6 caratteri';

  @override
  String get passwordTooWeak => 'la password è troppo debole';

  @override
  String get planarity => 'planarity';

  @override
  String get planarGraphWikipedia => 'wikipedia: grafico planare';

  @override
  String get pressAgainToDelete => 'premere nuovamente per eliminare';

  @override
  String get profile => 'profilo';

  @override
  String get profileSubtitle =>
      'aggiorna come appare il tuo nome nel tuo profilo';

  @override
  String get reason => 'motivo';

  @override
  String get remove => 'rimuovi';

  @override
  String removeFriendQuestion(String displayName) {
    return 'rimuovere $displayName dalla tua lista amici?';
  }

  @override
  String get removeFriend => 'rimuovi amico';

  @override
  String get reportPlayer => 'segnala giocatore';

  @override
  String get reportSubmitted => 'relazione presentata';

  @override
  String get reportSubmittedUnableRemoveFriend =>
      'segnalazione inviata: impossibile rimuovere l\'amico';

  @override
  String get resetPassword => 'reimpostare la password';

  @override
  String get share => 'condividi';

  @override
  String get shareInvitePrompt =>
      'condividi questo codice QR o link per invitare un amico';

  @override
  String get shareUnavailableBuild =>
      'la condivisione non è disponibile su questa build';

  @override
  String get signIn => 'accedi';

  @override
  String get signInAgainBeforeDeleting =>
      'accedi nuovamente prima di eliminare il tuo account';

  @override
  String get signInMethodNotEnabled =>
      'questo metodo di accesso non è abilitato';

  @override
  String get signInSubtitle => 'accedi con la tua email e password';

  @override
  String get signOut => 'esci';

  @override
  String get signUp => 'registrati';

  @override
  String get signUpToCompete => ' per competere con i tuoi amici';

  @override
  String solvedNodes(int nodeCount) {
    return 'risolti $nodeCount nodi';
  }

  @override
  String get start => 'inizia';

  @override
  String get submit => 'invia';

  @override
  String get thisPlayer => 'questo giocatore';

  @override
  String get tooManyAttempts => 'troppi tentativi: riprova più tardi';

  @override
  String get unableAuthenticateRightNow =>
      'impossibile autenticarsi in questo momento';

  @override
  String get unableCreateAccountRightNow =>
      'impossibile creare un account in questo momento';

  @override
  String get unableCreateProfileRightNow =>
      'impossibile creare il tuo profilo in questo momento';

  @override
  String get unableDeleteAccountRightNow =>
      'impossibile eliminare il tuo account in questo momento';

  @override
  String get unableDeleteProfileRightNow =>
      'impossibile eliminare il tuo profilo in questo momento';

  @override
  String get unableLoadFriendsLeaderboard =>
      'impossibile caricare la classifica degli amici in questo momento';

  @override
  String get unableLoadGlobalLeaderboard =>
      'impossibile caricare la classifica globale in questo momento';

  @override
  String get unableSendResetEmailRightNow =>
      'impossibile inviare e-mail di reimpostazione in questo momento';

  @override
  String get unableSubmitReportRightNow =>
      'impossibile inviare la segnalazione in questo momento';

  @override
  String get unableUpdateHiddenNames =>
      'impossibile aggiornare i nomi nascosti';

  @override
  String get unableCreateAccountNoUser =>
      'impossibile creare un account in questo momento';

  @override
  String get unhideUserName => 'mostrare il nome utente';

  @override
  String get you => 'Voi';

  @override
  String get youAndYourFriends => 'tu e i tuoi amici';

  @override
  String get youAlreadyReportedPlayer => 'hai già segnalato questo giocatore';

  @override
  String get youCantAddYourself => 'non puoi aggiungere te stesso';

  @override
  String get yourGlobalPosition => 'la tua posizione globale';

  @override
  String get yourNewFriend => 'il tuo nuovo amico';

  @override
  String get friendAlreadyInList => 'questo amico è già nella tua lista';

  @override
  String get friendInviteNoLongerValid =>
      'quell\'invito di amicizia non è più valido';

  @override
  String get about => 'Di';

  @override
  String get goal => 'obiettivo';

  @override
  String get goalDescription =>
      'risolvi quanti più grafici puoi ogni giorno con il minor numero di mosse possibile';

  @override
  String get whyEveryPuzzleIsSolvable => 'perché ogni enigma è risolvibile';

  @override
  String get planarGraphDescription =>
      'ogni grafo in planarità è risolvibile perché è un grafo planare. un grafo planare è un grafo che può essere disegnato su una superficie piana in modo che nessun bordo si intersechi, tranne dove si incontrano nei vertici condivisi.';

  @override
  String get reportReasonInappropriateDisplayName =>
      'nome visualizzato inappropriato';

  @override
  String get reportReasonAbuse => 'abuso o molestie';

  @override
  String get reportReasonImpersonation => 'impersonificazione';

  @override
  String get reportReasonSpam => 'spam o truffa';

  @override
  String get reportReasonOther => 'altro';
}
