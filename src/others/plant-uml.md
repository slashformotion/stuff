---
title: Plant UML cheatsheet
---

Pour définir un séparateur de namespace personalisé on utilise :
```
set namespaceSeparator <separator>
```

Pour enlever les bulles vertes bizarres devant le membres d'une classe: 
```
skinparam classAttributeIconSize 0	
```

On peut utiliser des espaces dans le nom du role de l'association
```
Organisation "+organisation\n 1" *--r-- "+categories\n 0..*" Category: "			 "
```

https://the-lum.github.io/puml-themes-gallery/