import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:app_links/app_links.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'firebase_options.dart';

bool _firebaseReady = false;
bool _googleSignInReady = false;
FirebaseAnalytics? _analytics;
FirebaseAnalyticsObserver? _analyticsObserver;

bool get _supportsMobileAds {
  if (kIsWeb) {
    return false;
  }

  return switch (defaultTargetPlatform) {
    TargetPlatform.android || TargetPlatform.iOS => true,
    _ => false,
  };
}

Future<void> _initializeMobileAds() async {
  if (!_supportsMobileAds) {
    return;
  }

  try {
    await MobileAds.instance.initialize();
  } catch (error, stackTrace) {
    debugPrint('Mobile Ads initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeMobileAds();
  _firebaseReady = await _initializeFirebase();
  _googleSignInReady = await _initializeGoogleSignIn();
  runApp(const PlanarityApp());
}

Future<bool> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final analytics = FirebaseAnalytics.instance;
    await analytics.setAnalyticsCollectionEnabled(true);
    await analytics.logAppOpen();
    _analytics = analytics;
    _analyticsObserver = FirebaseAnalyticsObserver(analytics: analytics);
    return true;
  } catch (error, stackTrace) {
    debugPrint('Firebase initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);
    return false;
  }
}

Future<bool> _initializeGoogleSignIn() async {
  if (kIsWeb) {
    return true;
  }

  try {
    await GoogleSignIn.instance.initialize();
    return true;
  } catch (error, stackTrace) {
    debugPrint('Google Sign-In initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);
    return false;
  }
}

class PlanarityApp extends StatelessWidget {
  const PlanarityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'planarity',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      navigatorObservers: _analyticsObserver == null
          ? const <NavigatorObserver>[]
          : <NavigatorObserver>[_analyticsObserver!],
      home: const PlanarityHomePage(),
    );
  }
}

Future<void> _runAnalyticsCall(
  String label,
  Future<void> Function(FirebaseAnalytics analytics) action,
) async {
  final analytics = _analytics;
  if (analytics == null) {
    return;
  }

  try {
    await action(analytics);
  } catch (error, stackTrace) {
    debugPrint('Analytics event failed: $label, error: $error');
    debugPrintStack(stackTrace: stackTrace);
  }
}

String _analyticsLevelName(int level) => 'level_$level';

Future<void> _logJoinGroupEvent(String groupId) {
  return _runAnalyticsCall(
    'join_group',
    (analytics) => analytics.logJoinGroup(groupId: groupId),
  );
}

Future<void> _logLevelStartEvent(int level) {
  return _runAnalyticsCall(
    'level_start',
    (analytics) =>
        analytics.logLevelStart(levelName: _analyticsLevelName(level)),
  );
}

Future<void> _logLevelEndEvent({required int level, required bool success}) {
  return _runAnalyticsCall(
    'level_end',
    (analytics) => analytics.logLevelEnd(
      levelName: _analyticsLevelName(level),
      success: success ? 1 : 0,
    ),
  );
}

Future<void> _logLevelUpEvent(int level) {
  return _runAnalyticsCall(
    'level_up',
    (analytics) => analytics.logLevelUp(level: level),
  );
}

Future<void> _logLoginEvent(String method) {
  return _runAnalyticsCall(
    'login',
    (analytics) => analytics.logLogin(loginMethod: method),
  );
}

Future<void> _logPostScoreEvent({required int score, required int level}) {
  return _runAnalyticsCall(
    'post_score',
    (analytics) => analytics.logPostScore(score: score, level: level),
  );
}

Future<void> _logShareEvent({
  required String contentType,
  required String itemId,
  required String method,
}) {
  return _runAnalyticsCall(
    'share',
    (analytics) => analytics.logShare(
      contentType: contentType,
      itemId: itemId,
      method: method,
    ),
  );
}

Future<void> _logSignUpEvent(String method) {
  return _runAnalyticsCall(
    'sign_up',
    (analytics) => analytics.logSignUp(signUpMethod: method),
  );
}

ThemeData _buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  const black = Colors.black;
  const white = Colors.white;
  final base = ColorScheme.fromSeed(
    seedColor: isDark ? white : black,
    brightness: brightness,
  );

  return ThemeData(
    brightness: brightness,
    colorScheme: base.copyWith(
      primary: isDark ? white : black,
      onPrimary: isDark ? black : white,
      secondary: isDark ? white : black,
      onSecondary: isDark ? black : white,
      error: isDark ? white : black,
      onError: isDark ? black : white,
      surface: isDark ? black : white,
      onSurface: isDark ? white : black,
    ),
    scaffoldBackgroundColor: isDark ? black : white,
    fontFamily: 'GeistMono',
    textTheme: ThemeData(brightness: brightness).textTheme.apply(
      bodyColor: isDark ? white : black,
      displayColor: isDark ? white : black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: isDark ? black : white,
      foregroundColor: isDark ? white : black,
      elevation: 0,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: isDark ? white : black,
        foregroundColor: isDark ? black : white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? white : black,
        side: BorderSide(color: isDark ? white : black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
    ),
    dividerColor: isDark ? Colors.white24 : Colors.black26,
    useMaterial3: true,
  );
}

class PlanarityHomePage extends StatefulWidget {
  const PlanarityHomePage({super.key});

  @override
  State<PlanarityHomePage> createState() => _PlanarityHomePageState();
}

enum DailyPlayStatus { ready, inProgress, locked }

