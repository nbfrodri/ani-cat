# ani-cat

Catálogo de anime para la terminal. Consulta [AniList](https://anilist.co/) para mostrar series ordenadas por tendencias, popularidad, fecha de estreno o puntuación. Al elegir una serie, abre su búsqueda en [ani-cli](https://github.com/pystardust/ani-cli).

`ani-cat` es un proyecto independiente. No está afiliado con AniList ni con `ani-cli`, y no incluye el código de `ani-cli`. El crédito por el reproductor y la búsqueda de episodios corresponde a [pystardust y las personas que contribuyen a ani-cli](https://github.com/pystardust/ani-cli/graphs/contributors).

## Requisitos

- Linux con `sh`, `curl`, `jq`, `fzf` y las utilidades GNU `date` y `stat`.
- [`ani-cli`](https://github.com/pystardust/ani-cli) instalado y accesible desde `PATH`. Si está en otra ubicación, se puede indicar con `ANI_CAT_ANI_CLI`.
- Un reproductor compatible con `ani-cli`, como `mpv`.
- Conexión a Internet para consultar páginas que no estén guardadas en caché.

En Arch Linux u Omarchy, puedes instalar las dependencias de los repositorios oficiales así:

```sh
sudo pacman -S --needed curl jq fzf mpv
```

`ani-cli` está en AUR. Si usas `yay`:

```sh
yay -S ani-cli
```

Consulta el [README de ani-cli](https://github.com/pystardust/ani-cli#installation) para otras distribuciones y métodos de instalación.

## Instalación

Descarga o clona este repositorio, entra en su directorio y ejecuta:

```sh
./install.sh
```

El instalador copia `ani-cat` a `~/.local/bin`. En Omarchy también crea un acceso llamado **ani-cat** en **Apps**. Si `~/.local/bin` no está en tu `PATH`, añádelo a la configuración de tu shell o ejecuta el archivo con su ruta completa.

Para instalarlo en otro directorio:

```sh
ANI_CAT_INSTALL_DIR="$HOME/bin" ./install.sh
```

Después, para actualizarlo, descarga los cambios del repositorio y vuelve a ejecutar `./install.sh`.

## Uso

```sh
ani-cat
ani-cat tendencias
ani-cat populares
ani-cat recientes
ani-cat puntuacion
```

Sin argumentos, `ani-cat` pide el orden. Cada página muestra hasta 25 series. Si hay más resultados, puedes seguir avanzando; no hay un límite fijo de 50 series.

| Tecla | Acción |
| --- | --- |
| `↑` / `↓` | Moverse por la lista |
| `→` o `Ctrl+N` | Página siguiente |
| `←` o `Ctrl+P` | Página anterior |
| `Ctrl+O` | Cambiar el orden |
| `Enter` | Buscar en `ani-cli` con el título inglés |
| `Ctrl+R` | Buscar con el título romanizado |
| `Ctrl+B` | Escribir otro título para la búsqueda |
| `Esc` | Salir |

La opción **más recientes** ordena por fecha de estreno y excluye fechas futuras. La **puntuación** mostrada es la valoración media de AniList sobre 100.

### Títulos y disponibilidad

AniList proporciona la información del catálogo; `ani-cli` consulta su propia fuente para encontrar episodios. Los nombres y la disponibilidad pueden diferir. Si la búsqueda inicial no encuentra la serie adecuada, vuelve al catálogo y prueba `Ctrl+R` o `Ctrl+B`. `ani-cat` muestra el texto que envía a `ani-cli` antes de abrirlo.

Si tu ejecutable de `ani-cli` está fuera de `PATH`:

```sh
ANI_CAT_ANI_CLI="$HOME/otro-directorio/ani-cli" ani-cat
```

### Caché y errores de red

Las respuestas de AniList se guardan durante 10 minutos en `${XDG_CACHE_HOME:-~/.cache}/ani-cat`. Al volver a una página reciente se usa la copia local. Si falla la conexión y existe una copia más antigua, `ani-cat` la muestra con un aviso.

La consulta de títulos se hace a la [API pública de AniList](https://docs.anilist.co/guide/graphql/) mediante HTTPS. `ani-cat` no pide credenciales ni envía información de uso propia. La reproducción y la búsqueda de episodios dependen de `ani-cli`.

## Desinstalación

```sh
rm "$HOME/.local/bin/ani-cat"
```

En Omarchy, elimina también el acceso de Apps con `omarchy tui remove ani-cat`. Si elegiste otro directorio en la instalación, borra el ejecutable de ese directorio. La caché está en `${XDG_CACHE_HOME:-~/.cache}/ani-cat` y se puede borrar por separado.

## Licencia

El código de `ani-cat` se distribuye bajo la [licencia MIT](LICENSE). `ani-cli` es un proyecto independiente y conserva su propia licencia.
