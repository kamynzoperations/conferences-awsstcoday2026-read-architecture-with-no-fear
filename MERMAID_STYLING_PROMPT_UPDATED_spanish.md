# Prompt de Estilización para Diagramas Mermaid
## Enfoque Basado en el Marco de Fluencia en IA (Marco 4Ds)
### Versión 2.0 — Generalizado para Cualquier Diagrama Mermaid con Punto de Entrada a Internet

---

## 📋 DELEGACIÓN: Instrucciones Claras para Modelos de IA

### Lo que Necesito
Necesito que estilices un código de diagrama Mermaid con un esquema de colores profesional, lo organices en un diseño jerárquico, añadas un punto de entrada de tráfico externo y apliques principios modernos de diseño visual.

### Contexto
- **Entrada**: Código de diagrama Mermaid sin procesar (cualquier tipo: flowchart, graph, state, ER, Gantt)
- **Salida**: Diagrama Mermaid estilizado con jerarquía clara, punto de entrada a internet, capas agrupadas y estilo profesional
- **Propósito**: Crear diagramas de arquitectura/sistema listos para publicación para audiencias mixtas
- **Restricciones**: Debe funcionar tanto para ingenieros COMO para partes interesadas no técnicas; válido para múltiples proveedores de nube y tipos de dominio

### Entregable Esperado
```
- Código de diagrama Mermaid con estilo aplicado
- Diseño de arriba hacia abajo (TD) o apropiado con punto de entrada a internet en la PARTE SUPERIOR
- Recursos agrupados en subgrafos lógicos por función/tipo de servicio
- Cada recurso etiquetado con íconos descriptivos y nombres legibles
- Flujo de datos claro que muestre dependencias y puntos de entrada/salida
- Esquema de colores profesional con categorías basadas en función consistentes
- Dos versiones (general + detallada) para audiencias mixtas
```

---

## 🎯 DESCRIPCIÓN: Especificaciones Técnicas Detalladas

### Descripción General: Qué lo Diferencia de la v1.0

**NUEVO en v2.0:**
1. **Capa de Punto de Entrada a Internet** — Los usuarios/tráfico externo entra desde ARRIBA
2. **Esquema de Colores Generalizado** — No específico de AWS; funciona para cualquier proveedor de nube o dominio
3. **Selección de Símbolos** — Dos opciones de íconos para usuarios de internet (👥 personas, 🌐 globo)
4. **Patrón de Dos Versiones** — Incluye orientación para crear diagramas generales vs. detallados
5. **Funciona con CUALQUIER Tipo Mermaid** — Flowchart, graph, state, ER, Gantt, etc.

---

## Paso 1: Elige Tu Símbolo de Punto de Entrada

**Para el nodo "Usuarios de Internet / Tráfico Externo", elige UNO:**

- **👥** — Usar cuando se representan USUARIOS FINALES, personas, clientes, aplicaciones cliente
  - *Ejemplo: "👥 Usuarios de App Móvil", "👥 Clientes de API", "👥 Navegadores Web"*
  - Mejor para: Sistemas orientados al usuario, SaaS, aplicaciones de consumo

- **🌐** — Usar cuando se representa TRÁFICO GENÉRICO DE INTERNET, cualquier fuente externa, acceso agnóstico a la nube
  - *Ejemplo: "🌐 Tráfico de Internet", "🌐 Solicitudes Externas", "🌐 Acceso Público"*
  - Mejor para: Diagramas de infraestructura, sistemas de múltiples fuentes, documentación agnóstica al proveedor

**Recomendación**: Elige según tu audiencia. Las partes interesadas no técnicas prefieren 👥. Los ingenieros prefieren 🌐. ¿Audiencia mixta? Usa 👥 para la versión general, 🌐 para la detallada.

---

## Paso 2: Define Tu Esquema de Colores (Basado en Función, No Específico del Proveedor)

**Categorías de Función Genéricas** — Adaptar a tu proveedor/dominio:

