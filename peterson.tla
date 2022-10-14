------------------------------ MODULE peterson ------------------------------
EXTENDS Integers
VARIABLES s0, s1, turn, interested1, interested0

TypeOk == (s0 \in 0..3) /\ (s1 \in 0..3) /\ (turn \in {0,1}) /\ (interested0 \in {TRUE,FALSE}) /\ (interested1 \in {TRUE,FALSE})

init0 == (s0 = 0) /\ (interested0 = FALSE) 
init1 == (s1 =0) /\ (interested1 = FALSE)
Init == init0 /\ init1 /\ (turn=0)

p01 == (s0 =0) /\ (s0' = 1) /\ (interested0' = TRUE) /\ UNCHANGED <<turn, interested1>>
p12 == (s0 =1) /\ (s0' = 2) /\ (turn'=1) /\ UNCHANGED <<interested0, interested1>>
p23 == (s0 =2) /\ (s0' = 3) /\ ((turn =0)\/ (interested1 = FALSE))/\ (UNCHANGED <<interested0, interested1, turn>>)
p22 == (turn =1) /\ (s0=2) /\ (interested1 = TRUE) /\ UNCHANGED <<interested1, turn, interested0, s0>>
p30 == (s0 =3) /\ (s0' = 0) /\ (interested0'=FALSE) /\ UNCHANGED <<interested1, turn>>


next0 == p01 \/ p12 \/ p23 \/ p30 


q01 == (s1 =0) /\ (s1' = 1) /\ (interested1' = TRUE) /\ (UNCHANGED <<interested0, turn>>)
q12 == (s1 =1) /\ (s1' = 2) /\ (turn' = 0 ) /\ (UNCHANGED <<interested0, interested1>>)
q22 == (turn =0) /\ (s1=2) /\ (interested0 = TRUE) /\ UNCHANGED <<interested1, turn, interested0, s1>> 
q23 == (s1 =2) /\ (s1' = 3) /\ ((turn =1)\/(interested0 = FALSE)) /\ (UNCHANGED <<interested1, interested0, turn>>)
q30 == (s1 =3) /\ (s1' = 0) /\ (interested1'=FALSE) /\ (UNCHANGED <<interested0, turn>>)


next1 == q01 \/ q12 \/ q23 \/ q30 

Next == (next0 /\ UNCHANGED s1) \/ (next1 /\ UNCHANGED s0)

condition == ~((s0 = 3) /\ (s1 = 3))




=============================================================================
\* Modification History
\* Last modified Fri Oct 14 13:56:09 IST 2022 by 112102006
\* Created Wed Aug 24 17:07:42 IST 2022 by 112102006
