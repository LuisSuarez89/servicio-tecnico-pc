import '../models/service_item.dart';
import '../models/service_category.dart';

class ServiceRepository {
  static const List<ServiceCategory> categories = [
    ServiceCategory(
      title: 'Mantenimiento',
      description:
          'Prevención y optimización para alargar la vida útil de tus equipos.',
      items: [
        ServiceItem(
            service: 'Mantenimiento preventivo portátil',
            price: 'Desde COP 120.000'),
        ServiceItem(
            service: 'Mantenimiento preventivo PC de escritorio',
            price: 'Desde COP 150.000'),
        ServiceItem(
            service: 'Limpieza interna y cambio de pasta térmica',
            price: 'Desde COP 95.000'),
        ServiceItem(
            service: 'Optimización de sistema operativo',
            price: 'Desde COP 80.000'),
      ],
    ),
    ServiceCategory(
      title: 'Reparación',
      description:
          'Solución de fallas de hardware y software con diagnóstico inicial.',
      items: [
        ServiceItem(service: 'Diagnóstico técnico', price: 'COP 50.000'),
        ServiceItem(
            service: 'Reparación de sistema operativo',
            price: 'Desde COP 140.000'),
        ServiceItem(
            service: 'Cambio de disco HDD a SSD (sin repuesto)',
            price: 'Desde COP 110.000'),
        ServiceItem(
            service: 'Recuperación básica de datos',
            price: 'Desde COP 160.000'),
      ],
    ),
    ServiceCategory(
      title: 'Asesoría',
      description:
          'Acompañamiento especializado para compra, configuración y seguridad.',
      items: [
        ServiceItem(
            service: 'Asesoría para compra de equipos',
            price: 'COP 90.000 / hora'),
        ServiceItem(
            service: 'Configuración de oficina en casa',
            price: 'Desde COP 130.000'),
        ServiceItem(
            service: 'Implementación de copias de seguridad',
            price: 'Desde COP 120.000'),
      ],
    ),
  ];
}
