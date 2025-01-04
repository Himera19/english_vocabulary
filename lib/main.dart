import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:english_vocabulary/page/search_screen.dart';
import 'package:english_vocabulary/service/provider/synonym_provider.dart';
import 'package:english_vocabulary/service/provider/word_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<List<String>>('search_history');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((void value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext _) => WordProvider()),
        ChangeNotifierProvider(create: (BuildContext _) => SynonymProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) => const MyApp(),
      ),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Vocabulary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SearchScreen(),
    );
  }
}
