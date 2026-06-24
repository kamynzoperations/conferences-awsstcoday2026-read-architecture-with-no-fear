# Prompt de Estilo para Diagramas Mermaid - Entregables v2.0
## Listo para uso del equipo

**Proyecto**: Prompt de Estilo Mermaid Generalizado con Punto de Entrada a Internet

---

## Qué estás recibiendo

Este paquete contiene **todo lo necesario para estandarizar los diagramas de arquitectura** en tu equipo/organización. Incluye el prompt actualizado, el documento de especificación, la guía de patrones y ejemplos.

### 📦 Archivos incluidos

1. **MERMAID_STYLING_PROMPT_UPDATED.md** — El prompt principal (v2.0)
   - Actualizado desde la versión original v1.0 (solo AWS) → v2.0 (cualquier diagrama Mermaid)
   - Agrega un punto de entrada a internet en la parte superior de los diagramas
   - Incluye orientación para crear dos versiones (resumen + detallada)
   - Paleta de colores generalizada (basada en función, no específica de un proveedor)
   - **Uso**: Compártelo con el equipo; copia en Claude/ChatGPT/Gemini al darle estilo a los diagramas
---

## Cómo usar este paquete

### Escenario 1: Crear tu primer diagrama con estilo (Inicio rápido)

1. **Abre el Editor en vivo de Mermaid**: https://mermaid.live/
2. **Pega tu código Mermaid sin estilo**
3. **Copia el prompt actualizado** desde `MERMAID_STYLING_PROMPT_UPDATED.md`
4. **Pégalo en Claude (o ChatGPT/Gemini)**:
   ```
   [Copia el prompt actualizado]
   
   Ahora, por favor, da estilo a este diagrama Mermaid:
   [Pega tu código sin estilo]
   
   Crea DOS versiones:
   - Resumen (simplificada, 6-8 nodos, para presentación)
   - Detallada (completa, todos los nodos, para documentación)
   ```
5. **Verifica que ambas se rendericen** en el Editor en vivo de Mermaid
6. **Exporta** (PNG para diapositivas, SVG para documentación)


## Recursos adicionales

- **Documentación de Mermaid**: https://mermaid.js.org/
- **Editor en vivo**: https://mermaid.live/ (prueba diagramas aquí)
- **CLI de Mermaid**: Instálala con `npm install -g mermaid-cli`
- **Accesibilidad de color**: https://webaim.org/resources/contrastchecker/

---

## Referencia rápida: Uso del prompt

### Con Claude
```markdown
[Pega el contenido de MERMAID_STYLING_PROMPT_UPDATED.md]

Aplica esto a mi diagrama:

[Pega tu código Mermaid]

Crea ambas versiones, resumen y detallada.
```

### Con ChatGPT
```
Eres un experto en la creación de diagramas Mermaid profesionales.

[Pega las secciones DESCRIPTION y DISCERNMENT del prompt]

Ahora aplica esto a mi diagrama:

[Pega tu código Mermaid]

Crea una versión resumen (6-8 nodos, simplificada) y una versión detallada (todos los nodos, completa).
```

### Con Gemini
Mismo enfoque que con ChatGPT; copia el prompt y tu diagrama.

---

## Resumen

✅ **Ahora tienes**:
- Un prompt reutilizable para todo tu equipo
- Un documento de especificación que registra todas las decisiones
- Una guía de patrones con ejemplos concretos
- Todo lo necesario para tu presentación de AWS Student Day
- Archivos Markdown compatibles con control de versiones

✅ **Puedes**:
- Aplicar este prompt a CUALQUIER diagrama Mermaid (no solo AWS)
- Crear versiones resumen para presentaciones
- Crear versiones detalladas para documentación
- Personalizar los colores para tu organización
- Entrenar a tu equipo usando el patrón proporcionado
