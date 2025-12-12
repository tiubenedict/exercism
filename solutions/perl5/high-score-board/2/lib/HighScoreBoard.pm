package HighScoreBoard;

use v5.40;

our %Scores;

sub set_player_scores (%new_scores) {
    for my $key (keys %new_scores) {
        $Scores{$key} = $new_scores{$key};
    }
    return %Scores;
}

sub get_player_score ($player) {
    return $Scores{$player};
}

sub increase_player_scores (%additional_scores) {
    # Solution 1
    # for my $key (keys %additional_scores) {
    #     $Scores{$key} = $Scores{$key} + $additional_scores{$key};
    # }

    # Solution 2
    %Scores = map { $_ => $Scores{$_} + $additional_scores{$_} } keys %Scores;  
    
    return %Scores;
}

sub sort_players_by_name {
    return sort keys(%Scores);
}

sub sort_players_by_score {
    # a <=> b ascending, b <=> a descending
    # <=> 'spaceship operator' for numbers, cmp for string
    # sort { custom operator }
    return sort { $Scores{$b} <=> $Scores{$a} } keys(%Scores);
}

sub delete_player ($player) {
    # Returns the score of the deleted player as well.
    # If this is undesired, set a separate "return;" line.
    return delete $Scores{$player};
}

1;
