## Initialization

Invoke vim on \*nix/macOS and it loads:

* user vimrc (e.g. `$HOME/.vim/vimrc`)
* system vimrc (e.g. `$VIM/vimrc`)
* ftdetect/syntax/indent files
* plugins
* packages
* `after/` directories

Invoke vim with `-u` specifying a vimrc, and it will use only that vimrc, skipping the search for a user or system vimrc, and leaving `$MYVIMRC` unset.

The load-order within each step of initialization corresponds to the order of `'runtimepath'`.
To see exactly what's been loaded, in order, run `:scriptnames`.
You can quickly check the order various things were loaded in from the shell:
``` sh
outfile=$(mktemp) &&
  vim -c "set nomore | redir! > $outfile" \
      -c 'scriptnames | redir END | quit' &&
  grep 'vimrc\|fugitive\|netrw' $outfile &&
  rm $outfile && unset outfile
```

I've extracted most of my customizations to plugins, and group those plugins using Vim 8's `package` feature.
Any order-dependent configuration that must happen upfront belongs in `vimrc`, since that loads first.
Keeping this file to the bare minimum makes it easier to share across systems.

For example, on NixOS, I have a nix derivation that [plucks the vimrc from this repo](https://github.com/ivanbrennan/nixbox/commit/15982480b1ce019bb19ec145868734826ff5c700).
I [bake that and a vim package-set](https://github.com/ivanbrennan/nixbox/blob/15982480b1ce019bb19ec145868734826ff5c700/environment/vim/packages.nix#L166-L179) into the system-wide vim configuration.
On Ubuntu and macOS I'll use a tool like [minpac](https://github.com/k-takata/minpac).
Since the NixOS vimrc derivation only uses the vimrc itself, there's no need to maintain separate branches for the different OS's, even if I want to commit minpac configuration to version control, so long as I don't pollute vimrc.

I could add hook to vimrc:
``` vim
silent! source ~/.vim/init_minpac.vim
```
This is probably unecessary though, since minpac only needs to be loaded when installing/upgrading packages.
The actual loading of packages is handled natively by Vim (see `:help 'packpath'`).
It's probaly best to commit minpac initialization (and a declarative list of packages/plugins) to a file that can be sourced manually as needed, with no direct ties to vimrc.
