# Paso 3 — Ejecutar Terramaid y Terravision

## Resumen

Este paso visualiza la infraestructura de Terraform del repositorio de demostración utilizando dos herramientas complementarias:

- **Terramaid** → genera un diagrama de flujo Mermaid a partir de las relaciones entre recursos de Terraform, y luego aplica estilos mediante IA con Claude.
- **Terravision** → genera un diagrama PNG de arquitectura en la nube directamente a partir de los archivos fuente de Terraform.

---

## 1. Clonar el repositorio

**Por qué:** Necesitas los archivos fuente de Terraform y el prompt de estilo Mermaid para ejecutar ambas herramientas.

```bash
git clone https://github.com/kamynzoperations/conferences-awsstcoday2026-read-architecture-with-no-fear.git
```

---

## 2. Ejecutar Terramaid en `tf-demo-repo`

**Por qué:** Terramaid analiza tu plan o configuración de Terraform y convierte las dependencias entre recursos en un diagrama Mermaid, haciendo que la arquitectura sea legible sin necesidad de acceder a la consola de la nube.

**Lo que producirás:** Un archivo de diagrama de flujo Mermaid sin estilo (`00_tm_demo-repo.mmd`) y una versión estilizada (`01_tm_style-demo-repo.mmd`).

### 2a. Navega al directorio de Terraform

```bash
cd tf-demo-repo
```

### 2b. Genera el diagrama Mermaid sin estilo

**Por qué:** Este comando escanea los recursos de Terraform en el directorio actual y genera un diagrama de flujo de izquierda a derecha en formato Mermaid.

```bash
terramaid run \
  -o 00_tm_demo-repo.mmd \
  -r "LR" \
  -s "00_tm_demo-repo" \
  -c "flowchart"
```

| Flag | Significado |
|------|---------|
| `-o` | Nombre del archivo de salida |
| `-r` | Dirección: `LR` = de izquierda a derecha |
| `-s` | Subtítulo / etiqueta del diagrama |
| `-c` | Tipo de gráfico (`flowchart`) |

**Resultado esperado:** `00_tm_demo-repo.mmd`

### 2c. Aplica estilos con IA usando Claude

**Por qué:** La salida de Mermaid sin estilo es funcional pero no tiene diseño. El prompt en `MERMAID_STYLING_PROMPT_UPDATED.md` indica a Claude que aplique colores con temática de AWS, íconos y mejoras de diseño.

**Cómo hacerlo:**

1. Abre una terminal y ejecuta Claude Code desde el directorio `tf-demo-repo`:

    ```bash
    claude
    ```

2. Confirma tu directorio de trabajo dentro de Claude:

    ```
    pwd
    ```

3. Ejecuta el siguiente prompt en Claude:

    ```
    Usa el prompt en ../MERMAID_STYLING_PROMPT_UPDATED_spanish.md sobre el archivo 00_tm_demo-repo.mmd
  y genera la salida como 01_tm_style-demo-repo.mmd.

  Crea DOS versiones:
    - Resumen (simplificada, 6-8 nodos, para presentación)
    - Detallada (completa, todos los nodos, para documentación)

  Genera las 2 versiones en archivos .mmd separados:
    - 01_tm_style-demo-repo-resumen.mmd
    - 01_tm_style-demo-repo-detallado.mmd
    ```

**Resultado esperado:** `01_tm_style-demo-repo.mmd` — un diagrama Mermaid con estilo, listo para presentación.

---

## 3. Ejecutar Terravision en `tf-demo-repo`

**Por qué:** Terravision genera un diagrama visual de arquitectura en la nube a partir del mismo código fuente de Terraform — útil para quienes prefieren diagramas de infraestructura en lugar de diagramas de flujo.

**Cómo hacerlo:** Abre una **ventana de terminal separada** (mantén la sesión de Claude abierta si todavía la estás usando), y luego ejecuta:

```bash
terravision draw \
  --source . \
  --format png \
  --outfile 00_tv_demo-repo-aws_architecture
```

| Flag | Significado |
|------|---------|
| `--source` | Ruta a los archivos de Terraform (`.` = directorio actual) |
| `--format` | Formato de la imagen de salida (`png`) |
| `--outfile` | Nombre del archivo de salida (sin necesidad de extensión) |

**Resultado esperado:** `00_tv_demo-repo-aws_architecture.png`

---

## Opcional — Ejecutar Terramaid en `tf-aws-account-storage`

> Sigue los mismos pasos de la Sección 2, sustituyendo `tf-aws-account-storage` como directorio de trabajo y actualizando los nombres de los archivos de salida en consecuencia.