class _PlanarityHomePageState extends State<PlanarityHomePage>
    with WidgetsBindingObserver {
  static final Uri _portfolioUri = Uri.parse(
    'https://wxlfe.dev/?utm_source=planarity&utm_medium=app&utm_campaign=internal_referral&utm_content=footer_portfolio_link',
  );
  static final Uri _originalGameUri = Uri.parse('http://johntantalo.com/');
  static final Uri _planarGraphInfoUri = Uri.parse(
    'https://en.wikipedia.org/wiki/Planar_graph',
  );
  static const _startingLevel = 4;
  static const _localGuestUserDocumentKey = 'local_guest_user_document';

  bool _isLoaded = false;
  DailyPlayStatus _status = DailyPlayStatus.ready;
  int _currentLevel = _startingLevel;
  int _score = 0;
  int _leaderboardRefreshTick = 0;
  _LeaderboardTab? _selectedLeaderboardTab;
  StreamSubscription<User?>? _authSubscription;
  String? _activeUserId;
  User? _currentUser;
  String? _pendingFriendInviteUid;
  bool _friendInvitePromptOpen = false;
  bool _friendInviteAuthPromptOpen = false;
  StreamSubscription<Uri>? _appLinkSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _pendingFriendInviteUid = _incomingFriendInviteUid();
    _configureIncomingFriendLinks();
    if (_firebaseReady) {
      _authSubscription = FirebaseAuth.instance.authStateChanges().listen(
        _handleAuthStateChange,
      );
      _reconcileUserState(FirebaseAuth.instance.currentUser, force: true);
    } else {
      _reconcileUserState(null, force: true);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _authSubscription?.cancel();
    _appLinkSubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      return;
    }
    _reconcileUserState(
      _firebaseReady ? FirebaseAuth.instance.currentUser : null,
      force: true,
    );
  }

  Future<void> _configureIncomingFriendLinks() async {
    if (kIsWeb) {
      return;
    }

    final appLinks = AppLinks();

    try {
      final initialUri = await appLinks.getInitialLink();
      _handleIncomingFriendInviteUri(initialUri);
    } catch (error, stackTrace) {
      debugPrint('Failed to read initial app link: $error');
      debugPrintStack(stackTrace: stackTrace);
    }

    _appLinkSubscription = appLinks.uriLinkStream.listen(
      _handleIncomingFriendInviteUri,
      onError: (Object error, StackTrace stackTrace) {
        debugPrint('Incoming app link failed: $error');
        debugPrintStack(stackTrace: stackTrace);
      },
    );
  }

  void _handleIncomingFriendInviteUri(Uri? uri) {
    final friendUid = _friendInviteUidFromUri(uri);
    if (friendUid == null) {
      return;
    }
    _pendingFriendInviteUid = friendUid;
    _maybePromptToAuthenticateForFriendInvite();
    final currentUser = _currentUser;
    if (currentUser != null) {
      _maybePromptToAddIncomingFriend(profileData: null);
    }
  }

  String _todayKey() {
    // Use the device's local calendar day for daily progress resets.
    final now = DateTime.now();
    final year = now.year.toString().padLeft(4, '0');
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  Future<void> _handleAuthStateChange(User? user) async {
    await _reconcileUserState(user);
  }

  Future<void> _reconcileUserState(User? user, {bool force = false}) async {
    final nextUserId = user?.uid;
    if (!force && nextUserId == _activeUserId) {
      return;
    }
    _activeUserId = nextUserId;
    await _analytics?.setUserId(id: nextUserId);

    final profileData = await _loadActiveUserDocument(user);
    final signedInChanged = (_currentUser != null) != (user != null);
    final lastPlayed = _profileLastPlayed(profileData);
    final playedToday = lastPlayed == _todayKey();
    final syncedScore = _profileScore(profileData, playedToday: playedToday);
    final syncedLevel = _profileCurrentLevel(
      profileData,
      playedToday: playedToday,
    );
    final isLocked = _profileLocked(profileData);

    if (!mounted) {
      return;
    }

    setState(() {
      _currentUser = user;
      _status = playedToday
          ? (isLocked ? DailyPlayStatus.locked : DailyPlayStatus.inProgress)
          : DailyPlayStatus.ready;
      _currentLevel = syncedLevel;
      _score = syncedScore;
      _isLoaded = true;
      if (_selectedLeaderboardTab == null || signedInChanged) {
        _selectedLeaderboardTab = user != null
            ? _LeaderboardTab.friends
            : _LeaderboardTab.global;
      }
    });
    _refreshLeaderboard();
    if (user == null) {
      _maybePromptToAuthenticateForFriendInvite();
      return;
    }

    _maybePromptToAddIncomingFriend(profileData: profileData);

    if (!playedToday &&
        (isLocked || syncedScore != 0 || syncedLevel != _startingLevel)) {
      await _updateCurrentUserProgressFields(
        user: user,
        score: 0,
        currentLevel: _startingLevel,
        locked: false,
      );
    }
  }

  Map<String, dynamic> _defaultUserDocument({String? displayName}) {
    return <String, dynamic>{
      'displayName': displayName ?? 'anonymous player',
      'currentLevel': _startingLevel,
      'friends': <String>[],
      'lastPlayed': '',
      'locked': false,
      'lifetimeScore': 0,
      'score': 0,
    };
  }

  Future<Map<String, dynamic>> _loadLocalGuestUserDocument() async {
    final prefs = await _prefsOrNull();
    if (prefs == null) {
      return _defaultUserDocument();
    }

    final raw = prefs.getString(_localGuestUserDocumentKey);
    if (raw == null || raw.isEmpty) {
      final document = _defaultUserDocument();
      await _saveLocalGuestUserDocument(document);
      return document;
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map<String, dynamic>) {
        return <String, dynamic>{..._defaultUserDocument(), ...decoded};
      }
      if (decoded is Map) {
        return <String, dynamic>{
          ..._defaultUserDocument(),
          ...decoded.map((key, value) => MapEntry(key.toString(), value)),
        };
      }
    } catch (_) {}

    final document = _defaultUserDocument();
    await _saveLocalGuestUserDocument(document);
    return document;
  }

  Future<void> _saveLocalGuestUserDocument(
    Map<String, dynamic> document,
  ) async {
    final prefs = await _prefsOrNull();
    if (prefs == null) {
      return;
    }
    await prefs.setString(_localGuestUserDocumentKey, jsonEncode(document));
  }

  Future<Map<String, dynamic>?> _loadActiveUserDocument(User? user) async {
    if (user == null) {
      return _loadLocalGuestUserDocument();
    }

    var profileData = await _loadUserDocument(user.uid);
    if (profileData != null) {
      return profileData;
    }

    await _ensureUserDocument(user);
    return _loadUserDocument(user.uid);
  }

  Future<void> _updateCurrentUserProgressFields({
    required User? user,
    int? score,
    int? currentLevel,
    String? lastPlayed,
    bool? locked,
    int? lifetimeScoreIncrement,
  }) async {
    if (user != null) {
      await _updateUserProgressFields(
        userId: user.uid,
        score: score,
        currentLevel: currentLevel,
        lastPlayed: lastPlayed,
        locked: locked,
        lifetimeScoreIncrement: lifetimeScoreIncrement,
      );
      return;
    }

    final localDocument = await _loadLocalGuestUserDocument();
    if (score != null) {
      localDocument['score'] = score;
    }
    if (currentLevel != null) {
      localDocument['currentLevel'] = currentLevel;
    }
    if (lastPlayed != null) {
      localDocument['lastPlayed'] = lastPlayed;
    }
    if (locked != null) {
      localDocument['locked'] = locked;
    }
    if (lifetimeScoreIncrement != null && lifetimeScoreIncrement > 0) {
      localDocument['lifetimeScore'] =
          _profileLifetimeScore(localDocument) + lifetimeScoreIncrement;
    }
    await _saveLocalGuestUserDocument(localDocument);
  }

  Future<void> _updateUserProgressFields({
    required String userId,
    int? score,
    int? currentLevel,
    String? lastPlayed,
    bool? locked,
    int? lifetimeScoreIncrement,
  }) async {
    final data = <String, Object>{};
    if (score != null) {
      data['score'] = score;
    }
    if (currentLevel != null) {
      data['currentLevel'] = currentLevel;
    }
    if (lastPlayed != null) {
      data['lastPlayed'] = lastPlayed;
    }
    if (locked != null) {
      data['locked'] = locked;
    }
    if (lifetimeScoreIncrement != null && lifetimeScoreIncrement > 0) {
      data['lifetimeScore'] = FieldValue.increment(lifetimeScoreIncrement);
    }
    if (data.isEmpty) {
      return;
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(data, SetOptions(merge: true));
  }

  Future<SharedPreferences?> _prefsOrNull() async {
    try {
      return await SharedPreferences.getInstance();
    } on MissingPluginException {
      return null;
    }
  }

  void _refreshLeaderboard() {
    if (!mounted) {
      return;
    }
    setState(() {
      _leaderboardRefreshTick += 1;
    });
  }

  Future<void> _openChallenge() async {
    await _reconcileUserState(
      _firebaseReady ? FirebaseAuth.instance.currentUser : _currentUser,
      force: true,
    );
    if (!mounted) {
      return;
    }
    if (_status == DailyPlayStatus.locked) {
      setState(() {});
      return;
    }

    final today = _todayKey();
    final startLevel = _currentLevel;
    final startScore = _score;
    setState(() {
      _status = DailyPlayStatus.inProgress;
      _currentLevel = startLevel;
      _score = startScore;
    });
    await _updateCurrentUserProgressFields(
      user: _currentUser,
      score: _score,
      currentLevel: _currentLevel,
      lastPlayed: today,
      locked: false,
    );
    final result = await Navigator.of(context).push<GameSessionResult>(
      MaterialPageRoute(
        settings: const RouteSettings(name: 'game_session'),
        builder: (_) => PlanarityGamePage(
          dayKey: today,
          startLevel: startLevel,
          startScore: startScore,
        ),
      ),
    );

    if (!mounted || result == null) {
      if (mounted) {
        _refreshLeaderboard();
      }
      return;
    }

    final previousScore = _score;
    setState(() {
      _score = result.score;
      if (result.locked) {
        _status = DailyPlayStatus.locked;
        _currentLevel = result.level;
      } else {
        _status = DailyPlayStatus.inProgress;
        _currentLevel = result.level;
      }
    });
    await _updateCurrentUserProgressFields(
      user: _currentUser,
      score: _score,
      currentLevel: result.level,
      lastPlayed: result.dayKey,
      locked: result.locked,
      lifetimeScoreIncrement: max(0, result.score - previousScore),
    );
    await _logPostScoreEvent(score: result.score, level: result.level);
    _refreshLeaderboard();
  }

  Future<String?> _submitAuth({
    required bool isSignIn,
    required String email,
    required String password,
  }) async {
    final cleanedEmail = email.trim().toLowerCase();
    final cleanedPassword = password.trim();

    if (cleanedEmail.isEmpty || cleanedPassword.isEmpty) {
      return 'enter email and password';
    }
    final emailValid = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(cleanedEmail);
    if (!emailValid) {
      return 'enter a valid email';
    }
    if (cleanedPassword.length < 6) {
      return 'password must be at least 6 characters';
    }
    if (!_firebaseReady) {
      return 'auth configuration is missing';
    }

    try {
      if (isSignIn) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: cleanedEmail,
          password: cleanedPassword,
        );
        await _logLoginEvent('email');
      } else {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: cleanedEmail,
              password: cleanedPassword,
            );
        final user = credential.user;
        if (user == null) {
          return 'unable to create account right now';
        }

        try {
          await _ensureUserDocument(user);
        } on FirebaseException catch (error) {
          await user.delete().catchError((_) {});
          return _firestoreErrorMessage(error);
        } catch (_) {
          await user.delete().catchError((_) {});
          return 'unable to create account right now';
        }
        await _logSignUpEvent('email');
      }
      return null;
    } on FirebaseAuthException catch (error, stackTrace) {
      debugPrint(
        'Firebase auth failed: code=${error.code}, message=${error.message}',
      );
      debugPrintStack(stackTrace: stackTrace);
      return _authErrorMessage(error);
    } on FirebaseException catch (error, stackTrace) {
      debugPrint(
        'Firebase auth config failed: code=${error.code}, message=${error.message}',
      );
      debugPrintStack(stackTrace: stackTrace);
      return 'auth configuration is missing';
    } catch (error, stackTrace) {
      debugPrint('Unexpected auth failure: $error');
      debugPrintStack(stackTrace: stackTrace);
      return 'unable to authenticate right now';
    }
  }

  Future<_AuthSubmissionResult> _submitGoogleAuth() async {
    if (!_firebaseReady) {
      return const _AuthSubmissionResult(
        errorText: 'auth configuration is missing',
      );
    }
    if (!kIsWeb &&
        (!_googleSignInReady ||
            !GoogleSignIn.instance.supportsAuthenticate())) {
      return const _AuthSubmissionResult(
        errorText: 'google sign-in is not available on this platform',
      );
    }

    try {
      final credential = await _signInWithGoogle();
      final user = credential.user;
      if (user == null) {
        return const _AuthSubmissionResult(
          errorText: 'unable to authenticate right now',
        );
      }

      if (credential.additionalUserInfo?.isNewUser ?? false) {
        await _ensureUserDocument(user);
      }
      if (credential.additionalUserInfo?.isNewUser ?? false) {
        await _logSignUpEvent('google');
      } else {
        await _logLoginEvent('google');
      }

      return _AuthSubmissionResult(
        userToEdit: credential.additionalUserInfo?.isNewUser ?? false
            ? user
            : null,
      );
    } on GoogleSignInException catch (error, stackTrace) {
      debugPrint(
        'Google sign-in failed: code=${error.code.name}, description=${error.description}',
      );
      debugPrintStack(stackTrace: stackTrace);
      return _AuthSubmissionResult(errorText: _googleAuthErrorMessage(error));
    } on PlatformException catch (error, stackTrace) {
      debugPrint(
        'Google platform auth failed: code=${error.code}, message=${error.message}',
      );
      debugPrintStack(stackTrace: stackTrace);
      return _AuthSubmissionResult(
        errorText: _googlePlatformAuthErrorMessage(error),
      );
    } on FirebaseAuthException catch (error, stackTrace) {
      debugPrint(
        'Firebase Google auth failed: code=${error.code}, message=${error.message}',
      );
      debugPrintStack(stackTrace: stackTrace);
      return _AuthSubmissionResult(errorText: _authErrorMessage(error));
    } on FirebaseException catch (error, stackTrace) {
      debugPrint(
        'Google auth config failed: code=${error.code}, message=${error.message}',
      );
      debugPrintStack(stackTrace: stackTrace);
      return _AuthSubmissionResult(errorText: _firestoreErrorMessage(error));
    } catch (error, stackTrace) {
      debugPrint('Unexpected Google auth failure: $error');
      debugPrintStack(stackTrace: stackTrace);
      return const _AuthSubmissionResult(
        errorText: 'unable to authenticate right now',
      );
    }
  }

  Future<UserCredential> _signInWithGoogle() async {
    if (kIsWeb) {
      return FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
    }

    final googleUser = await GoogleSignIn.instance.authenticate();
    final googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> _ensureUserDocument(User user) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(
          _defaultUserDocument(displayName: _defaultDisplayName(user)),
          SetOptions(merge: true),
        );
  }

  String _defaultDisplayName(User user) {
    final authDisplayName = user.displayName?.trim();
    if (authDisplayName != null && authDisplayName.isNotEmpty) {
      return authDisplayName;
    }
    return 'anonymous player';
  }

  String _authErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'email-already-in-use':
        return 'account exists. sign in instead';
      case 'invalid-email':
        return 'enter a valid email';
      case 'weak-password':
        return 'password is too weak';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'invalid email or password';
      case 'too-many-requests':
        return 'too many attempts. try again later';
      case 'operation-not-allowed':
        return 'email/password sign-in is not enabled';
      case 'app-not-authorized':
      case 'invalid-api-key':
        return 'auth configuration is invalid for this app';
      case 'keychain-error':
        return 'macos keychain access is not configured';
      case 'network-request-failed':
        return 'network error. check your connection';
      default:
        return 'unable to authenticate right now';
    }
  }

  String? _googleAuthErrorMessage(GoogleSignInException error) {
    switch (error.code) {
      case GoogleSignInExceptionCode.canceled:
        return '';
      case GoogleSignInExceptionCode.clientConfigurationError:
        return 'google sign-in is not configured for this app';
      default:
        if (error.description != null && error.description!.isNotEmpty) {
          return error.description;
        }
        return 'unable to authenticate right now';
    }
  }

  String _googlePlatformAuthErrorMessage(PlatformException error) {
    final message = error.message;
    if (message != null &&
        message.contains('missing support for the following URL schemes')) {
      return 'google sign-in is not configured for this iOS app';
    }
    if (message != null && message.isNotEmpty) {
      return message;
    }
    return 'unable to authenticate right now';
  }

  String _firestoreErrorMessage(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return 'unable to create your profile right now';
      case 'network-request-failed':
      case 'unavailable':
        return 'network error. check your connection';
      default:
        return 'unable to create account right now';
    }
  }

  Future<void> _showAuthModal({
    required bool isSignIn,
    bool showProfileAfterNewAccount = true,
  }) async {
    var nextMode = isSignIn;

    while (mounted) {
      final result = await showDialog<_AuthDialogResult>(
        context: context,
        builder: (dialogContext) {
          return _AuthDialog(
            isSignIn: nextMode,
            onSubmit: _submitAuth,
            onGoogleSubmit: _submitGoogleAuth,
          );
        },
      );

      if (!mounted || result == null) {
        _refreshLeaderboard();
        return;
      }

      if (result.nextIsSignIn != null) {
        nextMode = result.nextIsSignIn!;
        continue;
      }

      if (showProfileAfterNewAccount && result.userToEdit != null) {
        await _showProfileModal(user: result.userToEdit!);
      }
      _refreshLeaderboard();
      return;
    }
  }

  Future<void> _showProfileModal({required User user}) async {
    final profileData = await _loadUserDocument(user.uid);
    if (!mounted) {
      return;
    }
    final initialDisplayName = _profileDisplayName(profileData, user);
    final lifetimeScore = _profileLifetimeScore(profileData);
    final initialFriendIds = _profileFriendIds(profileData);
    final result = await showDialog<_ProfileDialogResult>(
      context: context,
      builder: (dialogContext) {
        return _ProfileDialog(
          initialDisplayName: initialDisplayName,
          initialFriendIds: initialFriendIds,
          lifetimeScore: lifetimeScore,
          loadFriends: _loadFriendProfiles,
          removeFriend: (friendUid) =>
              _removeFriendPair(userId: user.uid, friendUid: friendUid),
          buildInviteLink: () => _friendInvitePath(user.uid),
          shareInvite: (inviteLink, isDark, sharePositionOrigin) =>
              _shareFriendInviteCard(
                inviteLink: inviteLink,
                isDark: isDark,
                sharePositionOrigin: sharePositionOrigin,
              ),
        );
      },
    );

    if (result == null || !mounted) {
      _refreshLeaderboard();
      return;
    }

    if (result.signOutRequested) {
      await _saveDisplayName(user: user, displayName: result.displayName);
      if (!mounted) {
        return;
      }
      if (!kIsWeb &&
          _googleSignInReady &&
          GoogleSignIn.instance.supportsAuthenticate()) {
        await GoogleSignIn.instance.signOut().catchError((_) {});
      }
      await FirebaseAuth.instance.signOut();
      _refreshLeaderboard();
      return;
    }

    if (result.shouldPersist) {
      await _saveDisplayName(user: user, displayName: result.displayName);
    }
    _refreshLeaderboard();
  }

  Future<Map<String, dynamic>?> _loadUserDocument(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    return snapshot.data();
  }

  String _profileDisplayName(Map<String, dynamic>? profileData, User user) {
    final profileDisplayName = _profileDisplayNameFromData(profileData);
    if (profileDisplayName != null) {
      return profileDisplayName;
    }

    final authDisplayName = user.displayName?.trim();
    if (authDisplayName != null && authDisplayName.isNotEmpty) {
      return authDisplayName;
    }

    return 'anonymous player';
  }

  int _profileLifetimeScore(Map<String, dynamic>? profileData) {
    final lifetimeScore = profileData?['lifetimeScore'];
    if (lifetimeScore is int) {
      return lifetimeScore;
    }
    if (lifetimeScore is num) {
      return lifetimeScore.toInt();
    }
    return 0;
  }

  String? _profileDisplayNameFromData(Map<String, dynamic>? profileData) {
    final profileDisplayName = profileData?['displayName'];
    if (profileDisplayName is String && profileDisplayName.trim().isNotEmpty) {
      return profileDisplayName.trim();
    }
    return null;
  }

  int _profileScore(
    Map<String, dynamic>? profileData, {
    required bool playedToday,
  }) {
    if (!playedToday) {
      return 0;
    }
    final score = profileData?['score'];
    if (score is int) {
      return max(0, score);
    }
    if (score is num) {
      return max(0, score.toInt());
    }
    return 0;
  }

  int _profileCurrentLevel(
    Map<String, dynamic>? profileData, {
    required bool playedToday,
  }) {
    if (!playedToday) {
      return _startingLevel;
    }
    final currentLevel = profileData?['currentLevel'];
    if (currentLevel is int) {
      return max(_startingLevel, currentLevel);
    }
    if (currentLevel is num) {
      return max(_startingLevel, currentLevel.toInt());
    }
    return _startingLevel;
  }

  String? _profileLastPlayed(Map<String, dynamic>? profileData) {
    final lastPlayed = profileData?['lastPlayed'];
    if (lastPlayed is String && lastPlayed.isNotEmpty) {
      return lastPlayed;
    }
    return null;
  }

  bool _profileLocked(Map<String, dynamic>? profileData) {
    final locked = profileData?['locked'];
    if (locked is bool) {
      return locked;
    }
    return false;
  }

  List<String> _profileFriendIds(Map<String, dynamic>? profileData) {
    final rawFriends = profileData?['friends'];
    if (rawFriends is! List) {
      return const <String>[];
    }

    final seen = <String>{};
    final friends = <String>[];
    for (final value in rawFriends) {
      if (value is! String) {
        continue;
      }
      final trimmed = value.trim();
      if (trimmed.isEmpty || !seen.add(trimmed)) {
        continue;
      }
      friends.add(trimmed);
    }
    return friends;
  }

  String? _incomingFriendInviteUid() {
    return kIsWeb ? _friendInviteUidFromUri(Uri.base) : null;
  }

  String? _friendInviteUidFromUri(Uri? uri) {
    if (uri == null) {
      return null;
    }
    final normalizedPath = uri.path.startsWith('/') ? uri.path : '/${uri.path}';
    final isRootInviteRoute = normalizedPath == '/' || normalizedPath.isEmpty;
    if (!isRootInviteRoute) {
      return null;
    }
    final uid = uri.queryParameters['invite']?.trim();
    if (uid == null || uid.isEmpty) {
      return null;
    }
    return uid;
  }

  String _friendInvitePath(String uid) {
    return Uri(
      scheme: 'https',
      host: 'planarity.xyz',
      path: '/',
      queryParameters: <String, String>{'invite': uid},
    ).toString();
  }

  Future<List<_FriendProfile>> _loadFriendProfiles(
    List<String> friendIds,
  ) async {
    if (friendIds.isEmpty) {
      return const <_FriendProfile>[];
    }

    final futures = friendIds.map((uid) async {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      if (!snapshot.exists) {
        return null;
      }
      final data = snapshot.data();
      return _FriendProfile(
        uid: uid,
        displayName: _profileDisplayNameFromData(data) ?? 'anonymous player',
        lifetimeScore: _profileLifetimeScore(data),
      );
    });

    final friends = (await Future.wait(
      futures,
    )).whereType<_FriendProfile>().toList();
    friends.sort(
      (a, b) =>
          a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()),
    );
    return friends;
  }

  Future<void> _removeFriendPair({
    required String userId,
    required String friendUid,
  }) async {
    final batch = FirebaseFirestore.instance.batch();
    final users = FirebaseFirestore.instance.collection('users');
    batch.set(users.doc(userId), {
      'friends': FieldValue.arrayRemove([friendUid]),
    }, SetOptions(merge: true));
    batch.set(users.doc(friendUid), {
      'friends': FieldValue.arrayRemove([userId]),
    }, SetOptions(merge: true));
    await batch.commit();
  }

  Future<_FriendAddResult> _addFriendPair({
    required String userId,
    required String friendUid,
    required List<String> existingFriendIds,
  }) async {
    if (userId == friendUid) {
      return const _FriendAddResult(message: "you can't add yourself");
    }
    if (existingFriendIds.contains(friendUid)) {
      return const _FriendAddResult(
        message: 'this friend is already in your list',
      );
    }

    final users = FirebaseFirestore.instance.collection('users');
    final friendSnapshot = await users.doc(friendUid).get();
    if (!friendSnapshot.exists) {
      return const _FriendAddResult(
        message: 'that friend invite is no longer valid',
      );
    }

    final batch = FirebaseFirestore.instance.batch();
    batch.set(users.doc(userId), {
      'friends': FieldValue.arrayUnion([friendUid]),
    }, SetOptions(merge: true));
    batch.set(users.doc(friendUid), {
      'friends': FieldValue.arrayUnion([userId]),
    }, SetOptions(merge: true));
    await batch.commit();

    final friendName =
        _profileDisplayNameFromData(friendSnapshot.data()) ?? 'your new friend';
    await _logJoinGroupEvent('friends');
    return _FriendAddResult(message: 'added $friendName');
  }

  void _maybePromptToAddIncomingFriend({
    required Map<String, dynamic>? profileData,
  }) {
    final currentUser = _currentUser;
    final friendUid = _pendingFriendInviteUid;
    if (!mounted ||
        currentUser == null ||
        friendUid == null ||
        _friendInvitePromptOpen) {
      return;
    }
    if (friendUid == currentUser.uid) {
      _pendingFriendInviteUid = null;
      return;
    }

    _friendInvitePromptOpen = true;
    final existingFriendIds = _profileFriendIds(profileData);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final inviterData = await _loadUserDocument(friendUid);
      final inviterName =
          _profileDisplayNameFromData(inviterData) ?? 'this player';
      if (!mounted) {
        _friendInvitePromptOpen = false;
        return;
      }

      final shouldAdd = await showDialog<bool>(
        context: context,
        builder: (dialogContext) {
          final theme = Theme.of(dialogContext);
          return Dialog(
            backgroundColor: theme.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(
                color: theme.colorScheme.onSurface.withOpacity(0.35),
              ),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'friend invite',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'add $inviterName to your friends list?',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          child: const Text('decline'),
                        ),
                        const SizedBox(width: 8),
                        FilledButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(true),
                          child: const Text('add friend'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      if (!mounted) {
        _friendInvitePromptOpen = false;
        return;
      }

      if (shouldAdd == true) {
        final result = await _addFriendPair(
          userId: currentUser.uid,
          friendUid: friendUid,
          existingFriendIds: existingFriendIds,
        );
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(result.message)));
        }
      }

      _pendingFriendInviteUid = null;
      _friendInvitePromptOpen = false;
    });
  }

  void _maybePromptToAuthenticateForFriendInvite() {
    if (!mounted ||
        !_isLoaded ||
        _pendingFriendInviteUid == null ||
        _currentUser != null ||
        _friendInviteAuthPromptOpen) {
      return;
    }

    _friendInviteAuthPromptOpen = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted || _currentUser != null || _pendingFriendInviteUid == null) {
        _friendInviteAuthPromptOpen = false;
        return;
      }

      await _showAuthModal(isSignIn: false, showProfileAfterNewAccount: false);

      _friendInviteAuthPromptOpen = false;
    });
  }

  Future<void> _shareFriendInviteCard({
    required String inviteLink,
    required bool isDark,
    Rect? sharePositionOrigin,
  }) async {
    try {
      final bytes = await _buildFriendInviteShareImage(
        inviteLink: inviteLink,
        isDark: isDark,
      );
      final file = XFile.fromData(
        bytes,
        mimeType: 'image/png',
        name: 'planarity-friend-invite.png',
      );
      await SharePlus.instance.share(
        ShareParams(
          files: [file],
          text: inviteLink,
          sharePositionOrigin: sharePositionOrigin,
        ),
      );
      await _logShareEvent(
        contentType: 'friend_invite',
        itemId: 'friend_invite_card',
        method: 'system_share_sheet',
      );
    } on MissingPluginException {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Share is unavailable on this build.')),
      );
    }
  }

  Future<Uint8List> _buildFriendInviteShareImage({
    required String inviteLink,
    required bool isDark,
  }) async {
    const width = 1080.0;
    const height = 860.0;
    const qrSize = 520.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, width, height));
    final bgColor = isDark ? Colors.black : Colors.white;
    final fgColor = isDark ? Colors.white : Colors.black;

    canvas.drawRect(
      const Rect.fromLTWH(0, 0, width, height),
      Paint()..color = bgColor,
    );

    final title = TextPainter(
      text: TextSpan(
        text: 'planarity',
        style: TextStyle(
          color: fgColor,
          fontSize: 62,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    const iconSize = 72.0;
    const iconGap = 16.0;
    final headingWidth = iconSize + iconGap + title.width;
    final headingStartX = (width - headingWidth) / 2;
    final iconRect = Rect.fromLTWH(headingStartX, 62, iconSize, iconSize);
    _drawShareBrandIcon(canvas, iconRect);
    title.paint(
      canvas,
      Offset(
        headingStartX + iconSize + iconGap,
        iconRect.top + (iconSize - title.height) / 2,
      ),
    );

    final qrRect = Rect.fromLTWH((width - qrSize) / 2, 210, qrSize, qrSize);
    canvas.drawRect(
      qrRect.inflate(24),
      Paint()..color = fgColor.withOpacity(isDark ? 0.08 : 0.05),
    );

    final qrPainter = QrPainter(
      data: inviteLink,
      version: QrVersions.auto,
      gapless: false,
      color: fgColor,
      emptyColor: bgColor,
    );
    canvas.save();
    canvas.translate(qrRect.left, qrRect.top);
    qrPainter.paint(canvas, qrRect.size);
    canvas.restore();

    final image = await recorder.endRecording().toImage(
      width.toInt(),
      height.toInt(),
    );
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<void> _saveDisplayName({
    required User user,
    required String displayName,
  }) async {
    final cleanedDisplayName = displayName.trim().isEmpty
        ? 'anonymous player'
        : displayName.trim();
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'displayName': cleanedDisplayName,
    }, SetOptions(merge: true));
    await user.updateDisplayName(cleanedDisplayName);
    await user.reload();
  }

  Future<void> _showAboutModal() async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);

        return Dialog(
          backgroundColor: theme.colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(
              color: theme.colorScheme.onSurface.withOpacity(0.35),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'about',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'goal',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'solve as many graphs as you can each day with as few moves as possible.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'why every puzzle is solvable',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "every graph in planarity is solvable because it's a planar graph. a planar graph is a graph that can be drawn on a flat surface so that no edges cross, except where they meet at shared vertices.",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () async {
                      await launchUrl(
                        _planarGraphInfoUri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Text(
                      'wikipedia: planar graph',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    _refreshLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomeScaffold(context, _currentUser);
  }

  Widget _buildHomeScaffold(BuildContext context, User? user) {
    if (!_isLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isLocked = _status == DailyPlayStatus.locked;
    final isWide = MediaQuery.of(context).size.width >= 900;
    final buttonLabel = switch (_status) {
      DailyPlayStatus.ready => 'start',
      DailyPlayStatus.inProgress => 'continue',
      DailyPlayStatus.locked => 'locked',
    };
    final leaderboardKey = ValueKey(
      'leaderboard-${user?.uid ?? 'guest'}-$_leaderboardRefreshTick',
    );
    final selectedLeaderboardTab =
        _selectedLeaderboardTab ??
        (user != null ? _LeaderboardTab.friends : _LeaderboardTab.global);
    final homeContent = _HomeHeroContent(
      buttonLabel: buttonLabel,
      scoreLabel: '$_score',
      isLocked: isLocked,
      onPlayPressed: _openChallenge,
      showLeaderboardBelowButton: !isWide,
      leaderboard: _LeaderboardCard(
        key: leaderboardKey,
        user: user,
        refreshToken: _leaderboardRefreshTick,
        onSignUpTap: () => _showAuthModal(isSignIn: false),
        selectedTab: selectedLeaderboardTab,
        onTabSelected: (_LeaderboardTab tab) {
          setState(() {
            _selectedLeaderboardTab = tab;
          });
        },
      ),
      onPortfolioTap: () async {
        await launchUrl(_portfolioUri, mode: LaunchMode.externalApplication);
      },
      onOriginalGameTap: () async {
        await launchUrl(_originalGameUri, mode: LaunchMode.externalApplication);
      },
    );

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final pageBody = Stack(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1180),
                    child: isWide
                        ? Row(
                            children: [
                              Expanded(flex: 11, child: homeContent),
                              const SizedBox(width: 40),
                              Expanded(
                                flex: 9,
                                child: _LeaderboardCard(
                                  key: leaderboardKey,
                                  user: user,
                                  refreshToken: _leaderboardRefreshTick,
                                  onSignUpTap: () =>
                                      _showAuthModal(isSignIn: false),
                                  selectedTab: selectedLeaderboardTab,
                                  onTabSelected: (_LeaderboardTab tab) {
                                    setState(() {
                                      _selectedLeaderboardTab = tab;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        : homeContent,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: _showAboutModal,
                    icon: const FaIcon(
                      FontAwesomeIcons.circleQuestion,
                      size: 22,
                    ),
                    tooltip: 'about',
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      if (user == null) {
                        _showAuthModal(isSignIn: false);
                        return;
                      }
                      _showProfileModal(user: user);
                    },
                    icon: const FaIcon(FontAwesomeIcons.circleUser, size: 22),
                    tooltip: 'account',
                  ),
                ),
              ],
            );

            if (isWide) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: SizedBox.expand(child: pageBody),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: SizedBox(width: double.infinity, child: pageBody),
            );
          },
        ),
      ),
    );
  }
}

