import '../models/service_item.dart';
import '../models/service_category.dart';

class ServiceRepository {
  static const List<ServiceCategory> categories = [
    ServiceCategory(
      title: 'Mantenimiento',
      description:
          'Cuidado preventivo para que tus equipos trabajen mejor por más tiempo.',
      items: [
        ServiceItem(service: 'Mantenimiento preventivo para portátiles'),
        ServiceItem(service: 'Mantenimiento para PC de escritorio'),
        ServiceItem(service: 'Limpieza interna y cambio de pasta térmica'),
        ServiceItem(service: 'Optimización de sistema operativo'),
      ],
    ),
    ServiceCategory(
      title: 'Reparación',
      description:
          'Solución de fallas de hardware y software con diagnóstico inicial.',
      items: [
        ServiceItem(service: 'Diagnóstico técnico'),
        ServiceItem(service: 'Reparación de sistema operativo'),
        ServiceItem(service: 'Actualización de HDD a SSD'),
        ServiceItem(service: 'Recuperación básica de datos'),
      ],
    ),
    ServiceCategory(
      title: 'Asesoría',
      description:
          'Acompañamiento especializado para compra, configuración y seguridad.',
      items: [
        ServiceItem(service: 'Asesoría para compra de equipos'),
        ServiceItem(service: 'Configuración de oficina en casa'),
        ServiceItem(service: 'Implementación de copias de seguridad'),
      ],
    ),
  ];
}
