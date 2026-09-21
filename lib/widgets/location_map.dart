import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

const _mapViewType = 'tocancipa-location-map';
const _locationUrl = 'https://maps.app.goo.gl/ceGNpM35q9QStABx8';

class LocationMap extends StatefulWidget {
  const LocationMap({super.key});

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  static var _viewFactoryRegistered = false;

  @override
  void initState() {
    super.initState();
    if (_viewFactoryRegistered) {
      return;
    }

    ui_web.platformViewRegistry.registerViewFactory(_mapViewType, (viewId) {
      return web.HTMLIFrameElement()
        ..src = 'https://www.google.com/maps?q=Tocancip%C3%A1%2C%20Cundinamarca&z=13&output=embed'
        ..style.border = '0'
        ..style.height = '100%'
        ..style.width = '100%'
        ..title = 'Mapa de ubicación en Tocancipá';
    });
    _viewFactoryRegistered = true;
  }

  Future<void> _openExactLocation() async {
    final location = Uri.parse(_locationUrl);
    if (!await launchUrl(location, mode: LaunchMode.externalApplication)) {
      // ignore: avoid_print
      print('Could not launch $location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Text(
                'Nuestra ubicación',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Estamos ubicados en Tocancipá y atendemos sus alrededores y el norte de Bogotá.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.normal,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 380,
                  width: double.infinity,
                  child: const HtmlElementView(viewType: _mapViewType),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: _openExactLocation,
                icon: const Icon(Icons.directions),
                label: const Text('Ver ubicación exacta en Google Maps'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
