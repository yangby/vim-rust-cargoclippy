# vim-rust-cargoclippy

A vim plugin for rust-clippy -- a rust linter.

## Environment

### Requirements / Dependencies

- [Vim](http://www.vim.org/ "Vi IMproved - enhanced vi editor")

- [Syntastic](https://github.com/vim-syntastic/syntastic "Syntax checking hacks for vim")

- [rust.vim](https://github.com/rust-lang/rust.vim "Vim configuration for Rust.")

- [Rust](https://www.rust-lang.org/ "The Rust Programming Language - A systems programming language")

  With [Cargo](http://doc.crates.io/ "Rust’s Package Manager").

- [rust-clippy](https://github.com/Manishearth/rust-clippy "A bunch of lints to catch common mistakes and improve your Rust code")

  Install rust-clippy through cargo as a cargo subcommand.

  ```bash
  cargo install clippy
  ```

- (*Optional*) [Vundle](https://github.com/VundleVim/Vundle.vim "Vundle, the plug-in manager for Vim")

  **You can choose any plug-in manager as you like, or just install the plugin manually.**

## Installation

### Configure the Plugin with Vundle

Add the plugin into vim configuration files. For example: `~/.vimrc`.

```vim
Plugin 'yangby/vim-rust-cargoclippy'
```

The run the command `:PluginInstall` in vim to install the plugin.

### Enable the Plugin in Syntastic

Add syntastic configure into vim configuration files.

```vim
let g:syntastic_rust_checkers = ['cargoclippy', 'rustc']
```

## References

- [Add a cargo checker for syntastic #132](https://github.com/rust-lang/rust.vim/pull/132)

- [d3m3vilurr/clippy.vim](https://github.com/d3m3vilurr/clippy.vim)
