------------------------------ MODULE diehard3 ------------------------------
EXTENDS Integers
VARIABLES small, big

TypeOK == /\ small \in 0..3
          /\ big \in 0..5
Init == (big = 0 /\ small = 0)

FillSmall == (small' = 3 /\ big' = big)
FillBig == (big' = 5 /\ small' = small)
SmallToBig == IF big + small <= 5
                THEN (big' = big + small) /\ small' = 0
                ELSE (big' = 5 /\ small' = small-big)
BigToSmall == IF small + big <= 3
                THEN (small' = small+big) /\ big' = 0
                ELSE (small' = 3) /\ big' = big-small
EmptySmall == (small' = 0) /\ big' = big
EmptyBig == (big' = 0) /\ small' = small
Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ SmallToBig
        \/ BigToSmall
=============================================================================
\* Modification History
\* Last modified Tue Mar 28 12:25:02 TRT 2023 by tacet
\* Created Tue Mar 28 12:07:48 TRT 2023 by tacet
