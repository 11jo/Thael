BEGIN ~Zaki~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Encontrado
  SAY @0 /* ~�Por fin!...�"Cielecillos", cada d�a que pasa est� peor el Tr�fico Interplanar, vaya atascos, uff!...Euhh...�Hola Thael!, muy original lo de huir a esta Bolsa Planar pero con nosotros no funcionan este tipo de cosas. �Jijiji!~ */ 
      =
      @1 /* ~�Los Infernales somos expertos mercenarios de los Planos y encontrar tu rastro nos ha resultado relativamente facil!...Venga, entreganos a Velvevlos y dejate morir sin oponer resistencia...Estoy seguro de que nuestro cliente, el cual prefiere permanecer en el anonimato, agradecer� tu colaboraci�n. �Jijiji!~ */
  IF ~~ THEN REPLY @2 /* ~Disculpa que te interrumpa pero... �Qui�n eres tu y qu� haces aqu�?.~ */ DO ~SetGlobal("ZakiSummoned","GLOBAL",1) SetGlobal("InfernalesSummoned","GLOBAL",0)~ GOTO Explicacion
  IF ~~ THEN REPLY @3 /* ~��Pero qui�n demonios eres tu?!... ��Y qu� haces aqu�?!.~ */ DO ~SetGlobal("ZakiSummoned","GLOBAL",1) SetGlobal("InfernalesSummoned","GLOBAL",0)~ GOTO Explicacion 
END

IF ~~ THEN BEGIN Explicacion
  SAY @4 /* ~Uiiss, perdoname "florecilla". Llevas raz�n, a�n no me he presentado...Bueno, tenemos algo de prisa, pero ah� va un peque�o resumen...*ejem*...Ver�s, me llamo Zakisinais'Kithak, aunque puedes llamarme Zaki, es m�s c�modo, �verdad?. Soy el jefazo de los Infernales...Euhhh, los Infernales somos un "poderosisimo" grupo de mercenarios que aceptamos encargos de, basicamente, cualquier ser de cualquier Plano que pueda pagar nuestros "carisisimos" servicios.~ */ 
      =
      @5 /* ~Resulta que nos ha contratado cierto cliente para quitarle la espada a aquel elfillo de piel dorada y tambi�n para matarle, aunque realmente el orden no importa �jijiji!...Euhh, por cierto, tu debes ser el Hijo de Baal del que nos hablaron, �verdad?...Euhh, �cu�l era tu nombre?.~ */
  IF ~~ THEN REPLY @6 /* ~Me llamo <CHARNAME> y puesto que Thael es mi camarada no dejar� que cumplas tu encargo. �Sal de aqu� antes de que pierda la paciencia!.~ */ GOTO Problemas
  IF ~~ THEN REPLY @7 /* ~Me llamo <CHARNAME>...Dime,�no podriamos llegar a alg�n acuerdo? (Empiezas a toquetear sutilmente una bolsa con monedas de oro) .~ */ GOTO Problemas
  IF ~~ THEN REPLY @8 /* ~Mi nombre no es de tu incumbencia. �Sal de mis dominios!.~ */ GOTO Problemas
END

IF ~~ THEN BEGIN Problemas
  SAY @9 /* ~Jijiji...�Qu� gracioso eres!. ��Los Infernales somos profesionales y siempre cumplimos!!... Es m�s, a los Infernales no nos importa excedernos en el cumplimiento de lo pactado. Nos gusta que el cliente quede satisfecho, as� que...jijiji, �HE DECIDIDO QUE OS VAMOS A MATAR A "TODITOS"!...�qu� te parece?. �Jijiji!.~ */ 
  IF ~~ THEN REPLY @10 /* ~�"Os vamos"?... �Ja!, he notado que siempre hablas en plural y que siempre haces menci�n de los "Infernales", pero por si no te has dado cuenta solo eres uno. Admitelo, vas de farol, �verdad?.~ */ GOTO Presentacion  
  IF ~~ THEN REPLY @11 /* ~�Tu lo has querido!... ��EN GUARDIA!!~ */ DO ~ActionOverride("Zaki",Enemy()) SetGlobal("InfernalesSummoned","GLOBAL",1)~ EXIT 
END

IF ~~ THEN BEGIN Presentacion
  SAY @12 /* ~Jijiji, �permite que te presente al resto de la banda!.~ */
  IF ~~ THEN REPLY @13 /* ~Upss.~ */ DO ~ActionOverride("Zaki",Enemy()) SetGlobal("InfernalesSummoned","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @14 /* ~�"Resto de la banda"?~ */ DO ~ActionOverride("Zaki",Enemy()) SetGlobal("InfernalesSummoned","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @15 /* ~�Ummf, yo y mi vocaza!.~ */ DO ~ActionOverride("Zaki",Enemy()) SetGlobal("InfernalesSummoned","GLOBAL",1)~ EXIT
END

//************************************************************
//************************************************************

