# Instructions
My dotfiles repo includes a submodule. In order to have everything working
properly, follow the steps below to ensure that the latest updates for the
necessary repo are pulled.

1. Run the `homebrew.sh` script to install all of the necessary packages.
    - If extra packages need to be installed, run the script with the package
      name behind it. For example: `./homebrew.sh wget curl` will install wget
      and curl
    - The default packages that will always be installed are git, node, nvm, tmux, tree, btop, and python.
2. Navigate to the submodule directory:
`cd /Users/<username>/dotfiles/tmux/.tmux/plugins/tpm`
3. Pull the latest changes from the submodule's remote repository:
`git pull origin master` (the branch is labeled `master` instead of `main` for this submodule)
4. After updating the submodule, navigate back to the root of the main repo:
`cd ../../../..`
5. Commit the submodule update:
```
git add tmux plugins/tpm
git commit -m "Updated tpm submodule to the latest version"
```
6. Push the changes:
`git push`

# TODO
- Add logic to `setup.sh` to handle pulling changes from repo for tpm submodule
