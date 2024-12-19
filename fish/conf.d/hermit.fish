function __hermit_auto_env -e fish_prompt
    set -l new_hermit_env (find_enclosing_hermit_env)
    if test "$new_hermit_env" = "$HERMIT_ENV"
        return
    end
    if test -n "$HERMIT_ENV"
        # echo "Deactivating Hermit env: $HERMIT_ENV"
        replay "$HERMIT_ENV/bin/hermit env --deactivate > /tmp/\$\$.bash; source /tmp/\$\$.bash"
    end
    if test -n "$new_hermit_env"
        # echo "Activating Hermit env: $new_hermit_env"
        replay "$new_hermit_env/bin/hermit env --activate > /tmp/\$\$.bash; source /tmp/\$\$.bash"
    end
end

function find_enclosing_hermit_env
    set -l dir (pwd)
    while not test "$dir" = /
        if test -f "$dir/bin/activate-hermit"
            echo $dir; and return
        end
        set dir (realpath $dir/..)
    end
end