| Categoría de Función | Color Ejemplo | Código Hex | Color de Texto | Ejemplos |
|---|---|---|---|---|
| **Cómputo** | Naranja | `#FF9900` | Oscuro (`#232F3E`) | Funciones, Workers, Servicios, VMs |
| **Almacenamiento** | Verde | `#7AA116` | Blanco (`#fff`) | Almacenamiento de Objetos, Discos, Blobs |
| **Base de Datos** | Teal | `#00897B` | Blanco (`#fff`) | BD Relacional, NoSQL, Caché |
| **Seguridad/IAM** | Rojo | `#DD344C` | Blanco (`#fff`) | Identidad, Auth, Permisos, Secretos |
| **Red** | Morado | `#A66AD1` | Blanco (`#fff`) | Redes, Balanceadores de Carga, Enrutamiento, DNS |
| **Eventos/Mensajería** | Rosa | `#E7157B` | Blanco (`#fff`) | Colas, Pub/Sub, Streams, Eventos |
| **Monitoreo** | Rosa Claro | `#FF4F8B` | Blanco (`#fff`) | Observabilidad, Logs, Métricas, Alertas |
| **Config/Datos** | Azul Cielo | `#5294CF` | Blanco (`#fff`) | Configs, Parámetros, Secretos, Metadatos |
| **Utilidad/Temp** | Gris | `#879196` | Blanco (`#fff`) | Recursos temporales, helpers, código de pegamento |

**Personalización**: Reemplaza estos códigos hex con la paleta de colores de tu organización. Las *categorías* (Cómputo, Almacenamiento, etc.) son universales; los *colores* se adaptan a tu marca.

---

## Paso 3: Define Tus Capas de Jerarquía (De Arriba Hacia Abajo)

**Orden Estándar de Capas** (adaptar a tu caso de uso):

```
CAPA 0: Tráfico Externo / Usuarios de Internet (NUEVO en v2.0)
         ↓
CAPA 1: Puntos de Entrada (CDN, Balanceador de Carga, API Gateway, DNS Público)
         ↓
CAPA 2: Seguridad (Auth, Firewall, WAF, Identidad)
         ↓
CAPA 3: Procesamiento / Orquestación (Servicios, Funciones, Workers)
         ↓
CAPA 4: Almacenamiento / Persistencia (Bases de Datos, Cachés, Almacenamiento de Objetos)
         ↓
CAPA 5: Monitoreo / Observabilidad (Logs, Métricas, Alertas)
         ↓
CAPA 6: Infraestructura de Soporte (Redes, Secretos, Config)
```

**Omitir las capas que no apliquen a tu diagrama.**

---

## Paso 4: Crea el Punto de Entrada a Internet (NUEVA SECCIÓN)

**En la PARTE SUPERIOR de tu diagrama, añade un nodo de tráfico externo:**

```
%% Punto de entrada de usuarios de internet (elige un símbolo):

%% Opción A: Ícono de personas (para enfoque en usuario final)
users["👥 Usuarios Finales<br/>Desde Internet"]

%% Opción B: Ícono de globo (para enfoque agnóstico a la nube)
users["🌐 Tráfico de Internet<br/>Solicitudes Externas"]
```

**Estilizando el punto de entrada:**
- Usa un color neutro: Gris o Azul Claro (representa "fuera" del sistema)
- Hazlo visualmente distinto de los recursos internos
- Conéctalo a tu primera capa interna con una flecha clara
- Ejemplo al estilo AWS:

```
classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
class users external
```

**Flujo**: Punto de entrada a Internet → Capa de entrada (CDN/ALB) → Capas internas → Base de Datos/Salida

---

## Paso 5: Organiza en Subgrafos por Función

Crea un subgrafo para cada capa:

```
%% CAPA 0: Externa
subgraph internet["🌐 Tráfico Externo"]
    direction LR
    users["👥 Usuarios Finales<br/>Desde Internet"]
end

%% CAPA 1: Puntos de Entrada
subgraph entry["📥 Puntos de Entrada"]
    direction LR
    cdn["🌐 CDN / Edge<br/>Entrega de Contenido"]
    alb["⚖️ Balanceador de Carga<br/>Distribución de Tráfico"]
end

%% CAPA 2: Procesamiento
subgraph compute["λ Cómputo"]
    direction LR
    service["⚙️ Servicio / Función<br/>Lógica de Negocio"]
end

%% CAPA 3: Almacenamiento
subgraph storage["💾 Almacenamiento"]
    direction LR
    database["🗄️ Base de Datos<br/>Persistencia"]
end

%% Conexiones
internet --> entry
entry --> compute
compute --> storage
```

---

## Paso 6: Aplica Estilo Consistente con ClassDef

**Pega esto en la PARTE SUPERIOR de tu diagrama:**

