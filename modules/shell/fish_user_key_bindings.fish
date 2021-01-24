#!/usr/bin/env fish

function fish_user_key_bindings
    bind \cs 'pet-select --layout=bottom-up'
    bind \co 'commandline ranger-cd; commandline -f execute'
end
