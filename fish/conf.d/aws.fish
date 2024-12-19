
function __fish_print_aws_profiles
    set -l xdg_cache_home (__fish_make_cache_dir)
    set -l cache_file $xdg_cache_home/aws_profiles
    if test -f $cache_file
        set -l age (path mtime -R -- $cache_file)
        set -l max_age 600
        if test $age -gt $max_age
            rm $cache_file
        end
    end
    if not test -f $cache_file
        aws configure list-profiles >$cache_file
    end
    cat $cache_file
end

complete -c with-aws-profile -f -a "(__fish_print_aws_profiles)"

function __fish_list_eks_clusters
    set -l xdg_cache_home (__fish_make_cache_dir)
    if not set -q AWS_PROFILE
        echo "error: AWS_PROFILE not set" >&2
        return 1
    end
    set -l cache_file "$xdg_cache_home/eks_clusters.$AWS_PROFILE"
    if test -f $cache_file
        set -l age (path mtime -R -- $cache_file)
        set -l max_age 600
        if test $age -gt $max_age
            rm $cache_file
        end
    end
    if not test -f $cache_file
        aws eks list-clusters | jq -r '.clusters.[]' >$cache_file
    end
    cat $cache_file
end

complete -c with-eks-kubeconfig -f -a "(__fish_list_eks_clusters)"