```
%% Definiciones de clases de color (basadas en función, no específicas del proveedor)
classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E
classDef storage fill:#7AA116,stroke:#232F3E,stroke-width:2px,color:#fff
classDef database fill:#00897B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef iam fill:#DD344C,stroke:#232F3E,stroke-width:2px,color:#fff
classDef network fill:#A66AD1,stroke:#232F3E,stroke-width:2px,color:#fff
classDef messaging fill:#E7157B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef monitoring fill:#FF4F8B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef config fill:#5294CF,stroke:#232F3E,stroke-width:2px,color:#fff
classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
```

---

## Paso 7: Asigna Clases a los Nodos

Al final de tu diagrama:

```
class users external
class cdn,alb network
class service compute
class database database
```

---

## Paso 8: Crea DOS VERSIONES para Audiencias Mixtas (NUEVA SECCIÓN)

### Versión General (para presentaciones, resúmenes ejecutivos)

**Qué conservar:**
- Punto de entrada a internet ✓
- Grupos de capas principales ✓
- Flujos de datos críticos ✓
- Máximo 4-8 nodos

**Qué eliminar:**
- Infraestructura de soporte (a menos que sea crítica)
- Conexiones internas dentro de las capas
- Nombres detallados de recursos (simplificar al rol)
- Nodos secundarios de monitoreo/config

**Enfoque de ejemplo**: Mostrar solo Ingreso principal → Procesamiento → Almacenamiento. Ocultar pasos intermedios.

### Versión Detallada (para documentación técnica, análisis profundos)

**Qué conservar:**
- Todo de la versión general ✓
- Todas las capas de soporte
- Detalles de seguridad/monitoreo/config
- Todas las conexiones internas
- Nombres de recursos completamente descriptivos

**Qué eliminar:**
- Nada; mostrar la arquitectura completa

### Patrón: De Una Fuente a Dos Versiones

1. **Inicio**: Construye el diagrama detallado completo
2. **Crea la versión general**: Copia el diagrama, elimina nodos no críticos
3. **Prueba ambos**: Renderiza en el Editor Live de Mermaid; asegúrate de que ambos sean legibles
4. **Documenta la diferencia**: En las notas de tu presentación, explica qué cambió

**Convención de nombres de versión:**
```
diagrama-detallado.mmd     (arquitectura completa)
diagrama-general.mmd       (simplificado para diapositivas)
```

---

## Paso 9: Guía de Referencia de Íconos

Usa íconos emoji consistentes en todos tus diagramas:

| Función | Ícono | Uso |
|---|---|---|
| **Entrada/Tráfico** | 👥 🌐 | Usuarios, acceso externo, internet |
| **API/Interfaz** | 📡 🔌 | Endpoints de API, webhooks, integraciones |
| **Cómputo/Función** | λ ⚙️ | Servicios, funciones, workers, tareas |
| **Almacenamiento** | 🪣 💾 | Almacenamiento de objetos, discos, buckets |
| **Base de Datos** | 🗄️ | Relacional, NoSQL, persistencia de datos |
| **Seguridad/Auth** | 🔐 📜 | IAM, credenciales, políticas, secretos |
| **Red** | 🌐 🔗 | Redes, enrutamiento, DNS, balanceadores de carga |
| **Mensajería** | 📮 📬 | Colas, temas, pub/sub, streams |
| **Monitoreo** | 📝 📊 | Logs, métricas, dashboards, alertas |
| **Config** | ⚙️ 📋 | Configuración, parámetros, ajustes |
| **Utilidad** | 🎲 ⚡ | Recursos temporales, helpers, datos aleatorios |

---

## 🧠 DISCERNIMIENTO: Controles de Calidad y Validación

### Lista de Verificación de Calidad Visual

- [ ] **Contraste de Color**: Texto legible sobre todos los fondos (WCAG AA, mínimo 4.5:1)
- [ ] **Consistencia**: Los mismos tipos de recursos usan los mismos colores en todas partes
- [ ] **Jerarquía**: Flujo claro de arriba hacia abajo con entrada a internet en la PARTE SUPERIOR
- [ ] **Claridad**: Las etiquetas de nodos son concisas pero descriptivas (sustantivo + verbo o rol)
- [ ] **Íconos**: Cada recurso tiene un emoji/símbolo relevante
- [ ] **Agrupación**: Las funciones relacionadas están agrupadas en el mismo subgrafo
- [ ] **Dependencias**: Las flechas muestran relaciones claras de causa-efecto

### Lista de Verificación de Adecuación para la Audiencia

