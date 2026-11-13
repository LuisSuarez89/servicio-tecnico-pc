import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static final _portfolioUrl = Uri.parse(
    'https://luissuarez89.github.io/Portafolio/',
  );

  Future<void> _openPortfolio() async {
    if (!await launchUrl(
      _portfolioUrl,
      mode: LaunchMode.externalApplication,
    )) {
      // ignore: avoid_print
      print('Could not launch $_portfolioUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Icon(
                Icons.person_outline_rounded,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                'Sobre mí',
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Soy Luis Suárez, Ingeniero de Sistemas con 8 años de experiencia '
                'en operaciones fintech, soporte técnico e integraciones de APIs. '
                'También trabajo con análisis de datos y automatización, combinando '
                'una visión técnica y operativa para convertir necesidades en '
                'soluciones claras.',
                style: textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: _openPortfolio,
                icon: const Icon(Icons.open_in_new_rounded),
                label: const Text('Conoce mi portafolio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
