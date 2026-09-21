import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../repositories/service_repository.dart';
import '../widgets/hero_header.dart';
import '../widgets/location_map.dart';
import '../widgets/service_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _facebookProfileUrl =
      'https://www.facebook.com/profile.php?id=61589590780954';

  Future<void> _openFacebookProfile() async {
    final facebookProfile = Uri.parse(_facebookProfileUrl);
    if (!await launchUrl(
      facebookProfile,
      mode: LaunchMode.externalApplication,
    )) {
      // ignore: avoid_print
      print('Could not launch $facebookProfile');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Tomamos las categorías del repositorio
    final categories = ServiceRepository.categories;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. App Bar flotante
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 2,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.memory,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                const Text('Cómputo Tocancipá'),
              ],
            ),
            // actions: [
            //   TextButton.icon(
            //     onPressed: () {},
            //     icon: const Icon(Icons.phone),
            //     label: const Text('Contacto'),
            //   ),
            //   const SizedBox(width: 16),
            // ],
          ),

          // 2. Body con el Header Premium
          const SliverToBoxAdapter(
            child: HeroHeader(),
          ),

          // 3. Grid / Lista de Servicios (responsive)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Nuestros Servicios',
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Soluciones integrales diseñadas para ti',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.normal,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      // Usamos un Wrap para hacer un grid responsivo sin usar GridView explícito
                      Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: categories.map((category) {
                          return SizedBox(
                            width: 350, // Ancho fijo responsivo
                            child: ServiceCard(category: category),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: LocationMap(),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    children: [
                      Icon(
                        Icons.forum_outlined,
                        size: 42,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Contáctanos',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Estamos listos para ayudarte con el diagnóstico y la solución de tus equipos.',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _openFacebookProfile,
                            icon: const Icon(Icons.facebook),
                            label: const Text('Facebook'),
                          ),
                          Tooltip(
                            message: 'Número pendiente de confirmar',
                            child: OutlinedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.chat_outlined),
                              label: const Text('WhatsApp · número pendiente'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Cobertura: Tocancipá, sus alrededores y el norte de Bogotá.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Los valores pueden variar según repuestos, complejidad y servicio a domicilio.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
