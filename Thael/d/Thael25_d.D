BEGIN ~Thael25~


IF ~Global("ThaelSummoned","GLOBAL",1)~ THEN BEGIN InvocarThael1 
  SAY @0 /* ~��ARRGGGggggg!!...��QU�?!...�Por los Nueve Infiernos!,��<CHARNAME>?!~ */
  IF ~~ THEN GOTO InvocarThael2
END

IF ~~ THEN BEGIN InvocarThael2 
  SAY @1 /* ~�Has...has sido de lo m�s oportuno, un poco m�s y no lo cuento!... �Me has sacado de un buen apuro!. �Unos esbirros de Sendai me hab�an tendido una emboscada y la cosa no pintaba nada bien!...�ufff!...~ 
            ~�Has...has sido de lo m�s oportuna, un poco m�s y no lo cuento!... �Me has sacado de un buen apuro!. �Unos esbirros de Sendai me hab�an tendido una emboscada y la cosa no pintaba nada bien!...�ufff!...~*/
      
  IF ~~ THEN GOTO InvocarThael3
END

IF ~~ THEN BEGIN InvocarThael3 
  SAY @2 /* ~ Por lo que veo te has vuelto muy poderoso. Esa magia de teletransporte que has usado conmigo... Nunca hab�a visto nada igual...~ 
            ~ Por lo que veo te has vuelto muy poderosa. Esa magia de teletransporte que has usado conmigo... Nunca hab�a visto nada igual...~*/     
  IF ~~ THEN GOTO InvocarThael4
END

IF ~~ THEN BEGIN InvocarThael4 
  SAY @3 /* ~Bueno, sin lugar a dudas te debo una. Necesites lo que necesites, Velvevlos y yo estamos a tu entera disposici�n.~ */
IF ~~ THEN REPLY @4 /* ~Lo cierto es que no ten�a ni idea, pero me alegra haber sido de ayuda Thael. Por cierto, �dec�as que tus asaltadores eran hombres de Sendai?. Esa Sendai era la drow que arras� tu pueblo y asesino a tu familia, �verdad?.~ */ DO ~SetGlobal("ThaelSummoned","GLOBAL",2)~ GOTO EnEquipo
IF ~~ THEN REPLY @5 /* ~Me agrada saber que puedo contar contigo. Tus habilidades me podr�an ser �tiles proximamente. Por cierto, �dec�as que tus asaltadores eran hombres de Sendai?. Esa Sendai era la drow que arras� tu pueblo y asesino a tu familia, �verdad?.~ */ DO ~SetGlobal("ThaelSummoned","GLOBAL",2)~ GOTO EnEquipo
END


IF ~~ THEN BEGIN EnEquipo 
  SAY @6 /* ~...(Suspiro)...S�, as� es, como ya te dije una vez, no descansar� hasta haber vengado a mi familia y a todo el pueblo de Lorenthelian....�uhhg!...�Maldita sea...creo que aquellos asesinos me han dado m�s fuerte de lo que pensaba!...~ */
  IF ~~ THEN REPLY @7 /* ~�S�, ya veo que estas herido Thael!. No te preocupes, entra en el grupo y descansa, pronto nos pondremos en camino. Qui�n sabe, lo mismo tenemos la oportunidad de ajustarle las cuentas a Sendai.~ */ GOTO Dentro
  IF ~~ THEN REPLY @8 /* ~Tranquilo Thael, descansa aqu� cuanto necesites, puede que pronto reclame tus servicios.~ */ GOTO Fuera
END


IF ~~ THEN BEGIN Dentro 
  SAY @9 /* ~�Has oido eso Velvevlos?, �volvemos a viajar junto a <CHARNAME>!.~ */ 
  IF ~~ THEN REPLY @10 /* ~Bien, v�monos. Ser� bueno ver de nuevo a tu espada Velvevlos en acci�n.~ */ DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @11 /* ~Aunque pensandolo mejor, es mejor que esperes aqu� y descanses. No te preocupes, pronto vendr� a por ti.~ */ GOTO Fuera