class _HomeHeroContent extends StatelessWidget {
  const _HomeHeroContent({
    required this.buttonLabel,
    required this.scoreLabel,
    required this.isLocked,
    required this.onPlayPressed,
    required this.showLeaderboardBelowButton,
    required this.leaderboard,
    required this.onPortfolioTap,
    required this.onOriginalGameTap,
  });

  final String buttonLabel;
  final String scoreLabel;
  final bool isLocked;
  final VoidCallback onPlayPressed;
  final bool showLeaderboardBelowButton;
  final Widget leaderboard;
  final VoidCallback onPortfolioTap;
  final VoidCallback onOriginalGameTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final hasBoundedHeight = constraints.hasBoundedHeight;

        return Column(
          mainAxisSize: hasBoundedHeight ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasBoundedHeight)
              const Spacer()
            else
              const SizedBox(height: 24),
            const _AnimatedHomeIcon(),
            const SizedBox(height: 20),
            Text(
              'planarity',
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'untangle the graph',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 21),
            Text(
              'daily score',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              scoreLabel,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 21),
            OutlinedButton(
              onPressed: isLocked ? null : onPlayPressed,
              style: ButtonStyle(
                side: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: theme.colorScheme.onSurface.withOpacity(0.3),
                    );
                  }
                  return BorderSide(color: theme.colorScheme.onSurface);
                }),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return theme.colorScheme.onSurface.withOpacity(0.3);
                  }
                  return theme.colorScheme.onSurface;
                }),
              ),
              child: Text(
                buttonLabel,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (showLeaderboardBelowButton) ...[
              const SizedBox(height: 28),
              leaderboard,
            ],
            if (hasBoundedHeight)
              const Spacer()
            else
              const SizedBox(height: 24),
            Column(
              children: [
                InkWell(
                  onTap: onPortfolioTap,
                  child: Text(
                    '© nate wolfe',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.55),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: onOriginalGameTap,
                  child: Text(
                    'original by john tantalo',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.55),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _AuthDialogResult {
  const _AuthDialogResult({this.nextIsSignIn, this.userToEdit});

  final bool? nextIsSignIn;
  final User? userToEdit;
}

class _AuthSubmissionResult {
  const _AuthSubmissionResult({this.errorText, this.userToEdit});

  final String? errorText;
  final User? userToEdit;
}

class _ProfileDialogResult {
  const _ProfileDialogResult({
    required this.displayName,
    required this.shouldPersist,
    required this.signOutRequested,
  });

  final String displayName;
  final bool shouldPersist;
  final bool signOutRequested;
}

class _AuthDialog extends StatefulWidget {
  const _AuthDialog({
    required this.isSignIn,
    required this.onSubmit,
    required this.onGoogleSubmit,
  });

  final bool isSignIn;
  final Future<String?> Function({
    required bool isSignIn,
    required String email,
    required String password,
  })
  onSubmit;
  final Future<_AuthSubmissionResult> Function() onGoogleSubmit;

  @override
  State<_AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<_AuthDialog> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  String? _errorText;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _isSubmitting = true;
      _errorText = null;
    });

    final submitError = await widget.onSubmit(
      isSignIn: widget.isSignIn,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) {
      return;
    }

    if (submitError == null) {
      Navigator.of(context).pop(
        _AuthDialogResult(
          userToEdit: widget.isSignIn
              ? null
              : FirebaseAuth.instance.currentUser,
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = false;
      _errorText = submitError;
    });
  }

  Future<void> _submitGoogle() async {
    setState(() {
      _isSubmitting = true;
      _errorText = null;
    });

    final result = await widget.onGoogleSubmit();

    if (!mounted) {
      return;
    }

    if (result.errorText == null) {
      Navigator.of(
        context,
      ).pop(_AuthDialogResult(userToEdit: result.userToEdit));
      return;
    }

    setState(() {
      _isSubmitting = false;
      _errorText = result.errorText!.isEmpty ? null : result.errorText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actionLabel = widget.isSignIn ? 'sign in' : 'sign up';
    final subtitle = widget.isSignIn
        ? 'sign in with your email and password.'
        : 'create an account with your email and password.';
    final switchPrompt = widget.isSignIn ? 'new here?' : 'already signed up?';
    final switchAction = widget.isSignIn ? 'sign up' : 'sign in';

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: theme.colorScheme.onSurface.withOpacity(0.35)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                actionLabel,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.72),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                ),
                onSubmitted: _isSubmitting ? null : (_) async => _submit(),
              ),
              if (_errorText != null) ...[
                const SizedBox(height: 8),
                Text(
                  _errorText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.75),
                  ),
                ),
              ],
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(actionLabel),
                ),
              ),
              const SizedBox(height: 12),
              Divider(
                height: 1,
                color: theme.colorScheme.onSurface.withOpacity(0.25),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: IconButton.outlined(
                  onPressed: _isSubmitting ? null : _submitGoogle,
                  tooltip: 'continue with Google',
                  icon: const FaIcon(FontAwesomeIcons.google, size: 18),
                ),
              ),
              const SizedBox(height: 12),
              Divider(
                height: 1,
                color: theme.colorScheme.onSurface.withOpacity(0.25),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(switchPrompt, style: theme.textTheme.bodyMedium),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: _isSubmitting
                        ? null
                        : () {
                            Navigator.of(context).pop(
                              _AuthDialogResult(nextIsSignIn: !widget.isSignIn),
                            );
                          },
                    child: Text(switchAction),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileDialog extends StatefulWidget {
  const _ProfileDialog({
    required this.initialDisplayName,
    required this.initialFriendIds,
    required this.lifetimeScore,
    required this.loadFriends,
    required this.removeFriend,
    required this.buildInviteLink,
    required this.shareInvite,
  });

  final String initialDisplayName;
  final List<String> initialFriendIds;
  final int lifetimeScore;
  final Future<List<_FriendProfile>> Function(List<String> friendIds)
  loadFriends;
  final Future<void> Function(String friendUid) removeFriend;
  final String Function() buildInviteLink;
  final Future<void> Function(
    String inviteLink,
    bool isDark,
    Rect? sharePositionOrigin,
  )
  shareInvite;

  @override
  State<_ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<_ProfileDialog> {
  late final TextEditingController _displayNameController;
  late List<String> _friendIds;
  List<_FriendProfile> _friends = const <_FriendProfile>[];
  final Set<String> _removingFriendIds = <String>{};
  bool _friendsLoading = true;
  String? _displayNameErrorText;

  String get _initialDisplayNameTrimmed => widget.initialDisplayName.trim();

  String? _displayNameErrorForInput(String value) {
    if (value.trim() == _initialDisplayNameTrimmed) {
      return null;
    }
    return _displayNameValidationMessage(value);
  }

  void _updateDisplayNameValidation(String value) {
    final nextErrorText = _displayNameErrorForInput(value);
    if (_displayNameErrorText == nextErrorText) {
      return;
    }
    setState(() {
      _displayNameErrorText = nextErrorText;
    });
  }

  void _submitProfileDialog({
    required bool shouldPersist,
    required bool signOutRequested,
  }) {
    final errorText = _displayNameErrorForInput(_displayNameController.text);
    if (errorText != null) {
      setState(() {
        _displayNameErrorText = errorText;
      });
      return;
    }
    Navigator.of(context).pop(
      _ProfileDialogResult(
        displayName: _displayNameController.text,
        shouldPersist: shouldPersist,
        signOutRequested: signOutRequested,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _displayNameController = TextEditingController(
      text: widget.initialDisplayName,
    );
    _friendIds = List<String>.from(widget.initialFriendIds);
    _refreshFriends();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    super.dispose();
  }

  Future<void> _refreshFriends() async {
    setState(() {
      _friendsLoading = true;
    });
    final friends = await widget.loadFriends(_friendIds);
    if (!mounted) {
      return;
    }
    setState(() {
      _friends = friends;
      _friendIds = friends.map((friend) => friend.uid).toList(growable: false);
      _friendsLoading = false;
    });
  }

  Future<void> _removeFriend(_FriendProfile friend) async {
    final shouldRemove = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final theme = Theme.of(dialogContext);
        return Dialog(
          backgroundColor: theme.colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(
              color: theme.colorScheme.onSurface.withOpacity(0.35),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'remove friend',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'remove ${friend.displayName} from your friends list?',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(false),
                        child: const Text('cancel'),
                      ),
                      const SizedBox(width: 8),
                      FilledButton(
                        onPressed: () => Navigator.of(dialogContext).pop(true),
                        child: const Text('remove'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    if (shouldRemove != true || !mounted) {
      return;
    }

    setState(() {
      _removingFriendIds.add(friend.uid);
    });
    try {
      await widget.removeFriend(friend.uid);
      if (!mounted) {
        return;
      }
      _friendIds = _friendIds.where((uid) => uid != friend.uid).toList();
      await _refreshFriends();
    } finally {
      if (mounted) {
        setState(() {
          _removingFriendIds.remove(friend.uid);
        });
      }
    }
  }

  Future<void> _showInviteDialog() async {
    final inviteLink = widget.buildInviteLink();
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return _FriendInviteDialog(
          inviteLink: inviteLink,
          shareInvite: widget.shareInvite,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: theme.colorScheme.onSurface.withOpacity(0.35)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'profile',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'update how your name appears in your profile.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.72),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _displayNameController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'display name',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  errorText: _displayNameErrorText,
                ),
                onChanged: _updateDisplayNameValidation,
                onSubmitted: (_) => _submitProfileDialog(
                  shouldPersist: true,
                  signOutRequested: false,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'lifetime score',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${widget.lifetimeScore}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'friends',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: _showInviteDialog,
                    icon: const FaIcon(FontAwesomeIcons.userPlus, size: 14),
                    label: const Text('invite'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_friendsLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (_friends.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withOpacity(0.22),
                    ),
                  ),
                  child: Text(
                    "you haven't added any friends yet.",
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              else
                ..._friends.map((friend) {
                  final isRemoving = _removingFriendIds.contains(friend.uid);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.onSurface.withOpacity(0.22),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friend.displayName,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'lifetime score ${friend.lifetimeScore}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        IconButton(
                          onPressed: isRemoving
                              ? null
                              : () => _removeFriend(friend),
                          tooltip: 'remove friend',
                          icon: isRemoving
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const FaIcon(
                                  FontAwesomeIcons.userMinus,
                                  size: 14,
                                ),
                        ),
                      ],
                    ),
                  );
                }),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => _submitProfileDialog(
                    shouldPersist: false,
                    signOutRequested: true,
                  ),
                  child: const Text('sign out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FriendInviteDialog extends StatelessWidget {
  const _FriendInviteDialog({
    required this.inviteLink,
    required this.shareInvite,
  });

  final String inviteLink;
  final Future<void> Function(
    String inviteLink,
    bool isDark,
    Rect? sharePositionOrigin,
  )
  shareInvite;

  Future<void> _copyInviteLink(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: inviteLink));
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Invite link copied')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: theme.colorScheme.onSurface.withOpacity(0.35)),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'invite',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (buttonContext) {
                      return IconButton(
                        onPressed: () async {
                          await shareInvite(
                            inviteLink,
                            theme.brightness == Brightness.dark,
                            _sharePositionOriginForContext(buttonContext),
                          );
                        },
                        tooltip: 'share',
                        icon: const FaIcon(
                          FontAwesomeIcons.shareNodes,
                          size: 18,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'share this QR code or link to invite a friend',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.72),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withOpacity(0.22),
                    ),
                  ),
                  child: QrImageView(
                    data: inviteLink,
                    size: 220,
                    backgroundColor: theme.colorScheme.surface,
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: theme.colorScheme.onSurface,
                    ),
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.onSurface.withOpacity(0.22),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SelectableText(
                        inviteLink,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => _copyInviteLink(context),
                      tooltip: 'copy invite link',
                      icon: const FaIcon(FontAwesomeIcons.copy, size: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FriendProfile {
  const _FriendProfile({
    required this.uid,
    required this.displayName,
    required this.lifetimeScore,
  });

  final String uid;
  final String displayName;
  final int lifetimeScore;
}

class _FriendAddResult {
  const _FriendAddResult({required this.message});

  final String message;
}

String _leaderboardTodayKey() {
  final now = DateTime.now();
  final year = now.year.toString().padLeft(4, '0');
  final month = now.month.toString().padLeft(2, '0');
  final day = now.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

String? _leaderboardDisplayNameFromData(Map<String, dynamic>? profileData) {
  final profileDisplayName = profileData?['displayName'];
  if (profileDisplayName is String && profileDisplayName.trim().isNotEmpty) {
    return profileDisplayName.trim();
  }
  return null;
}

final RegExp _displayNameEmailPattern = RegExp(
  r'^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$',
  caseSensitive: false,
);

final RegExp _displayNamePhonePattern = RegExp(
  r'^(?:\+?\d{1,3}[\s.-]*)?(?:\(\d{3}\)|\d{3})[\s.-]*\d{3}[\s.-]*\d{4}$',
);

final RegExp _displayNameUrlPattern = RegExp(
  r'^(?:(?:https?:\/\/)|(?:www\.))[^\s/$.?#].[^\s]*$',
  caseSensitive: false,
);

String? _displayNameValidationMessage(String displayName) {
  final trimmed = displayName.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  if (_displayNameEmailPattern.hasMatch(trimmed) ||
      _displayNamePhonePattern.hasMatch(trimmed) ||
      _displayNameUrlPattern.hasMatch(trimmed)) {
    return 'invalid name - try something else';
  }
  return null;
}

List<String> _leaderboardFriendIds(Map<String, dynamic>? profileData) {
  final rawFriends = profileData?['friends'];
  if (rawFriends is! List) {
    return const <String>[];
  }

  final seen = <String>{};
  final friends = <String>[];
  for (final value in rawFriends) {
    if (value is! String) {
      continue;
    }
    final trimmed = value.trim();
    if (trimmed.isEmpty || !seen.add(trimmed)) {
      continue;
    }
    friends.add(trimmed);
  }
  return friends;
}

List<List<String>> _chunkedLeaderboardFriendIds(
  List<String> friendIds, {
  int chunkSize = 10,
}) {
  if (friendIds.isEmpty) {
    return const <List<String>>[];
  }

  final sortedIds = List<String>.from(friendIds)..sort();
  final chunks = <List<String>>[];
  for (var index = 0; index < sortedIds.length; index += chunkSize) {
    final end = min(index + chunkSize, sortedIds.length);
    chunks.add(sortedIds.sublist(index, end));
  }
  return chunks;
}

int _leaderboardScoreFromData(Map<String, dynamic>? profileData) {
  final playedToday = profileData?['lastPlayed'] == _leaderboardTodayKey();
  if (!playedToday) {
    return 0;
  }
  return _leaderboardRawScoreFromData(profileData);
}

int _leaderboardRawScoreFromData(Map<String, dynamic>? profileData) {
  final score = profileData?['score'];
  if (score is int) {
    return max(0, score);
  }
  if (score is num) {
    return max(0, score.toInt());
  }
  return 0;
}

bool _leaderboardLockedFromData(Map<String, dynamic>? profileData) {
  final locked = profileData?['locked'];
  if (locked is bool) {
    return locked;
  }
  return false;
}

enum _LeaderboardTab { friends, global }

class _LeaderboardCard extends StatelessWidget {
  const _LeaderboardCard({
    super.key,
    this.user,
    required this.refreshToken,
    required this.onSignUpTap,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final User? user;
  final int refreshToken;
  final VoidCallback onSignUpTap;
  final _LeaderboardTab selectedTab;
  final ValueChanged<_LeaderboardTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 420),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onSurface.withOpacity(0.22),
        ),
      ),
      child: _LeaderboardCardContents(
        user: user,
        refreshToken: refreshToken,
        onSignUpTap: onSignUpTap,
        selectedTab: selectedTab,
        onTabSelected: onTabSelected,
      ),
    );
  }
}

class _LeaderboardCardContents extends StatelessWidget {
  const _LeaderboardCardContents({
    required this.user,
    required this.refreshToken,
    required this.onSignUpTap,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final User? user;
  final int refreshToken;
  final VoidCallback onSignUpTap;
  final _LeaderboardTab selectedTab;
  final ValueChanged<_LeaderboardTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'leaderboard',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _LeaderboardTabButton(
                label: 'friends',
                selected: selectedTab == _LeaderboardTab.friends,
                enabled: true,
                onPressed: () => onTabSelected(_LeaderboardTab.friends),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _LeaderboardTabButton(
                label: 'global',
                selected: selectedTab == _LeaderboardTab.global,
                enabled: true,
                onPressed: () => onTabSelected(_LeaderboardTab.global),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 160),
          child: selectedTab == _LeaderboardTab.friends
              ? _FriendsLeaderboardView(
                  key: ValueKey('friends-$refreshToken'),
                  user: user,
                  refreshToken: refreshToken,
                  onSignUpTap: onSignUpTap,
                )
              : _GlobalLeaderboardView(
                  key: const ValueKey('global'),
                  user: user,
                ),
        ),
      ],
    );
  }
}

class _LeaderboardTabButton extends StatelessWidget {
  const _LeaderboardTabButton({
    required this.label,
    required this.selected,
    required this.enabled,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSurface;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: selected ? color : Colors.transparent,
        foregroundColor: selected ? theme.colorScheme.surface : color,
        side: BorderSide(color: enabled ? color : color.withOpacity(0.24)),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          color: enabled
              ? (selected ? theme.colorScheme.surface : color)
              : color.withOpacity(0.3),
        ),
      ),
    );
  }
}

class _FriendsLeaderboardView extends StatefulWidget {
  const _FriendsLeaderboardView({
    super.key,
    required this.user,
    required this.refreshToken,
    required this.onSignUpTap,
  });

  final User? user;
  final int refreshToken;
  final VoidCallback onSignUpTap;

  @override
  State<_FriendsLeaderboardView> createState() =>
      _FriendsLeaderboardViewState();
}

class _FriendsLeaderboardViewState extends State<_FriendsLeaderboardView> {
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userSubscription;
  final Map<String, StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>
  _friendQuerySubscriptions =
      <String, StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>{};
  Map<String, dynamic>? _userProfileData;
  final Map<String, Map<String, dynamic>?> _friendProfileData =
      <String, Map<String, dynamic>?>{};
  Object? _loadError;
  bool _isLoading = true;

  User? get _user => widget.user;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  @override
  void didUpdateWidget(covariant _FriendsLeaderboardView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.user?.uid != widget.user?.uid ||
        oldWidget.refreshToken != widget.refreshToken) {
      _startListening();
    }
  }

  @override
  void dispose() {
    _cancelAllSubscriptions();
    super.dispose();
  }

  void _cancelAllSubscriptions() {
    _userSubscription?.cancel();
    _userSubscription = null;
    for (final subscription in _friendQuerySubscriptions.values) {
      subscription.cancel();
    }
    _friendQuerySubscriptions.clear();
  }

  void _startListening() {
    _cancelAllSubscriptions();
    if (mounted) {
      setState(() {
        _userProfileData = null;
        _friendProfileData.clear();
        _loadError = null;
        _isLoading = true;
      });
    } else {
      _userProfileData = null;
      _friendProfileData.clear();
      _loadError = null;
      _isLoading = true;
    }

    final user = _user;
    if (user == null) {
      if (mounted) {
        setState(() {});
      }
      return;
    }

    final users = FirebaseFirestore.instance.collection('users');
    _userSubscription = users
        .doc(user.uid)
        .snapshots()
        .listen(
          (snapshot) {
            _userProfileData = snapshot.data();
            _loadError = null;
            _syncFriendSubscriptions(_leaderboardFriendIds(_userProfileData));
            _publishLeaderboard();
          },
          onError: (Object error) {
            if (!mounted) {
              return;
            }
            setState(() {
              _loadError = error;
              _isLoading = false;
            });
          },
        );
  }

  void _syncFriendSubscriptions(List<String> friendIds) {
    final users = FirebaseFirestore.instance.collection('users');
    final friendChunks = _chunkedLeaderboardFriendIds(friendIds);
    final nextChunkKeys = friendChunks
        .map((chunk) => chunk.join('\u0000'))
        .toSet();
    final currentChunkKeys = _friendQuerySubscriptions.keys.toSet();

    for (final removedChunkKey in currentChunkKeys.difference(nextChunkKeys)) {
      _friendQuerySubscriptions.remove(removedChunkKey)?.cancel();
      for (final friendId in removedChunkKey.split('\u0000')) {
        _friendProfileData.remove(friendId);
      }
    }

    for (final chunk in friendChunks) {
      final chunkKey = chunk.join('\u0000');
      if (_friendQuerySubscriptions.containsKey(chunkKey)) {
        continue;
      }

      _friendQuerySubscriptions[chunkKey] = users
          .where(FieldPath.documentId, whereIn: chunk)
          .snapshots()
          .listen(
            (snapshot) {
              for (final friendId in chunk) {
                _friendProfileData[friendId] = null;
              }
              for (final doc in snapshot.docs) {
                _friendProfileData[doc.id] = doc.data();
              }
              _loadError = null;
              _publishLeaderboard();
            },
            onError: (Object error) {
              if (!mounted) {
                return;
              }
              setState(() {
                _loadError = error;
                _isLoading = false;
              });
            },
          );
    }
  }

  void _publishLeaderboard() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signedInUser = widget.user;

    if (signedInUser == null) {
      final messageStyle = theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface.withOpacity(0.72),
      );
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          InkWell(
            onTap: widget.onSignUpTap,
            child: Text(
              'sign up',
              style: messageStyle?.copyWith(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(' to compete with your friends', style: messageStyle),
        ],
      );
    }

    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_loadError != null) {
      return Text(
        'unable to load friends leaderboard right now',
        style: theme.textTheme.bodyMedium,
      );
    }

    final entries = _buildFriendsLeaderboardEntries(
      user: signedInUser,
      userProfileData: _userProfileData,
      friendProfileData: _friendProfileData,
    );
    if (entries.length <= 1) {
      return Text(
        "you haven't added any friends yet. open your profile to invite someone.",
        style: theme.textTheme.bodyMedium,
      );
    }

    return _LeaderboardTable(
      entries: entries,
      subtitle: 'you and your friends',
    );
  }
}

