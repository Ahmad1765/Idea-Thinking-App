import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load();

  // Initialize Hive
  await Hive.initFlutter();
  // Phase 0.6: Register Hive adapters here (added in Phase 1 when models exist)
  // Hive.registerAdapter(IdeaModelAdapter());
  // Hive.registerAdapter(FocusSessionModelAdapter());
  // Hive.registerAdapter(UserProfileModelAdapter());

  // Initialize Supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
