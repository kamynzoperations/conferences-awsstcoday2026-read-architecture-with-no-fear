# De Junior a Arquitec: Leer infra sin miedo — AWS Student Day 2026

- 💼 [LinkedIn](https://www.linkedin.com/in/kamymartinez/)
- 🐦 [Instagram](https://www.instagram.com/kamynz/)


## Introducción

Este repositorio tiene la información necesaria para seguir la demo de la charla **"Read Architecture with No Fear"** en el ambiente de **AWS Student Day 2026**. Contiene el proyecto de Terraform usado en la demo en vivo y las guías paso a paso (español + inglés) para visualizar infraestructura con **Terramaid** y **Terravision**.

## Enlace relevante

> 🔗 **Presentación**: TBD — el enlace se agregará una vez publicado.

## Audiencia

- Audiencia mixta/general de conferencia, incluyendo asistentes sin experiencia técnica previa
- Personas que sienten temor o intimidación al leer código de Terraform directamente
- Cualquier rol que quiera aprender a leer arquitectura en la nube a través de diagramas en lugar de archivos `.tf`

## Metas

- Introducción a la lectura de arquitecturas de AWS a través de diagramas, sin necesidad de leer Terraform línea por línea
- Generar un diagrama de flujo Mermaid (Terramaid) a partir de recursos de Terraform, con estilo aplicado vía IA
- Generar un diagrama de arquitectura en PNG (Terravision) directamente desde el código fuente de Terraform

## Resumen

| **Metas**        | *Ver sección de Metas arriba*                                                  |
| ----------------- | ------------------------------------------------------------------------------- |
| **Qué aprenderás** | *Uso de Terramaid y Terravision para visualizar infraestructura de Terraform*  |
| **Qué necesitarás** | *Terraform, Python, Git y Graphviz instalados (ver Prerequisitos)*            |
| **Temas**         | *Terraform, Terramaid, Terravision, Mermaid*                                    |
| **Slides**        | TBD                                                                              |

## Prerequisitos relevantes

- Tener instalado Terramaid y Terravision junto con sus dependencias (Python 3.10+, Git, Graphviz, Terraform) — ver [`step1-installation-spanish.md`](./step1-installation-spanish.md)
- Tener acceso al proyecto de demo [`tf-demo-repo/`](./tf-demo-repo)

## Estructura del repositorio

```
.
├── step1-installation-spanish.md                  # Paso 1 (Español) — instalar Terramaid y Terravision
├── step2-check-prompt-for-terramaid-spanish.md     # Paso 2 (Español) — revisar el prompt de estilo Mermaid
├── step3-run-terramaid-and-terravision-spanish.md  # Paso 3 (Español) — ejecutar ambas herramientas en tf-demo-repo
├── tf-demo-repo/                                  # Proyecto de Terraform usado en la demo en vivo
│   ├── *.tf                                       # Infraestructura fuente (ALB, ECS, RDS, networking, etc.)
│   └── results/                                   # Salida generada por Terramaid/Terravision (ver Workflows abajo)
```

La demo recorre específicamente `tf-demo-repo/`. Los pasos están numerados y son equivalentes en ambos idiomas; sigue el conjunto que corresponda a tu idioma.

## Workflows

Dos workflows de GitHub Actions convierten los diagramas generados localmente en un PR revisable:

| Workflow | Archivo | Detecta |
|---|---|---|
| Commit Terramaid Results | `.github/workflows/terramaid-results.yml` | `*_tm_*.mmd` |
| Commit Terravision Results | `.github/workflows/terravision-results.yml` | `*_tv_*.png` |

**Disparo (trigger):**
- Automáticamente al hacer push a `main` cuando cambia algún archivo `**.tf`, o
- Manualmente, en cualquier momento, mediante `workflow_dispatch`.

**Qué hace:** busca los archivos generados correspondientes en todo el repositorio, los mueve a la carpeta `tf-*/results/` más cercana, y abre un pull request contra `main` con los cambios.

**Ejecución manual:**
1. Ve a la pestaña **Actions** en GitHub.
2. Selecciona "Commit Terramaid Results" o "Commit Terravision Results" en la barra lateral izquierda.
3. Haz clic en **Run workflow** → elige la rama `main` → **Run workflow**.
4. Una vez que termine, revisa el PR abierto y haz merge.

## Video

> Link del demo: https://youtu.be/_mBFRftzf34

## Pre-Learning

> TBD

## Agradecimientos

- [Santiago Hurtado](https://co.linkedin.com/in/santiago-hurtado): Ofrecerme apoyo y su conocimiento en liderazgo para desafiarme cada vez mas. 
- [Jhonny Pong](https://www.linkedin.com/in/JhonnyPong): Ofrecerme apoyo en los eventos y ser una constante persona en mi vida laboral para seguir creciendo. 
