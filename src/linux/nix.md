# Nix

***Cette page est en cours d'écriture***

Concaténation de strings

```nix
let 
  h = "Hello";
  w = "World";
in
{
  helloWorld = h + " "+ w;
}
```

String f"" style 

```nix
let 
  h = "Strings";
  value = 4;
in
{
  helloWorld = "${h} ${toString value} the win!";
}
```

## Functions 

```nix
# Func f concatene a,b,c
let
  f = "f";
  o = "o";
  func = a: b: c: a+b+c; 
in
{
  foo = func f o "o";
}```

### Fonctions avec des paramètres nommés

```nix
let
  f = "f";
  o = "o";
  func = {a, b, c}: a+b+c; 
in
{
  foo = func {a=f;b=o;c="o";};
}
```

### ifs

```nix
let
  min = a: b: if a<b then a else b;
  max = a: b: if a>b then a else b;
in
{
  ex0 = min 5 3;
  ex1 = max 9 4;
}
# with import <nixpkgs> { };
# {
#   # finally make use of it
#   ex0 = stdenv.lib.min 5 3;
#   ex1 = stdenv.lib.max 9 4;
# }

```

### default values for args 

`a` a pour valeur par defaut "f", `b` "a" et c "".

```nix
let
  f = "f";
  o = "o";
  b = "b";
  func = {a ? f, b ? "a" , c ? "" }: a+b+c; #only modify this line!
in
rec {
  foo = func {b="o"; c=o;}; #must evaluate to "foo"
  bar = func {a=b; c="r";}; #must evaluate to "bar"
  foobar = func {a=foo;b=bar;}; #must evaluate to "foobar"
}
```

### more args 

```nix
let
  arguments = {a="f"; b="o"; c="o"; d="bar";}; #only modify this line
  func = {a, b, c, ...}: a+b+c; 
  func2 = args@{a, b, c, ...}: a+b+c+args.d;
in
{
  #the argument d is not used 
  foo = func arguments;
  #now the argument d is used
  foobar = func2 arguments;
}
```

### moarrrr args 

```nix
let
  func = {a, b, ...}@bargs: if a == "foo" then
    b + bargs.c else b + bargs.x + bargs.y;
in
{
  #complete next line so it evaluates to "foobar"
  foobar = func {
  	a="bar"; 
    b="foo"; 
    x="b"; 
    y="ar";
  };
}
```