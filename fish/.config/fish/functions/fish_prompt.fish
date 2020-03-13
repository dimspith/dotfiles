function fish_prompt --description 'Write out the prompt'
    set_color red
    echo -n "["(prompt_pwd)"]"
    set_color green
    echo "%> "
end
