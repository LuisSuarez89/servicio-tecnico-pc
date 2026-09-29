import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'zeraus_logo.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF07111F),
        gradient: RadialGradient(
          center: Alignment(.75, -.75),
          radius: 1.25,
          colors: [Color(0xFF123B70), Color(0xFF07111F)],
          stops: [0, .58],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 88),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ZerausLogo(),
              const SizedBox(height: 36),
              const _Eyebrow(),
              const SizedBox(height: 18),
              Text(
                'Tecnología lista para lo que sigue.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'En Zeraus Tech cuidamos, optimizamos y recuperamos tus equipos. '
                'Soporte técnico claro y confiable para hogares, estudiantes, '
                'emprendedores y empresas.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () async {
                  final Uri url =
                      Uri.parse('https://forms.gle/yTBEFvwE7Vud8mqeA');
                  if (!await launchUrl(url)) {
                    // ignore: avoid_print
                    print('Could not launch $url');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Solicitar diagnóstico'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF168DFF).withValues(alpha: .16),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: const Color(0xFF35B9FF).withValues(alpha: .5)),
      ),
      child: const Text(
        'SOPORTE TÉCNICO PARA PC',
        style: TextStyle(
          color: Color(0xFF9BDFFF),
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.4,
        ),
      ),
    );
  }
}
