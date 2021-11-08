BEGIN ~GCompis~


IF ~RandomNum(2,1) NumTimesTalkedTo(0)~ THEN BEGIN Enclenque
  SAY @0 /* ~¡Dejame en paz, enclenque!~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2) NumTimesTalkedTo(0)~ THEN BEGIN Basura
  SAY @1 /* ~¡Alejate de mi cerveza, basura!~ */
  IF ~~ THEN EXIT
END