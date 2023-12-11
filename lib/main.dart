import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_study/screens/mainpage.dart';
import 'package:hive_study/screens/viewScreen.dart';
import 'package:path_provider/path_provider.dart';

import 'models/hive_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    final directory= await getApplicationDocumentsDirectory();
   Hive.init(directory.path);
  //await Hive.initFlutter();
  Hive.registerAdapter(HiveModelAdapter());
  await Hive.openBox("contacts");
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const viewScreen(),
    );
  }
}
