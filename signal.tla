------------------------------- MODULE signal -------------------------------
EXTENDS Integers
VARIABLES x, s1, s2

TypeOk == (x \in 0..21) /\ (s1 \in {"r1", "g1"}) /\ (s2 \in {"r2", "g2"})

init1 == (x=0) /\ (s1="r1")
init2 == (x=0) /\ (s2 ="g2")
Init == init1 /\ init2

p1 == (x<20)/\ (x' =x+1) /\ UNCHANGED s1
p2 == (s1 = "r1") /\ (x=20) /\ (x'=0) /\ (s1' = "g1")
p3 == (s1 = "g1") /\ (x=20) /\ (x'=0) /\ (s1' = "r1")

next1 == p1 \/ p2 \/  p3

q1 == (x<20)/\ (x' =x+1) /\ UNCHANGED s2
q2 == (s2 = "r2") /\ (x=20) /\ (x'=0) /\ (s2' = "g2")
q3 == (s2 = "g2") /\ (x=20) /\ (x'=0) /\ (s2' = "r2")

                    
next2 == q1 \/ q2 \/  q3

Next == next1 /\ next2

condition == ~(s1="g1" /\ s2="g2")



 


=============================================================================
\* Modification History
\* Last modified Wed Aug 31 19:05:48 IST 2022 by 112102006
\* Created Wed Aug 31 17:04:01 IST 2022 by 112102006
