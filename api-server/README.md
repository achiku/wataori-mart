# wataori-mart-api

```
brew install haskell-stack
brew install fswatch
stack setup --install-ghc
```

```
stack build
stack install
stack wataori-mart-exe
```

```
fswatch .  | xargs -n1 -I{} stack build -v
```


#### vim
