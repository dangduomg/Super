unit module Super;
=begin overview
Raku support for Python's super
=end overview

class SuperDelegator {
    has $!object is built;
    has %!super-methods = $!object.^mro[1].^method_table;

    method FALLBACK($name, |args) {
        %!super-methods{$name}($!object, |args);
    }
}

sub super($o) is export {
    SuperDelegator.new(object => $o);
}