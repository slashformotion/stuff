Pour faire de l'uart sous linux, il faut que l'utilisateur courant fasse partie du groupe `dialout`

```
sudo usermod -a -G dialout [MYUSERNAME]
```
puis logout, login

Source originale: <https://www.enib.fr/~kerhoas/qt.html>