END


IF ~~ THEN BEGIN Fuera 
  SAY @12 /* ~Muy bien, como quieras, la verdad es que me vendr� bien descansar, me han dado una buena paliza.~ */ 
  IF ~~ THEN DO ~SetGlobal("ThaelFuera","GLOBAL",1) MoveToPointNoInterrupt([2555.1426]) Face(0)~ EXIT
END


IF ~Global("ThaelFuera","GLOBAL",1)~ THEN DentroBis                //Nunca ha estado dentro
  SAY @13 /* ~�Nos vamos ya?. Velvevlos empieza a impacientarse.~ */ 
  IF ~~ THEN REPLY @14 /* ~S�, v�monos.~ */ DO ~JoinParty() SetGlobal("ThaelFuera","GLOBAL",0)~ EXIT
  IF ~~ THEN REPLY @15 /* ~Todav�a no. Espera aqu� un poco m�s.~ */ EXIT
END


//******************************************************************
//******************************************************************

BEGIN ~Thael25p~

IF ~Global("ThaelKickedOut","GLOBAL",0)~ THEN BEGIN AbandonarGrupo
  SAY @16 /* ~�Est�s seguro?. Tengo la sensaci�n de que pronto me vas a necesitar, no creo que sea buena idea separarnos ahora.~ */ 
  IF ~~ THEN REPLY @17 /* ~Mmm, creo que llevas raz�n, tus intuiciones siempre han sido acertadas. Quedate.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",0) JoinParty()~ EXIT
  IF ~AreaCheck("AR4500")~ THEN REPLY @18 /* ~S� lo que quieres decir Thael, pero es necesario. Espera aqu�.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",1) MoveToPointNoInterrupt([2555.1426]) Face(0)~ GOTO EsperarAqui
  IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ THEN REPLY @19 /* ~Te enviar� de vuelta a la bolsa planar... Espera all�.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",1) CreateVisualEffectObject("SPDIMNDR",Myself) Wait(2) MoveBetweenAreas("AR4500",[2555.1426],0)~ EXIT
  IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ THEN REPLY @20 /* ~En ese caso espera aqu�. Volver� pronto.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",1)~ GOTO EsperarAqui
END

IF ~~ THEN BEGIN EsperarAqui 
  SAY @21 /* ~Como quieras, pero no tardes mucho.~ */ 
  IF ~~ THEN EXIT
END


IF ~Global("ThaelKickedOut","GLOBAL",1)~ THEN BEGIN RegresarGrupo 
  SAY @22 /* ~Velvevlos empieza a tener sed, �nos ponemos en marcha?.~ */
  IF ~~ THEN REPLY @23 /* ~S�, vamos.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",0) JoinParty()~ EXIT
  IF ~~ THEN REPLY @24 /* ~Todav�a no. Esp�rame aqu� un poco m�s.~ */ GOTO Paciencia
END


IF ~~ THEN BEGIN Paciencia 
  SAY @25 /* ~Como quieras, pero cada vez me cuesta m�s controlar a Velvevlos. Por favor vuelve pronto.~ */ 
  IF ~~ THEN EXIT
END


//****************************************************************
//****************************************************************

BEGIN ~Thael25j~


//***************************************************************
//******** LOS INFERNALES ***************************************
//***************************************************************

IF ~AreaCheck("AR4500") Global("ZakiSpawnPlane","GLOBAL",0)~ THEN BEGIN ThaelIntuicion 
  SAY @26 /* ~�Eh?...�Lo hab�is notado?...�Hab�is notado esa onda de energ�a?... Es..es como si una fuerza exterior nos hubiera localizado y se abriera paso hasta nosotros...~ */ 
  IF ~~ THEN REPLY @27 /* ~�Una fuerza exterior?...�Por d�nde?~ */ GOTO ThaelAvisoInvasion
END

