BEGIN ~Sindel~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Encontronazo
  SAY @0 /* ~�Eh, chicos, mirad lo que tenemos aqu�!...�Pero si se trata de uno de mis hermanitos!. �S�, no hay duda, mi don para ver el aura de la gente no me enga�a: el halo de muerte que le rodea corresponde sin lugar a dudas a uno de los v�stagos de Baal!~*/ 
//= 
//@1 /*~Bien, supongo que tendr� que matarte... La Esencia de nuestro Padre solo puede ser heredada por uno solo de sus hijos...�Y esa ser� yo!~*/ 

  IF ~~ THEN REPLY @2 /* ~As� que es cierto, eres otro Hijo de Baal (suspiro)... Me empiezo a preguntar cu�ntos estaremos desperdigados por el mundo...~*/ DO   ~SetGlobal("SindelExiste","LOCALS",1)~ GOTO Semilla
END

IF ~~ THEN BEGIN Semilla
  SAY @3 /* ~Yo al principio tambi�n me hac�a esa pregunta, he matado a decenas de los nuestros, de todas las razas y clases sociales...Al parecer a nuestro Padre se le daba muy bien ligar, �no crees?, �ja,ja,ja!.~ */
  IF ~~ THEN REPLY @4 /* ~...S�, no se puede decir que perdiera el tiempo.~ */ GOTO Bravuconadas
END

IF ~~ THEN BEGIN Bravuconadas
 SAY @5 /* ~Bueno hermanito, no es por estropear este "emotivo" encuentro, pero ya supones como va a acabar esto, �verdad?...��Debo matarte, no hay otra salida, es nuestro destino, es la voluntad de nuestro Padre!!.~ ~Bueno hermanita, no es por estropear este emotivo encuentro, pero ya supones como va a acabar esto, �verdad?...��Debo matarte, no hay otra salida, es nuestro destino, es la voluntad de nuestro Padre!!. */ 
      
  IF ~Class(Player1,PALADIN)~ THEN REPLY @6 /* ~�La maldad que anida en tu coraz�n me hace saber que en tu alma no hay cabida para la redenci�n!. �Sea pues, ven a recibir tu justo castigo!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @7 /* ~�Insensata!,No sabes con quien te las estas jugando...�Hoy ser�s tu quien muera!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @8 /* ~S�, mejor pasemos a la acci�n (bostezo)... �Empezaba a aburrirme con tu insoportable parloteo!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @9 /* ~�Jajaja, no sabes a quien te enfrentas escremento de kobold!. ��Yo ser� quien te abra en canal !!.~ */ GOTO Pelea
  IF ~Class(Player1,PALADIN)~ THEN REPLY @10 /* ~Desde aqu� se percibe tu malignidad, pero no tengo el poder suficiente para enfrentarme a ti...No pondr� en peligro innecesariamente la vida de mis compa�eros. Me rindo. Pon tus condiciones...~ */ GOTO Rendicion
  IF ~~ THEN REPLY @11 /* ~Euh...�No habr�a alguna forma de solucionarlo...amigablemente?~ */ GOTO Rendicion
  IF ~~ THEN REPLY @12 /* ~Mmm, se nota que eres una gran guerrera, �qu� te parece una alianza?...�Tu y yo juntos!...�Haremos al mundo temblar!~ */ GOTO Rendicion
END

IF ~~ THEN BEGIN Rendicion
  SAY @13 /* ~��Ja,ja,ja,ja!!....Me has caido simp�tico. No es corriente encontrar a alguien tan cobarde, �ja,ja,ja!... Est� bien, ver�s lo que vamos a hacer hermanito: Mis compa�eros y yo tenemos bastante sed y apenas nos queda dinero con el que seguir disfrutando de la sabrosa cerveza de este antro. Mmm, dame todo tu dinero y te dejar� vivir.~ */ 
       
  IF ~~ THEN REPLY @14 /* ~�Todo mi dinero!, �Ni en broma maldita zorra!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @15 /* ~(Suspiro)...Aqu� tienes...Pero esto no quedar� as�. �Volveremos a encontrarnos!~ */ DO ~TakePartyGold(2147483647)~ GOTO Gallina
END

IF ~~ THEN BEGIN Gallina
  SAY @16 /* ~�Ja,ja,ja!. Lo que tu digas. Aqu� te estar� esperando gallinita...Pero la pr�xima vez trae m�s monedas de oro, a mis hombres les gusta bastante la cerveza, �ja,ja,ja!.~ */
  IF ~~ THEN REPLY @17 /* ~�Ummf!~ */ EXIT
END

IF ~~ THEN BEGIN Pelea
  SAY @18 /* ~�Bien, por fin alguien capaz de presentar batalla!...�ATENCI�N MUCHACHOS,TENEMOS DIVERSI�N. MATEMOS A ESTOS BUFONES!.��A POR ELLOS!!~ */
  IF ~~ THEN  DO ~ActionOverride("Sindel",Enemy()) ActionOverride("Buch",Enemy()) ActionOverride("Buss",Enemy()) ActionOverride("Buba",Enemy())~ EXIT 
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN OtroEncontronazo
  SAY @19 /* ~�Has vuelto! �Bien, dame todo tu dinero gallinita!.~ */
  IF ~~ THEN REPLY @20 /* ~�Te equivocas, he venido a darte una buena paliza!.~ */ GOTO Pelea 
  IF ~~ THEN REPLY @21 /* ~Euh...claro...aqu� tienes...~ */ DO ~TakePartyGold(2147483647)~ EXIT
END

