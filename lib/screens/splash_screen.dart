import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar después de 2.5 segundos (tiempo total de animaciones)
    Future.delayed(2500.ms, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo animado con efecto de rebote
            Image.asset("assets/Logo.png", height: 100)
                .animate()
                .fadeIn(duration: 800.ms)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.1, 1.1),
                  duration: 400.ms,
                )
                .then()
                .scale(
                  begin: const Offset(1.1, 1.1),
                  end: const Offset(1.0, 1.0),
                  duration: 200.ms,
                ),

            const SizedBox(height: 30),

            // Texto CARID con animación
            Text(
              'CAREiD',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            )
                .animate()
                .fadeIn(delay: 500.ms)
                .moveY(begin: -30, end: 0, duration: 600.ms),

            const SizedBox(height: 40),

            // Spinner animado - versión corregida
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]!),
            )
                .animate()
                .fadeIn(delay: 800.ms)
                .custom(
                  duration: 1500.ms,
                  builder: (_, value, child) => Transform.rotate(
                    angle: value * 2 * 3.1416,
                    child: child,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}