IF ~~ THEN BEGIN ThaelAvisoInvasion
  SAY @28 /* ~�Espera, intento concentrarme para localizarla!...~ */       
      =
      @29 /* ~�S�, Velvevlos la ha encontrado!...�En la entrada a la Bolsa Planar!...�Por ah� se acerca algo!...�ATENTOS!.~ */
  IF ~~ THEN DO ~SetGlobal("ZakiSpawnPlane","GLOBAL",1)~ EXIT
END

//****************************************************************
// Level Up Velvevlos
//****************************************************************

IF ~AreaCheck("AR5003") Global("LevelUpVelve","GLOBAL",1)~ THEN BEGIN SuperVelve 
  SAY @30 /* ~�UuuOoh!...�Me embriaga tanto poder!... <CHARNAME>, �Velvevlos se ha vuelto muchisimo m�s poderosa!.�Es..es increible!~ */ 
  IF ~~ THEN REPLY @31 /* ~Sabes que confio en ti Thael, pero si llegara a notar que Velvevlos controla tus actos, me ver�a obligado a tomar cartas en el asunto. No permitir� que ese vil artefacto corrompa tu alma.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",2)~ GOTO VelveAviso
  IF ~~ THEN REPLY @32 /* ~Desde aqu� noto su terror�fico poder...Te prevengo Thael, no permitir� que la maldad que emana de Velvevlos rompa el equilibrio del grupo. Espero que seas capaz de controlar tal poder.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",2)~ GOTO VelveAviso
  IF ~~ THEN REPLY @33 /* ~�Estupendo!, desde aqu� noto su energ�a...Ser� interesante ver de lo que es capaz ahora.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",2)~ EXIT    
END

IF ~Global("LevelUpVelve","GLOBAL",2)~ THEN BEGIN VelveAviso 
  SAY @34 /* ~Por supuesto <CHARNAME>, por supuesto...(�Velvevlos, es sin duda la espada m�s poderosa de todo Faerun!. Y yo...�yo soy su afortunado portador!).~ */ 
  IF ~~ THEN REPLY @35 /* ~Muy bien y ahora, sigamos adelante.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",3)~ EXIT
END

//******************************************************************


IF ~AreaCheck("AR5200") Global("ActividadVolcanica","GLOBAL",0)~ THEN BEGIN ThaelCorazonYagaShura 
  SAY @36 /* ~Al fin llegamos...No se a vosotros, pero la actividad volc�nica de la zona me pone nervioso.~ */
  IF ~~ THEN DO ~SetGlobal("ActividadVolcanica","GLOBAL",1)~ EXIT
END


IF ~AreaCheck("AR6100") Global("ThaelAfuerasSendai","GLOBAL",0)~ THEN BEGIN AfuerasSendai 
  SAY @37 /* ~<CHARNAME>, a partir de ahora deber�amos ir con cuidado, Velvevlos no deja de advertirme de que hay drows al acecho. Puede que los esbirros de Sendai est�n cerca de aqu�... S�, sin duda ya estamos cerca de su escondrijo... �Pronto cumplir� mi Venganza!.~ */ 
  IF ~~ THEN DO ~SetGlobal("ThaelAfuerasSendai","GLOBAL",1)~ EXIT
END



//******************************************************************************************************************
//Por alguna extra�a raz�n el Thael se queda bloqueado tras el dialogo, salvo que duplique la asignaci�n de variable
//******************************************************************************************************************


