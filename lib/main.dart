import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/models/photo_model.dart'; // make sure the path is correct

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(PhotoModelAdapter());
  Hive.registerAdapter(SrcModelAdapter());


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Photo Gallery')),
        body: const Center(child: Text('App Ready')),
      ),
    );
  }
}
