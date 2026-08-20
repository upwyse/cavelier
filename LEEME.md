# Sitio estático de Cavelier — listo para WordPress

Este ZIP contiene el diseño completo de Lovable ya compilado a HTML/CSS/JS puro (30 páginas, incluidas las 8 páginas del menú principal, las 8 áreas de práctica, las 7 industrias, las 6 publicaciones y el perfil de Javier Escandón).

## Qué hay adentro

- **`public_html/`** → el sitio ya renderizado:
  - `index.html`, `la-firma/index.html`, `contacto/index.html`, etc. (una carpeta por página)
  - `assets/` → el CSS y JS ya compilados y optimizados por Vite
  - `favicon.ico`
- **`descargar-imagenes.sh`** → script para dejar el sitio 100% independiente de Lovable (ver abajo)

## Sobre las imágenes (importante)

El proyecto exportado de Lovable **no incluye los archivos de imagen** — Lovable las sirve desde su propio CDN. Por ahora, todo el HTML ya apunta directamente a ese CDN (`https://mockup-palette-project.lovable.app/__l5e/...`), así que **el sitio funciona ya mismo tal cual está**, sin pasos adicionales.

Pero para no depender de que el proyecto de Lovable siga existiendo a futuro, corre esto en tu computadora (con tu internet normal, no en un servidor):

```bash
bash descargar-imagenes.sh
```

Esto descarga las 19 imágenes del sitio a `public_html/assets/images/` y actualiza automáticamente todos los HTML para que apunten a esa carpeta local en vez de a Lovable.

## Cómo usarlo en tu hosting (recordando la guía anterior)

1. Sube el contenido de `public_html/` a tu hosting (por FTP o el Administrador de Archivos de cPanel), usando la URL temporal o tu archivo `hosts` modificado para probarlo antes de conectar el dominio.
2. Si vas a integrarlo dentro de WordPress en vez de dejarlo como sitio estático puro, usa el plugin **WPCode** (o similar) para pegar el `<head>` (CSS/fuentes) y el contenido de cada `<body>` en la página correspondiente de WordPress — tal como está en la Fase 5 de la guía de migración.

## Nota sobre "Publicaciones" y "Contacto"

Estas páginas están renderizadas con datos de ejemplo (placeholder) tal como estaban en el diseño de Lovable. Cuando lo pases a WordPress, conviene:
- Reemplazar "Publicaciones" con el sistema nativo de **Entradas** de WordPress.
- Conectar el formulario de "Contacto" a un plugin real (WPForms / Contact Form 7), ya que en este export es solo visual (no envía correos).

## Perfiles de profesionales

Solo **Javier Escandón** tiene página de perfil completa — así estaba diseñado en el proyecto original de Lovable (el código indica "diseño en revisión" para el resto del equipo). El resto del equipo aparece únicamente como tarjeta en `/profesionales`.