List<_LeaderboardEntry> _buildFriendsLeaderboardEntries({
  required User user,
  required Map<String, dynamic>? userProfileData,
  required Map<String, Map<String, dynamic>?> friendProfileData,
}) {
  final friendIds = _leaderboardFriendIds(userProfileData);
  if (friendIds.isEmpty) {
    return _friendsEntriesFor(user);
  }

  final standings = <_LeaderboardStanding>[
    _LeaderboardStanding(
      uid: user.uid,
      name:
          _leaderboardDisplayNameFromData(userProfileData) ??
          _displayNameForUser(user),
      score: _leaderboardScoreFromData(userProfileData),
      isLocked: _leaderboardLockedFromData(userProfileData),
      isCurrentUser: true,
    ),
  ];

  for (final friendId in friendIds) {
    final friendData = friendProfileData[friendId];
    if (friendData == null) {
      continue;
    }
    standings.add(
      _LeaderboardStanding(
        uid: friendId,
        name: _leaderboardDisplayNameFromData(friendData) ?? 'anonymous player',
        score: _leaderboardScoreFromData(friendData),
        isLocked: _leaderboardLockedFromData(friendData),
        isCurrentUser: false,
      ),
    );
  }

  standings.sort((_LeaderboardStanding a, _LeaderboardStanding b) {
    final byScore = b.score.compareTo(a.score);
    if (byScore != 0) {
      return byScore;
    }
    final byName = a.name.toLowerCase().compareTo(b.name.toLowerCase());
    if (byName != 0) {
      return byName;
    }
    return a.uid.compareTo(b.uid);
  });

  return [
    for (var index = 0; index < standings.length; index += 1)
      _LeaderboardEntry(
        rank: index + 1,
        name: standings[index].name,
        score: standings[index].score,
        isLocked: standings[index].isLocked,
        isCurrentUser: standings[index].isCurrentUser,
      ),
  ];
}

