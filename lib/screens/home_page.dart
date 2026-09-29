import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../repositories/service_repository.dart';
import '../widgets/hero_header.dart';
import '../widgets/location_map.dart';
import '../widgets/service_card.dart';
import '../widgets/zeraus_logo.dart';

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
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 0,
            title: const ZerausLogo(compact: true),
            centerTitle: false,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Center(
                  child: Text(
                    'SOPORTE PARA PC',
                    style: TextStyle(
                      color: Color(0xFF9BDFFF),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SliverToBoxAdapter(
            child: HeroHeader(),
          ),

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
                        'Soluciones para tu tecnología',
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Conoce los servicios que podemos realizar por ti.',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.normal,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: categories.map((category) {
                          return SizedBox(
                            width: 350,
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
              color: const Color(0xFF081323),
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
                        'Hablemos de tu equipo',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Cuéntanos qué necesitas y encontraremos la mejor solución para tu equipo.',
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
                            message: 'Canal de WhatsApp próximo a habilitarse',
                            child: OutlinedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.chat_outlined),
                              label: const Text('WhatsApp · próximamente'),
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
