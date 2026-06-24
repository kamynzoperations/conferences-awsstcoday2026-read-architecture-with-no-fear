# Paso 1 — Instalación

Este paso instala las dos herramientas utilizadas para visualizar la infraestructura de Terraform:

- **Terramaid** — convierte los grafos de recursos de Terraform en diagramas de flujo Mermaid
- **Terravision** — genera diagramas de arquitectura en la nube como imágenes PNG a partir del código fuente de Terraform

---

## Parte 1 — Instalar Terramaid

**Por qué:** Terramaid lee tu configuración de Terraform y genera un diagrama Mermaid de las relaciones entre recursos. Debe instalarse antes de ejecutar los comandos de visualización del Paso 3.

Referencia: [github.com/RoseSecurity/Terramaid](https://github.com/RoseSecurity/Terramaid)

---

### macOS (recomendado)

```bash
brew install terramaid
which terramaid   # confirma que el binario está en tu PATH
```

---

### Windows

Elige la opción que mejor se adapte a tu entorno:

#### Opción 1 — Binario preconstruido (más fácil, sin dependencias)

1. Ve a [github.com/RoseSecurity/Terramaid/releases](https://github.com/RoseSecurity/Terramaid/releases)
2. Descarga el ZIP correspondiente a tu arquitectura:
   - `Terramaid_Windows_x86_64.zip` — la mayoría de PCs de 64 bits
   - `Terramaid_Windows_arm64.zip` — dispositivos Windows basados en ARM
3. Extrae el ZIP y mueve `terramaid.exe` a una carpeta incluida en tu `PATH`
   (por ejemplo, `C:\tools\` agregada al PATH, o `C:\Windows\System32`)
4. Verifica:
   ```
   terramaid --help
   ```

#### Opción 2 — Instalación con Go (si ya tienes Go configurado)

```bash
go install github.com/RoseSecurity/terramaid@latest
```

Esto coloca el binario en `GOPATH/bin`, que normalmente ya está en tu PATH.

#### Opción 3 — Compilar desde el código fuente

```bash
git clone git@github.com:RoseSecurity/terramaid.git
cd terramaid
make build
```

> Requiere `make` en Windows — disponible mediante Git Bash, WSL, o
> [GnuWin32](http://gnuwin32.sourceforge.net/packages/make.htm).

---

## Parte 2 — Instalar Terravision

**Por qué:** Terravision genera diagramas de arquitectura en la nube en formato PNG directamente a partir de los archivos fuente de Terraform. Requiere Python y Graphviz además de la propia CLI.

Referencia: [Guía de instalación de Terravision](https://github.com/patrickchugh/terravision/blob/main/docs/installation.md)

---

### Paso 2a — Requisitos del sistema

| Dependencia | Requerido | Notas |
|---|---|---|
| Python 3.10+ | ✅ Sí | Entorno de ejecución principal |
| Git | ✅ Sí | Obtención del código fuente |
| Graphviz | ✅ Sí | Renderizado de diagramas |
| Terraform 1.x | ⚠️ Condicional | No se necesita si se usa el modo `--planfile` |
| Ollama | ❌ Opcional | Solo para el refinamiento de diagramas con IA local |
| wslu | ❌ Opcional | Solo WSL — necesario para que `--show` abra automáticamente los diagramas |

> Si proporcionas resultados pregenerados mediante `--planfile` y `--graphfile`,
> Terraform no es necesario. Consulta la Guía de uso para más detalles.

---

### Paso 2b — Instalar dependencias

#### Graphviz

```bash
# macOS
brew install graphviz

# Ubuntu / Debian
sudo apt install graphviz

# Windows — descarga el instalador desde https://graphviz.org/download/
```

#### Git

La mayoría de los sistemas tienen Git preinstalado. Verifícalo con:

```bash
git --version
```

#### Terraform (si no usas el modo `--planfile`)

```bash
# macOS
brew tap hashicorp/tap
brew install hashicorp/terraform

# Windows — descarga desde https://developer.hashicorp.com/terraform/install
```

---

### Paso 2c — Instalar la CLI de Terravision

**Por qué:** `pipx` instala Terravision en un entorno aislado para que no entre en conflicto con otros paquetes de Python en tu sistema.

```bash
# Primero instala pipx si no lo tienes:
#   macOS:          brew install pipx && pipx ensurepath
#   Ubuntu/Debian:  sudo apt install pipx && pipx ensurepath
#   Windows:        python -m pip install --user pipx && python -m pipx ensurepath

pipx install terravision
```

---

## Verificación final

Ejecuta lo siguiente para confirmar que ambas herramientas y todas las dependencias están correctamente instaladas:

```bash
# Terramaid
which terramaid
terramaid --help

# Terravision
terravision --version
terravision --help

# Dependencias
python --version     # se espera 3.10+
git --version
dot -V               # Graphviz
terraform version    # omitir si se usa el modo --planfile
```

Todos los comandos deben devolver información de versión sin errores. Si alguno falla, revisa la sección de instalación correspondiente antes de continuar con el Paso 2.
