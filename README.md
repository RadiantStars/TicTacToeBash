# TicTacToeBash
## A Tictoktoe project on Bash

This is a small project to test what I have learned using bash.
- The program takes 2 inputs, an X or O and a file that contains a numbers from 1-9.
- The first input determines whether which player goes first.
- Each number in the file corresponds to a specific spot on a 3x3 board.

The program reads though the file and places the Xs and Os in the corresponding spots if one of the players win before the end of the game. The program stops and prints the results and the winner
There are also a few checks that have been implemented:
1. Checks if the first argument is an X or O
2. Checks if the second arguement is a readable file
3. Checks if the file contains only numbers betwwen 1-9 with no repeated values.
Each of these checks if triggered ends the program with a different exit code.
