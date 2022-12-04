---
title: Bash tricks
author: slashformotion
date:  20220624
---



Pour exécuter une commande en supprimant sa sortie STDOUT: 
```
some_command > /dev/null
```

Pour exécuter une commande en supprimant sa sortie STDOUT et sa sortie SDERR:
```
some_command > /dev/null 2>&1
```
