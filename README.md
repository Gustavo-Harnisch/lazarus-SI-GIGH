# Proyecto Lazarus — SI-GIGH

Aplicación de escritorio desarrollada en **Lazarus / Free Pascal**, correspondiente al ramo de Sistemas de Información.

## Tabla de contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Cómo abrir el proyecto](#cómo-abrir-el-proyecto)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Compilación por línea de comandos](#compilación-por-línea-de-comandos)
- [Estado del proyecto](#estado-del-proyecto)

## Requisitos

- [Lazarus IDE](https://www.lazarus-ide.org/) 2.2 o superior
- Free Pascal Compiler (FPC) 3.2 o superior

## Instalación

**Linux (Debian/Ubuntu):**
```bash
sudo apt install lazarus fpc
```

**Windows / macOS:** descargar el instalador desde [lazarus-ide.org/download](https://www.lazarus-ide.org/index.php?page=downloads).

## Cómo abrir el proyecto

1. Abrir Lazarus.
2. Ir a `Project > Open Project…`.
3. Seleccionar `project1.lpi`.
4. Presionar `Run` (F9) para compilar y ejecutar.

## Estructura del proyecto

| Archivo | Descripción |
|---|---|
| `project1.lpr` | Programa principal (entry point). |
| `project1.lpi` | Definición del proyecto Lazarus (configuración de compilación). |
| `project1.res` | Recursos compilados del proyecto. |
| `project1.ico` | Ícono de la aplicación. |
| `unita.pas` | Código fuente del formulario principal. |
| `unita.lfm` | Diseño visual del formulario (asociado a `unita.pas`). |

## Compilación por línea de comandos

```bash
lazbuild project1.lpi
```

El ejecutable resultante queda en el directorio raíz del proyecto.

## Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo [`LICENSE`](LICENSE) para más detalles.