**Para la Versión General (Presentaciones):**
- [ ] Solo 4–8 nodos (sin sobrecarga de información)
- [ ] Las etiquetas de nodos usan nombres basados en roles, no IDs de recursos
- [ ] El flujo de datos es obvio a simple vista
- [ ] Las partes interesadas no técnicas pueden explicar lo que ven

**Para la Versión Detallada (Documentación):**
- [ ] Todos los nodos presentes y correctamente nombrados
- [ ] Todas las conexiones explícitas (sin ambigüedad)
- [ ] El diagrama aún cabe en una página/pantalla (hacer zoom si es necesario)
- [ ] Los ingenieros pueden usarlo para entender el sistema completo

### Verificación de Accesibilidad

- [ ] **Daltonismo**: Diagrama legible sin color (usar formas, texto, íconos)
- [ ] **Tamaño de Texto**: Etiquetas legibles a 72dpi (resolución estándar de pantalla)
- [ ] **Espaciado**: Sin nodos superpuestos
- [ ] **Ratio de Contraste**: Mínimo 4.5:1 entre texto y fondo
- [ ] **Punto de entrada a internet**: Visualmente distinto de los nodos internos

### Validación Técnica

- [ ] **Sintaxis Mermaid Válida**: Sin errores de sintaxis
- [ ] **Relaciones Correctas**: Las conexiones tienen sentido lógico
- [ ] **Sin Nodos Huérfanos**: Cada nodo está conectado o intencionalmente aislado
- [ ] **Estilo Limpio**: Sin definiciones `classDef` en conflicto
- [ ] **Renderizable en herramientas estándar**: Funciona en Mermaid Live, mermaid-cli, VS Code

---

## ✅ DILIGENCIA: Implementación y Refinamiento

### Prueba del Resultado

