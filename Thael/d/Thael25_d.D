BEGIN ~Thael25~


IF ~Global("ThaelSummoned","GLOBAL",1)~ THEN BEGIN InvocarThael1 
  SAY @0 /* ~¡¡ARRGGGggggg!!...¡¿QUÉ?!...¡Por los Nueve Infiernos!,¡¿<CHARNAME>?!~ */
  IF ~~ THEN GOTO InvocarThael2
END

IF ~~ THEN BEGIN InvocarThael2 
  SAY @1 /* ~¡Has...has sido de lo más oportuno, un poco más y no lo cuento!... ¡Me has sacado de un buen apuro!. ¡Unos esbirros de Sendai me habían tendido una emboscada y la cosa no pintaba nada bien!...¡ufff!...~ 
            ~¡Has...has sido de lo más oportuna, un poco más y no lo cuento!... ¡Me has sacado de un buen apuro!. ¡Unos esbirros de Sendai me habían tendido una emboscada y la cosa no pintaba nada bien!...¡ufff!...~*/
      
  IF ~~ THEN GOTO InvocarThael3
END

IF ~~ THEN BEGIN InvocarThael3 
  SAY @2 /* ~ Por lo que veo te has vuelto muy poderoso. Esa magia de teletransporte que has usado conmigo... Nunca había visto nada igual...~ 
            ~ Por lo que veo te has vuelto muy poderosa. Esa magia de teletransporte que has usado conmigo... Nunca había visto nada igual...~*/     
  IF ~~ THEN GOTO InvocarThael4
END

IF ~~ THEN BEGIN InvocarThael4 
  SAY @3 /* ~Bueno, sin lugar a dudas te debo una. Necesites lo que necesites, Velvevlos y yo estamos a tu entera disposición.~ */
IF ~~ THEN REPLY @4 /* ~Lo cierto es que no tenía ni idea, pero me alegra haber sido de ayuda Thael. Por cierto, ¿decías que tus asaltadores eran hombres de Sendai?. Esa Sendai era la drow que arrasó tu pueblo y asesino a tu familia, ¿verdad?.~ */ DO ~SetGlobal("ThaelSummoned","GLOBAL",2)~ GOTO EnEquipo
IF ~~ THEN REPLY @5 /* ~Me agrada saber que puedo contar contigo. Tus habilidades me podrían ser útiles proximamente. Por cierto, ¿decías que tus asaltadores eran hombres de Sendai?. Esa Sendai era la drow que arrasó tu pueblo y asesino a tu familia, ¿verdad?.~ */ DO ~SetGlobal("ThaelSummoned","GLOBAL",2)~ GOTO EnEquipo
END


IF ~~ THEN BEGIN EnEquipo 
  SAY @6 /* ~...(Suspiro)...Sí, así es, como ya te dije una vez, no descansaré hasta haber vengado a mi familia y a todo el pueblo de Lorenthelian....¡uhhg!...¡Maldita sea...creo que aquellos asesinos me han dado más fuerte de lo que pensaba!...~ */
  IF ~~ THEN REPLY @7 /* ~¡Sí, ya veo que estas herido Thael!. No te preocupes, entra en el grupo y descansa, pronto nos pondremos en camino. Quién sabe, lo mismo tenemos la oportunidad de ajustarle las cuentas a Sendai.~ */ GOTO Dentro
  IF ~~ THEN REPLY @8 /* ~Tranquilo Thael, descansa aquí cuanto necesites, puede que pronto reclame tus servicios.~ */ GOTO Fuera
END


IF ~~ THEN BEGIN Dentro 
  SAY @9 /* ~¿Has oido eso Velvevlos?, ¡volvemos a viajar junto a <CHARNAME>!.~ */ 
  IF ~~ THEN REPLY @10 /* ~Bien, vámonos. Será bueno ver de nuevo a tu espada Velvevlos en acción.~ */ DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @11 /* ~Aunque pensandolo mejor, es mejor que esperes aquí y descanses. No te preocupes, pronto vendré a por ti.~ */ GOTO Fuera
END


