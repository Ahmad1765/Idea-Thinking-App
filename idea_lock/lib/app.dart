import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/app_routes.dart';
import 'core/di/providers.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/auth/presentation/screens/onboarding_screen.dart';
import 'features/ideas/presentation/screens/swipe_deck_screen.dart';
import 'features/ideas/presentation/screens/idea_create_screen.dart';
import 'features/ideas/presentation/screens/idea_detail_screen.dart';
import 'features/matches/presentation/screens/matches_list_screen.dart';
import 'features/matches/presentation/screens/chat_screen.dart';
import 'features/social/presentation/screens/feed_screen.dart';
import 'features/social/presentation/screens/thread_screen.dart';
import 'features/focus/presentation/screens/focus_setup_screen.dart';
import 'features/focus/presentation/screens/focus_timer_screen.dart';
import 'features/focus/presentation/screens/focus_summary_screen.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/profile/presentation/screens/achievements_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/home_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  // Watch auth state to trigger router rebuild on auth changes
  ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggedIn = session != null;
      final isAuthRoute = state.matchedLocation.startsWith('/auth');
      final isSplash = state.matchedLocation == AppRoutes.splash;

      if (isSplash) return null;
      if (!isLoggedIn && !isAuthRoute) return AppRoutes.login;
      if (isLoggedIn && isAuthRoute) return AppRoutes.swipe;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, __) => const SplashScreen(),
      ),

      // Auth routes
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, __) => const OnboardingScreen(),
      ),

      // Home shell with bottom nav
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, __, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.swipe,
            builder: (_, __) => const SwipeDeckScreen(),
          ),
          GoRoute(
            path: AppRoutes.feed,
            builder: (_, __) => const FeedScreen(),
          ),
          GoRoute(
            path: AppRoutes.focus,
            builder: (_, __) => const FocusSetupScreen(),
          ),
          GoRoute(
            path: AppRoutes.matches,
            builder: (_, __) => const MatchesListScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (_, __) => const ProfileScreen(),
          ),
        ],
      ),

      // Full-screen routes outside shell
      GoRoute(
        path: '/ideas/create',
        builder: (_, __) => const IdeaCreateScreen(),
      ),
      GoRoute(
        path: '/ideas/:id',
        builder: (_, state) => IdeaDetailScreen(ideaId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/matches/:id/chat',
        builder: (_, state) => ChatScreen(matchId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/feed/:postId',
        builder: (_, state) => ThreadScreen(postId: state.pathParameters['postId']!),
      ),
      GoRoute(
        path: AppRoutes.focusTimer,
        builder: (_, __) => const FocusTimerScreen(),
      ),
      GoRoute(
        path: AppRoutes.focusSummary,
        builder: (_, __) => const FocusSummaryScreen(),
      ),
      GoRoute(
        path: '/profile/:userId',
        builder: (_, state) => ProfileScreen(userId: state.pathParameters['userId']),
      ),
      GoRoute(
        path: AppRoutes.achievements,
        builder: (_, __) => const AchievementsScreen(),
      ),
    ],
  );
});

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Idea Lock',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
