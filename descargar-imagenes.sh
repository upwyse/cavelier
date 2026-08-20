#!/bin/bash
# Este script descarga las imagenes del sitio desde el CDN de Lovable
# y las deja guardadas localmente en public_html/assets/images/
# luego reemplaza las URLs en los HTML para que ya no dependan de Lovable.
#
# Ejecutalo TU en tu propia computadora (con internet normal), dentro de esta carpeta:
#   bash descargar-imagenes.sh

set -e
BASE="https://mockup-palette-project.lovable.app"
DEST="public_html/assets/images"
mkdir -p "$DEST"

IMAGES=(
  "/__l5e/assets-v1/05c37e40-2896-4b81-acdd-25fe1954a042/logo-a-cropped.png"
  "/__l5e/assets-v1/0df2f1cf-0be7-4e83-bc44-be9900890a90/montanas-cavelier-1.jpg"
  "/__l5e/assets-v1/0f19dd15-a921-4c08-ba60-132b944a413a/globo-terrestre-linea.png"
  "/__l5e/assets-v1/1628909b-db3c-465c-920a-74ff6134dced/cavelier-logo-white.png"
  "/__l5e/assets-v1/1dc864c3-b883-4797-a7d8-88dc4803187a/ind-agro.jpg"
  "/__l5e/assets-v1/40ab39e4-83cc-4a81-934f-5058b254da4f/ind-laboratorio.avif"
  "/__l5e/assets-v1/45a99de0-ea87-44d9-8bb7-4208d0fa49b0/ind-educacion.avif"
  "/__l5e/assets-v1/4690e724-9936-4692-b1a3-a77237e35055/world-dotted-map.png"
  "/__l5e/assets-v1/46b620d1-8a29-4c43-9b42-585b853a1db9/montanas-cavelier-2.jpg"
  "/__l5e/assets-v1/5542e401-2915-4f26-a87d-c6e8a0d4b401/ascenso-ridge.jpg"
  "/__l5e/assets-v1/6336d5e6-4cd5-4f26-85aa-3582e4c30ca4/ind-financieros.jpg"
  "/__l5e/assets-v1/662e8123-98c3-47e9-947d-888a02d8162b/a-dark-tight.png"
  "/__l5e/assets-v1/69843f58-498a-4924-abd7-acc04dfef586/female-cutout.png"
  "/__l5e/assets-v1/75acc6a4-e230-4ca3-ad05-96a4f0aa26a0/ind-media.png"
  "/__l5e/assets-v1/8c627c21-e51f-48aa-affb-847236dd9289/male-cutout.png"
  "/__l5e/assets-v1/da669f02-75d3-4f2d-a53e-a136a61d9f02/montanas-cavelier-hero.jpg"
  "/__l5e/assets-v1/e0bbf777-4ee0-46b6-95fd-4a06e1e6393a/cavelier-mountains-clean.png"
  "/__l5e/assets-v1/e6df50be-4b5c-4928-be4a-1d5849c8fbc6/ind-consumo.webp"
  "/__l5e/assets-v1/f70969f2-acb2-46eb-b621-e4a3e2a62552/ind-tecnologia.jpg"
)

for path in "${IMAGES[@]}"; do
  filename=$(basename "$path")
  echo "Descargando $filename ..."
  curl -sL "$BASE$path" -o "$DEST/$filename"
done

echo "Reemplazando URLs en los archivos HTML..."
find public_html -name "*.html" | while read -r file; do
  for path in "${IMAGES[@]}"; do
    filename=$(basename "$path")
    # Reemplaza la URL completa de Lovable por la ruta local
    sed -i.bak "s#${BASE}${path}#/assets/images/${filename}#g" "$file"
  done
  rm -f "$file.bak"
done

echo "Listo. Las imagenes ahora estan en $DEST y el sitio ya no depende de Lovable."
