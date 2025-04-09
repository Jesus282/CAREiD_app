import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¡Bienvenido/a!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                '¿Qué deseas hacer hoy?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildMenuCard(
                      context,
                      icon: Icons.calendar_today,
                      label: 'Agendar Cita',
                      onTap: () {},
                    ),
                    _buildMenuCard(
                      context,
                      icon: Icons.person,
                      label: 'Perfil',
                      onTap: () {},
                    ),
                    _buildMenuCard(
                      context,
                      icon: Icons.medication,
                      label: 'Mis Medicamentos',
                      onTap: () {},
                    ),
                    _buildMenuCard(
                      context,
                      icon: Icons.settings,
                      label: 'Configuración',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
