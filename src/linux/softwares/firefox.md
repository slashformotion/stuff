# Firefox

J'utilise exclusivement firefox pour naviguer sur le web. Je n'utilise pas les forks divers et variés car ils sont souvent en retard sur firefox upstream.

## Extensions

Utiliser firefox sans extensions c'est un peu comme sortir marcher dans la neige sans rien au pieds, sur le coup ça semble rigolo mais au bout de 5 minutes on se dit que ce serait mieux avec!

Les indispensables:

- [ublock-origin](https://addons.mozilla.org/fr/firefox/addon/ublock-origin/) : Le seul, l'unique bloqueur de pub nécéssaire à une navigation saine sur le web.
- [decentraleys](https://decentraleyes.org/) : Une extension qui va garder en cache les assets des cdns pour éviter de trop leur donner de données. Cette extension devrait aussi réduire *un peu* la consommation de bande passante.
- [Privacy Redirect](https://addons.mozilla.org/fr/firefox/addon/privacy-redirect/) : Redirige les requêtes les demandes Twitter, YouTube, Instagram et Google Maps vers des alternatives respectueuses de la vie privée.

Les extensions pratiques:

- [Bit It Now!](https://addons.mozilla.org/fr/firefox/addon/bibitnow/) : Cette extension génère des snippets Bibtex pour la page web courante.
- [uBlacklist](https://addons.mozilla.org/fr/firefox/addon/ublacklist/) : Une extension incroyable qui permet d'empêcher certains sites d'apparaitre dans les résultats des grands moteurs de recherches. On peut ajouter ses propres blocklist ou celles d'autres utilisateurs[^repogithub].
- [Awesome RSS](https://addons.mozilla.org/fr/firefox/addon/awesome-rss/) : Ajoute un bouton RSS dans la barre d'URL.

[^repogithub]:J'ai créé un [repo github](https://github.com/slashformotion/ublacklist) qui contient les listes qui m'intéresse + ma propre liste)

## Configuration

> Pour aller dans le tableau des confs: `about:config`.

Depuis quelques versions, Firefox cache les extensions dans un sous-menu, ce qui n'est pas à mon goût:
    
Changez `extensions.unifiedExtensions.enabled` à `false`.