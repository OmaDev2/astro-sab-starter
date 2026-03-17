#!/usr/bin/env bash
# demo.sh — Preview rápido del starter con datos de ejemplo
# Uso: ./demo.sh [paleta]
# Paletas: industrial | nature | electric | premium | warm | fresh (default: warm)
#
# El script NO modifica el template original.
# Crea una copia temporal en /tmp/astro-demo, la rellena y lanza npm run dev.

set -e

PALETTE="${1:-warm}"
DEMO_DIR="/tmp/astro-demo-$$"

VALID_PALETTES="industrial nature electric premium warm fresh"
if ! echo "$VALID_PALETTES" | grep -qw "$PALETTE"; then
  echo "❌ Paleta desconocida: $PALETTE"
  echo "   Paletas disponibles: $VALID_PALETTES"
  exit 1
fi

echo ""
echo "🚀 Creando demo con paleta '$PALETTE'..."
echo "   Directorio temporal: $DEMO_DIR"
echo ""

# Copiar template a directorio temporal
cp -r "$(dirname "$0")" "$DEMO_DIR"
cd "$DEMO_DIR"

# Limpiar git y content stubs
rm -rf .git
rm -f src/content/locations/.gitkeep
rm -f src/content/services/.gitkeep

# Aplicar paleta
cp "palettes/${PALETTE}.config.mjs" tailwind.config.mjs

# Google Fonts URLs por paleta (compatible con bash 3.x de macOS)
case "$PALETTE" in
  industrial) FONTS_URL="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Inter:wght@400;500;600;700;800&display=swap" ;;
  nature)     FONTS_URL="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap" ;;
  electric)   FONTS_URL="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&display=swap" ;;
  premium)    FONTS_URL="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800&family=Lato:wght@300;400;700&display=swap" ;;
  warm)       FONTS_URL="https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800&display=swap" ;;
  fresh)      FONTS_URL="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800&display=swap" ;;
esac
sed -i '' "s|__GOOGLE_FONTS_URL__|${FONTS_URL}|g" src/layouts/BaseLayout.astro 2>/dev/null || \
  sed -i    "s|__GOOGLE_FONTS_URL__|${FONTS_URL}|g" src/layouts/BaseLayout.astro

# astro.config.mjs y package.json
sed -i '' 's|__SITE_URL__|https://demo.example.com|g' astro.config.mjs 2>/dev/null || \
  sed -i    's|__SITE_URL__|https://demo.example.com|g' astro.config.mjs

sed -i '' 's|__PROJECT_SLUG__|astro-demo|g' package.json 2>/dev/null || \
  sed -i    's|__PROJECT_SLUG__|astro-demo|g' package.json

# business.json con datos de demo (parquetista Barcelona)
cat > src/data/business.json << 'BUSINESS'
{
  "name": "Parquets Martínez",
  "legalName": "Parquets Martínez S.L.",
  "type": "HomeAndConstructionBusiness",
  "phone": "+34 612 345 678",
  "email": "info@parquetsmartinez.es",
  "url": "https://demo.example.com",
  "logo": "/images/logo.png",
  "priceRange": "$$",
  "openingHours": ["Mo-Fr 08:00-18:00", "Sa 09:00-14:00"],
  "serviceArea": ["Barcelona", "Badalona", "Hospitalet", "Terrassa", "Sabadell"],
  "services": ["Instalación de parquet", "Lijado y barnizado", "Tarima flotante", "Parquet de madera maciza"],
  "socialProfiles": {
    "facebook": "",
    "instagram": "",
    "google": "",
    "yelp": ""
  },
  "founded": "2010",
  "description": "Parquetistas profesionales en Barcelona. Instalación, lijado y restauración de parquet y tarima flotante. Presupuesto gratis en 24h.",
  "reviews": {
    "ratingValue": "4.9",
    "reviewCount": "87"
  },
  "brandColors": {
    "primary": "#92400e",
    "accent": "#d97706"
  }
}
BUSINESS

# home.json
cat > src/data/home.json << 'HOME'
{
  "heroImageAlt": "Parquetista profesional instalando parquet en Barcelona",
  "h1": "Parquetistas profesionales en Barcelona",
  "heroSubtitle": "Instalación, lijado y restauración de parquet con garantía de calidad. Presupuesto gratis en 24h.",
  "ctaText": "Solicitar presupuesto gratis",
  "servicesHeading": "Nuestros servicios de parquet"
}
HOME

# Servicios de demo
mkdir -p src/content/services

cat > src/content/services/instalacion-parquet.md << 'MD'
---
name: "Instalación de parquet"
title: "Instalación de parquet en Barcelona | Parquets Martínez"
description: "Instalación profesional de parquet en Barcelona. Madera maciza, ingeniería y laminado. Presupuesto gratis sin compromiso."
price: "Desde 25€/m²"
keywords: ["instalacion parquet barcelona", "parquetista barcelona", "precio parquet barcelona"]
---

## Instalación de parquet profesional en Barcelona

