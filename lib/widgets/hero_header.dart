import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            const Color(0xFF003882), // Azul más oscuro
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Soporte Técnico en Tocancipá',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Mantenimiento, reparación y asesoría para tus equipos de cómputo',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'Atendemos hogares, estudiantes, emprendedores y empresas en Tocancipá, '
                'sus alrededores y el norte de Bogotá. '
                'Nuestros técnicos ofrecen diagnóstico confiable, soluciones rápidas '
                'y acompañamiento profesional para potenciar el rendimiento de tu tecnología.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri.parse('https://forms.gle/yTBEFvwE7Vud8mqeA');
                  if (!await launchUrl(url)) {
                    // ignore: avoid_print
                    print('Could not launch $url');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                icon: const Icon(Icons.support_agent),
                label: const Text('Solicitar Servicio Ahora'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
