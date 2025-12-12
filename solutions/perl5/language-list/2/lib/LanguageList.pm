package LanguageList;

use v5.40;

our @Languages;

sub add_language ($language) {
    push(@Languages, $language);
    return;
}

sub remove_language () {
    pop @Languages;
    return;
}

sub first_language () {
    return $Languages[0];
}

sub last_language () {
    return $Languages[-1];
}

sub get_languages (@elements) {
    my @elements_shifted = map  { $_ - 1} @elements;
    return @Languages[@elements_shifted];
}

sub has_language ($language) {
    return grep { $_ eq $language } @Languages;
}

1;