Somos especialistas en la instalación de todo tipo de parquet y tarima en Barcelona y área metropolitana. Trabajamos con madera maciza, parquet de ingeniería y tarima flotante de las mejores marcas.

## ¿Cuánto cuesta instalar parquet en Barcelona?

El precio de instalación de parquet en Barcelona oscila entre **25 y 55 €/m²** dependiendo de:

- **Tipo de madera:** roble, nogal, cerezo, exóticas
- **Sistema de instalación:** pegado, flotante, clavado
- **Preparación del suelo:** si requiere autonivelante o fresado previo
- **Superficie total:** a mayor superficie, mejor precio por metro cuadrado

> Solicita tu presupuesto gratuito. Respondemos en menos de 24h.

## Tipos de parquet que instalamos

**Parquet de madera maciza** — la opción más duradera y natural. Permite lijar y renovar varias veces a lo largo de su vida útil (50+ años).

**Parquet de ingeniería** — núcleo multilámina con capa de madera noble. Mayor estabilidad dimensional ante cambios de humedad. Ideal para suelo radiante.

**Tarima flotante** — instalación rápida sin cola ni clavos. Amplia variedad de acabados y precios. Perfecta para reformas con presupuesto ajustado.

## Proceso de instalación

1. **Visita técnica gratuita** — medimos la superficie y evaluamos el estado del suelo
2. **Presupuesto detallado** — sin sorpresas, incluye materiales y mano de obra
3. **Aclimatación** — dejamos la madera 48h en la estancia para adaptarse a la humedad
4. **Instalación profesional** — equipo propio, sin subcontratas
5. **Acabado final** — lijado, barnizado o aceite según preferencia
6. **Garantía** — 2 años de garantía en instalación

## Preguntas frecuentes

**¿Cuánto tiempo tarda la instalación?** Para una vivienda media de 80 m², la instalación completa se realiza en 2-3 días laborables.

**¿Puedo instalar parquet sobre suelo radiante?** Sí, pero es imprescindible usar parquet de ingeniería o tarima específica para suelo radiante con conductividad térmica adecuada.
MD

cat > src/content/services/lijado-barnizado.md << 'MD'
---
name: "Lijado y barnizado"
title: "Lijado y barnizado de parquet Barcelona | Precio y presupuesto"
description: "Renovamos tu parquet antiguo con lijado y barnizado profesional en Barcelona. Resultados como nuevo. Presupuesto gratis."
price: "Desde 12€/m²"
keywords: ["lijar parquet barcelona", "barnizar parquet barcelona", "restaurar parquet"]
---

## Lijado y barnizado de parquet en Barcelona

Si tu parquet tiene arañazos, manchas o simplemente ha perdido su brillo original, el lijado y barnizado profesional es la solución más económica para renovarlo sin necesidad de sustituirlo.

## ¿Cuánto cuesta lijar y barnizar parquet?

El precio del lijado y barnizado en Barcelona oscila entre **12 y 25 €/m²** según:

- Estado actual del parquet (arañazos superficiales vs profundos)
- Tipo de acabado elegido (barniz brillante, satinado, mate o aceite natural)
- Número de capas aplicadas

## Proceso de lijado profesional

Utilizamos maquinaria de lijado sin polvo (aspiración integrada) que permite trabajar con la vivienda habitada. El proceso completo dura 1-2 días para una estancia media.

**¿Cuántas veces se puede lijar un parquet?** Un parquet de madera maciza de 20mm puede lijarse entre 4 y 6 veces a lo largo de su vida. El parquet de ingeniería, entre 2 y 3 veces según el espesor de la capa noble.
MD

cat > src/content/services/tarima-flotante.md << 'MD'
---
name: "Tarima flotante"
title: "Instalación tarima flotante Barcelona | Precio 2024"
description: "Instalación de tarima flotante en Barcelona. Gran variedad de marcas y acabados. Colocación rápida y limpia. Presupuesto sin compromiso."
price: "Desde 18€/m²"
keywords: ["tarima flotante barcelona", "colocar tarima flotante", "precio tarima flotante barcelona"]
---

## Tarima flotante en Barcelona — instalación profesional

La tarima flotante es la opción más popular para reformas: instalación rápida (sin cola ni tornillos), gran variedad de acabados y precio muy competitivo.

## Ventajas de la tarima flotante

- **Instalación en 1 día** para superficies de hasta 60 m²
- **Sin obras** — se coloca directamente sobre el suelo existente (baldosa, parquet antiguo, cemento)
- **Variedad ilimitada** — roble, nogal, cerezo, tonos grises, blanqueados
- **Fácil sustitución** de lamas dañadas sin desmontar todo el suelo

## ¿Cuánto cuesta la tarima flotante instalada?

Precio total (material + instalación) en Barcelona: **18 a 35 €/m²** según calidad del producto. Incluimos rodapiés y umbral de puerta.
MD

# Ciudades de demo
mkdir -p src/content/locations

