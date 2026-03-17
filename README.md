# dotfiles

These dotfiles are managed by [chezmoi](https://www.chezmoi.io). Install it and apply the latest state using:

```sh
sh -c "$(curl -fsLS https://raw.githubusercontent.com/gustavohenke/dotfiles/refs/heads/main/install.sh)"
```

**Note:** if the environment this script will run on is not a TTY, the following env variables can be
set to make it initialize correctly:

```sh
export DOTFILES_NAME="Person name"
export DOTFILES_EMAIL="person@example.com"
export DOTFILES_PROFILE="personal" # can be one of personal, work-laptop, or work-devbox
```
