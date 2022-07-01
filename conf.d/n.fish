function _choose_node_version --on-variable PWD
    n --preserve auto 2>/dev/null ||
    test (node -v) = v(n --lts) ||
    n --preserve lts 2>/dev/null
end

_choose_node_version