cat > src/content/locations/barcelona.md << 'MD'
---
city: "Barcelona"
state: "Cataluña"
h1: "Parquetistas en Barcelona — Instalación y lijado profesional"
title: "Parquetista en Barcelona | Presupuesto gratis en 24h"
description: "Parquetistas profesionales en Barcelona. Instalación, lijado y restauración de parquet y tarima. +87 reseñas ⭐ 4.9. Presupuesto gratis."
heroImage: "https://images.unsplash.com/photo-1541123437800-1bb1317badc2?w=1200&h=675&fit=crop"
neighborhoods: ["Eixample", "Gràcia", "Sant Gervasi", "Sarrià", "Les Corts", "Sants", "Poblenou"]
priceRange: "25-55 €/m²"
keywords: ["parquetista barcelona", "instalar parquet barcelona", "precio parquet barcelona"]
faqs:
  - question: "¿Cuánto cuesta instalar parquet en Barcelona?"
    answer: "El precio de instalación de parquet en Barcelona oscila entre 25 y 55 €/m² según el tipo de madera y sistema de colocación. La tarima flotante es la opción más económica (desde 18 €/m²) y el parquet de madera maciza la más duradera (desde 40 €/m²)."
  - question: "¿Cuánto tiempo tarda instalar parquet en un piso de 80 m²?"
    answer: "Para un piso estándar de 80 m², la instalación completa lleva entre 2 y 3 días laborables, incluyendo preparación del suelo, instalación y acabado."
---

## Parquetistas profesionales en Barcelona

Con más de 14 años instalando parquet en Barcelona, somos uno de los equipos de parquetistas de confianza en la ciudad. Trabajamos en todos los distritos de Barcelona y área metropolitana.

## ¿Cuánto cuesta instalar parquet en Barcelona?

Los precios del parquet en Barcelona varían según el tipo de suelo elegido:

| Tipo | Precio instalado |
|------|-----------------|
| Tarima flotante | 18 - 28 €/m² |
| Parquet de ingeniería | 30 - 45 €/m² |
| Parquet madera maciza | 40 - 55 €/m² |
| Lijado y barnizado | 12 - 22 €/m² |

> Estos precios incluyen materiales y mano de obra. Solicita presupuesto personalizado gratuito.

## Dónde trabajamos en Barcelona

Cubrimos todos los barrios de Barcelona: **Eixample, Gràcia, Sant Gervasi, Sarrià, Les Corts, Sants, Poblenou, Barceloneta, Gòtic** y todos los distritos. Sin recargo por desplazamiento dentro de la ciudad.

## Instaladores de parquet en Barcelona — ¿por qué elegirnos?

- **Equipo propio** — sin subcontratas, mismo equipo del presupuesto a la instalación
- **Garantía 2 años** en instalación y materiales
- **Maquinaria sin polvo** — trabajamos con aspiración integrada
- **Presupuesto en 24h** — visita técnica gratuita y sin compromiso
MD

cat > src/content/locations/badalona.md << 'MD'
---
city: "Badalona"
state: "Cataluña"
h1: "Parquetistas en Badalona — Instalación y lijado de parquet"
title: "Parquetista en Badalona | Presupuesto gratis sin compromiso"
description: "Parquetistas en Badalona. Instalación de parquet, tarima flotante y lijado profesional. Presupuesto gratis. Respuesta en 24h."
heroImage: "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=1200&h=675&fit=crop"
neighborhoods: ["Centre", "Sant Roc", "Artigas", "Bufalà", "Llefià", "La Salut"]
priceRange: "22-50 €/m²"
keywords: ["parquetista badalona", "instalar parquet badalona", "tarima flotante badalona"]
faqs:
  - question: "¿Cuánto cuesta instalar parquet en Badalona?"
    answer: "El precio de instalación de parquet en Badalona está entre 22 y 50 €/m² dependiendo del tipo de madera. La tarima flotante es la más económica desde 18 €/m²."
---

## Parquetistas en Badalona

Ofrecemos servicios de instalación y restauración de parquet en Badalona y toda el área del Barcelonès Nord. Trabajamos tanto en viviendas como en locales comerciales y oficinas.

## ¿Cuánto cuesta el parquet en Badalona?

Los precios en Badalona son similares a Barcelona ciudad. Para tarima flotante, desde 18 €/m² instalada. Para parquet de madera maciza, desde 38 €/m². El lijado y renovación del parquet existente desde 12 €/m².

## Barrios de Badalona donde trabajamos

Cubrimos todos los barrios: **Centre, Sant Roc, Artigas, Bufalà, Llefià, La Salut, Morera, Pomar, Sistrells** y todo el municipio sin recargo por desplazamiento.
MD

# npm install y dev
echo ""
echo "📦 Instalando dependencias..."
npm install --silent

echo ""
echo "✅ Demo lista. Paleta: $PALETTE"
echo ""
echo "📍 Directorio: $DEMO_DIR"
echo "   Para limpiar después: rm -rf $DEMO_DIR"
echo ""
echo "🌐 Abriendo http://localhost:4321 ..."
echo ""

npm run dev
