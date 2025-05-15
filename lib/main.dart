import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart'; // Conexión BD

// Importaciones de pantallas
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/register_screen.dart';
import 'screens/failure_screen.dart';
import 'screens/plan_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/configuration_screen.dart';
import 'screens/family_screen.dart';
// import 'screens/calendar_screen.dart'; ← Ya no se necesita en rutas
import 'screens/chatpersonal.dart';
import 'screens/alarm_screen.dart';
import 'screens/clinic_list.dart';
//import 'screens/contact_screen.dart';
import 'screens/history_screen.dart';
import 'screens/mediclist_screen.dart';
import 'screens/profilecosult_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/record_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';
import 'screens/location_screen.dart';
import 'screens/chatlist.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialización de Supabase
  await Supabase.initialize(
    url: 'https://mgbdvzesfyrzqdikalub.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1nYmR2emVzZnlyenFkaWthbHViIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUyNzAyMzIsImV4cCI6MjA2MDg0NjIzMn0.sU3O8DpBLqS9AP9osi796ZX-wmZgFMDOl0oQEmLw8uw',
    
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAREiD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 100, 218, 182),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/menu': (context) => MenuScreen(),
        '/configuracion': (context) => ConfigurationScreen(),
        '/familia': (context) => FamilyScreen(),
        '/alarma': (context) => AlarmScreen(),
        '/clinicas': (context) => ClinicListScreen(),
        '/location': (context) => MedicalMapScreen(),
        //'/contacto': (context) => ContactScreen(),
        '/historial': (context) => UploadScreen(),
        '/medicamentos': (context) => MedicListScreen(),
        '/perfilconsulta': (context) => ConsultaScreen(),
        '/perfil': (context) => ProfileScreen(),
        '/registroclinico': (context) => DocumentListScreen(),
        '/ajustes': (context) => SettingsScreen(),
        '/plan': (context) => PlanScreen(),
        '/error': (context) => FailureScreen(),
        '/ayuda': (context) => HelpScreen(),
        '/chat': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return ChatScreen(receiverName: args['receiverName']!);
        },
         '/chatlist': (context) => const ChatListScreen(),
'/chat': (context) {
final receiverName = ModalRoute.of(context)!.settings.arguments as String;
return ChatScreen(receiverName: receiverName);
},
      // Manejo de rutas con argumentos como receiverName
      }
    );
  }
}