IF ~AreaCheck("AR6101") Global("EscondrijoSendai","GLOBAL",0)~ THEN BEGIN EntrandaSendai 
  SAY @38 /* ~�Al fin, la entrada a la madriguera de esa zorra!...Es seguro que antes de cruzarnos con Sendai, echar� sobre nosotros todo lo que tenga...���PUES ESCUCHAME BIEN PUTA, HOY NO TE SALVAR� NI LA MISMISIMA LOLTH!!!.~ */ 
  IF ~~ THEN REPLY @39 /* ~Bueno, ten�a en mente entrar en silencio para pillarlos por sorpresa pero...�Qu� demonios!, supongo que tampoco est� de m�s que estos drows pasen un poco de miedo ante nuestro imparable avance, �verdad?.~ */ DO ~SetGlobal("EscondrijoSendai","GLOBAL",1) SetGlobal("EscondrijoSendai","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @40 /* ~Tranquilo Thael, s� que esperabas este momento desde hace mucho, pero debemos mantener la sangre fr�a, bien sabes lo peligrosos que pueden llegar a ser estos drows.~ */ DO ~SetGlobal("EscondrijoSendai","GLOBAL",1) SetGlobal("EscondrijoSendai","GLOBAL",1)~ EXIT
END


//*************Muerte de Sendai************************************

IF ~AreaCheck("AR6108") Global("ThaelMuerteSendai","GLOBAL",0)~ THEN BEGIN ThaelSendaiMuerta
  SAY @41 /* ~Por fin...por fin se termin�, Sendai est� muerta (suspiro)...�NETHESSA, LURIVIEL, PUEBLO DE LORENTHELIAN!...��VUESTRA ASESINA HA MUERTO!!...�POD�IS DESCANSAR EN PAZ!...(sollozo)...~ */
  IF ~~ THEN REPLY @42 /* ~As� es Thael, la vil asesina yace inerte y con ello las miles de almas que en vida quit�, por fin descansan en paz... Dime, �te encuentras bien?~ */ GOTO ThaelReflexion
  IF ~~ THEN REPLY @43 /* ~�S� Thael!, por fin has alcanzado la Venganza que tanto ansiabas... �Estar�s contento, verdad?~ */ GOTO ThaelReflexion
  IF ~~ THEN REPLY @44 /* ~Jojojojo... �S�!, ah� la tienes Thael, bien muerta y desangrada, jajaja. �Venga, vayamos a por otro de mis hermanos!... Ya quedan pocos, puedo presentir como mi Destino est� cada vez m�s cerca.~ */ DO ~SetGlobal("ThaelMuerteSendai","GLOBAL",1) AddexperienceParty(20000)~ JOURNAL @45 /* ~Thael por fin ha llevado a cabo su ansiada Venganza. Su mujer, su hija, sus amigos, en definitiva, todos aquellos que fueron asesinados por Sendai, ya pueden descansar en paz.                                .~ */ EXIT
END

IF ~~ THEN BEGIN ThaelReflexion
  SAY @46 /* ~(Suspiro)...Bueno, durante mucho tiempo, mi �nica obsesi�n fue la de llegar a esto, pero ahora... Sabes, pens� que me sentir�a mejor con la muerte de Sendai, que todo el dolor que llevo dentro desaparecer�a, pero... no es as�...~ */
      =
      @47 /* ~...Mi esposa Nethessa y mi hijita Luriviel lo eran todo para mi, eran mi vida...pero ellas ya no pueden regresar, est�n m�s all� de cualquier hechizo, salmo o deseo que se pueda formular... Yo...yo, debo pensar que voy a hacer a partir de ahora...~ */       
      =
      @48 /* ~Pero, por lo pronto, continuar� contigo... No te preocupes <CHARNAME>, mientras me necesites estar� a tu lado.~ */
  IF ~~ THEN REPLY @49 /* ~Gracias Thael~ */ DO ~SetGlobal("ThaelMuerteSendai","GLOBAL",1) AddexperienceParty(20000)~ JOURNAL @45 /* ~Thael por fin ha llevado a cabo su ansiada Venganza. Su mujer, su hija, sus amigos, en definitiva, todos aquellos que fueron asesinados por Sendai, ya pueden descansar en paz.                                .~ */ EXIT
END



//*******************************************************************

I_C_T BALTH 6 ThaelMapaSendai
== THAEL25J IF ~InParty("Thael")~ THEN @50 /* ~�Por los Nueve Infiernos!. En uno de los mapas se hace menci�n a una tal Sendai. �No se tratar� de una drow?.~ */
== BALTH IF ~InParty("Thael")~ THEN @51 /* ~As� es. Por lo que tengo entendido es una mujer drow procedente de la oscura Ust Natha. Al parecer se instal� hace poco en ese enclave junto con todo su ejercito de mercenarios de �lite, esclavos y bestias de la Infraoscuridad.~ */
== THAEL25J IF ~InParty("Thael")~ THEN @52 /* ~��S�!!. �Por fin la encontr�!. Pronto har� que esa zorra pague con creces todo el da�o que hizo en el pasado...~ */
== BALTH IF ~InParty("Thael")~ THEN @53 /* ~En fin, ahora debo volver a mis asuntos. Como dec�a, creo que esos mapas os podr�n ser de utilidad.~ */
END

I_C_T SENPRI 3 ThaelvsDiayzha
== THAEL25J IF ~InParty("Thael")~ THEN @54 /* ~�Maldita drow!, �d�nde se esconde Sendai?, �RESPONDE!.~ */
== SENPRI IF ~InParty("Thael")~ THEN @55 /* ~�Crees que se est� escondiendo?. �JA,JA,JA!. �Estupido, no tienes ni idea del poder de Sendai!.~ */
END



I_C_T SENDAI 14 ThaelvsSendai
== THAEL25J IF ~InParty("Thael")~ THEN @56 /* ~�SENDAI!.�Dejate de palabras!.�Hoy, las almas de todas las vidas inocentes que has sesgado por fin alcanzar�n el descanso eterno!...�Mi amada esposa Nethessa, mi dulce hija Luriviel, todos los habitantes de Lorenthelian...��TODOS!!... ��Todos claman venganza zorra!!. �Hoy Velvevlos se clavar� en tu negro coraz�n!.��LO JURO!!.~ */
== SENDAI IF ~InParty("Thael")~ THEN @57 /* ~�Thael?, �jajajaja!. El cobarde que huy� de aquel poblucho al sur del Bosque Alto mientras masacraba a todos los dem�s, �jajaja!. �Necio, no ten�is ninguna posibilidad contra mi!.~ */ 
                                     =
                                     @58 /* ~Sabes una cosa darthiir, cuando destruimos Lorenthelian, yo misma tuve la suerte de acabar con tu familia... �Recuerdo perfectamente como antes de arrancarle los ojos a tu mujer, le dej� ver como le cortaba la cabeza a vuestra hijita peque�a, jajajaja!. �Ten�as que haber visto como gritaba la putilla, JAJAJAJAJA!.~ */
== THAEL25J IF ~InParty("Thael")~ THEN @59 /* ~�NO PERMITIR� QUE SIGAS RESPIRANDO NI UN SEGUNDO M�S!...���MUEREEEEEEE!!!~ */ 
END

I_C_T BAZDRA01 0 ThaelAvisoDraconis
== THAEL25J IF ~InParty("Thael")~ THEN @60 /* ~Atento <CHARNAME>, ese hombre no es lo que aparenta, Velvevlos detecta en �l un terrible poder. Sea lo que sea, no es humano.~ */
END


I_C_T SOLAR 67 ThaelDecision
== THAEL25J IF ~InParty("Thael")~ THEN @61 /* ~Bueno camarada, tu camino parece que est� a punto de llegar a su final...El mio tambi�n lo est�...Tras la muerte de Sendai estuve pensando que hacer con mi vida, pero la verdad es que ya no me quedan ganas de vivir, sin mi familia a mi lado, este mundo ya no tiene nada que ofrecerme...~ */ 
               =
               @62 /* ~No me mires as� <CHARNAME>, es justamente lo que est�s pensando...Se trata de una decisi�n m�s que meditada, as� que lo �nico que te pido es que la aceptes sin m�s amigo mio.~ */
               =
               @63 /* ~Por lo pronto te ayudar� en tu enfrentamiento final contra Melis�n. Despu�s de que la derrotemos nos despediremos...para siempre...~ */
END

I_C_T FINSOL01 27 ThaelAscendChoice
== THAEL25J IF ~InParty("Thael")~ THEN @64 /* ~Acepta el regalo que se te ofrece <CHARNAME>. Yo sin dudar acceder�a a convertirme en un dios. �Piensalo!, podr�as hacerlo todo: podr�as desintegrar a tus antiguos enemigos con tan solo un gesto...o quiz�s...o quiz�s tambi�n podr�as volver a ver a todos tus seres queridos a los que la muerte se llev� repentinamente...~ */
END



//********************************************************************


EXTEND_TOP SARVOLO 9 #7
IF ~InParty("Thael")~ THEN REPLY @65 /* ~Hablame de Thael.~ */ GOTO VoloThael
END

CHAIN SARVOLO VoloThael
@66 /* ~Thael, el portador de la milenaria Velvevlos, una de las espadas m�s mortiferas de todo Faerun. Este elfo de dorada piel y ojos esmeralda solo busca una cosa en la vida: Venganza.~ */ 
=
@67 /* ~Venganza por la muerte de sus seres queridos a manos de la sanguinaria drow Sendai... Es ya mucho el tiempo que lleva persiguiendo a esa maligna drow, pero para cualquiera que conozca a este tenaz elfo, sabe que al final encontrar� a Sendai y que le har� pagar las muertes de su amada esposa y su querida hija.~ */
=
@68 /* ~La pregunta que nos hacemos todos es: �Qu� har� este valiente elfo una vez que alcance su objetivo?.~ */
== THAEL25J IF ~IsValidForPartyDialog("Thael")~ THEN @69 /* ~Yo...la verdad es que nunca me he planteado que har� si alguna vez alcanzo mi meta...No se que har� cuando desaparezca el �nico motivo por el que quiero seguir vivo... Yo... Yo tengo estar un momento a solas, debo pensar en esto.~ */
EXTERN SARVOLO 9


//*******************************************************************
//*******************************************************************

BEGIN ~BThael25~

CHAIN
IF ~InParty("Sarevok") See("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING) Global("BThaelSarevok","LOCALS",0)~ THEN BTHAEL25 TCHAIN110
@70 /* ~Sarevok me he fijado que de vez en cuando te quedas mirando a Velvevlos, �es por alguna raz�n en especial?.~ */ DO ~SetGlobal("BThaelSarevok","LOCALS",1)~
== BSAREV25 @71 /* ~As� es... En el pasado encomend� a varios de mis mejores hombres la misi�n de recuperar ese artefacto que esgrimes...~ */
            =
            @72 /* ~Ver�s, hubo un tiempo en el que pretend�a reclamar para mi mismo toda la Esencia de Baal y adem�s dominar todo Faerun... Durante esa etapa de mi vida, llegaron a mis oidos multiples leyendas sobre artefactos de inmenso poder, muy utilies para todo aquel que tuviera en mente unos objetivos como los mios...~ */
            = 
            @73 /* ~No me mires as�, hace tiempo que no persigo tales objetivos y en cuanto a mi interes por adue�arme de Velvevlos, puedes estar tranquilo... En la biblioteca de Candelero tuve la oportunidad de leer bastante sobre la Hoja Sangrienta y, creeme, ahora que he vuelto al mundo de los vivos, lo �ltimo que har�a es condenarme empu�ando dicho artefacto.~ */
== BTHAEL25 @74 /* ~Me alegra oir eso..Si intentaras arrebatarmela, ten por seguro que no dudar�a en degollarte con su hoja.~ */
== BSAREV25 @75 /* ~Como te he dicho, no tengo ning�n inter�s en ella.~ */
            =
            @76 /* ~Ah, y otra cosa elfo... �Vuelve a amenazarme y lo lamentar�s!.~ */ 
EXIT


//****************************************************************

CHAIN 
IF ~Dead("Viconia") Global("IllaseraSpawn","GLOBAL",1) Global("ViconiaDieTOB","LOCALS",0)~ THEN BTHAEL HCHAIN203
@77 /* ~�Viconia!...Maldita sea, nunca pens� que llegar�a el d�a en que lamentar�a la muerte de un drow...Era muy buena sanadora.~ */ DO ~SetGlobal("ViconiaDieTOB","LOCALS",1)~ 
EXIT

//*****************************************************************