IF ~~ THEN BEGIN Fuera 
  SAY @12 /* ~Muy bien, como quieras, la verdad es que me vendrá bien descansar, me han dado una buena paliza.~ */ 
  IF ~~ THEN DO ~SetGlobal("ThaelFuera","GLOBAL",1) MoveToPointNoInterrupt([2555.1426]) Face(0)~ EXIT
END


IF ~Global("ThaelFuera","GLOBAL",1)~ THEN DentroBis                //Nunca ha estado dentro
  SAY @13 /* ~¿Nos vamos ya?. Velvevlos empieza a impacientarse.~ */ 
  IF ~~ THEN REPLY @14 /* ~Sí, vámonos.~ */ DO ~JoinParty() SetGlobal("ThaelFuera","GLOBAL",0)~ EXIT
  IF ~~ THEN REPLY @15 /* ~Todavía no. Espera aquí un poco más.~ */ EXIT
END


//******************************************************************
//******************************************************************

BEGIN ~Thael25p~

IF ~Global("ThaelKickedOut","GLOBAL",0)~ THEN BEGIN AbandonarGrupo
  SAY @16 /* ~¿Estás seguro?. Tengo la sensación de que pronto me vas a necesitar, no creo que sea buena idea separarnos ahora.~ */ 
  IF ~~ THEN REPLY @17 /* ~Mmm, creo que llevas razón, tus intuiciones siempre han sido acertadas. Quedate.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",0) JoinParty()~ EXIT
  IF ~AreaCheck("AR4500")~ THEN REPLY @18 /* ~Sé lo que quieres decir Thael, pero es necesario. Espera aquí.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",1) MoveToPointNoInterrupt([2555.1426]) Face(0)~ GOTO EsperarAqui
  IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ THEN REPLY @19 /* ~Te enviaré de vuelta a la bolsa planar... Espera allí.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",1) CreateVisualEffectObject("SPDIMNDR",Myself) Wait(2) MoveBetweenAreas("AR4500",[2555.1426],0)~ EXIT
  IF ~!AreaCheck("AR4500") !AreaCheck("AR4000") !AreaCheck("AR6200")~ THEN REPLY @20 /* ~En ese caso espera aquí. Volveré pronto.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",1)~ GOTO EsperarAqui
END

IF ~~ THEN BEGIN EsperarAqui 
  SAY @21 /* ~Como quieras, pero no tardes mucho.~ */ 
  IF ~~ THEN EXIT
END


IF ~Global("ThaelKickedOut","GLOBAL",1)~ THEN BEGIN RegresarGrupo 
  SAY @22 /* ~Velvevlos empieza a tener sed, ¿nos ponemos en marcha?.~ */
  IF ~~ THEN REPLY @23 /* ~Sí, vamos.~ */ DO ~SetGlobal("ThaelKickedOut","GLOBAL",0) JoinParty()~ EXIT
  IF ~~ THEN REPLY @24 /* ~Todavía no. Espérame aquí un poco más.~ */ GOTO Paciencia
END


IF ~~ THEN BEGIN Paciencia 
  SAY @25 /* ~Como quieras, pero cada vez me cuesta más controlar a Velvevlos. Por favor vuelve pronto.~ */ 
  IF ~~ THEN EXIT
END


//****************************************************************
//****************************************************************

BEGIN ~Thael25j~


//***************************************************************
//******** LOS INFERNALES ***************************************
//***************************************************************

IF ~AreaCheck("AR4500") Global("ZakiSpawnPlane","GLOBAL",0)~ THEN BEGIN ThaelIntuicion 
  SAY @26 /* ~¿Eh?...¿Lo habéis notado?...¿Habéis notado esa onda de energía?... Es..es como si una fuerza exterior nos hubiera localizado y se abriera paso hasta nosotros...~ */ 
  IF ~~ THEN REPLY @27 /* ~¿Una fuerza exterior?...¿Por dónde?~ */ GOTO ThaelAvisoInvasion
END