1. **Renderiza el diagrama**
   - Usa el [Editor Live de Mermaid](https://mermaid.live/)
   - Verifica errores de renderizado o problemas de diseño
   - Confirma que los colores se muestran correctamente
   - Prueba el modo oscuro (si es compatible)

2. **Valida las relaciones**
   - Traza el flujo de datos desde la entrada a internet → salida
   - Confirma que todas las dependencias están representadas
   - Verifica las relaciones bidireccionales si aplica

3. **Pruebas de accesibilidad**
   - Usa el [Simulador de Daltonismo](https://www.color-blindness.com/coblis-color-blindness-simulator/)
   - Verifica el contraste de texto con el [Verificador de Contraste WebAIM](https://webaim.org/resources/contrastchecker/)
   - Prueba con lector de pantalla (para diagramas exportados)

4. **Pruebas con la audiencia**
   - Muestra la versión general a una parte interesada no técnica; ¿puede explicarla?
   - Muestra la detallada a un ingeniero; ¿puede reconstruir el sistema a partir de ella?

### Preguntas de Refinamiento

- **Claridad**: ¿Puede una persona no técnica entender dónde entran los usuarios de internet?
- **Completitud**: ¿Se muestran todos los recursos críticos?
- **Dos Versiones**: ¿La versión general se siente simplificada? ¿La detallada se siente completa?
- **Generalidad**: ¿Podría un colega usar este prompt con un proveedor de nube o dominio diferente?
- **Mantenibilidad**: ¿Puede este diagrama actualizarse a medida que cambia la infraestructura?

### Exportación y Compartición

**Para diferentes propósitos:**

| Propósito | Formato de Exportación | Método | Comando |
|---------|--------------|--------|---------|
| Diapositiva de Presentación | PNG | Mermaid CLI | `mmdc -i diagrama.mmd -o diagrama.png -w 2400 -H 1600` |
| Incrustación Web | SVG | Mermaid CLI | `mmdc -i diagrama.mmd -o diagrama.svg` |
| Documentación | PNG/SVG | Impresión desde navegador o CLI | Guardar desde [Mermaid Live](https://mermaid.live/) |
| README de GitHub | Mermaid markdown | Copiar bloque de código | Pegar código del diagrama en \`\`\`mermaid \`\`\` |
| Informe PDF | PDF | Imprimir a PDF desde navegador | Imprimir desde Editor Live, guardar como PDF |

---

## 📐 REFERENCIA: Paleta de Colores Completa y Plantillas

### Paleta de Colores Basada en Función (Lista para Copiar y Pegar)

```
%% Usar esto al inicio de CUALQUIER diagrama Mermaid
%% Adaptar colores a tu organización/proveedor

classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E
classDef storage fill:#7AA116,stroke:#232F3E,stroke-width:2px,color:#fff
classDef database fill:#00897B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef iam fill:#DD344C,stroke:#232F3E,stroke-width:2px,color:#fff
classDef messaging fill:#E7157B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef monitoring fill:#FF4F8B,stroke:#232F3E,stroke-width:2px,color:#fff
classDef config fill:#5294CF,stroke:#232F3E,stroke-width:2px,color:#fff
classDef network fill:#A66AD1,stroke:#232F3E,stroke-width:2px,color:#fff
classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
```

### Plantilla Genérica (Funciona para Cualquier Dominio)

```
flowchart TD
    %% ===== DEFINICIONES DE ESTILO =====
    classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E
    classDef storage fill:#7AA116,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef database fill:#00897B,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef network fill:#A66AD1,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef monitoring fill:#FF4F8B,stroke:#232F3E,stroke-width:2px,color:#fff
    classDef external fill:#F1EFE8,stroke:#5F5E5A,stroke-width:2px,color:#2C2C2A
    
    %% ===== CAPA 0: PUNTO DE ENTRADA A INTERNET =====
    subgraph internet["👥 Usuarios Externos / 🌐 Tráfico de Internet"]
        direction LR
        users["Elige uno:<br/>👥 Usuarios Finales O 🌐 Internet"]
    end
    
    %% ===== CAPA 1: ENTRADA/INGRESO =====
    subgraph entry["📥 Puntos de Entrada e Ingreso"]
        direction LR
        in1["Gateway/LB<br/>Punto de Entrada"]
        in2["DNS/Enrutamiento<br/>Dirección"]
    end
    
    %% ===== CAPA 2: PROCESAMIENTO =====
    subgraph processing["λ Procesamiento y Lógica"]
        direction LR
        proc1["Servicio/Función<br/>Lógica de Negocio"]
        proc2["Orquestador<br/>Flujo de Trabajo"]
    end
    
    %% ===== CAPA 3: ALMACENAMIENTO =====
    subgraph storage_layer["💾 Almacenamiento de Datos"]
        direction LR
        stor1["Base de Datos<br/>Persistencia"]
        stor2["Caché<br/>Velocidad"]
    end
    
    %% ===== CAPA 4: MONITOREO =====
    subgraph monitoring["📝 Observabilidad"]
        direction LR
        mon1["Logs<br/>Eventos"]
        mon2["Métricas<br/>Salud"]
    end
    
    %% ===== CONEXIONES =====
    internet --> entry
    entry --> processing
    processing --> storage_layer
    processing --> monitoring
    storage_layer --> monitoring
    
    %% ===== ASIGNACIÓN DE CLASES =====
    class users external
    class in1,in2 network
    class proc1,proc2 compute
    class stor1,stor2 database
    class mon1,mon2 monitoring
```

### Ejemplos de Personalización

**Cambiar un solo color:**
```
%% Por defecto (cómputo naranja)
classDef compute fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:#232F3E

%% Modificado (cómputo azul para otra organización)
classDef compute fill:#0066CC,stroke:#232F3E,stroke-width:2px,color:#fff
```

**Añadir énfasis a recursos críticos:**
```
classDef critical fill:#FF9900,stroke:#DD344C,stroke-width:4px,color:#232F3E
class nodo_critico1,nodo_critico2 critical
```

**Marcar como obsoleto o resaltar recursos experimentales:**
```
classDef deprecated fill:#CCCCCC,stroke:#666,stroke-width:2px,stroke-dasharray:5 5,color:#333
classDef experimental fill:#FFE680,stroke:#FFB300,stroke-width:2px,color:#333
```

---

## 🎓 Cómo Usar Este Prompt con Modelos de IA

### Para Claude (Anthropic):
```
[Copia el prompt actualizado de arriba]

Ahora, por favor estiliza mi diagrama Mermaid siguiendo este marco:

[Pega tu código Mermaid sin procesar aquí]

Resultado requerido:
- Añade 👥 o 🌐 en la PARTE SUPERIOR (tú decides cuál)
- Diseño de arriba hacia abajo (TD) con capas jerárquicas
- Esquema de colores basado en función aplicado
- Crea AMBAS versiones: una general (simplificada) y una detallada (completa)
- Incluye una breve explicación de las diferencias entre versiones
```

### Para ChatGPT / GPT-4:
```
Eres un experto en crear diagramas profesionales usando Mermaid.

Sigue esta especificación:
[Copia las secciones DESCRIPCIÓN + DISCERNIMIENTO]

Paleta de colores:
[Copia la tabla de colores]

Aplica esto a mi diagrama:
[Pega tu código Mermaid sin procesar]

Luego crea DOS versiones: una simplificada para una diapositiva de presentación, una detallada para documentación.
```

### Para Google Gemini, Llama u otros modelos:
Reemplaza las referencias específicas del modelo pero conserva la estructura principal:
1. Declara claramente la tarea (Delegación)
2. Proporciona instrucciones detalladas (Descripción)
3. Incluye criterios de validación (Discernimiento)
4. Especifica formatos de salida (Diligencia)

---

## 📝 Ejemplos Prácticos

### Ejemplo 1: Arquitectura AWS (De la v1.0)

**Versión General** (Presentación, 6 nodos):
```
👥 Usuarios → CloudFront → ALB → ECS → RDS + CloudWatch
```

**Versión Detallada** (Documentación, 45+ nodos):
Todo el stack completo de AWS con grupos de seguridad, subredes, rutas, etc.

### Ejemplo 2: Pipeline de Datos (No AWS)

**Versión General**:
```
🌐 Fuente de Datos → ETL → Almacén de Datos → Dashboard
```

**Versión Detallada**:
```
🌐 Fuente de Datos → Extracción → Transformación → Carga → Esquema → Almacén → Motor de Consultas → Herramienta BI
                                                          ↓
                                                  Controles de Calidad de Datos
                                                          ↓
                                                  Alertas / Monitoreo
```

### Ejemplo 3: Pipeline CI/CD

**Versión General**:
```
👥 Desarrollador → Git Push → Build → Pruebas → Despliegue → Producción
```

**Versión Detallada**:
```
👥 Desarrollador
    ↓
Git Commit → GitHub Webhook → Runner CI (trabajo de build)
                               ↓
                           Linting → Pruebas Unitarias → Artefacto de Build
                               ↓
                           Despliegue a Staging
                               ↓
                           Pruebas de Integración
                               ↓
                           Aprobación Manual (opcional)
                               ↓
                           Despliegue a Producción
                               ↓
                           Verificaciones de Salud + Monitoreo
```

---

## 🔗 Recursos Útiles

- **Documentación Oficial de Mermaid**: https://mermaid.js.org/
- **Editor Live de Mermaid**: https://mermaid.live/
- **Verificador de Contraste**: https://webaim.org/resources/contrastchecker/
- **Simulador de Daltonismo**: https://www.color-blindness.com/coblis-color-blindness-simulator/
- **Mermaid CLI**: https://mermaid.js.org/syntax/flowchart.html
- **Control de Versiones para Diagramas**: GitHub/GitLab (almacenar `.mmd` junto al código)

---

## 📞 Lista de Verificación de Implementación para Equipos

- [ ] **Decidir el símbolo**: ¿👥 (enfocado en personas) o 🌐 (genérico)? ¿O ambos?
- [ ] **Adaptar la paleta de colores**: ¿Tu organización tiene colores de marca? Mapéalos a las categorías basadas en función
- [ ] **Elegir la estructura de capas**: ¿El orden estándar de capas funciona para tus casos de uso, o necesitas personalizarlo?
- [ ] **Crear plantilla del equipo**: Construye UN diagrama de referencia que muestre ambas versiones como ejemplo del equipo
- [ ] **Control de versiones**: Almacena archivos `.mmd` junto a tu infraestructura/código
- [ ] **Documentar decisiones**: Actualiza esta especificación con las elecciones de tu equipo (asignaciones de color, preferencia de símbolo, etc.)
- [ ] **Capacitar al equipo**: Muestra un ejemplo concreto; deja que lo apliquen a sus propios diagramas
- [ ] **Iterar**: Recopila retroalimentación; refina el esquema de colores o la estructura de capas después de algunas semanas

---

**Marco Utilizado**: Marco de Fluencia en IA - 4Ds (Delegación, Descripción, Discernimiento, Diligencia)
**Versión**: 2.0 — Generalizado para Cualquier Diagrama Mermaid con Punto de Entrada a Internet
**Última Actualización**: 23 de junio de 2026
**Compatibilidad**: Claude, ChatGPT, Gemini, Llama y otros LLMs
**Estado**: Listo para Uso del Equipo