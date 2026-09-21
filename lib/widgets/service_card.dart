import 'package:flutter/material.dart';
import '../models/service_category.dart';
import 'price_table_row.dart';

class ServiceCard extends StatefulWidget {
  final ServiceCategory category;

  const ServiceCard({
    super.key,
    required this.category,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  IconData _getIconForCategory(String title) {
    if (title.toLowerCase().contains('mantenimiento'))
      return Icons.build_circle_outlined;
    if (title.toLowerCase().contains('reparación'))
      return Icons.computer_outlined;
    if (title.toLowerCase().contains('asesoría'))
      return Icons.support_agent_outlined;
    return Icons.design_services_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(0, _isHovered ? -8.0 : 0.0, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xFFE9ECEF),
              width: _isHovered ? 2.0 : 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ]
                : [
                    const BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
          ),
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getIconForCategory(widget.category.title),
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.category.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.category.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              const Divider(color: Color(0xFFE9ECEF), thickness: 1.5),
              const SizedBox(height: 16),
              ...widget.category.items.map((item) => PriceTableRow(item: item)),
            ],
          ),
        ),
      ),
    );
  }
}