class _GlobalLeaderboardView extends StatefulWidget {
  const _GlobalLeaderboardView({super.key, required this.user});

  final User? user;

  @override
  State<_GlobalLeaderboardView> createState() => _GlobalLeaderboardViewState();
}

class _GlobalLeaderboardViewState extends State<_GlobalLeaderboardView> {
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _topSubscription;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userSubscription;
  final Map<String, StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>
  _friendQuerySubscriptions =
      <String, StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>{};
  final Map<String, Map<String, dynamic>?> _friendProfileData =
      <String, Map<String, dynamic>?>{};
  final Map<String, int> _globalRanks = <String, int>{};
  final Map<String, Map<String, dynamic>> _topProfileData =
      <String, Map<String, dynamic>>{};
  List<String> _topUserIds = const <String>[];
  Map<String, dynamic>? _userProfileData;
  Object? _loadError;
  bool _isLoading = true;
  int _rankRefreshVersion = 0;

  User? get _user => widget.user;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  @override
  void didUpdateWidget(covariant _GlobalLeaderboardView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.user?.uid != widget.user?.uid) {
      _startListening();
    }
  }

  @override
  void dispose() {
    _cancelAllSubscriptions();
    super.dispose();
  }

  void _cancelAllSubscriptions() {
    _topSubscription?.cancel();
    _topSubscription = null;
    _userSubscription?.cancel();
    _userSubscription = null;
    for (final subscription in _friendQuerySubscriptions.values) {
      subscription.cancel();
    }
    _friendQuerySubscriptions.clear();
  }

  void _startListening() {
    _cancelAllSubscriptions();
    if (mounted) {
      setState(() {
        _topUserIds = const <String>[];
        _topProfileData.clear();
        _userProfileData = null;
        _friendProfileData.clear();
        _globalRanks.clear();
        _loadError = null;
        _isLoading = true;
      });
    } else {
      _topUserIds = const <String>[];
      _topProfileData.clear();
      _userProfileData = null;
      _friendProfileData.clear();
      _globalRanks.clear();
      _loadError = null;
      _isLoading = true;
    }

    final users = FirebaseFirestore.instance.collection('users');
    _topSubscription = users
        .where('lastPlayed', isEqualTo: _leaderboardTodayKey())
        .orderBy('score', descending: true)
        .limit(3)
        .snapshots()
        .listen(
          (snapshot) {
            _topUserIds = snapshot.docs
                .map((doc) => doc.id)
                .toList(growable: false);
            _topProfileData
              ..clear()
              ..addEntries(
                snapshot.docs.map((doc) => MapEntry(doc.id, doc.data())),
              );
            _loadError = null;
            _publishLeaderboard();
          },
          onError: (Object error) {
            debugPrint('Global leaderboard top query failed: $error');
            if (!mounted) {
              return;
            }
            setState(() {
              _loadError = error;
              _isLoading = false;
            });
          },
        );

    final user = _user;
    if (user == null) {
      return;
    }

    _userSubscription = users
        .doc(user.uid)
        .snapshots()
        .listen(
          (snapshot) {
            _userProfileData = snapshot.data();
            _loadError = null;
            _syncFriendSubscriptions(_leaderboardFriendIds(_userProfileData));
            _publishLeaderboard();
          },
          onError: (Object error) {
            debugPrint('Global leaderboard user query failed: $error');
            if (!mounted) {
              return;
            }
            setState(() {
              _loadError = error;
              _isLoading = false;
            });
          },
        );
  }

  void _syncFriendSubscriptions(List<String> friendIds) {
    final users = FirebaseFirestore.instance.collection('users');
    final friendChunks = _chunkedLeaderboardFriendIds(friendIds);
    final nextChunkKeys = friendChunks
        .map((chunk) => chunk.join('\u0000'))
        .toSet();
    final currentChunkKeys = _friendQuerySubscriptions.keys.toSet();

    for (final removedChunkKey in currentChunkKeys.difference(nextChunkKeys)) {
      _friendQuerySubscriptions.remove(removedChunkKey)?.cancel();
      for (final friendId in removedChunkKey.split('\u0000')) {
        _friendProfileData.remove(friendId);
      }
    }

    for (final chunk in friendChunks) {
      final chunkKey = chunk.join('\u0000');
      if (_friendQuerySubscriptions.containsKey(chunkKey)) {
        continue;
      }

      _friendQuerySubscriptions[chunkKey] = users
          .where(FieldPath.documentId, whereIn: chunk)
          .snapshots()
          .listen(
            (snapshot) {
              for (final friendId in chunk) {
                _friendProfileData[friendId] = null;
              }
              for (final doc in snapshot.docs) {
                _friendProfileData[doc.id] = doc.data();
              }
              _loadError = null;
              _publishLeaderboard();
            },
            onError: (Object error) {
              debugPrint('Global leaderboard friend query failed: $error');
              if (!mounted) {
                return;
              }
              setState(() {
                _loadError = error;
                _isLoading = false;
              });
            },
          );
    }
  }

  List<_LeaderboardStanding> _selectedStandings() {
    final standingsByUid = <String, _LeaderboardStanding>{};

    for (final uid in _topUserIds) {
      final profileData = _topProfileData[uid];
      if (profileData == null) {
        continue;
      }
      standingsByUid[uid] = _LeaderboardStanding(
        uid: uid,
        name:
            _leaderboardDisplayNameFromData(profileData) ?? 'anonymous player',
        score: _leaderboardScoreFromData(profileData),
        isLocked: _leaderboardLockedFromData(profileData),
        isCurrentUser: uid == _user?.uid,
      );
    }

    final user = _user;
    if (user != null) {
      standingsByUid[user.uid] = _LeaderboardStanding(
        uid: user.uid,
        name:
            _leaderboardDisplayNameFromData(_userProfileData) ??
            _displayNameForUser(user),
        score: _leaderboardScoreFromData(_userProfileData),
        isLocked: _leaderboardLockedFromData(_userProfileData),
        isCurrentUser: true,
      );

      for (final friendId in _leaderboardFriendIds(_userProfileData)) {
        final friendData = _friendProfileData[friendId];
        if (friendData == null) {
          continue;
        }
        standingsByUid[friendId] = _LeaderboardStanding(
          uid: friendId,
          name:
              _leaderboardDisplayNameFromData(friendData) ?? 'anonymous player',
          score: _leaderboardScoreFromData(friendData),
          isLocked: _leaderboardLockedFromData(friendData),
          isCurrentUser: false,
        );
      }
    }

    final standings = standingsByUid.values.toList(growable: false);
    standings.sort((_LeaderboardStanding a, _LeaderboardStanding b) {
      final rankA = _globalRanks[a.uid];
      final rankB = _globalRanks[b.uid];
      if (rankA != null && rankB != null && rankA != rankB) {
        return rankA.compareTo(rankB);
      }
      final byScore = b.score.compareTo(a.score);
      if (byScore != 0) {
        return byScore;
      }
      if (a.isCurrentUser != b.isCurrentUser) {
        return a.isCurrentUser ? -1 : 1;
      }
      final byName = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      if (byName != 0) {
        return byName;
      }
      return a.uid.compareTo(b.uid);
    });
    return standings;
  }

  Future<void> _refreshGlobalRanks() async {
    final standings = _selectedStandings();
    if (standings.isEmpty) {
      if (!mounted) {
        return;
      }
      setState(() {
        _globalRanks.clear();
      });
      return;
    }

    final requestVersion = ++_rankRefreshVersion;
    final users = FirebaseFirestore.instance.collection('users');
    final distinctScores =
        standings.map((entry) => entry.score).toSet().toList()
          ..sort((a, b) => b.compareTo(a));
    final ranksByScore = <int, int>{};

    try {
      await Future.wait(
        distinctScores.map((score) async {
          final aggregateSnapshot = await users
              .where('lastPlayed', isEqualTo: _leaderboardTodayKey())
              .where('score', isGreaterThan: score)
              .count()
              .get();
          ranksByScore[score] = (aggregateSnapshot.count ?? 0) + 1;
        }),
      );
    } catch (error) {
      debugPrint('Global leaderboard rank query failed: $error');
      if (!mounted || requestVersion != _rankRefreshVersion) {
        return;
      }
      setState(() {
        _loadError = error;
        _isLoading = false;
      });
      return;
    }

    if (!mounted || requestVersion != _rankRefreshVersion) {
      return;
    }

    setState(() {
      _globalRanks
        ..clear()
        ..addEntries(
          standings.map(
            (entry) => MapEntry(entry.uid, ranksByScore[entry.score] ?? 1),
          ),
        );
      _isLoading = false;
    });
  }

  void _publishLeaderboard() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = false;
    });
    unawaited(_refreshGlobalRanks());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final standings = _selectedStandings();
    final entries = standings
        .map(
          (standing) => _LeaderboardEntry(
            rank: _globalRanks[standing.uid] ?? 0,
            name: standing.name,
            score: standing.score,
            isLocked: standing.isLocked,
            isCurrentUser: standing.isCurrentUser,
          ),
        )
        .toList(growable: false);
    _LeaderboardStanding? topStanding;
    if (_topUserIds.isNotEmpty) {
      final topUserId = _topUserIds.first;
      for (final standing in standings) {
        if (standing.uid == topUserId) {
          topStanding = standing;
          break;
        }
      }
    }

    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_loadError != null) {
      final errorDetail = _loadError.toString().trim();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'unable to load global leaderboard right now',
            style: theme.textTheme.bodyMedium,
          ),
          if (errorDetail.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              errorDetail,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.72),
              ),
            ),
          ],
        ],
      );
    }

    if (topStanding == null || entries.isEmpty) {
      return Text('no global scores yet.', style: theme.textTheme.bodyMedium);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _LeaderboardMetric(
          label: 'global top score',
          value: '${topStanding.score}',
          detail: topStanding.name,
        ),
        const SizedBox(height: 14),
        _LeaderboardTable(
          entries: entries,
          subtitle: _user == null ? 'global snapshot' : 'your global position',
        ),
      ],
    );
  }
}

