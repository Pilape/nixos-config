function fish_prompt   
    printf '%s%s%s' \
        (set_color green) (prompt_pwd) \
        (set_color brblack) (fish_git_prompt)
        set_color --reset

    printf '\n><> '

end
