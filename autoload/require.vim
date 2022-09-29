function require#(module_name)
    if !exists('g:modules_lookup')
        let g:modules_lookup = expand('~') .. '/.vim/vim_modules'
    endif
    let __module__ = g:modules_lookup .. '/' .. a:module_name

    if isdirectory(__module__) && filereadable(__module__ .. '/index.vim')
        execute 'source ' .. __module__ .. '/index.vim'
        return (exists('b:exports') ? b:exports : '')

    elseif filereadable(__module__ .. '.vim')
        execute 'source ' .. __module__ .. '.vim'
        return (exists('b:exports') ? b:exports : '')

    elseif filereadable(__module__)
        execute 'source ' .. __module__
        return (exists('b:exports') ? b:exports : '')

    else
        echoerr 'No such module: "' .. a:module_name .. '" '
        return 0
    endif
endfu
