import 'package:flutter/material.dart';

class SeoContent extends StatelessWidget {
  const SeoContent({super.key});

  static const _frequentQuestions = [
    (
      question: '¿Tu computador está lento o se calienta demasiado?',
      answer:
          'La lentitud, el ruido constante del ventilador y el sobrecalentamiento pueden indicar que tu equipo necesita mantenimiento, limpieza interna, optimización o una mejora de almacenamiento. Revisamos el caso para proponerte una solución adecuada.',
    ),
    (
      question: '¿Reparan computadores y portátiles?',
      answer:
          'Sí. Atendemos problemas de software y hardware en computadores de escritorio y portátiles, incluyendo fallas de arranque, sistema operativo, rendimiento, almacenamiento y recuperación básica de información.',
    ),
    (
      question: '¿Conviene cambiar un disco HDD por un SSD?',
      answer:
          'En muchos equipos, actualizar de HDD a SSD reduce notablemente los tiempos de encendido, carga de programas y respuesta general. Durante el diagnóstico revisamos la compatibilidad de tu computador.',
    ),
    (
      question: '¿En qué zonas prestan soporte técnico?',
      answer:
          'Prestamos servicio técnico en Tocancipá, municipios cercanos y el norte de Bogotá. Cuéntanos dónde estás y qué ocurre con tu equipo para orientarte.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Soporte técnico que se adapta a lo que necesitas',
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Desde un computador lento hasta una actualización para trabajar mejor: '
                'te ayudamos a cuidar y recuperar tu equipo con recomendaciones claras.',
                style: textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Preguntas frecuentes sobre reparación y mantenimiento de PC',
                  style: textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 16),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE3EAF4)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: _frequentQuestions
                      .map(
                        (item) => ExpansionTile(
                          title: Text(
                            item.question,
                            style: textTheme.titleMedium,
                          ),
                          childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                          tilePadding: const EdgeInsets.symmetric(horizontal: 24),
                          children: [
                            Text(
                              item.answer,
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
