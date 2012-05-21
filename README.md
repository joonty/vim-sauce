# Sauce for Vim

Sauce is a manager for multiple *vimrc* files, which can be used to load different settings for different environments. In short, you can maintain lots of different vim settings files and only load the one(s) you need when you need them.

This can be used as a simple project organiser tool. For instance:

```vim
" Load the MyProject sauce
:Sauce MyProject
```

This "sauce" (read: source) can contain anything that you would put in your vimrc, and can be used to override those settings. In this case, it could be used to CD into the project directory, set spaces instead of tabs, open [NERDTree][1], set configuration options for [PHPQA tools][2], etc.

There's even autocomplete on the sauce names, so you don't need to remember them :)

## Quick Guide

Actually, a quick guide is all that's needed. There are just a few handy functions to manage your sauces:

```vim
" Load a sauce
:Sauce <name>
" Create a new sauce
:SauceNew <name>
" Edit an existing sauce
:SauceEdit <name>
" Copy an existing sauce as a new sauce
:SauceCopy <name>
" Delete an existing sauce (will prompt you to confirm)
:SauceDelete <name>
```

## Installation

Installation is easy-peasy if you're using [Vundle][3]. Just add this to your *.vimrc* file:

```vim
Bundle 'joonty/vim-sauce.git'
```
and run `vim +BundleInstall +qall` from a terminal.

If you aren't using vundle, you will have to extract the files in each folder to the correct folder in *.vim/*.

## Configuration

No configuration is necessary, although it's possible to change the default directory where sauces are stored (~/.vimsauce). To do this, add this to your vimrc file:

```vim
let g:sauce_path = "/path/to/sauces"
```

## Known Issues

The autocomplete currently won't work with Windows. However, plans are in place to change that.

## License

Sauce for Vim is released under the MIT license. See the LICENSE file for more information.

[1]: http://www.vim.org/scripts/script.php?script_id=1658
[2]: https://github.com/joonty/vim-phpqa
[3]: https://github.com/gmarik/vundle
