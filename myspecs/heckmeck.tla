------------------------------ MODULE heckmeck ------------------------------
EXTENDS Naturals,TLC


CONSTANTS
    NUM_PLAYER = 3       (* Number of players in the game *)
    NUM_DICE = 8          (* Number of dice used in the game *)
    NUM_ROLLS = 3           (* Number of rolls per turn *)
    MAX_CHICKENS = 8        (* Maximum number of chickens per player *)
    CHIP_VALUES = {1, 2, 3, 4, 5, 6, 7, 8, 10, 12}   (* Available chip values *)

=============================================================================
\* Modification History
\* Last modified Tue Apr 11 11:24:37 TRT 2023 by quantwifi
\* Created Sun Apr 09 20:41:18 TRT 2023 by quantwifi