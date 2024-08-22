# Instructions
My dotfiles repo includes a submodule. In order to have everything working
properly, follow the steps below to ensure that the latest updates for the
necessary repo are pulled.

1. Navigate to the submodule directory:
`/Users/vax/dotfiles/tmux/.tmux/plugins/tpm`
2. Pull the latest changes from the submodule's remote repository:
`git pull origin main`
3. After updating submodule, navigate back to the root of my main repo:
`cd ../../..`
4. Commit the submodule update:
```
git add tmux/plugins/tpm
git commit -m "Updated tpm submodule to the latest version"
```
5. Push the changes:
`git push`

# TODO
- Add logic to `setup.sh` to handle pulling changes from repo for tpm submodule
- Add homebrew script to automate the installation of tmux, tree, git, nodejs, and nvm