IF ~~ THEN BEGIN ThaelAvisoInvasion
  SAY @28 /* ~¡Espera, intento concentrarme para localizarla!...~ */       
      =
      @29 /* ~¡Sí, Velvevlos la ha encontrado!...¡En la entrada a la Bolsa Planar!...¡Por ahí se acerca algo!...¡ATENTOS!.~ */
  IF ~~ THEN DO ~SetGlobal("ZakiSpawnPlane","GLOBAL",1)~ EXIT
END

//****************************************************************
// Level Up Velvevlos
//****************************************************************

IF ~AreaCheck("AR5003") Global("LevelUpVelve","GLOBAL",1)~ THEN BEGIN SuperVelve 
  SAY @30 /* ~¡UuuOoh!...¡Me embriaga tanto poder!... <CHARNAME>, ¡Velvevlos se ha vuelto muchisimo más poderosa!.¡Es..es increible!~ */ 
  IF ~~ THEN REPLY @31 /* ~Sabes que confio en ti Thael, pero si llegara a notar que Velvevlos controla tus actos, me vería obligado a tomar cartas en el asunto. No permitiré que ese vil artefacto corrompa tu alma.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",2)~ GOTO VelveAviso
  IF ~~ THEN REPLY @32 /* ~Desde aquí noto su terrorífico poder...Te prevengo Thael, no permitiré que la maldad que emana de Velvevlos rompa el equilibrio del grupo. Espero que seas capaz de controlar tal poder.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",2)~ GOTO VelveAviso
  IF ~~ THEN REPLY @33 /* ~¡Estupendo!, desde aquí noto su energía...Será interesante ver de lo que es capaz ahora.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",2)~ EXIT    
END

IF ~Global("LevelUpVelve","GLOBAL",2)~ THEN BEGIN VelveAviso 
  SAY @34 /* ~Por supuesto <CHARNAME>, por supuesto...(¡Velvevlos, es sin duda la espada más poderosa de todo Faerun!. Y yo...¡yo soy su afortunado portador!).~ */ 
  IF ~~ THEN REPLY @35 /* ~Muy bien y ahora, sigamos adelante.~ */ DO ~SetGlobal("LevelUpVelve","GLOBAL",3)~ EXIT
END

//******************************************************************


IF ~AreaCheck("AR5200") Global("ActividadVolcanica","GLOBAL",0)~ THEN BEGIN ThaelCorazonYagaShura 
  SAY @36 /* ~Al fin llegamos...No se a vosotros, pero la actividad volcánica de la zona me pone nervioso.~ */
  IF ~~ THEN DO ~SetGlobal("ActividadVolcanica","GLOBAL",1)~ EXIT
END


IF ~AreaCheck("AR6100") Global("ThaelAfuerasSendai","GLOBAL",0)~ THEN BEGIN AfuerasSendai 
  SAY @37 /* ~<CHARNAME>, a partir de ahora deberíamos ir con cuidado, Velvevlos no deja de advertirme de que hay drows al acecho. Puede que los esbirros de Sendai estén cerca de aquí... Sí, sin duda ya estamos cerca de su escondrijo... ¡Pronto cumpliré mi Venganza!.~ */ 
  IF ~~ THEN DO ~SetGlobal("ThaelAfuerasSendai","GLOBAL",1)~ EXIT
END



//******************************************************************************************************************
//Por alguna extraña razón el Thael se queda bloqueado tras el dialogo, salvo que duplique la asignación de variable
//******************************************************************************************************************