class _LeaderboardMetric extends StatelessWidget {
  const _LeaderboardMetric({
    required this.label,
    required this.value,
    required this.detail,
  });

  final String label;
  final String value;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          detail,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.72),
          ),
        ),
      ],
    );
  }
}

class _LeaderboardTable extends StatelessWidget {
  const _LeaderboardTable({required this.entries, required this.subtitle});

  final List<_LeaderboardEntry> entries;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 10),
        ...entries.map((entry) {
          final isCurrentUser = entry.isCurrentUser;
          final rowBackground = isCurrentUser
              ? theme.colorScheme.onSurface
              : Colors.transparent;
          final rowForeground = isCurrentUser
              ? theme.colorScheme.surface
              : theme.colorScheme.onSurface;

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(
              color: rowBackground,
              border: Border.all(
                color: isCurrentUser
                    ? theme.colorScheme.onSurface
                    : theme.colorScheme.onSurface.withOpacity(0.16),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 34,
                  child: Text(
                    '#${entry.rank}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isCurrentUser
                          ? rowForeground
                          : theme.colorScheme.onSurface.withOpacity(0.75),
                      fontWeight: isCurrentUser
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    entry.name,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: rowForeground,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (entry.isLocked) ...[
                      FaIcon(
                        FontAwesomeIcons.lock,
                        size: 12,
                        color: rowForeground,
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      '${entry.score}',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: rowForeground,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _LeaderboardEntry {
  const _LeaderboardEntry({
    required this.rank,
    required this.name,
    required this.score,
    this.isLocked = false,
    this.isCurrentUser = false,
  });

  final int rank;
  final String name;
  final int score;
  final bool isLocked;
  final bool isCurrentUser;
}

class _LeaderboardStanding {
  const _LeaderboardStanding({
    required this.uid,
    required this.name,
    required this.score,
    required this.isLocked,
    required this.isCurrentUser,
  });

  final String uid;
  final String name;
  final int score;
  final bool isLocked;
  final bool isCurrentUser;
}

List<_LeaderboardEntry> _friendsEntriesFor(User user) {
  return [
    _LeaderboardEntry(
      rank: 1,
      name: _displayNameForUser(user),
      score: 0,
      isLocked: false,
      isCurrentUser: true,
    ),
  ];
}

String _displayNameForUser(User user) {
  final displayName = user.displayName?.trim();
  if (displayName != null && displayName.isNotEmpty) {
    return displayName.toLowerCase();
  }
  final email = user.email?.trim().toLowerCase();
  if (email != null && email.isNotEmpty) {
    return email.split('@').first;
  }
  return 'you';
}

class PlanarityGamePage extends StatefulWidget {
  const PlanarityGamePage({
    super.key,
    required this.dayKey,
    required this.startLevel,
    required this.startScore,
  });

  final String dayKey;
  final int startLevel;
  final int startScore;

  @override
  State<PlanarityGamePage> createState() => _PlanarityGamePageState();
}

class _PlanarityGamePageState extends State<PlanarityGamePage> {
  static const _androidDebugInterstitialAdUnitId =
      'ca-app-pub-3940256099942544/1033173712';
  static const _iosDebugInterstitialAdUnitId =
      'ca-app-pub-3940256099942544/4411468910';
  static const _androidInterstitialAdUnitId =
      'ca-app-pub-1627227368495179/5369521604';
  static const _iosInterstitialAdUnitId =
      'ca-app-pub-1627227368495179/5468865000';

  late int _level;
  late int _totalScore;
  late PlanarityLevel _current;
  int _movesUsed = 0;
  int? _activeNode;
  Offset? _dragStart;
  bool _resolvingLevel = false;
  Size? _lastBoardSize;
  bool _needsCentering = true;
  bool _recenterScheduled = false;
  InterstitialAd? _interstitialAd;
  bool _interstitialAdLoading = false;

  @override
  void initState() {
    super.initState();
    _level = widget.startLevel;
    _totalScore = widget.startScore;
    _current = PlanarityGenerator.generate(
      dayKey: widget.dayKey,
      level: _level,
    );
    unawaited(_logLevelStartEvent(_level));
    _loadInterstitialAd();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _startNextLevel() {
    setState(() {
      _level += 1;
      _movesUsed = 0;
      _activeNode = null;
      _dragStart = null;
      _current = PlanarityGenerator.generate(
        dayKey: widget.dayKey,
        level: _level,
      );
      _needsCentering = true;
    });
    unawaited(_logLevelStartEvent(_level));
  }

  String? get _interstitialAdUnitId {
    if (!_supportsMobileAds) {
      return null;
    }

    return switch (defaultTargetPlatform) {
      TargetPlatform.android =>
        kDebugMode
            ? _androidDebugInterstitialAdUnitId
            : _androidInterstitialAdUnitId,
      TargetPlatform.iOS =>
        kDebugMode ? _iosDebugInterstitialAdUnitId : _iosInterstitialAdUnitId,
      _ => null,
    };
  }

  bool get _shouldShowInterstitialForCurrentLevel => _level % 3 == 0;

  void _loadInterstitialAd() {
    final adUnitId = _interstitialAdUnitId;
    if (adUnitId == null || _interstitialAdLoading || _interstitialAd != null) {
      return;
    }

    _interstitialAdLoading = true;
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAdLoading = false;
          _interstitialAd?.dispose();
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialAdLoading = false;
          _interstitialAd = null;
          debugPrint('Interstitial ad failed to load: $error');
        },
      ),
    );
  }

  Future<void> _showInterstitialAdIfNeeded() async {
    if (!_shouldShowInterstitialForCurrentLevel) {
      return;
    }

    final ad = _interstitialAd;
    if (ad == null) {
      _loadInterstitialAd();
      return;
    }

    final completer = Completer<void>();

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        if (identical(_interstitialAd, ad)) {
          _interstitialAd = null;
        }
        _loadInterstitialAd();
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('Interstitial ad failed to show: $error');
        ad.dispose();
        if (identical(_interstitialAd, ad)) {
          _interstitialAd = null;
        }
        _loadInterstitialAd();
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
    );

    _interstitialAd = null;
    ad.show();
    await completer.future;
  }

  void _failRun() {
    Navigator.of(context).pop(
      GameSessionResult(
        dayKey: widget.dayKey,
        score: _totalScore,
        level: _level,
        locked: true,
      ),
    );
  }

  void _exitToHome({int? level}) {
    Navigator.of(context).pop(
      GameSessionResult(
        dayKey: widget.dayKey,
        score: _totalScore,
        level: level ?? _level,
        locked: false,
      ),
    );
  }

  bool _isSolved() => _countCrossings(_current.nodes, _current.edges) == 0;

  void _onPanStart(int index, DragStartDetails details) {
    if (_resolvingLevel) {
      return;
    }
    _activeNode = index;
    _dragStart = _current.nodes[index];
  }

  void _onPanUpdate(int index, DragUpdateDetails details, Size boardSize) {
    if (_activeNode != index || _resolvingLevel) {
      return;
    }

    final raw = _current.nodes[index] + details.delta;
    final clamped = Offset(
      raw.dx.clamp(20.0, boardSize.width - 20.0),
      raw.dy.clamp(20.0, boardSize.height - 20.0),
    );

    setState(() {
      _current.nodes[index] = clamped;
    });
  }

  Future<void> _onPanEnd(int index) async {
    if (_activeNode != index || _dragStart == null) {
      _activeNode = null;
      _dragStart = null;
      return;
    }

    final moved = (_current.nodes[index] - _dragStart!).distance > 0.5;
    _activeNode = null;
    _dragStart = null;

    if (!moved) {
      return;
    }

    setState(() {
      _movesUsed += 1;
    });

    if (_isSolved()) {
      if (_resolvingLevel) {
        return;
      }
      _resolvingLevel = true;
      final levelScore = scoreForSolvedLevel(
        level: _level,
        movesUsed: _movesUsed,
      );
      setState(() {
        _totalScore += levelScore;
      });
      await _logLevelEndEvent(level: _level, success: true);
      await _logLevelUpEvent(_level + 1);
      final solvedNodes = List<Offset>.from(_current.nodes);
      final solvedEdges = List<Edge>.from(_current.edges);
      await _showInterstitialAdIfNeeded();
      final proceed = await _showCompletionModal(
        solved: true,
        totalMoves: _level,
        movesUsed: _movesUsed,
        totalScore: _totalScore,
        nodes: solvedNodes,
        edges: solvedEdges,
      );
      _resolvingLevel = false;
      if (!mounted) {
        return;
      }
      if (!proceed) {
        _exitToHome(level: _level + 1);
        return;
      }
      _startNextLevel();
      return;
    }

    if (_movesUsed >= _level) {
      if (_resolvingLevel) {
        return;
      }
      _resolvingLevel = true;
      await _logLevelEndEvent(level: _level, success: false);
      final finalNodes = List<Offset>.from(_current.nodes);
      final finalEdges = List<Edge>.from(_current.edges);
      await _showCompletionModal(
        solved: false,
        totalMoves: _level,
        movesUsed: _movesUsed,
        totalScore: _totalScore,
        nodes: finalNodes,
        edges: finalEdges,
      );
      _resolvingLevel = false;
      if (!mounted) {
        return;
      }
      _failRun();
    }
  }

  @override
  Widget build(BuildContext context) {
    final crossingEdges = _findIntersectingEdges(
      _current.nodes,
      _current.edges,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: _exitToHome,
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          size: 18,
                        ),
                        tooltip: 'back',
                      ),
                    ),
                    Text(
                      'planarity',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6,
                          ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          '$_totalScore',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'untangle the graph',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.75),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _MoveDots(
                    totalMoves: _level,
                    movesUsed: _movesUsed,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Divider(height: 1, color: Theme.of(context).dividerColor),
              const SizedBox(height: 12),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final boardSize = Size(
                      constraints.maxWidth,
                      constraints.maxHeight,
                    );
                    _maybeRecenterForBoard(boardSize);

                    return Stack(
                      children: [
                        CustomPaint(
                          size: boardSize,
                          painter: GraphPainter(
                            nodes: _current.nodes,
                            edges: _current.edges,
                            intersectingEdges: crossingEdges,
                            isDark:
                                Theme.of(context).brightness == Brightness.dark,
                          ),
                        ),
                        ...List.generate(_current.nodes.length, (index) {
                          final position = _current.nodes[index];
                          return Positioned(
                            left: position.dx - 10,
                            top: position.dy - 10,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onPanStart: (details) =>
                                  _onPanStart(index, details),
                              onPanUpdate: (details) =>
                                  _onPanUpdate(index, details, boardSize),
                              onPanEnd: (_) {
                                _onPanEnd(index);
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _maybeRecenterForBoard(Size boardSize) {
    final sizeChanged =
        _lastBoardSize == null ||
        (_lastBoardSize!.width - boardSize.width).abs() > 0.5 ||
        (_lastBoardSize!.height - boardSize.height).abs() > 0.5;
    if (!_needsCentering && !sizeChanged) {
      return;
    }
    if (_recenterScheduled) {
      return;
    }
    _recenterScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        _recenterScheduled = false;
        return;
      }
      setState(() {
        _centerNodesInBoard(boardSize);
        _lastBoardSize = boardSize;
        _needsCentering = false;
        _recenterScheduled = false;
      });
    });
  }

  void _centerNodesInBoard(Size boardSize) {
    if (_current.nodes.isEmpty) {
      return;
    }

    const padding = 20.0;
    double minX = _current.nodes.first.dx;
    double maxX = _current.nodes.first.dx;
    double minY = _current.nodes.first.dy;
    double maxY = _current.nodes.first.dy;
    for (final node in _current.nodes) {
      minX = min(minX, node.dx);
      maxX = max(maxX, node.dx);
      minY = min(minY, node.dy);
      maxY = max(maxY, node.dy);
    }

    final currentCenter = Offset((minX + maxX) / 2, (minY + maxY) / 2);
    final targetCenter = Offset(boardSize.width / 2, boardSize.height / 2);
    var dx = targetCenter.dx - currentCenter.dx;
    var dy = targetCenter.dy - currentCenter.dy;

    final minDx = padding - minX;
    final maxDx = (boardSize.width - padding) - maxX;
    final minDy = padding - minY;
    final maxDy = (boardSize.height - padding) - maxY;
    dx = dx.clamp(minDx, maxDx);
    dy = dy.clamp(minDy, maxDy);

    for (var i = 0; i < _current.nodes.length; i++) {
      final shifted = _current.nodes[i] + Offset(dx, dy);
      _current.nodes[i] = Offset(
        shifted.dx.clamp(padding, boardSize.width - padding),
        shifted.dy.clamp(padding, boardSize.height - padding),
      );
    }
  }

  Future<bool> _showCompletionModal({
    required bool solved,
    required int totalMoves,
    required int movesUsed,
    required int totalScore,
    required List<Offset> nodes,
    required List<Edge> edges,
  }) async {
    final continuePlay = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.35),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          solved
                              ? 'solved ${nodes.length} nodes'
                              : 'failed ${nodes.length} nodes',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Builder(
                        builder: (buttonContext) {
                          return IconButton(
                            onPressed: () async {
                              await _shareSolvedCard(
                                solved: solved,
                                totalMoves: totalMoves,
                                movesUsed: movesUsed,
                                totalScore: totalScore,
                                nodes: nodes,
                                edges: edges,
                                isDark:
                                    Theme.of(context).brightness ==
                                    Brightness.dark,
                                sharePositionOrigin:
                                    _sharePositionOriginForContext(
                                      buttonContext,
                                    ),
                              );
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.shareNodes,
                              size: 18,
                            ),
                            tooltip: 'share',
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: _MoveDots(
                      totalMoves: totalMoves,
                      movesUsed: movesUsed,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final fittedNodes = _normalizeNodesToRect(
                          nodes,
                          (Offset.zero & Size(constraints.maxWidth, 180))
                              .deflate(14),
                        );
                        final fittedCrossings = _findIntersectingEdges(
                          fittedNodes,
                          edges,
                        );
                        return CustomPaint(
                          painter: GraphPainter(
                            nodes: fittedNodes,
                            edges: edges,
                            intersectingEdges: fittedCrossings,
                            isDark:
                                Theme.of(context).brightness == Brightness.dark,
                            drawNodes: true,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('home'),
                      ),
                      if (solved)
                        FilledButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('continue - $totalScore'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return continuePlay ?? false;
  }

  Future<void> _shareSolvedCard({
    required bool solved,
    required int totalMoves,
    required int movesUsed,
    required int totalScore,
    required List<Offset> nodes,
    required List<Edge> edges,
    required bool isDark,
    Rect? sharePositionOrigin,
  }) async {
    try {
      final bytes = await _buildShareImage(
        solved: solved,
        totalMoves: totalMoves,
        movesUsed: movesUsed,
        totalScore: totalScore,
        nodes: nodes,
        edges: edges,
        isDark: isDark,
      );
      final file = XFile.fromData(
        bytes,
        mimeType: 'image/png',
        name: solved ? 'planarity-solved.png' : 'planarity-failed.png',
      );
      await SharePlus.instance.share(
        ShareParams(files: [file], sharePositionOrigin: sharePositionOrigin),
      );
      await _logShareEvent(
        contentType: solved ? 'solved_result' : 'failed_result',
        itemId: 'daily_result_card',
        method: 'system_share_sheet',
      );
    } on MissingPluginException {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Share is unavailable on this build.')),
      );
    }
  }

  Future<Uint8List> _buildShareImage({
    required bool solved,
    required int totalMoves,
    required int movesUsed,
    required int totalScore,
    required List<Offset> nodes,
    required List<Edge> edges,
    required bool isDark,
  }) async {
    const width = 1080.0;
    const height = 1350.0;
    const graphTop = 330.0;
    const graphSide = 120.0;
    const graphHeight = 880.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, width, height));
    final bgColor = isDark ? Colors.black : Colors.white;
    final fgColor = isDark ? Colors.white : Colors.black;

    canvas.drawRect(
      const Rect.fromLTWH(0, 0, width, height),
      Paint()..color = bgColor,
    );

    final title = TextPainter(
      text: TextSpan(
        text: 'planarity',
        style: TextStyle(
          color: fgColor,
          fontSize: 62,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    const iconSize = 72.0;
    const iconGap = 16.0;
    final headingWidth = iconSize + iconGap + title.width;
    final headingStartX = (width - headingWidth) / 2;
    final iconRect = Rect.fromLTWH(headingStartX, 62, iconSize, iconSize);
    _drawShareBrandIcon(canvas, iconRect);
    title.paint(
      canvas,
      Offset(
        headingStartX + iconSize + iconGap,
        iconRect.top + (iconSize - title.height) / 2,
      ),
    );

    final subtitle = TextPainter(
      text: TextSpan(
        text: 'untangle the graph',
        style: TextStyle(
          color: fgColor.withOpacity(0.75),
          fontSize: 34,
          fontWeight: FontWeight.w400,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    subtitle.paint(canvas, Offset((width - subtitle.width) / 2, 150));

    final dotFill = Paint()..color = fgColor;
    final dotStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..color = fgColor;
    const dotRadius = 10.0;
    const dotGap = 11.0;
    final rowWidth = (totalMoves * dotRadius * 2) + ((totalMoves - 1) * dotGap);
    var x = (width - rowWidth) / 2 + dotRadius;
    const y = 248.0;
    final solidCount = max(0, totalMoves - movesUsed);
    for (var i = 0; i < totalMoves; i++) {
      final center = Offset(x, y);
      if (i < solidCount) {
        canvas.drawCircle(center, dotRadius, dotFill);
      }
      canvas.drawCircle(center, dotRadius, dotStroke);
      x += (dotRadius * 2) + dotGap;
    }

    final graphRect = Rect.fromLTWH(
      graphSide,
      graphTop,
      width - (2 * graphSide),
      graphHeight,
    );
    canvas.drawRect(
      graphRect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = fgColor.withOpacity(0.28),
    );

    if (nodes.isNotEmpty) {
      final normalized = _normalizeNodesToRect(nodes, graphRect.deflate(24));
      final crossingEdges = _findIntersectingEdges(normalized, edges);
      final edgePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..color = fgColor.withOpacity(0.88);
      final crossingEdgePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..color = fgColor.withOpacity(0.28);
      for (final edge in edges) {
        if (crossingEdges.contains(edge)) {
          _drawDottedLine(
            canvas,
            normalized[edge.a],
            normalized[edge.b],
            crossingEdgePaint,
            16,
            10,
          );
        } else {
          canvas.drawLine(normalized[edge.a], normalized[edge.b], edgePaint);
        }
      }
      final nodePaint = Paint()..color = fgColor;
      for (final node in normalized) {
        canvas.drawCircle(node, 12, nodePaint);
      }
    }

    final image = await recorder.endRecording().toImage(
      width.toInt(),
      height.toInt(),
    );
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  List<Offset> _normalizeNodesToRect(List<Offset> nodes, Rect target) {
    final xs = nodes.map((p) => p.dx).toList()..sort();
    final ys = nodes.map((p) => p.dy).toList()..sort();
    final minX = xs.first;
    final maxX = xs.last;
    final minY = ys.first;
    final maxY = ys.last;
    final spanX = max(maxX - minX, 1.0);
    final spanY = max(maxY - minY, 1.0);
    final scale = min(target.width / spanX, target.height / spanY);
    final usedW = spanX * scale;
    final usedH = spanY * scale;
    final offsetX = target.left + (target.width - usedW) / 2;
    final offsetY = target.top + (target.height - usedH) / 2;

    return nodes
        .map((node) {
          return Offset(
            offsetX + ((node.dx - minX) * scale),
            offsetY + ((node.dy - minY) * scale),
          );
        })
        .toList(growable: false);
  }
}

class GraphPainter extends CustomPainter {
  GraphPainter({
    required this.nodes,
    required this.edges,
    required this.intersectingEdges,
    required this.isDark,
    this.drawNodes = false,
  });

  final List<Offset> nodes;
  final List<Edge> edges;
  final Set<Edge> intersectingEdges;
  final bool isDark;
  final bool drawNodes;

  @override
  void paint(Canvas canvas, Size size) {
    final edgePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..color = isDark ? Colors.white70 : Colors.black87;
    final intersectingEdgePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..color = isDark ? Colors.white24 : Colors.black26;

    for (final edge in edges) {
      final p1 = nodes[edge.a];
      final p2 = nodes[edge.b];
      if (intersectingEdges.contains(edge)) {
        _drawDottedLine(canvas, p1, p2, intersectingEdgePaint, 8, 6);
      } else {
        canvas.drawLine(p1, p2, edgePaint);
      }
    }

    if (drawNodes) {
      final nodePaint = Paint()..color = isDark ? Colors.white : Colors.black;
      for (final node in nodes) {
        canvas.drawCircle(node, 5.2, nodePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) {
    return oldDelegate.nodes != nodes ||
        oldDelegate.edges != edges ||
        oldDelegate.intersectingEdges != intersectingEdges ||
        oldDelegate.isDark != isDark ||
        oldDelegate.drawNodes != drawNodes;
  }
}

class _MoveDots extends StatelessWidget {
  const _MoveDots({
    required this.totalMoves,
    required this.movesUsed,
    required this.color,
  });

  final int totalMoves;
  final int movesUsed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final solidCount = max(0, totalMoves - movesUsed);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(totalMoves, (index) {
          final isHollow = index >= solidCount;
          return Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isHollow ? Colors.transparent : color,
              border: Border.all(color: color, width: 1.2),
            ),
          );
        }),
      ),
    );
  }
}

class _AnimatedHomeIcon extends StatefulWidget {
  const _AnimatedHomeIcon();

  @override
  State<_AnimatedHomeIcon> createState() => _AnimatedHomeIconState();
}

class _AnimatedHomeIconState extends State<_AnimatedHomeIcon>
    with TickerProviderStateMixin {
  static const _edges = <Edge>[
    Edge(0, 1),
    Edge(1, 2),
    Edge(2, 3),
    Edge(3, 4),
    Edge(4, 0),
    Edge(0, 2),
    Edge(1, 3),
  ];

  final Random _random = Random();
  late final AnimationController _driftController;
  late final AnimationController _scrambleController;
  late List<Offset> _baseNodes;
  late List<Offset> _scrambleFromNodes;
  late List<Offset> _scrambleToNodes;
  late List<double> _phaseX;
  late List<double> _phaseY;

  @override
  void initState() {
    super.initState();
    _baseNodes = _initialNodes();
    _scrambleFromNodes = _baseNodes;
    _scrambleToNodes = _baseNodes;
    _phaseX = List<double>.generate(
      _baseNodes.length,
      (_) => _random.nextDouble() * 2 * pi,
    );
    _phaseY = List<double>.generate(
      _baseNodes.length,
      (_) => _random.nextDouble() * 2 * pi,
    );
    _driftController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
    _scrambleController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 420),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() {
              _baseNodes = _scrambleToNodes;
            });
            _scrambleController.reset();
          }
        });
  }

  @override
  void dispose() {
    _driftController.dispose();
    _scrambleController.dispose();
    super.dispose();
  }

  List<Offset> _initialNodes() {
    // Coordinates normalized from public/icon-source.svg (viewBox 0..1024).
    return const <Offset>[
      Offset(0.50, 0.189),
      Offset(0.797, 0.404),
      Offset(0.684, 0.754),
      Offset(0.316, 0.754),
      Offset(0.203, 0.404),
    ];
  }

  void _scramble() {
    final currentAnchor = _currentAnchorNodes();
    final target = _scrambledNodes();
    setState(() {
      _scrambleFromNodes = currentAnchor;
      _scrambleToNodes = target;
      _phaseX = List<double>.generate(
        _baseNodes.length,
        (_) => _random.nextDouble() * 2 * pi,
      );
      _phaseY = List<double>.generate(
        _baseNodes.length,
        (_) => _random.nextDouble() * 2 * pi,
      );
    });
    _scrambleController
      ..reset()
      ..forward();
  }

  List<Offset> _scrambledNodes() {
    const minDistance = 0.18;
    const minBound = 0.18;
    const maxBound = 0.82;
    final nodes = <Offset>[];

    var attempts = 0;
    while (nodes.length < 5 && attempts < 500) {
      attempts += 1;
      final candidate = Offset(
        minBound + _random.nextDouble() * (maxBound - minBound),
        minBound + _random.nextDouble() * (maxBound - minBound),
      );
      final tooClose = nodes.any(
        (node) => (node - candidate).distance < minDistance,
      );
      if (!tooClose) {
        nodes.add(candidate);
      }
    }

    if (nodes.length == 5) {
      return nodes;
    }
    return _initialNodes();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final edgeColor = isDark
        ? const Color(0xFFF4F4F5).withOpacity(0.26)
        : Colors.black.withOpacity(0.28);
    final nodeColor = isDark
        ? const Color(0xFFF4F4F5).withOpacity(0.94)
        : Colors.black.withOpacity(0.92);
    final glowColor = isDark
        ? const Color(0xFFF4F4F5).withOpacity(0.08)
        : Colors.black.withOpacity(0.08);

    return GestureDetector(
      onTap: _scramble,
      child: SizedBox(
        width: 138,
        height: 138,
        child: AnimatedBuilder(
          animation: Listenable.merge([_driftController, _scrambleController]),
          builder: (context, _) {
            final t = _driftController.value * 2 * pi;
            final anchorNodes = _currentAnchorNodes();
            final animatedNodes = List<Offset>.generate(anchorNodes.length, (
              index,
            ) {
              final base = anchorNodes[index];
              final dx = sin(t + _phaseX[index]) * 0.012;
              final dy = cos(t + _phaseY[index]) * 0.012;
              return Offset(
                (base.dx + dx).clamp(0.12, 0.88),
                (base.dy + dy).clamp(0.12, 0.88),
              );
            });

            return CustomPaint(
              painter: _HomeIconPainter(
                nodes: animatedNodes,
                edges: _edges,
                edgeColor: edgeColor,
                nodeColor: nodeColor,
                glowColor: glowColor,
              ),
            );
          },
        ),
      ),
    );
  }

  List<Offset> _currentAnchorNodes() {
    if (!_scrambleController.isAnimating) {
      return _baseNodes;
    }

    final curved = Curves.easeInOutCubic.transform(_scrambleController.value);
    return List<Offset>.generate(_scrambleFromNodes.length, (index) {
      return Offset.lerp(
        _scrambleFromNodes[index],
        _scrambleToNodes[index],
        curved,
      )!;
    });
  }
}

class _HomeIconPainter extends CustomPainter {
  const _HomeIconPainter({
    required this.nodes,
    required this.edges,
    required this.edgeColor,
    required this.nodeColor,
    required this.glowColor,
  });

  final List<Offset> nodes;
  final List<Edge> edges;
  final Color edgeColor;
  final Color nodeColor;
  final Color glowColor;

  @override
  void paint(Canvas canvas, Size size) {
    final pxNodes = nodes
        .map((n) => Offset(n.dx * size.width, n.dy * size.height))
        .toList(growable: false);

    final edgePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..color = edgeColor;
    for (final edge in edges) {
      canvas.drawLine(pxNodes[edge.a], pxNodes[edge.b], edgePaint);
    }

    final glowPaint = Paint()..color = glowColor;
    for (final p in pxNodes) {
      canvas.drawCircle(p, 12, glowPaint);
    }

    final nodePaint = Paint()..color = nodeColor;
    for (final p in pxNodes) {
      canvas.drawCircle(p, 6.8, nodePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _HomeIconPainter oldDelegate) {
    return oldDelegate.nodes != nodes ||
        oldDelegate.edges != edges ||
        oldDelegate.edgeColor != edgeColor ||
        oldDelegate.nodeColor != nodeColor ||
        oldDelegate.glowColor != glowColor;
  }
}

class PlanarityLevel {
  PlanarityLevel({required this.nodes, required this.edges});

  final List<Offset> nodes;
  final List<Edge> edges;
}

class PlanarityGenerator {
  static PlanarityLevel generate({required String dayKey, required int level}) {
    final nodeCount = max(2, level);
    final structureRandom = _DeterministicRandom(
      _stableSeed(dayKey, nodeCount),
    );
    final edges = _buildPlanarEdges(nodeCount, structureRandom);
    final positionsRandom = _DeterministicRandom(
      _stableSeed(dayKey, nodeCount),
    );
    final scattered = _scatterNodes(nodeCount, positionsRandom);

    if (nodeCount >= 4 && edges.isNotEmpty) {
      var attempts = 0;
      while (_countCrossings(scattered, edges) == 0 && attempts < 30) {
        for (var i = 0; i < scattered.length; i++) {
          scattered[i] = _randomPoint(positionsRandom);
        }
        attempts += 1;
      }
    }

    return PlanarityLevel(nodes: scattered, edges: edges);
  }

  static List<Offset> _scatterNodes(int n, _DeterministicRandom random) {
    return List.generate(n, (_) => _randomPoint(random));
  }

  static Offset _randomPoint(_DeterministicRandom random) {
    return Offset(
      50 + random.nextDouble() * 260,
      60 + random.nextDouble() * 420,
    );
  }

  static List<Edge> _buildPlanarEdges(int n, _DeterministicRandom random) {
    if (n <= 1) {
      return const <Edge>[];
    }

    final edges = <Edge>{};

    for (var i = 0; i < n; i++) {
      edges.add(Edge(i, (i + 1) % n));
    }

    final candidates = <Edge>[];
    for (var a = 0; a < n; a++) {
      for (var b = a + 1; b < n; b++) {
        final isCycleNeighbor = (b == a + 1) || (a == 0 && b == n - 1);
        if (!isCycleNeighbor) {
          candidates.add(Edge(a, b));
        }
      }
    }

    _shuffleEdges(candidates, random);
    for (final candidate in candidates) {
      final crossesExisting = edges.any((existing) {
        if (existing.sharesNode(candidate)) {
          return false;
        }
        return _crossesInConvexOrder(candidate, existing, n);
      });
      if (!crossesExisting && random.nextDouble() < 0.55) {
        edges.add(candidate);
      }
    }

    return edges.toList(growable: false);
  }

  static void _shuffleEdges(List<Edge> edges, _DeterministicRandom random) {
    for (var i = edges.length - 1; i > 0; i--) {
      final swapIndex = random.nextInt(i + 1);
      final current = edges[i];
      edges[i] = edges[swapIndex];
      edges[swapIndex] = current;
    }
  }

  // For vertices placed in a consistent cyclic order on a convex polygon,
  // two edges cross iff their endpoints interleave around the polygon.
  static bool _crossesInConvexOrder(Edge a, Edge b, int nodeCount) {
    final aToBStart = _isBetweenClockwise(
      start: a.a,
      value: b.a,
      end: a.b,
      nodeCount: nodeCount,
    );
    final aToBEnd = _isBetweenClockwise(
      start: a.a,
      value: b.b,
      end: a.b,
      nodeCount: nodeCount,
    );
    return aToBStart != aToBEnd;
  }

  static bool _isBetweenClockwise({
    required int start,
    required int value,
    required int end,
    required int nodeCount,
  }) {
    final relativeValue = (value - start + nodeCount) % nodeCount;
    final relativeEnd = (end - start + nodeCount) % nodeCount;
    return relativeValue > 0 && relativeValue < relativeEnd;
  }

  // Stable seed hash (FNV-1a style) to keep generation consistent across runs/platforms.
  static int _stableSeed(String dayKey, int level) {
    final input = '$dayKey|$level';
    var hash = 0x811C9DC5;
    for (final unit in input.codeUnits) {
      hash ^= unit;
      hash = _mul32(hash, 0x01000193) & 0x7fffffff;
    }
    return hash;
  }

  // Keep multiplication in 32-bit space so Dart VM and JS produce identical seeds.
  static int _mul32(int a, int b) {
    final aLow = a & 0xffff;
    final aHigh = (a >>> 16) & 0xffff;
    final bLow = b & 0xffff;
    final bHigh = (b >>> 16) & 0xffff;
    final low = aLow * bLow;
    final mid = ((aHigh * bLow) + (aLow * bHigh)) & 0xffff;
    return (low + (mid << 16)) & 0xffffffff;
  }
}

class _DeterministicRandom {
  _DeterministicRandom(int seed) : _state = seed & 0xffffffff;

  int _state;

  int nextInt(int max) {
    assert(max > 0, 'max must be positive');
    return (nextDouble() * max).floor();
  }

  double nextDouble() {
    _state = (_state * 1664525 + 1013904223) & 0xffffffff;
    return _state / 0x100000000;
  }
}

class Edge {
  const Edge(int x, int y) : a = x < y ? x : y, b = x < y ? y : x;

  final int a;
  final int b;

  bool sharesNode(Edge other) {
    return a == other.a || a == other.b || b == other.a || b == other.b;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Edge && other.a == a && other.b == b;
  }

  @override
  int get hashCode => Object.hash(a, b);
}

class GameSessionResult {
  GameSessionResult({
    required this.dayKey,
    required this.score,
    required this.level,
    required this.locked,
  });

  final String dayKey;
  final int score;
  final int level;
  final bool locked;
}

int scoreForSolvedLevel({required int level, required int movesUsed}) {
  return max(0, level - movesUsed);
}

int _countCrossings(List<Offset> nodes, List<Edge> edges) {
  return _findIntersectingEdges(nodes, edges).length;
}

Set<Edge> _findIntersectingEdges(List<Offset> nodes, List<Edge> edges) {
  final intersecting = <Edge>{};
  for (var i = 0; i < edges.length; i++) {
    for (var j = i + 1; j < edges.length; j++) {
      final e1 = edges[i];
      final e2 = edges[j];
      if (e1.sharesNode(e2)) {
        continue;
      }

      if (_segmentsIntersect(
        nodes[e1.a],
        nodes[e1.b],
        nodes[e2.a],
        nodes[e2.b],
      )) {
        intersecting
          ..add(e1)
          ..add(e2);
      }
    }
  }
  return intersecting;
}

bool _segmentsIntersect(Offset p1, Offset p2, Offset q1, Offset q2) {
  final o1 = _orientation(p1, p2, q1);
  final o2 = _orientation(p1, p2, q2);
  final o3 = _orientation(q1, q2, p1);
  final o4 = _orientation(q1, q2, p2);

  return o1 * o2 < 0 && o3 * o4 < 0;
}

double _orientation(Offset a, Offset b, Offset c) {
  return (b.dx - a.dx) * (c.dy - a.dy) - (b.dy - a.dy) * (c.dx - a.dx);
}

void _drawDottedLine(
  Canvas canvas,
  Offset start,
  Offset end,
  Paint paint,
  double dashLength,
  double dashGap,
) {
  final total = (end - start).distance;
  if (total == 0) {
    return;
  }
  final direction = (end - start) / total;
  var distance = 0.0;
  while (distance < total) {
    final dashEnd = min(distance + dashLength, total);
    final p1 = start + (direction * distance);
    final p2 = start + (direction * dashEnd);
    canvas.drawLine(p1, p2, paint);
    distance += dashLength + dashGap;
  }
}

Rect? _sharePositionOriginForContext(BuildContext context) {
  final renderObject = context.findRenderObject();
  if (renderObject is! RenderBox || !renderObject.hasSize) {
    return null;
  }
  final size = renderObject.size;
  if (size.width <= 0 || size.height <= 0) {
    return null;
  }
  final origin = renderObject.localToGlobal(Offset.zero);
  return origin & size;
}

void _drawShareBrandIcon(Canvas canvas, Rect rect) {
  final bgPaint = Paint()..color = const Color(0xFF0F1319);
  final edgePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = rect.width * 0.018
    ..color = const Color(0xFFF4F4F5).withOpacity(0.26);
  final glowPaint = Paint()..color = const Color(0xFFF4F4F5).withOpacity(0.08);
  final nodePaint = Paint()..color = const Color(0xFFF4F4F5).withOpacity(0.94);

  canvas.drawRRect(
    RRect.fromRectAndRadius(rect, Radius.circular(rect.width * 0.215)),
    bgPaint,
  );

  final nodes = <Offset>[
    Offset(rect.left + rect.width * 0.500, rect.top + rect.height * 0.189),
    Offset(rect.left + rect.width * 0.797, rect.top + rect.height * 0.404),
    Offset(rect.left + rect.width * 0.684, rect.top + rect.height * 0.754),
    Offset(rect.left + rect.width * 0.316, rect.top + rect.height * 0.754),
    Offset(rect.left + rect.width * 0.203, rect.top + rect.height * 0.404),
  ];
  const edges = <Edge>[
    Edge(0, 1),
    Edge(1, 2),
    Edge(2, 3),
    Edge(3, 4),
    Edge(4, 0),
    Edge(0, 2),
    Edge(1, 3),
  ];

  for (final edge in edges) {
    canvas.drawLine(nodes[edge.a], nodes[edge.b], edgePaint);
  }
  for (final node in nodes) {
    canvas.drawCircle(node, rect.width * 0.084, glowPaint);
  }
  for (final node in nodes) {
    canvas.drawCircle(node, rect.width * 0.051, nodePaint);
  }
}
