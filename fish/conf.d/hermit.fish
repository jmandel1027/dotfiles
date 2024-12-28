function hermit_activate
    set -l hermit_env (find_enclosing_hermit_env)
    echo "Activating Hermit env: $hermit_env"
    replay "$hermit_env/bin/hermit env --activate > /tmp/\$\$.bash; source /tmp/\$\$.bash"
end

function hermit_deactivate
    set -l hermit_env (find_enclosing_hermit_env)
    echo "Deactivating Hermit env: $hermit_env"
    replay "$hermit_env/bin/hermit env --deactivate > /tmp/\$\$.bash; source /tmp/\$\$.bash"
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