IF ~AreaCheck("AR6101") Global("EscondrijoSendai","GLOBAL",0)~ THEN BEGIN EntrandaSendai 
  SAY @38 /* ~¡Al fin, la entrada a la madriguera de esa zorra!...Es seguro que antes de cruzarnos con Sendai, echará sobre nosotros todo lo que tenga...¡¡¡PUES ESCUCHAME BIEN PUTA, HOY NO TE SALVARÁ NI LA MISMISIMA LOLTH!!!.~ */ 
  IF ~~ THEN REPLY @39 /* ~Bueno, tenía en mente entrar en silencio para pillarlos por sorpresa pero...¡Qué demonios!, supongo que tampoco está de más que estos drows pasen un poco de miedo ante nuestro imparable avance, ¿verdad?.~ */ DO ~SetGlobal("EscondrijoSendai","GLOBAL",1) SetGlobal("EscondrijoSendai","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @40 /* ~Tranquilo Thael, sé que esperabas este momento desde hace mucho, pero debemos mantener la sangre fría, bien sabes lo peligrosos que pueden llegar a ser estos drows.~ */ DO ~SetGlobal("EscondrijoSendai","GLOBAL",1) SetGlobal("EscondrijoSendai","GLOBAL",1)~ EXIT
END


//*************Muerte de Sendai************************************

IF ~AreaCheck("AR6108") Global("ThaelMuerteSendai","GLOBAL",0)~ THEN BEGIN ThaelSendaiMuerta
  SAY @41 /* ~Por fin...por fin se terminó, Sendai está muerta (suspiro)...¡NETHESSA, LURIVIEL, PUEBLO DE LORENTHELIAN!...¡¡VUESTRA ASESINA HA MUERTO!!...¡PODÉIS DESCANSAR EN PAZ!...(sollozo)...~ */
  IF ~~ THEN REPLY @42 /* ~Así es Thael, la vil asesina yace inerte y con ello las miles de almas que en vida quitó, por fin descansan en paz... Dime, ¿te encuentras bien?~ */ GOTO ThaelReflexion
  IF ~~ THEN REPLY @43 /* ~¡Sí Thael!, por fin has alcanzado la Venganza que tanto ansiabas... ¿Estarás contento, verdad?~ */ GOTO ThaelReflexion
  IF ~~ THEN REPLY @44 /* ~Jojojojo... ¡Sí!, ahí la tienes Thael, bien muerta y desangrada, jajaja. ¡Venga, vayamos a por otro de mis hermanos!... Ya quedan pocos, puedo presentir como mi Destino está cada vez más cerca.~ */ DO ~SetGlobal("ThaelMuerteSendai","GLOBAL",1) AddexperienceParty(20000)~ JOURNAL @45 /* ~Thael por fin ha llevado a cabo su ansiada Venganza. Su mujer, su hija, sus amigos, en definitiva, todos aquellos que fueron asesinados por Sendai, ya pueden descansar en paz.                                .~ */ EXIT
END

IF ~~ THEN BEGIN ThaelReflexion
  SAY @46 /* ~(Suspiro)...Bueno, durante mucho tiempo, mi única obsesión fue la de llegar a esto, pero ahora... Sabes, pensé que me sentiría mejor con la muerte de Sendai, que todo el dolor que llevo dentro desaparecería, pero... no es así...~ */
      =
      @47 /* ~...Mi esposa Nethessa y mi hijita Luriviel lo eran todo para mi, eran mi vida...pero ellas ya no pueden regresar, están más allá de cualquier hechizo, salmo o deseo que se pueda formular... Yo...yo, debo pensar que voy a hacer a partir de ahora...~ */       
      =
      @48 /* ~Pero, por lo pronto, continuaré contigo... No te preocupes <CHARNAME>, mientras me necesites estaré a tu lado.~ */
  IF ~~ THEN REPLY @49 /* ~Gracias Thael~ */ DO ~SetGlobal("ThaelMuerteSendai","GLOBAL",1) AddexperienceParty(20000)~ JOURNAL @45 /* ~Thael por fin ha llevado a cabo su ansiada Venganza. Su mujer, su hija, sus amigos, en definitiva, todos aquellos que fueron asesinados por Sendai, ya pueden descansar en paz.                                .~ */ EXIT
END



//*******************************************************************

I_C_T BALTH 6 ThaelMapaSendai
== THAEL25J IF ~InParty("Thael")~ THEN @50 /* ~¡Por los Nueve Infiernos!. En uno de los mapas se hace mención a una tal Sendai. ¿No se tratará de una drow?.~ */
== BALTH IF ~InParty("Thael")~ THEN @51 /* ~Así es. Por lo que tengo entendido es una mujer drow procedente de la oscura Ust Natha. Al parecer se instaló hace poco en ese enclave junto con todo su ejercito de mercenarios de élite, esclavos y bestias de la Infraoscuridad.~ */
== THAEL25J IF ~InParty("Thael")~ THEN @52 /* ~¡¡Sí!!. ¡Por fin la encontré!. Pronto haré que esa zorra pague con creces todo el daño que hizo en el pasado...~ */
== BALTH IF ~InParty("Thael")~ THEN @53 /* ~En fin, ahora debo volver a mis asuntos. Como decía, creo que esos mapas os podrán ser de utilidad.~ */
END

I_C_T SENPRI 3 ThaelvsDiayzha
== THAEL25J IF ~InParty("Thael")~ THEN @54 /* ~¡Maldita drow!, ¿dónde se esconde Sendai?, ¡RESPONDE!.~ */
== SENPRI IF ~InParty("Thael")~ THEN @55 /* ~¿Crees que se está escondiendo?. ¡JA,JA,JA!. ¡Estupido, no tienes ni idea del poder de Sendai!.~ */
END



I_C_T SENDAI 14 ThaelvsSendai
== THAEL25J IF ~InParty("Thael")~ THEN @56 /* ~¡SENDAI!.¡Dejate de palabras!.¡Hoy, las almas de todas las vidas inocentes que has sesgado por fin alcanzarán el descanso eterno!...¡Mi amada esposa Nethessa, mi dulce hija Luriviel, todos los habitantes de Lorenthelian...¡¡TODOS!!... ¡¡Todos claman venganza zorra!!. ¡Hoy Velvevlos se clavará en tu negro corazón!.¡¡LO JURO!!.~ */
== SENDAI IF ~InParty("Thael")~ THEN @57 /* ~¿Thael?, ¡jajajaja!. El cobarde que huyó de aquel poblucho al sur del Bosque Alto mientras masacraba a todos los demás, ¡jajaja!. ¡Necio, no tenéis ninguna posibilidad contra mi!.~ */ 
                                     =
                                     @58 /* ~Sabes una cosa darthiir, cuando destruimos Lorenthelian, yo misma tuve la suerte de acabar con tu familia... ¡Recuerdo perfectamente como antes de arrancarle los ojos a tu mujer, le dejé ver como le cortaba la cabeza a vuestra hijita pequeña, jajajaja!. ¡Tenías que haber visto como gritaba la putilla, JAJAJAJAJA!.~ */
== THAEL25J IF ~InParty("Thael")~ THEN @59 /* ~¡NO PERMITIRÉ QUE SIGAS RESPIRANDO NI UN SEGUNDO MÁS!...¡¡¡MUEREEEEEEE!!!~ */ 
END

I_C_T BAZDRA01 0 ThaelAvisoDraconis
== THAEL25J IF ~InParty("Thael")~ THEN @60 /* ~Atento <CHARNAME>, ese hombre no es lo que aparenta, Velvevlos detecta en él un terrible poder. Sea lo que sea, no es humano.~ */
END


I_C_T SOLAR 67 ThaelDecision
== THAEL25J IF ~InParty("Thael")~ THEN @61 /* ~Bueno camarada, tu camino parece que está a punto de llegar a su final...El mio también lo está...Tras la muerte de Sendai estuve pensando que hacer con mi vida, pero la verdad es que ya no me quedan ganas de vivir, sin mi familia a mi lado, este mundo ya no tiene nada que ofrecerme...~ */ 
               =
               @62 /* ~No me mires así <CHARNAME>, es justamente lo que estás pensando...Se trata de una decisión más que meditada, así que lo único que te pido es que la aceptes sin más amigo mio.~ */
               =
               @63 /* ~Por lo pronto te ayudaré en tu enfrentamiento final contra Melisán. Después de que la derrotemos nos despediremos...para siempre...~ */
END

I_C_T FINSOL01 27 ThaelAscendChoice
== THAEL25J IF ~InParty("Thael")~ THEN @64 /* ~Acepta el regalo que se te ofrece <CHARNAME>. Yo sin dudar accedería a convertirme en un dios. ¡Piensalo!, podrías hacerlo todo: podrías desintegrar a tus antiguos enemigos con tan solo un gesto...o quizás...o quizás también podrías volver a ver a todos tus seres queridos a los que la muerte se llevó repentinamente...~ */
END



//********************************************************************


EXTEND_TOP SARVOLO 9 #7
IF ~InParty("Thael")~ THEN REPLY @65 /* ~Hablame de Thael.~ */ GOTO VoloThael
END

CHAIN SARVOLO VoloThael
@66 /* ~Thael, el portador de la milenaria Velvevlos, una de las espadas más mortiferas de todo Faerun. Este elfo de dorada piel y ojos esmeralda solo busca una cosa en la vida: Venganza.~ */ 
=
@67 /* ~Venganza por la muerte de sus seres queridos a manos de la sanguinaria drow Sendai... Es ya mucho el tiempo que lleva persiguiendo a esa maligna drow, pero para cualquiera que conozca a este tenaz elfo, sabe que al final encontrará a Sendai y que le hará pagar las muertes de su amada esposa y su querida hija.~ */
=
@68 /* ~La pregunta que nos hacemos todos es: ¿Qué hará este valiente elfo una vez que alcance su objetivo?.~ */
== THAEL25J IF ~IsValidForPartyDialog("Thael")~ THEN @69 /* ~Yo...la verdad es que nunca me he planteado que haré si alguna vez alcanzo mi meta...No se que haré cuando desaparezca el único motivo por el que quiero seguir vivo... Yo... Yo tengo estar un momento a solas, debo pensar en esto.~ */
EXTERN SARVOLO 9


//*******************************************************************
//*******************************************************************

BEGIN ~BThael25~

CHAIN
IF ~InParty("Sarevok") See("Sarevok") !StateCheck("Sarevok",STATE_SLEEPING) Global("BThaelSarevok","LOCALS",0)~ THEN BTHAEL25 TCHAIN110
@70 /* ~Sarevok me he fijado que de vez en cuando te quedas mirando a Velvevlos, ¿es por alguna razón en especial?.~ */ DO ~SetGlobal("BThaelSarevok","LOCALS",1)~
== BSAREV25 @71 /* ~Así es... En el pasado encomendé a varios de mis mejores hombres la misión de recuperar ese artefacto que esgrimes...~ */
            =
            @72 /* ~Verás, hubo un tiempo en el que pretendía reclamar para mi mismo toda la Esencia de Baal y además dominar todo Faerun... Durante esa etapa de mi vida, llegaron a mis oidos multiples leyendas sobre artefactos de inmenso poder, muy utilies para todo aquel que tuviera en mente unos objetivos como los mios...~ */
            = 
            @73 /* ~No me mires así, hace tiempo que no persigo tales objetivos y en cuanto a mi interes por adueñarme de Velvevlos, puedes estar tranquilo... En la biblioteca de Candelero tuve la oportunidad de leer bastante sobre la Hoja Sangrienta y, creeme, ahora que he vuelto al mundo de los vivos, lo último que haría es condenarme empuñando dicho artefacto.~ */
== BTHAEL25 @74 /* ~Me alegra oir eso..Si intentaras arrebatarmela, ten por seguro que no dudaría en degollarte con su hoja.~ */
== BSAREV25 @75 /* ~Como te he dicho, no tengo ningún interés en ella.~ */
            =
            @76 /* ~Ah, y otra cosa elfo... ¡Vuelve a amenazarme y lo lamentarás!.~ */ 
EXIT


//****************************************************************

CHAIN 
IF ~Dead("Viconia") Global("IllaseraSpawn","GLOBAL",1) Global("ViconiaDieTOB","LOCALS",0)~ THEN BTHAEL HCHAIN203
@77 /* ~¡Viconia!...Maldita sea, nunca pensé que llegaría el día en que lamentaría la muerte de un drow...Era muy buena sanadora.~ */ DO ~SetGlobal("ViconiaDieTOB","LOCALS",1)~ 
EXIT

//*****************************************************************

