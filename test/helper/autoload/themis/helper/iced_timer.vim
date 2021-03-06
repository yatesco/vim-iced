let s:save_cpo = &cpoptions
set cpoptions&vim

let s:helper = {}

function! s:helper.start(timer, callback, ...) abort
  return a:callback(-1)
endfunction

function! s:helper.stop(timer) abort
  return ''
endfunction

function! s:helper.start_lazily(id, timer, callback, ...) abort
  return a:callback(-1)
endfunction

function! s:helper.mock() abort
  call iced#system#set_component('timer', {'start': {_ -> self}})
endfunction

function! themis#helper#iced_timer#new(runner) abort
  return deepcopy(s:helper)
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
