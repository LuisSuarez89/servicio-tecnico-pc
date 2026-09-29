import '../models/service_item.dart';
import '../models/service_category.dart';

class ServiceRepository {
  static const List<ServiceCategory> categories = [
    ServiceCategory(
      title: 'Mantenimiento',
      description:
          'Mantenimiento preventivo para computadores y portátiles: reduce el sobrecalentamiento, mejora el rendimiento y prolonga la vida útil de tu equipo.',
      items: [
        ServiceItem(service: 'Mantenimiento preventivo para portátiles'),
        ServiceItem(service: 'Mantenimiento para PC de escritorio'),
        ServiceItem(service: 'Limpieza interna y cambio de pasta térmica'),
        ServiceItem(service: 'Optimización de sistema operativo'),
        ServiceItem(service: 'Eliminación de programas innecesarios'),
      ],
    ),
    ServiceCategory(
      title: 'Reparación',
      description:
          'Reparación de computadores con diagnóstico inicial para identificar fallas de hardware, software, lentitud o problemas de arranque.',
      items: [
        ServiceItem(service: 'Diagnóstico técnico'),
        ServiceItem(service: 'Reparación de sistema operativo'),
        ServiceItem(service: 'Actualización de HDD a SSD'),
        ServiceItem(service: 'Recuperación básica de datos'),
        ServiceItem(service: 'Solución de lentitud, errores y virus'),
      ],
    ),
    ServiceCategory(
      title: 'Asesoría',
      description:
          'Asesoría técnica para elegir, configurar y proteger la tecnología que necesitas en casa, estudio o trabajo.',
      items: [
        ServiceItem(service: 'Asesoría para compra de equipos'),
        ServiceItem(service: 'Configuración de oficina en casa'),
        ServiceItem(service: 'Implementación de copias de seguridad'),
        ServiceItem(service: 'Recomendaciones para mejorar rendimiento'),
      ],
    ),
  ];
}
