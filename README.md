# Chess
The classic strategy game that you can play in the terminal, implemented in Ruby.
To play, download the repository and run <ruby chess.rb> from a terminal.
* Only legal moves are allowed.
* You can not move into check.

##To Play
Use the keys "wasd" to navegate up/left/down/right on the display. Hit enter to select a piece, select a different square to move
the piece. 

## Implementation
Chess was implemented with an object-oriented approach in Ruby. There are separate classes for the Display, Board, Game, Pieces, and
subclasses for types of pieces, including a subclass for empty squares. There are modules for stepping and sliding pieces. Preventing players from moving into check is done by creating a deep duplicate of the board, then checking if the duplicated board is in check.


##Future improvements
* Implement pawn promotion
* Implement castling







