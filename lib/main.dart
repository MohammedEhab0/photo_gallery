import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'Di/di.dart';
import 'core/providers/SettingProviders.dart';
import 'core/theme/AppTheme.dart';
import 'data/models/photo_model.dart';
import 'presentation/photo_list_screen/photo_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters if not already registered
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(PhotoModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(SrcModelAdapter());
  }

  // Open the box before calling getIt.init()
  await Hive.openBox<PhotoModel>('photosBox');

  // Initialize dependency injection AFTER box is opened
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingProviders()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingProviders = Provider.of<SettingProviders>(context);
    return MaterialApp(
      title: 'Photo Gallery',
      themeMode: settingProviders.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: PhotoListScreen.routeName,
      routes: {
        PhotoListScreen.routeName: (context) => const PhotoListScreen(),
      },
    );
  }
}
