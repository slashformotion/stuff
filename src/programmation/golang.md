
# Pourquoi utiliser Golang ?

- [Golang over Java, Python](https://yourbasic.org/golang/advantages-over-java-python/)

# Liens intéressants

- [Docs](https://go.dev/doc/): la doc officielle !
- [pkg.go.dev/](https://pkg.go.dev/): La doc des modules !
- [Effective Go](https://go.dev/doc/effective_go): Une lecture obligatoire !
- [Go by Example](https://gobyexample.com/) Un site incroyable qui couvre de très nombreux sujets

# Constantes

Les constantes sont déclarées comme des constantes mais utilise le mot clé `const` au lieu de `var`.
Les constantes peuvent être des charactères, des strings, des booléens ou des valeurs numériques (pas d'arrays ou de slices),

```go
const Pi = 3.14
// Pi is a constant
```

*Un moyen détourné d'obtenir des "constantes" pour tout les types possibles est de faire une fonction qui va renvoyer la valeur voulue, mais c'est sous-optimal car on instancie un nouvel slice à chaque appel de `sliceConstant`.*

```go
func sliceConstant() []string {
 return []string{"1","2", "3"}
}
```

## Closer Interfaces

Les interfaces comportant un closer, c'est à dire une méthode `(type).Close() error` ne doivent PAS être fermées en utilisant defer SAUF si defer fait paniquer le programme.

Exemple pratique:


```go
func helloNotes() error {
    f, err := os.Create("somewhere/notes.txt")
    defer f.Close() // ici la valeur de l'erreur n'est pas vérifiée
    if err != nil {
        return err
    }

    if err = io.WriteString(f, "hello world"); err != nil {
        f.Close()
        return err
    }
    return nil
}
```

Il vaut mieux fermer le fichier à la fin "manuellement".

```go
func helloNotes() error {
    f, err := os.Create("somewhere/notes.txt")
    if err != nil {
        return err
    }

    if err = io.WriteString(f, "hello world"); err != nil {
        f.Close()
        return err
    }

    return f.Close()
}
```

Ou alors on utiliser `panic` (mais ça change la gestion des erreurs):

```go
func helloNotes() error {
    f, err := os.Create("somewhere/notes.txt")
    defer func () {
        err := f.Close()
        if err != nil {
            panic(err)
        }
    }()
    if err != nil {
        return err
    }

    if err = io.WriteString(f, "hello world"); err != nil {
        f.Close()
        return err
    }

    return nil
}
```

## Articles intéressants

- [Don't use build tags for integration tests (*Peter Bourgon*)](https://peter.bourgon.org/blog/2021/04/02/dont-use-build-tags-for-integration-tests.html)
- [Embedding Vue.js Apps in Go (*Trevor Taubitz*)](https://hackandsla.sh/posts/2021-06-18-embed-vuejs-in-go/)
- [Le meilleur tutoriel vidéo sur la réflexion en Go](https://youtube.com/watch?v=f4aUrm7N5DU)

## Libs

Une liste de librairies intéressantes.

- [github.com/gocarina/gocsv](https://github.com/gocarina/gocsv): Une lib de gestion des csv avec une fonction `Unmarshal` très pratique.
- [github.com/microcosm-cc/bluemonday](https://github.com/microcosm-cc/bluemonday): un sanityzer HTML. 
- [github.com/mitchellh/go-homedir](https://github.com/mitchellh/go-homedir): un petit module cross-plateforme pour gérer trouver le répertoire utilisateur courant.
