----------------------------- MODULE heckmeck1 -----------------------------
EXTENDS Naturals, Integers, TLC, FiniteSets


CONSTANTS
    MAX_CHICKENS
    NUM_PLAYERS,      
    NUM_DICE,                        
    CHIP_VALUES,
    DIE_VALUES  

VARIABLES
    players,         
    current_player            

Chickens == [21 |-> 1, 22 |-> 1, 23 |->1, 24 |->2, 25 |->3, 26 |->3]

CHIP_VALUES == [21,22,23,24,25,26]

PlayerState == [alinanzar: SUBSET DIE_VALUES, chickens: 0..MAX_CHICKENS, chips: SUBSET CHIP_VALUES]


Init ==
    /\ players \in [1..NUM_PLAYERS -> [alinanzar |-> {}, chickens |-> 0, chips |-> {}]]
    /\ current_player = 1

(*berabere olursa??*)
WinningState ==
    /\ \E p1: \A p2 \in 1..NUM_PLAYERS :
          players[p1].chickens >= players[p2].chickens
    /\ \A c \in CHIP_VALUES : \E p \in 1..NUM_PLAYERS :
          c \in players[p].chips

(*nasıl zar atcaz*)

LegalRoll(dice_roll) ==
    /\ Cardinality(dice_roll) = NUM_DICE
    /\ \A d \in 1..NUM_DICE : dice_roll[d] \in 1..6


RollDice == /\ current_roll <= MAX_ROLLS
            /\ LET
                rolled_dice == [d \in 1..NUM_DICE |-> RandomElement(DIE_VALUES)]
                roll_sum == Sum({d \in 1..NUM_DICE : rolled_dice[d] \notin players[current_player].alinanzar})
                (*
                new_chips == 
                *)
            IN
                /\ players' = [players EXCEPT ![current_player].chips = new_chips, ![current_player].chickens = players[current_player].chickens + new_chickens]
                /\ UNCHANGED current_player
        \/ Skip


TakeChip(chip_value) ==
    /\ players' = [players EXCEPT ![current_player].chips = players[current_player].chips \cup {chip_value}]
    /\ current_roll' = 1
    /\ current_player' = IF current_player = NUM_PLAYERS THEN 1 ELSE current_player + 1


PassTurn ==
    /\ current_roll' = 1
    /\ current_player' = IF current_player = NUM_PLAYERS THEN 1 ELSE current_player + 1


NextRound ==
    /\ players \in [1..NUM_PLAYERS -> [chickens |-> 0, chips |-> {}]]
    /\ current_roll' = 1
    /\ current_player' = 1




=============================================================================
\* Modification History
\* Last modified Tue Apr 11 19:55:06 TRT 2023 by quantwifi
\* Created Tue Apr 11 11:25:05 TRT 2023 by quantwifi