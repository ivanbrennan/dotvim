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
  grep 'vimrc\|netrw\|coherent' $outfile &&
  rm $outfile && unset outfile
```

I've extracted most of my customizations to plugins, and group those plugins using Vim 8's `package` feature. Any order-dependent configuration that must happen upfront belongs in `vimrc`, since that loads first. Keeping this file to the bare minimum makes it easier to share across systems.

For example, on NixOS, I can derive vimrc on its own and bake a vim package-set into the system-wide vim configuration to manage plugins. On Ubuntu and macOS I can use a tool like minpac. Since the NixOS vimrc derivation only uses the vimrc file, there's no need to maintain separate branches for different OS's, even if I want to commit minpac to version control, as long as I don't pollute vimrc itself.

I could add hook to vimrc:
``` vim
silent! source ~/.vim/init_minpac.vim
```
and commit minpac configuration here without affecting my NixOS configuration.
This probably unecessary though, since minpac only needs to be loaded when installing/upgrading packages, since Vim itself handles loading via `'packpath'`.
It's probaly best to commit minpac initialization (and a declarative list of packages/plugins) to a file that can be sourced manually as needed, with no direct ties to vimrc.
