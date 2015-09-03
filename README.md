# Chess
Comnand line version of the classic strategy game.
To play, clone the repository and run 'ruby game.rb'

### Human Player
* You cannot move yourself into check
* The game will display all possible moves

### AI
* Always moves its opponent into checkmate or check if possible
* Takes the opponents piece if available
* Moves itself out of check

## How To Play
'wasd' moves the cursor up/left/down/right.  Enter selects the piece and enter again selects the position to move.  't' terminates the game.

## Implementation
Chess utilizes object orientation and Ruby's class inheritence structure.  All pieces inherit from a 'Piece' class, then from either 'Slideable' or 'Steppable' classes.  The pawn only inherits from 'Piece' and carries it's own movement logic.  

All pieces are contained in their own files and required at once with a 'pieces/index.rb' file.

Game, Board, Player, ComputerPlayer, and Display all have their own class structure.

* `system(clear)` and `#render` in a loop create 'live' terminal gameplay
* Custom error messages for clarity
* Optional debug mode prints game-state information
