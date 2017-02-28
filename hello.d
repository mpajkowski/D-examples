module blackjack;

import std.stdio;
import std.random;

void printWinMsg(int player, int points) {
    writefln("Winner: Player %d with %d points!", player + 1, points);
}

void main(string[] args) {
    int score_P0 = 0, score_P1 = 0;
    int player = 0;
    char player_choice = 0;
    
    while (player < 2) {
        writefln("Player %d", player + 1);
        writefln("Player 1: %d", score_P0);
        writefln("Player 2: %d", score_P1);
        writef("Continue? (Y/N): ");
        
        if (score_P0 == 21 || score_P1 == 21) break;

        readf("%s", &player_choice);

        switch (player_choice) {
            case 'Y' :
            case 'y' :
                if (!player)    score_P0 += uniform (2, 12);
                else            score_P1 += uniform (2, 12);
                break;
            case 'N' :
            case 'n' :
                player++;
                break;
            default:
                break;
        } 
    }

    if      (score_P0 > 21)         printWinMsg(1, score_P1);
    else if (score_P1 > 21)         printWinMsg(0, score_P0);
    else if (score_P1 > score_P0)   printWinMsg(1, score_P1);
    else if (score_P0 > score_P1)   printWinMsg(0, score_P0);
    else				            writefln("Draw");
}
