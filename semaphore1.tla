----------------------------- MODULE semaphore1 -----------------------------
EXTENDS Integers
VARIABLES sem, s0, s1

TypeOK == (sem \in {"available", "busy"}) /\ (s0 \in {"ready", "idle", "critical"}) /\ (s1 \in {"ready", "idle", "critical"})

init0 == (sem = "available") /\ (s0 = "idle")
init1 == (sem = "available") /\ (s1 ="idle") 
Init == init0 /\ init1

Pir == (s0 ="idle") /\ (s0'="ready") /\ UNCHANGED sem
Prr == (s0="ready") /\ (sem="busy") /\ UNCHANGED <<sem, s0>>
Prc == (s0="ready") /\ (s0'="critical") /\ (sem="available") /\ (sem'="busy")
Pci == (s0="critical") /\ (s0'="idle") /\ (sem' = "available")

Pstall == UNCHANGED <<s0, sem>>

next0 == Pir \/ Prr \/ Prc \/ Pci \/ Pstall

Qir == (s1 ="idle") /\ (s1'="ready") /\ UNCHANGED sem
Qrr == (s1="ready") /\ (sem="busy") /\ UNCHANGED <<sem, s1>>
Qrc == (s1="ready") /\ (s1'="critical") /\ (sem="available") /\ (sem'="busy")
Qci == (s1="critical") /\ (s1'="idle") /\ (sem' = "available")

Qstall == UNCHANGED <<s1, sem>>

next1 == Qir \/ Qrr \/ Qrc \/ Qci \/ Qstall



Next == (next0 /\ UNCHANGED s1) \/ (next1 /\ UNCHANGED s0)

boundedwait1 == []((s0="ready") => (<>(s0="critical")))
boundedwait2 == []((s1="ready") => (<>(s1="critical")))



mexclusion == ~(s0="critical" /\ s1="critical")

WFairness == WF_s0 (Prc) /\ WF_s0(Pci) /\ WF_s1 (Qrc) /\ WF_s1(Qci)
SFairness == SF_s0(Prc) /\ WF_s0(Pci) /\ SF_s1(Qrc) /\ WF_s1(Qci)

spec1 == Init /\ [][Next]_<<s0, s1, sem>> /\ SFairness 
spec2 == Init /\ [][Next]_<<s0, s1, sem>> /\ WFairness 



=============================================================================
\* Modification History
\* Last modified Wed Sep 21 18:05:35 IST 2022 by sumi1
\* Created Wed Sep 21 16:05:40 IST 2022 by sumi1
