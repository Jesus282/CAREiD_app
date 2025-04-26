import 'package:flutter/material.dart';
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


// flutter run -d edge//
void main() {
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
  '/chat': (context) => ChatScreen(),
  '/alarma': (context) => AlarmScreen(),
  '/clinicas': (context) => ClinicList(),
  '/contacto': (context) => ContactScreen(),
  '/historial': (context) => HistoryScreen(),
  '/medicamentos': (context) => MedicListScreen(),
  '/perfilconsulta': (context) => ProfileConsultScreen(),
  '/perfil': (context) => ProfileScreen(),
  '/registroclinico': (context) => RecordScreen(),
  '/ajustes': (context) => SettingsScreen(),
  '/plan': (context) => PlanScreen(),
  '/error': (context) => FailureScreen(),
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
