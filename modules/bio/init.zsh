function vcf-cat {
    cat $1; shift
    (cat "$@" | grep -v "^#")
}