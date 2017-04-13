" -*- coding: utf-8; mode: Vim; fill-column: 76; tab-width: 4; -*-
" Brief: Syntax checking plugin for syntastic.
"       Use `cargo clippy` for rust language.
" Author: YangBy <yby@yangby.org>
" Original: < Created by YangBy at 2017-04-14_04:11:34_CST >
" Final: < Last modified by YangBy at 2017-04-14_04:38:27_CST >

" See for details on how to add an external Syntastic checker:
" https://github.com/scrooloose/syntastic/wiki/Syntax-Checker-Guide#external

if exists('g:loaded_syntastic_rust_cargoclippy_checker')
    finish
endif
let g:loaded_syntastic_rust_cargoclippy_checker = 1

if !exists('g:syntastic_rust_cargoclippy_sort')
    let g:syntastic_rust_cargoclippy_sort = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_rust_cargoclippy_IsAvailable() dict
"    return executable(self.getExec())
    return executable('cargo-clippy')
endfunction

function! SyntaxCheckers_rust_cargoclippy_GetHighlightRegex(item)
    if match(a:item['text'], 'should have a snake case name such as') > -1
        let term = split(a:item['text'], '`')[1]
        return '\V\<'.term.'\>'
    endif

    return ''
endfunction

function! SyntaxCheckers_rust_cargoclippy_GetLocList() dict

    let args = [
        \   'clippy',
        \   '--release',
        \   '--quiet', '--color', 'never',
        \ ]
    let makeprg = self.makeprgBuild({
        \   'exe': 'cargo',
        \   'args': args,
        \   'fname': ''
        \ })

    " Old errorformat (before nightly 2016/08/10)
    let errorformat  =
        \ '%E%f:%l:%c: %\d%#:%\d%# %.%\{-}error:%.%\{-} %m,'   .
        \ '%W%f:%l:%c: %\d%#:%\d%# %.%\{-}warning:%.%\{-} %m,' .
        \ '%C%f:%l %m'

    " New errorformat (after nightly 2016/08/10)
    let errorformat  .=
        \ ',' .
        \ '%-G,' .
        \ '%-Gerror: aborting %.%#,' .
        \ '%-Gerror: Could not compile %.%#,' .
        \ '%Eerror: %m,' .
        \ '%Eerror[E%n]: %m,' .
        \ '%-Gwarning: the option `Z` is unstable %.%#,' .
        \ '%Wwarning: %m,' .
        \ '%Inote: %m,' .
        \ '%C %#--> %f:%l:%c'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'cwd': expand('%:p:h:h'),
        \ 'errorformat': errorformat,
    \ })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'rust',
    \ 'name': 'cargoclippy',
\ })

let &cpo = s:save_cpo
unlet s:save_cpo
