---------------------------- MODULE MeasuringJar ----------------------------
EXTENDS Integers
VARIABLES small, big

TypeOK == small \in 0..3 /\ big \in 0..5

Init == (big=0) /\ (small = 0)

EmptyBig == (big'=0) /\ (small'=small)
EmptySmall == (small'=0) /\ (big' = big)

FillBig == (big'=5) /\ (small' = small)
FillSmall == (small' = 3) /\ (big' = big)

SmallToBig == IF (small+big > 5) THEN (big'=5) /\ (small'= small - (5-big))
              ELSE (small' = 0) /\ (big' = big +small)

BigToSmall == IF (small+big) > 3 THEN (small'=3) /\ (big' = big -(3- small))
              ELSE (big' = 0) /\ (small' = small +big)
              
Next == \/EmptyBig
        \/EmptySmall
        \/FillBig
        \/FillSmall
        \/SmallToBig
        \/BigToSmall

=============================================================================
\* Modification History
\* Last modified Wed Aug 17 18:21:30 IST 2022 by 112102006
\* Created Wed Aug 17 17:44:40 IST 2022 by 112102006
