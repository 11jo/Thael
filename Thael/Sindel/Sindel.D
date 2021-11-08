BEGIN ~Sindel~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Encontronazo
  SAY @0 /* ~¡Eh, chicos, mirad lo que tenemos aquí!...¡Pero si se trata de uno de mis hermanitos!. ¡Sí, no hay duda, mi don para ver el aura de la gente no me engaña: el halo de muerte que le rodea corresponde sin lugar a dudas a uno de los vástagos de Baal!~*/ 
//= 
//@1 /*~Bien, supongo que tendré que matarte... La Esencia de nuestro Padre solo puede ser heredada por uno solo de sus hijos...¡Y esa seré yo!~*/ 

  IF ~~ THEN REPLY @2 /* ~Así que es cierto, eres otro Hijo de Baal (suspiro)... Me empiezo a preguntar cuántos estaremos desperdigados por el mundo...~*/ DO   ~SetGlobal("SindelExiste","LOCALS",1)~ GOTO Semilla
END

IF ~~ THEN BEGIN Semilla
  SAY @3 /* ~Yo al principio también me hacía esa pregunta, he matado a decenas de los nuestros, de todas las razas y clases sociales...Al parecer a nuestro Padre se le daba muy bien ligar, ¿no crees?, ¡ja,ja,ja!.~ */
  IF ~~ THEN REPLY @4 /* ~...Sí, no se puede decir que perdiera el tiempo.~ */ GOTO Bravuconadas
END

IF ~~ THEN BEGIN Bravuconadas
 SAY @5 /* ~Bueno hermanito, no es por estropear este "emotivo" encuentro, pero ya supones como va a acabar esto, ¿verdad?...¡¡Debo matarte, no hay otra salida, es nuestro destino, es la voluntad de nuestro Padre!!.~ ~Bueno hermanita, no es por estropear este emotivo encuentro, pero ya supones como va a acabar esto, ¿verdad?...¡¡Debo matarte, no hay otra salida, es nuestro destino, es la voluntad de nuestro Padre!!. */ 
      
  IF ~Class(Player1,PALADIN)~ THEN REPLY @6 /* ~¡La maldad que anida en tu corazón me hace saber que en tu alma no hay cabida para la redención!. ¡Sea pues, ven a recibir tu justo castigo!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @7 /* ~¡Insensata!,No sabes con quien te las estas jugando...¡Hoy serás tu quien muera!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @8 /* ~Sí, mejor pasemos a la acción (bostezo)... ¡Empezaba a aburrirme con tu insoportable parloteo!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @9 /* ~¡Jajaja, no sabes a quien te enfrentas escremento de kobold!. ¡¡Yo seré quien te abra en canal !!.~ */ GOTO Pelea
  IF ~Class(Player1,PALADIN)~ THEN REPLY @10 /* ~Desde aquí se percibe tu malignidad, pero no tengo el poder suficiente para enfrentarme a ti...No pondré en peligro innecesariamente la vida de mis compañeros. Me rindo. Pon tus condiciones...~ */ GOTO Rendicion
  IF ~~ THEN REPLY @11 /* ~Euh...¿No habría alguna forma de solucionarlo...amigablemente?~ */ GOTO Rendicion
  IF ~~ THEN REPLY @12 /* ~Mmm, se nota que eres una gran guerrera, ¿qué te parece una alianza?...¡Tu y yo juntos!...¡Haremos al mundo temblar!~ */ GOTO Rendicion
END

IF ~~ THEN BEGIN Rendicion
  SAY @13 /* ~¡¡Ja,ja,ja,ja!!....Me has caido simpático. No es corriente encontrar a alguien tan cobarde, ¡ja,ja,ja!... Está bien, verás lo que vamos a hacer hermanito: Mis compañeros y yo tenemos bastante sed y apenas nos queda dinero con el que seguir disfrutando de la sabrosa cerveza de este antro. Mmm, dame todo tu dinero y te dejaré vivir.~ */ 
       
  IF ~~ THEN REPLY @14 /* ~¡Todo mi dinero!, ¡Ni en broma maldita zorra!.~ */ GOTO Pelea
  IF ~~ THEN REPLY @15 /* ~(Suspiro)...Aquí tienes...Pero esto no quedará así. ¡Volveremos a encontrarnos!~ */ DO ~TakePartyGold(2147483647)~ GOTO Gallina
END

IF ~~ THEN BEGIN Gallina
  SAY @16 /* ~¡Ja,ja,ja!. Lo que tu digas. Aquí te estaré esperando gallinita...Pero la próxima vez trae más monedas de oro, a mis hombres les gusta bastante la cerveza, ¡ja,ja,ja!.~ */
  IF ~~ THEN REPLY @17 /* ~¡Ummf!~ */ EXIT
END

IF ~~ THEN BEGIN Pelea
  SAY @18 /* ~¡Bien, por fin alguien capaz de presentar batalla!...¡ATENCIÓN MUCHACHOS,TENEMOS DIVERSIÓN. MATEMOS A ESTOS BUFONES!.¡¡A POR ELLOS!!~ */
  IF ~~ THEN  DO ~ActionOverride("Sindel",Enemy()) ActionOverride("Buch",Enemy()) ActionOverride("Buss",Enemy()) ActionOverride("Buba",Enemy())~ EXIT 
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN OtroEncontronazo
  SAY @19 /* ~¡Has vuelto! ¡Bien, dame todo tu dinero gallinita!.~ */
  IF ~~ THEN REPLY @20 /* ~¡Te equivocas, he venido a darte una buena paliza!.~ */ GOTO Pelea 
  IF ~~ THEN REPLY @21 /* ~Euh...claro...aquí tienes...~ */ DO ~TakePartyGold(2147483647)~ EXIT
END

