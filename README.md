# Zeraus Tech (Flutter Web)

Aplicación web construida con Flutter para presentar los servicios de soporte técnico de Zeraus Tech:

- Mantenimiento
- Reparación
- Asesoría

Atiende Tocancipá, sus alrededores y el norte de Bogotá.

## Ejecutar localmente

1. Instala Flutter (canal estable).
2. Activa web: `flutter config --enable-web`
3. Corre la app:

```bash
flutter pub get
flutter run -d chrome
```

## Sitemap y Google Search Console

El sitio publica el sitemap en:

`https://luissuarez89.github.io/servicio-tecnico-pc/sitemap.xml`

Después de desplegar los cambios, envía `sitemap.xml` en la sección **Sitemaps** de Google Search Console. El archivo `robots.txt` también anuncia la URL del sitemap.
