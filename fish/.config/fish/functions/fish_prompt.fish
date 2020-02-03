function fish_prompt --description 'Write out the prompt'
    if test "$status" -eq 0
        set_color green
        echo -n "[]"
    else
        set_color red
        echo -n "[]"
    end
    set_color purple
    echo -n "["(prompt_pwd)"]"
    set_color yellow
    echo "%> "
end
