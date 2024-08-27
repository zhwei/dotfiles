My dotfiles

## Usage

```bash
bash install.sh
```


## Update

```bash
# update zshell
omz update

# update pure
cd zsh/pure && git pull origin main && cd -
```

## Refresh Brewfile

```bash
brew bundle dump --force
```