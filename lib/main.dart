import 'package:flutter/material.dart';


//import 'package:supabase_flutter/supabase_flutter.dart';//Conexion BD

import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/register_screen.dart';
import 'screens/failure_screen.dart';
import 'screens/plan_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/configuration_screen.dart';
import 'screens/family_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/alarm_screen.dart';
import 'screens/clinic_list.dart';
import 'screens/contact_scree.dart';
import 'screens/history_screen.dart';
import 'screens/mediclist_screen.dart';
import 'screens/profilecosult_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/record_screen.dart'; 
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';
import 'screens/location_screen.dart';

import 'package:firebase_core/firebase_core.dart';
// flutter run -d edge//
//void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Supabase.initialize(
   //url: 'https://mgbdvzesfyrzqdikalub.supabase.co', // URL de tu proyecto
   //anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1nYmR2emVzZnlyenFkaWthbHViIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUyNzAyMzIsImV4cCI6MjA2MDg0NjIzMn0.sU3O8DpBLqS9AP9osi796ZX-wmZgFMDOl0oQEmLw8uw', // Clave pública de tu proyecto
  //);
  //runApp(const MyApp());
//} 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAREiD',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 100, 218, 182)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
  '/': (context) => const SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/menu': (context) => MenuScreen(),
  '/configuracion': (context) => ConfigurationScreen(),
  '/familia': (context) => FamilyScreen(),
  '/calendario': (context) => CalendarScreen(),
  '/chat': (context) => ChatListScreen(),
  '/alarma': (context) => AlarmScreen(),
  '/clinicas': (context) => ClinicListScreen(),
  '/contacto': (context) => ContactScreen(),
  '/historial': (context) => HistoryScreen(),
  '/medicamentos': (context) => MedicListScreen(),
  '/perfilconsulta': (context) => ConsultaScreen(),
  '/perfil': (context) => ProfileScreen(),
  '/registroclinico': (context) => RecordScreen(),
  '/ajustes': (context) => SettingsScreen(),
  '/plan': (context) => PlanScreen(),
  '/error': (context) => FailureScreen(),
  '/ayuda':(context)=> HelpScreen(),
  '/location':(context)=> LocationScreen(),
},


      //home: const SplashScreen(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body: Center(
      
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
