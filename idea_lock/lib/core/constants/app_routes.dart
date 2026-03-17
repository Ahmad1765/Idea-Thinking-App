abstract class AppRoutes {
  static const splash = '/';
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const onboarding = '/auth/onboarding';

  static const home = '/home';
  static const swipe = '/home/swipe';
  static const feed = '/home/feed';
  static const focus = '/home/focus';
  static const matches = '/home/matches';
  static const profile = '/home/profile';

  static const ideaDetail = '/ideas/:id';
  static const ideaCreate = '/ideas/create';

  static const chat = '/matches/:id/chat';

  static const thread = '/feed/:postId';

  static const focusTimer = '/focus/timer';
  static const focusSummary = '/focus/summary';

  static const publicProfile = '/profile/:userId';
  static const achievements = '/profile/achievements';

  static const settings = '/settings';
}
