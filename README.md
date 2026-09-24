# ani-cat

Browse anime from your terminal. `ani-cat` uses [AniList](https://anilist.co/) to list shows by trending status, popularity, release date, or score. Selecting a show searches for it in [ani-cli](https://github.com/pystardust/ani-cli).

`ani-cat` is an independent project. It is not affiliated with AniList or `ani-cli`, and it does not include `ani-cli` code. Credit for anime search and playback goes to [pystardust and the ani-cli contributors](https://github.com/pystardust/ani-cli/graphs/contributors).

## Requirements

- Linux with `sh`, `curl`, `jq`, `fzf`, and GNU `date` and `stat`.
- [`ani-cli`](https://github.com/pystardust/ani-cli) installed and available on `PATH`. Set `ANI_CAT_ANI_CLI` if it is elsewhere.
- A player supported by `ani-cli`, such as `mpv`.
- An Internet connection for pages that are not cached.

On Arch Linux or Omarchy, install the dependencies from the official repositories:

```sh
sudo pacman -S --needed curl jq fzf mpv
```

`ani-cli` is available from the AUR. If you use `yay`:

```sh
yay -S ani-cli
```

See the [ani-cli installation guide](https://github.com/pystardust/ani-cli#installation) for other distributions and installation methods.

## Installation

Clone the repository and run the installer:

```sh
git clone https://github.com/nbfrodri/ani-cat.git
cd ani-cat
./install.sh
```

The installer copies `ani-cat` to `~/.local/bin`. On Omarchy, it also adds **ani-cat** to **Apps**. If `~/.local/bin` is not on your `PATH`, add it to your shell configuration or run the executable by its full path.

To install it elsewhere:

```sh
ANI_CAT_INSTALL_DIR="$HOME/bin" ./install.sh
```

To update, run `git pull` in the cloned repository, then run `./install.sh` again.

## Usage

```sh
ani-cat
ani-cat trending
ani-cat popular
ani-cat recent
ani-cat score
```

Without arguments, `ani-cat` asks how to sort the catalog. Each page shows up to 25 shows. You can keep paging while AniList has more results.

| Key | Action |
| --- | --- |
| `↑` / `↓` | Move through the list |
| `→` or `Ctrl+N` | Next page |
| `←` or `Ctrl+P` | Previous page |
| `Ctrl+O` | Change sort order |
| `Enter` | Search in `ani-cli` using the English title |
| `Ctrl+R` | Search using the romaji title |
| `Ctrl+B` | Enter a different search title |
| `Esc` | Quit |

**Most recent** sorts by release date and excludes future dates. Scores are AniList average scores out of 100.

### Titles and availability

AniList provides the catalog data; `ani-cli` uses its own source to find episodes. Titles and availability may differ. If the first search does not find the right show, return to the catalog and try `Ctrl+R` or `Ctrl+B`. `ani-cat` prints the exact search text before launching `ani-cli`.

If your `ani-cli` executable is outside `PATH`:

```sh
ANI_CAT_ANI_CLI="$HOME/another-directory/ani-cli" ani-cat
```

### Cache and network errors

AniList responses are cached for 10 minutes in `${XDG_CACHE_HOME:-~/.cache}/ani-cat`. Revisiting a recent page uses the local copy. If the connection fails and an older copy exists, `ani-cat` shows it with a warning.

Catalog queries go to the [public AniList API](https://docs.anilist.co/guide/graphql/) over HTTPS. `ani-cat` does not ask for credentials or send its own usage data. Playback and episode search depend on `ani-cli`.

## Uninstall

```sh
rm "$HOME/.local/bin/ani-cat"
```

On Omarchy, also remove the Apps entry with `omarchy tui remove ani-cat`. If you chose another installation directory, remove the executable there. You can delete the cache in `${XDG_CACHE_HOME:-~/.cache}/ani-cat` separately.

## License

`ani-cat` is distributed under the [MIT license](LICENSE). `ani-cli` is an independent project with its own license.
