# Iphone et linux: une drôle d'histoire

Utiliser un iphone et un ordinateur sous linux peut être assez compliqué. Voici quelques petits "tips" pour mieux les faire cohabiter. 

## HEIC

Les iphones récents utilisent le format *heic* pour les photos. Format qui n'est souvent pas géré sur linux sur les distributions que j'ai utilisé. 

Sur fedora:
```shell
sudo dnf install libheif
# add support of heic to gimp and qt
sudo dnf install gimp-heif-plugin qt-heif-image-plugin
```


Sur ubuntu (ou debian):
```shell
sudo apt install heif-gdk-pixbuf
```
Ensuite on peut utiliser `heif-convert` pour convertir des fichiers heic vers des formats plus communs.

```shell
heif-convert input.heic output.jpg
```

---
Sources: 
- <https://superuser.com/questions/1252004/how-can-i-view-heic-photos-on-linux> 
- <https://lokarithm.com/2021/02/27/linux-how-to-convert-heic-files-to-jpg-or-png/>