# custom 'next' command to hook 'refresh' after next (for use with tui)
define n
    next
    refresh
end

# leave a short alias for non-TUI next
define ne
    next
end

# same thing for step
define s
    step
    refresh
end

# leave a short alias for non-TUI step
define st 
    step
end

# same thing for continue
define c
    continue
    refresh
end

define fi
    finish
end

skip -gfi char_traits.h
skip -gfi vector.h
skip -gfi ostream
skip -gfi istream
skip -gfi /usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/c++/12/bits/*

skip -gfi logging.h
