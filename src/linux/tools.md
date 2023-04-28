# Outils

Voici une liste non-exaustive des outils que j'utilise avec quelques notes pour les installer et les configurer

## Zellij

Un terminal multiplexer qui gère les sessions, tabs et panes: 

Site internet: <https://zellij.dev/>
Documentation: <https://zellij.dev/documentation/> 
Repo: <https://github.com/zellij-org/zellij>

Installation avec cargo:

```sh
cargo install --locked zellij
```

Set zsh comme le shell dans zsh (utile quand on utilise bash ou dash comme shell par défault mais zsh comme shell "de travail").
```kdl
// Choose the path to the default shell that zellij will use for opening new panes
// Default: $SHELL
//
default_shell "zsh"
```

### Themes

Download themes from the repo: <https://github.com/zellij-org/zellij/tree/main/example/themes>

```kdl
// Choose the theme that is specified in the themes section.
// Default: default
//
theme "gruvbox-dark"
```


## Gitui

gitui est un client git dans le terminal.

Repo: <https://github.com/extrawurst/gitui>

Installer sur Fedora: 
```shell
sudo dnf install gitui
```

Installer avec cargo:
```sh
cargo install gitui
```

## FIP-Player

FIP-Player est un lecteur webradios publiques françaises. 

Repo: <https://github.com/DucNg/fip-player>

```shell
# il faut installer libmpv

# on fedora
sudo dnf install mpv-devel
go install github.com/DucNg/fip-player@latest
```