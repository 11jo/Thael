EXTEND_TOP FATESP 6

   IF ~!Dead("Thael")
       !InMyArea("Thael")
       Global("ThaelSummoned","GLOBAL",0)~ THEN

      REPLY @0 /* ~Tráeme a Thael, el portador de la legendaria Velvevlos.~ */ DO ~SetGlobal("ThaelSummoned","GLOBAL",1)~ GOTO 8
END


