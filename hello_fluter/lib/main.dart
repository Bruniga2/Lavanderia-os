import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_page.dart';
import 'screens/clean_clothes_page.dart';
import 'screens/dirty_clothes_page.dart';
import 'screens/inventory_report_page.dart';
import 'firebase_options.dart'; // Asegúrate de importar este archivo

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa Firebase con las opciones necesarias
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Error initializing Firebase: $e");
    return; // Si hay un error, detiene la ejecución
  }

  runApp(HospitalInventoryApp());
}

class HospitalInventoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Inventory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/clean': (context) => CleanClothesPage(),
        '/dirty': (context) => DirtyClothesPage(),
        '/report': (context) => InventoryReportPage(),
      },
    );
  }
}
