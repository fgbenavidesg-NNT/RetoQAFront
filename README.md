# Reto de Automatización QA – FrontEnd  

Este proyecto implementa una **suite de pruebas automatizadas** para la aplicación web [Sauce Demo](https://www.saucedemo.com/), utilizando **Playwright** con **Cucumber** y el patrón de diseño **Page Object Model (POM)**.  

---

## Contenido del proyecto

- `config/cucumber.js` : Configuración de Cucumber (parámetros de ejecución).  
- `src/features/` : Archivos `.feature` escritos en Gherkin con los escenarios de prueba (ejemplo: flujo de compra).  
- `src/helper/browsers/` : Configuración del navegador (headless, viewport, etc.).  
- `src/helper/env/` : Variables de entorno y datos de prueba.  
- `src/helper/types/` : Definición de tipos en TypeScript.  
- `src/helper/report.ts` : Configuración y generación de reportes.  
- `src/hooks/hooks.ts` : Hooks de Cucumber (`Before`, `After`, setup y teardown de escenarios).  
- `src/pages/` : Page Objects que implementan el patrón **POM**.  
  - `loginPage.ts` : Página de inicio de sesión.  
  - `dashboardPage.ts` : Página principal con el listado de productos.  
  - `carritoCompras.ts` : Página del carrito de compras.  
  - `checkoutPage.ts` : Página de checkout y confirmación de compra.  
- `src/step-definitions/comprarProductosSteps.ts` : Implementación de los pasos de los escenarios definidos en Gherkin.  
- `test-results/reports/` : Reportes de ejecución generados (JSON, HTML, etc.).  
---
## Requisitos  

- **Node.js** (v18 o superior)  
- **npm** (incluido con Node.js)  
- **Git**  
- Conexión a internet para descargar dependencias
---


## Configuración

1. Clonar el repositorio:  
```bash
   git clone https://github.com/fgbenavidesg-NNT/RetoQAFront.git
   cd RetoQAFront
```

2. Instalacion de dependencias 
```bash
    npm install
```

3. Instalar los navegadores de Playwright
```bash
   npx playwright install
```

## Ejecución de pruebas

# Ejecutar todas las pruebas
```bash
    npm run test-dev 
```
# Ejecutar escenario

```bash
    npm run test-dev -- --tags "@comprar_productos_usuario_valido"
```

# Ejecutar feature

```bash
    npm run test-dev -- src/features/comprar_productos.feature
```
