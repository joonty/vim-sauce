" ------------------------------------------------------------------------------
" Vim Sauce                                                {{{
"
" Author: Jon Cairns <jon@joncairnsMaintainer.com>
"
" Description:
" Organise mutliple vimrc files, to allow a project style configuration.
" Different configurations can be quickly loaded using :Sauce <name>
"
" Requires: Vim 6.0 or newer.
"
" Install:
" Put this file in the vim plugins directory (~/.vim/plugin)
" to load it automatically, or load it manually with :so sauce.vim.
"
" License: MIT
"
" }}}
" ------------------------------------------------------------------------------

" Directory to contain sauce files
if !exists("g:sauce_path")
	let g:sauce_path = "~/.vimsauce/"
endif

" Whether to say when loading a sauce file
if !exists("g:sauce_output")
	let g:sauce_output = 1
endif

let g:sauce_path = resolve(expand(g:sauce_path))."/"

if !isdirectory(g:sauce_path)
	call mkdir(g:sauce_path)
endif

command! -n=1 -complete=customlist,s:CompleteSauce -bar Sauce call sauce#LoadSauce('<args>')
command! -n=1 -bar SauceNew call sauce#SauceNew('<args>',g:sauce_skel_file)
command! -n=1 -complete=customlist,s:CompleteSauce -bar SauceEdit call sauce#SauceEdit('<args>')
command! -n=1 -complete=customlist,s:CompleteSauce -bar SauceCopy call sauce#SauceCopy('<args>')
command! -n=1 -complete=customlist,s:CompleteSauce -bar SauceDelete call sauce#SauceDelete('<args>')
command! -n=1 -complete=customlist,s:CompleteSauce -bar SauceRename call sauce#SauceRename('<args>')

function! s:CompleteSauce(A,L,P)
    return filter(sauce#SauceNames(), 'v:val =~ a:A')
endfunction

if !exists("g:sauce_skel_file")
    let g:sauce_skel_file = resolve(expand("<sfile>:h")."/../skel/vimrc.tmpl")
endif
