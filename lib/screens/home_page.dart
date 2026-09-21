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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    children: [
                      Icon(
                        Icons.facebook,
                        size: 42,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Síguenos en Facebook',
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Conoce nuestras novedades y ponte en contacto con nosotros a través de nuestro perfil.',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: _openFacebookProfile,
                        icon: const Icon(Icons.facebook),
                        label: const Text('Visitar perfil de Facebook'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 4. Footer Simple
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Cobertura: Tocancipá, sus alrededores y el norte de Bogotá.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Nota: Los valores pueden variar según repuestos, '
                        'complejidad y servicio a domicilio.',
                        style: Theme.of(context).textTheme.bodyMedium,
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
