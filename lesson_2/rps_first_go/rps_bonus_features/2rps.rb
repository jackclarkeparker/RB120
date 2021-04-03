=begin

We've got to create an application that allows a user to play rounds of rock,
paper, scissors, spock, lizard with a computer. Each round of gameplay awards
one player with a point, and whoever reaches 10 points first is the overall winner.

### EXPLICIT

- Create a game that can be played between a player and the computer.

### IMPLICIT

- The computer has a selection of names that it can randomly draw from which
  will be assigned to it.


### DATA STRUCTURE

Classes
=======

RPSGame
ATTRIBUTES
- human
- computer
- scoreboard
- move_history

BEHAVIOURS
- can play a game of rps
  -

-----------------------------------------

Scoreboard
ATTRIBUTES
- human
- computer

BEHAVIOURS
- can display scores

-----------------------------------------

Player
ATTRIBUTES
- name
- move
- score

-----------------------------------------

Human < Player
BEHAVIOURS
- can choose a name

-----------------------------------------

Computer < Player
BEHAVIOURS
- can choose a name

-----------------------------------------

Move
ATTRIBUTES
- value
- choice
BEHAVIOURS
- can display the choice

-----------------------------------------

Rock < Move
BEHAVIOURS
- can determine whether it won

-----------------------------------------

Paper < Move
BEHAVIOURS
- can determine whether it won

-----------------------------------------

Scissors < Move
BEHAVIOURS
- can determine whether it won

-----------------------------------------

Spock < Move
BEHAVIOURS
- can determine whether it won

-----------------------------------------

Lizard < Move
BEHAVIOURS
- can determine whether it won

=end