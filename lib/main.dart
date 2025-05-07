import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
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
import 'screens/chat_screen.dart';  // Asegúrate de importar la pantalla de chat
import 'screens/alarm_screen.dart';
import 'screens/clinic_list.dart';
import 'screens/history_screen.dart';
import 'screens/mediclist_screen.dart';
import 'screens/profilecosult_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/record_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';
import 'screens/location_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialización de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/historial': (context) => UploadScreen(),
        '/medicamentos': (context) => MedicListScreen(),
        '/perfilconsulta': (context) => ConsultaScreen(),
        '/perfil': (context) => ProfileScreen(),
        '/registroclinico': (context) => DocumentListScreen(),
        '/ajustes': (context) => SettingsScreen(),
        '/plan': (context) => PlanScreen(),
        '/error': (context) => FailureScreen(),
        '/ayuda': (context) => HelpScreen(),
      },
      // Manejo de rutas con parámetros (especialmente para el chat)
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return ChatListScreen(receiverName: args['receiverName']);
            },
          );
        }

        return null;
      },
    );
  }
}
