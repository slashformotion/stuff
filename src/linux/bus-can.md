# BUS CAN 

Les kernels récents gère les sondes pour BUS CAN nativement, cependant il faut setup l'interface réseau.
J'ai utilisé un BUS CAN dans le cadre de mes études sous la supervision de [Vincent Kerhoas](https://www.enib.fr/~kerhoas), qui m'a appris beaucoup. La page relative au projet que j'ai réalisé se trouve [ici](https://www.enib.fr/~kerhoas/rescapt_cours_index.html). 


## Initialisation (à faire à chaque redémarrage)

Pour créer une interface réseau pour communiquer avec les sondes de bus can.

```sh
sudo ip link set can0 up type can bitrate 500000
```

## Exploitation

On utilise les outils [can-utils](https://github.com/linux-can/can-utils) pour du debug (utilisable seulement si il n'y a pas trop de trafic sinon, on ne peut rien voir).

> Installation pour [ArchLinux](https://archlinux.org/):
> ```bash
> yay -S can-utils
> ```
> Lien du packet AUR: <https://aur.archlinux.org/packages/can-utils>

## Création d'interfaces Qt (interaction avec un BUS CAN)

Je vous renvoie vers la page de Vincent Kerhoas sur ce sujet: <https://www.enib.fr/~kerhoas/qt.html> .