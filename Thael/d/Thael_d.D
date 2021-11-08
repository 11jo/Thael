BEGIN ~Thael~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN PrimerContacto
  SAY @0 /* ~Saludos amigo, me llamo Thael. Por lo que veo, no soy el único que ha conseguido escapar de las garras del mago.¿Necesitais ayuda?~ 
            ~Saludos amiga, me llamo Thael. Por lo que veo no soy el único que ha conseguido escapar de las garras del mago.¿Necesitais ayuda?~*/ 
  IF ~~ THEN REPLY @1 /* ~Hola, yo me llamo <CHARNAME> y lo cierto es que nos vendría bien algo de ayuda extra.~ */ GOTO Alianza
  IF ~~ THEN REPLY @2 /* ~Lo siento pero no necesitamos nada. Quizás en otro momento.~ */ GOTO Adios
  IF ~Class(Player1,PALADIN)~ THEN REPLY @3 /* ~ Un momento, esa espada que llevas ahí...¡Percibo como de ella emana una enorme maldad!~ */ GOTO Palaca
END

IF ~~ THEN BEGIN Palaca
  SAY @4 /* ~¿Mi espada?..¡Ah!, permite que te la presente, ésta es la increible Velvevlos. Se que en un principio puede dar mala impresión, pero te aseguro que es una fiel camarada.~ */
  IF ~~ THEN REPLY @5 /* ~Mmm, tengo la certeza de que en tu espada se esconde un terrible mal, pero en ti no detecto vileza alguna... ¡Sea pues!, te daré un voto de confianza Thael y puesto que necesitamos de toda la ayuda posible, dime, ¿en qué podrías ayudarnos?.~ */ GOTO Alianza
  IF ~~ THEN REPLY @6 /* ~Eso no me es suficiente. ¡Apartate de mi camino!. ¡Es más, te aconsejo que destruyas esa espada!. Me da la sensación de que su mera existencia no puede traer nada bueno.~ */ GOTO Adios
END

IF ~~ THEN BEGIN Alianza
  SAY @7 /* ~Tengo algunas pociones que he cogido de la guarida de ese mago loco y que podrían serte de utilidad... Además, si pretendes ir tras él, me gustaría unirme a tu grupo. Ese bastardo me debe unas cuantas horas de torturas y dolor que quiero devolverle clavandole mi espada en su negro corazón.~ */
  IF ~~ THEN REPLY @8 /* ~¿Así que tu también has sufrido la hospitalidad del mago?... De acuerdo Thael, unamonos y veamos donde se ha ido a esconder esa rata.~ */ DO ~SetGlobal("ThaelAdmitido","GLOBAL",1) SetGlobal("DialogosconThael","LOCALS",1) SetGlobalTimer("ThaelDialogo","GLOBAL",TWO_DAYS) JoinParty()~ EXIT
  IF ~~ THEN REPLY @9 /* ~¿Pociones?. ¡Seguro que nos vendrán muy bien!. ¡Bienvenido al grupo Thael!.~ */ DO ~SetGlobal("ThaelAdmitido","GLOBAL",1) SetGlobal("DialogosconThael","LOCALS",1) SetGlobalTimer("ThaelDialogo","GLOBAL",TWO_DAYS) JoinParty()~ EXIT
  IF ~~ THEN REPLY @10 /* ~Mmm, lo he pensado mejor, es más conveniente que cada uno siga por su lado.~ */ GOTO Adios
END

IF ~~ THEN BEGIN Adios
  SAY @11 /* ~Como quieras... Por ahora me dedicaré a recabar información por esta zona, a ver si alguien me puede dar alguna pista sobre Irenicus...Si cambias de idea me podrás encontrar por aquí.~ */
  IF ~~ THEN REPLY @12 /* ~Lo tendré en cuenta. Adios.~ */ EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN CambiodeOpinion                  //Nunca antes se ha unido al grupo
  SAY @13 /* ~Has vuelto.¿Debo suponer que has cambiado de opinión?~ */
  IF ~~ THEN REPLY @14 /* ~Así es, nos vendría bien tu ayuda Thael.~ */ DO ~SetGlobal("ThaelAdmitido","GLOBAL",1) SetGlobal("DialogosconThael","LOCALS",1) SetGlobalTimer("ThaelDialogo","GLOBAL",TWO_DAYS) JoinParty()~ EXIT 
  IF ~~ THEN REPLY @15 /* ~No, simplemente pasaba por aquí.~ */ EXIT
END


//**********************************************************
//**********************************************************35


BEGIN ~ThaelP~   


IF ~Global("ThaelAdmitido","GLOBAL",1)~ THEN BEGIN DejarGrupo
  SAY @16 /* ~¿No quieres que continuemos juntos?~ */
    IF ~~ THEN REPLY @17 /* ~No te vayas Thael. Con tu ayuda y Velvevlos la busqueda de Irenicus será más fácil.~ */ DO ~JoinParty()~ EXIT
    IF ~Global("ThaelInfraoscuridad","GLOBAL",0) Global("ThaelLealtad","GLOBAL",0)~ THEN REPLY @18 /* ~Así es, creo que deberías marcharte Thael.~ */ GOTO Waukin
    IF ~Global("ThaelInfraoscuridad","GLOBAL",2) Global("ThaelLealtad","GLOBAL",0)~ THEN REPLY @18 /* ~Así es, creo que deberías marcharte Thael.~ */ GOTO Infraoscuridad
    IF ~Global("ThaelInfraoscuridad","GLOBAL",2) Global("ThaelLealtad","GLOBAL",1)~ THEN REPLY @18 /* ~Así es, creo que deberías marcharte Thael.~ */ GOTO Infierno
END

IF ~~ THEN BEGIN Waukin
  SAY @19 /* ~Como quieras, creo que continuaré la busqueda de Irenicus donde la dejé. Si me necesitas me podrás encontrar en donde nos conocimos por primera vez,en el Paseo de Waukin.~ */
  IF ~~ THEN REPLY @20 /* ~Muy bien Thael, buena suerte a ti también, y que los dioses te concedan la venganza.~ */ DO ~SetGlobal("ThaelAdmitido","GLOBAL",0) EscapeAreaMove("AR0700",3160,1205,3)~ EXIT
END  

IF ~~ THEN BEGIN Infraoscuridad
  SAY @21 /* ~Como quieras, ya conozces la ubicación de la ciudad drow de Ust Natha, ¿verdad?. Si deseas encontrarme, buscame en la entrada al poblado de los svirfneblind que hay en la zona o bien por los alrededores de Ust Natha. Estaré cazando drows e intentando averiguar el paradero de la asesina Sendai.~ */
  IF ~~ THEN REPLY @20 /* ~Muy bien Thael, buena suerte a ti también, y que los dioses te concedan la venganza.~ */ DO ~SetGlobal("ThaelAdmitido","GLOBAL",0) EscapeAreaMove("AR2100",584,1124,0)~ EXIT
END 

IF ~~ THEN BEGIN Infierno
  SAY @22 /* ~Muy bien, te esperaré aquí por si cambias de opinión.~ */
  IF ~~ THEN DO ~SetGlobal("ThaelAdmitido","GLOBAL",0)~ EXIT
END  

 
IF ~Global("ThaelAdmitido","GLOBAL",0)~ THEN BEGIN Reencuentro
  SAY @23 /* ~¡Has regresado!. ¿Quieres que volvamos a unirnos?~ */
  IF ~~ THEN REPLY @24 /* ~Así es Thael...Únete a nosotros, necesitamos de tus habilidades.~ */ DO ~SetGlobal("ThaelAdmitido","GLOBAL",1) JoinParty()~ EXIT
  IF ~~ THEN REPLY @25 /* ~No, sólo quería saludarte.~ */ EXIT
END


//*********************************************************
//*********************************************************73

BEGIN ~Thaelj~
 


IF ~Global("PistaPerdida","GLOBAL",0) PartyHasItem("MISCA6")~ THEN BEGIN BusquedaSendai
  SAY @26 /* ~<CHARNAME>, he hablado con Solaufein... Sendai ya no está en Ust Natha...he perdido su pista...~ */
  IF ~~ THEN REPLY @27 /* ~Tranquilo Thael, tarde o temprano la encontraremos y vengaremos a los tuyos, ¡lo juro!~ */ DO ~AddexperienceParty(10000) SetGlobal("PistaPerdida","GLOBAL",1)~ JOURNAL @28 /* ~Sendai no se encuentra en Ust Natha y con ello las esperanzas de encontrarla por parte de Thael se desvanecen. No obstante, estaremos alerta ante cualquier nueva pista sobre el paradero de Sendai.                                                                .~ */ EXIT
  IF ~~ THEN REPLY @29 /* ~Así es, aunque a mi me resulta más inquietante pensar en algo que escuché que te decía Solaufein: Sendai, la asesina de tu familia, tiene sangre divina...Llamame paranoico si quieres, pero creo que esa tal Sendai podría ser hermana mía.~  ~Así es, aunque a mi me resulta más inquietante pensar en algo que escuché que te decía Solaufein: Sendai, la asesina de tu familia, tiene sangre divina...Llamame paranoica si quieres, pero creo que esa tal Sendai podría ser hermana mía.~*/  DO ~AddexperienceParty(10000) SetGlobal("PistaPerdida","GLOBAL",1)~ JOURNAL @30 /* ~Sendai no se encuentra en Ust Natha y con ello las esperanzas de encontrarla por parte de Thael se desvanecen. No obstante, estaremos alerta ante cualquier nueva pista sobre el paradero de Sendai.                                                          .~ */ EXIT
END

//******************************************************
//******************************************************

IF ~AreaCheck("AR0314") Global("ThaelSindel","GLOBAL",0)~ THEN BEGIN PoderSindel 
  SAY @31 /* ~Atento <CHARNAME>, Velvevlos detecta un gran poder en esta sala...¡Mi espada dice que se trata de otro Hijo de Baal!...Cuidado, es tremendamente  poderoso, no nos interesa tener problemas con él.~ */ 
  IF ~~ THEN REPLY @32 /* ~¿Un Hijo de Baal?... Lo tendré en cuenta.~ */ DO ~SetGlobal("ThaelSindel","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @33 /* ~¡Yo no me acobardo ante nadie!. Quizás sea él quien deba tener cuidado conmigo.~ */ DO ~SetGlobal("ThaelSindel","GLOBAL",1)~ EXIT
END


IF ~AreaCheck("AR0600") Global("ThaelCirco","GLOBAL",0)~ THEN BEGIN EntrarCirco 
  SAY @34 /* ~Perdona <CHARNAME>, me he fijado que a veces te quedas mirandome con extrañeza...¿sucede algo?.~ */ 
  IF ~~ THEN REPLY @35 /* ~La verdad es que debo reconocer que tu aspecto me inquieta Thael: piel dorada que parece metálica, ojos de los emana una tenue luz verdosa, pelo plateado... Nunca había visto un elfo como tu.~ */ DO ~SetGlobal("ThaelCirco","GLOBAL",1)~ GOTO AspectoThael
END

IF ~~ THEN BEGIN AspectoThael
  SAY @36 /* ~ Entiendo... Bueno, efectivamente mi aspecto no es natural, desde que soy el portador de Velvevlos mi cuerpo ha sufrido algunos cambios. Las energías mágicas que emanan de ella me han hecho más fuerte, rápido y resistente... aunque a un precio muy alto...~ */       
      =
      @37 /* ~Quizás más adelante tengamos oportunidad de hablar de ello, pero ahora creo que deberíamos centrarnos en este extraño lugar... Velvevlos nunca había percibido nada igual.~ */
  IF ~~ THEN REPLY @38 /* ~Vaya, tu espada parece realmente poderosa...Pero llevas razón, a mi también me da mala espina este lugar. ¡Sigamos!~ */ EXIT
END
 

IF ~AreaCheck("AR2100") Global("ThaelInfraoscuridad","GLOBAL",0)~ THEN BEGIN IntroInfraoscuridad 
  SAY @39 /* ~Cuidado <CHARNAME>, conozco esta parte de la Infraoscuridad muy bien, estamos cerca de Ust Natha, la ciudadela drow en donde me intenté infiltrar una vez...(suspiro)...Allí es donde se esconde Sendai. Hemos de movernos con cautela.~ */ 
  IF ~~ THEN REPLY @40 /* ~¿Una ciudadela drow?...no es algo que debamos tomarnos a la ligera... Dime, ¿qué más puedes decirme de la zona?.~ */ DO ~SetGlobal("ThaelInfraoscuridad","GLOBAL",1)~ GOTO DescribeInfraoscuridad
  IF ~~ THEN REPLY @41 /* ~Muy bien Thael, iremos con cuidado.~ */ DO ~SetGlobal("ThaelInfraoscuridad","GLOBAL",1)~ EXIT
END


IF ~~ THEN BEGIN DescribeInfraoscuridad
   SAY @42 /* ~Veamos, en el noroeste recuerdo que había un pequeño poblado svirfneblin, se trata de gnomos de las profundidades y no suelen ser violentos, así que, seguramente, podamos descansar allí. Por lo demás, lo único que encontraremos serán un montón de problemas y enemigos: drows, kuotoas, ilicidos, contempladores y muchos más monstruos, a cual más aterrador. Sin duda en esta zona se concentra lo peor de la Infraoscuridad.~ */
   IF ~~ THEN REPLY @43 /* ~Gracias Thael, tu conocimiento de la zona nos vendrá muy bien~ */ DO ~AddexperienceParty(5000)~ EXIT
   IF ~~ THEN REPLY @44 /* ~¡Jajaja!, sabía que nos vendrías muy bien en el grupo Thael. De acuerdo, veamos donde se ha ido a esconder Irenicus. ¡Adelante!.~ */ EXIT
END




//**********LevelUpVelvevlos SoA*************************************123

IF ~AreaCheck("AR2100") Global("TalkedToCarlig","GLOBAL",1) Global("ThaelInfraoscuridad","GLOBAL",1)~ THEN BEGIN IntroInfraoscuridad 
  SAY @45 /* ~¡Uaaah!..., ¿Habéis sentido eso?...Velvevlos se ha vuelto más poderosa...¡Siento como su energía recorre mi cuerpo!...~ */ 
  IF ~~ THEN REPLY @46 /* ~Así que es cierto, a mayor número de muertes mayor es su poder...Ten cuidado Thael, no se puede esperar nada bueno de un objeto que se alimenta de la muerte.~ */ DO ~SetGlobal("ThaelInfraoscuridad","GLOBAL",2)~ EXIT
  IF ~~ THEN REPLY @47 /* ~¡Vaya, esa sí que es una buena noticia!. ¡Estoy deseando ver a la nueva Velvevlos en acción!.~ */ DO ~SetGlobal("ThaelInfraoscuridad","GLOBAL",2)~ EXIT    
END

//******************************************************************

IF ~AreaCheck("AR2200") Global("ThaelUstNatha","GLOBAL",0)~ THEN BEGIN IntroUstNatha 
  SAY @48 /* ~¡Lo conseguimos!,¡Estamos dentro de Ust Natha!...La ciudad que esconde a la asesina de mi familia...¡Velvevlos está ansiosa por atravesar el negro corazón de Sendai!.~ */ 
  IF ~~ THEN DO ~SetGlobal("ThaelUstNatha","GLOBAL",1) AddexperienceParty(10000)~ JOURNAL @49 /* ~Al fin hemos conseguido entrar en Ust Natha, la ciudad drow donde se esconde Sendai, la asesina de la familia de Thael. Ahora debo controlar a Thael más que nunca. Su ansia de venganza podría llegar a desenmascarnos, echando por tierra todos nuestros planes.~ */ EXIT
END

IF ~AreaCheck("AR0808") Global("ThaelBodhiFinal","GLOBAL",0)~ THEN BEGIN BuscarLintherna 
  SAY @50 /* ~Bien, ya estamos dentro, ahora deberíamos darnos prisa en recuperar la Lintherna de Rynn  y volver cuanto antes a Suldanessalar... Velvevlos presiente que algo terrible está sucediendo allí.~ */ 
  IF ~~ THEN DO ~ SetGlobal("ThaelBodhiFinal","GLOBAL",1)~ EXIT
END

IF ~AreaCheck("AR2800") Global("ThaelSuldanessalar","GLOBAL",0)~ THEN BEGIN IntroSuldanessalar 
  SAY @51 /* ~¡¡NO!!, ¡NO PUEDE SER!, ¡Otra vez no!, ¡Está pasando lo mismo que sucedió en Lorenthelian!...¡<CHARNAME>, no podemos permitirlo!...¡¡Debemos salvar la ciudad!!.~ */ 
  IF ~~ THEN DO ~SetGlobal("ThaelSuldanessalar","GLOBAL",1)~ EXIT
END


//***********************************************************

I_C_T RENAL 30 ThaelRenal
== THAELJ IF ~InParty("Thael")~ THEN @52 /* ~Una vez me propusieron algo parecido en Luskan. Este tipo de negocios con las Cofradias de Ladrones suelen ser muy lucrativos, aunque también muy peligrosos.~ */
END

I_C_T VICONI 0 ThaelArdeVico
== THAELJ IF ~InParty("Thael")~ THEN @53 /* ~¡Mirad como suplica esa drow!. ¡Jajajaja, será interesante ver como arde esa vil criatura!.~ */
END

I_C_T VICONI 14 ThaelNoVico
== THAELJ IF ~InParty("Thael")~ THEN @54 /* ~Ummf, no puedo decir que esté de acuerdo con lo que acabamos de hacer, pero tu mandas... <CHARNAME>, los drows son criaturas viles y depravadas, no te fies de ella.~ */
END

I_C_T FIRKRA02 21 ThaelFirkraag
== THAELJ IF ~InParty("Thael")~ THEN @55 /* ~¡Velvevlos se agita furiosa en mi puño!. ¡Está impaciente por probar la sangre de esta bestia!. Entiendo tu decisión <CHARNAME>, aunque espero que regresemos pronto...¡Tenemos que matar al dragón!.~ */
END

I_C_T SHADRA01 0 ThaelDragonSombra
== THAELJ IF ~InParty("Thael")~ THEN @56 /* ~¡Mira bien dragón, esta es Velvevlos, antes de que tu nacieras ella ya había probado en multiples ocasiones la sangre de los de tu estirpe!. ¡Tiembla, porque pronto tu oscura alma será suya!.~ */
== SHADRA01 IF ~InParty("Thael")~ THEN @57 /* ~¿Esgrimes a la Hoja Sangrienta?...Ese artefacto se daba por perdido...¡Bien, ahora la victoria sí que tiene un buen incentivo!. ¡Velvevlos ocupará un lugar especial en mi tesoro!. JAJAJAJA.~ */
END

I_C_T YOSHJ 113 ThaelYoshimo
== THAELJ IF ~InParty("Thael")~ THEN @58 /* ~¡Lo sabía!,¡Velvevlos y yo lo sabiamos!, ¡Traicionera criatura, pagarás por esto!.~ */
END

I_C_T PPSAEM2 17 ThaelSaemon
== THAELJ IF ~InParty("Thael")~ THEN @59 /* ~¿Un portal mágico que lleve hasta la Infraoscuridad?... ¡Sí, es muy probable!... Irenicus tiene aliados allí... Me estoy refiriendo a los drows y más concretamente en la ciudad subterranea de Ust Natha...~ */
END

I_C_T UDSILVER 34 ThaelAdalon
== THAELJ IF ~InParty("Thael")~ THEN @60 /* ~¡Bien!, una forma segura de entrar a Ust Natha, creo que por fin la suerte me sonrie...(Encontraré a Sendai y cumpliré mi venganza).~ */
END

I_C_T BODHI 11 ThaelBodhi1
== THAELJ IF ~InParty("Thael")~ THEN @61 /* ~Mmm, una oferta alternativa a la de los Ladrones de las Sombras...No lo dudes <CHARNAME>, si es más ventajosa, aceptala.~ */
END

I_C_T BODHI2 15 ThaelBodhi2
== THAELJ IF ~InParty("Thael")~ THEN @62 /* ~¡Oooh vamos!...¡Por los Nueve Infiernos!...Hoy llevo todo el día con dolor de cabeza y estoy cansado de esta "mujer", de sus acertijos y sus malintencionadas preguntas dejadas en el aire. Yo voto por ensartar su corazón con una bonita estaca. ¿Alguien se apunta?.~ */
END

I_C_T BODHI2 16 ThaelBodhi2
== THAELJ IF ~InParty("Thael")~ THEN @62 /* ~¡Oooh vamos!...¡Por los Nueve Infiernos!...Hoy llevo todo el día con dolor de cabeza y estoy cansado de esta "mujer", de sus acertijos y sus malintencionadas preguntas dejadas en el aire. Yo voto por ensartar su corazón con una bonita estaca. ¿Alguien se apunta?.~ */
END

I_C_T BODHI2 17 ThaelBodhi2
== THAELJ IF ~InParty("Thael")~ THEN @62 /* ~¡Oooh vamos!...¡Por los Nueve Infiernos!...Hoy llevo todo el día con dolor de cabeza y estoy cansado de esta "mujer", de sus acertijos y sus malintencionadas preguntas dejadas en el aire. Yo voto por ensartar su corazón con una bonita estaca. ¿Alguien se apunta?.~ */
END

I_C_T UDSOLA01 102 ThaelSola
== THAELJ IF ~InParty("Thael")~ THEN @63 /* ~Un momento Solaufein, en la ciudad he oido hablar de una tal Sendai y de sus cacerías en la superficie, ¿sabes dónde puedo encontrarla?.~ */
== UDSOLA01 IF ~InParty("Thael")~ THEN @64 /* ~¿Sendai?...No me extraña que escuches hablar de ella, su grupo de sanguinarios mercenarios era todo un orgullo para Ust Natha. Se dice que su influencia y poder eran tales que las propias Madres Matriarcas la trataban como a una igual.~ */
                                       =
                                       @65 /* ~ Pero ya no está en la ciudad, partió hace unas semanas hacia el sur, guiando a todo su ejercito de mercenarios drows y esclavos. Por lo que sé, no pidió permiso a nadie y nadie se atrevió a interponerse en su camino... Se decía que Sendai tenía sangre divina, pero yo no creo en esos chismes...Bueno, ya está bien de tanta cháchara, pronto llegarán esos svirfneblins.~ */ 
== THAELJ IF ~InParty("Thael")~ THEN @66 /* ~Lástima... Me hubiera gustado "conocerla"...~ */
== UDSOLA01 IF ~InParty("Thael")~ THEN @67 /* ~Sssh, atento, ya escucho como se acercan...~ */
END

I_C_T UDSOLA01 107 ThaelSola
== THAELJ IF ~InParty("Thael")~ THEN @63 /* ~Solaufein, en la ciudad he oido hablar de una tal Sendai y de sus cacerías en la superficie, ¿sabes dónde puedo encontrarla?.~ */
== UDSOLA01 IF ~InParty("Thael")~ THEN @64 /* ~¿Sendai?...No me extraña que escuches hablar de ella, su grupo de sanguinarios mercenarios era todo un orgullo para Ust Natha. Se dice que su influencia y poder eran tales que las propias Madres Matriarcas la trataban como a una igual.~ */
                                       =
                                       @68 /* ~ Pero ya no está en la ciudad, partió hace unas semanas hacia el sur, guiando a todo su ejercito de mercenarios drows y esclavos. Por lo que sé, no pidió permiso a nadie y nadie se atrevió a interponerse en su camino.... Se decía que Sendai tenía sangre divina, pero yo no creo en esos chismes...Bueno, ya está bien de tanta cháchara, pronto llegarán esos svirfneblins.~ */ 
== THAELJ IF ~InParty("Thael")~ THEN @66 /* ~Lástima... Me hubiera gustado "conocerla"...~ */
== UDSOLA01 IF ~InParty("Thael")~ THEN @69 /* ~Sssh, atentos, escucho como se acercan... Me voy, ya nos veremos en la taberna.~ */
END

I_C_T PLAYER1 18 ThaelIrenicusDead
== THAELJ IF ~InParty("Thael")~ THEN @70 /* ~¡Algo va mal!. ¡Velvevlos me está chillando como una loca!...¡ALGO VA TERRIBLEMENTE MAL!... ¡¡<CHARNAME>!!...~ */
END

I_C_T PLAYER1 25 ThaelInfierno
== THAELJ IF ~InParty("Thael")~ THEN @71 /* ~Mmm, interesante... <CHARNAME>, no te lo vas a creer, pero Velvevlos dice que tu y este lugar compartís la misma esencia...~ */
END

I_C_T DRAGBLAC 0 ThaelDragonNegro
== THAELJ IF ~InParty("Thael")~ THEN @72 /* ~¡<CHARNAME>, no perdamos tiempo con el dragón, cada segundo es vital, matemoslo y cojamos la copa!.~ */
END

I_C_T HELLJON 7 ThaelIrenicusInfierno1
== THAELJ IF ~InParty("Thael")~ THEN @73 /* ~¡Varias veces has escapado ya de Velvevlos, pero te juro que esta vez morirás!.~ */ 
END

I_C_T HELLJON 8 ThaelIrenicusInfierno2
== THAELJ IF ~InParty("Thael")~ THEN @73 /* ~¡Varias veces has escapado ya de Velvevlos, pero te juro que esta vez morirás!.~ */ 
END

I_C_T HELLJON 9 ThaelIrenicusInfierno3
== THAELJ IF ~InParty("Thael")~ THEN @73 /* ~¡Varias veces has escapado ya de Velvevlos, pero te juro que esta vez morirás!.~ */ 
END

I_C_T HELLJON 10 ThaelIrenicusInfierno4
== THAELJ IF ~InParty("Thael")~ THEN @73 /* ~¡Varias veces has escapado ya de Velvevlos, pero te juro que esta vez morirás!.~ */ 
END

//************************************************************


EXTEND_BOTTOM PLAYER1 33
IF ~IsValidForPartyDialog("Thael") Global("ThaelLealtad","GLOBAL",0)~ THEN DO ~SetGlobal("ThaelLealtad","GLOBAL",1)~ GOTO P133Thael
END

APPEND PLAYER1
  IF ~~ P133Thael
   SAY @74 /* ~Thael, un elfo al que la vida le ha convertido en un ser amargado y de moral difusa. Solo vive para vengarse de Sendai, una sanguinaria drow que aniquiló a todos sus seres queridos. Para conseguir su objetivo se ha aliado con Velvevlos, una poderosa espada maléfica. Si decide seguirte seguramente nunca alcance su venganza. Solo por las veces que ha derramado su sangre por ti, te ves en la obligación de darle la oportunidad de elegir.~ */
   ++ @75 /* ~Thael, no tienes que seguir adelante, esta no es tu lucha.~ */ EXTERN THAELJ doordie
   ++ @76 /* ~Thael, no hay necesidad de que continues, de hacerlo puede que no puedas continuar la busqueda de Sendai.~ */ EXTERN THAELJ bowout
   ++ @77 /* ~Pronto tendrá lugar la última batalla para recuperar mi alma Thael. Presiento que será una dura contienda, me gustaría saber si puedo contar contigo hasta el final camarada.~ */ EXTERN THAELJ thankyou
  END
END

APPEND THAELJ

  IF ~~ doordie
   SAY @78 /* ~Te equivocas <CHARNAME>, sí que es mi lucha, ahí dentro se esconde el culpable de la matanza en Suldanessalar...Años atras no puede hacer nada para salvar a mi pueblo, pero ahora tengo el poder suficiente para impedir que suceda de nuevo algo parecido. Y así lo haré, rajaré a ese cabrón de Irenicus con Velvevlos. ¡Lo juro!.~ */ 
  IF ~~ GOTO tolend
  END

  IF ~~ bowout
   SAY @79 /* ~Bueno, nunca te lo he dicho, pero desde que te vi supe que la mejor forma de llegar a Sendai era siguiendote. Verás, no sabría como explicartelo, pero Velvevlos me ha confirmado que tu destino y el de Sendai se cruzarán en un futuro no muy lejano. Así que hasta que llegue ese momento, yo me pegaré a ti como un lapa amigo mio.~ */
  IF ~~ GOTO tolend
  END

  IF ~~ thankyou
   SAY @80 /* ~Claro <CHARNAME>, sabes que puedes contar conmigo, porque sé, que cuando llegue el momento, yo podré contar contigo en mi enfrentamiento con Sendai.~ */
  IF ~~ GOTO tolend
  END

  IF ~~ tolend
   SAY @81 /* ~Adelante compañero, ahí abajo se esconde un mago loco y Velvevlos necesita calmar su sed de sangre.~ */ 
   COPY_TRANS PLAYER1 33 
  END

END

//******************************************************
//******************************************************

BEGIN ~BThael~

IF ~Global("DialogosconThael","LOCALS",2)~ THEN BEGIN ThaelBanner01
  SAY @82 /* ~<CHARNAME>, durante mi encarcelamiento en la Guarida de Irenicus escuchaba a veces a los guardias hablar entre ellos; solían comentar los experimentos que el mago te estaba realizando...Dime, ¿tienes idea de qué es lo que él quería de ti?.~  */ 
  IF ~~ THEN REPLY @83 /* ~Oiste bien. Ese Irenicus me hizo pasar por extraños y dolorosos experimentos... La verdad es que no sé exactamente que pretendía con ello, pero ten por seguro de que me enteraré y de que cuando demos con él pagará por lo que me hizo a mi y a Imoen.~ */ GOTO ThaelBanner011
  IF ~~ THEN REPLY @86 /* ~Creo que este no es el mejor momento para charlar Thael. Mejor en otra ocasión.~ */ DO ~SetGlobalTimer("ThaelDialogo","GLOBAL",FOUR_DAYS) IncrementGlobal("DialogosconThael","LOCALS",1) ~ EXIT
END

IF ~~ THEN BEGIN ThaelBanner011
  SAY @87 /* ~Sí, yo también estoy deseando volver a encontrarme con Irenicus para devolverle con creces todo lo que me ha hecho sufrir.~ */	
  IF ~~ THEN REPLY @88 /* ~Pero ahora que lo pienso, ¿por qué te tenía encarcelado?. ¿Llegaste a enterarte de cuales eran sus intenciones?~  */ GOTO ThaelBanner02
END

IF ~~ THEN BEGIN ThaelBanner02
  SAY @89 /* ~Al parecer nuestro torturador estaba interesado en mi poderosa espada Velvevlos y en las mutaciones que sus energías mágicas han provocado en mi cuerpo...~*/
      =
      @90 /* ~Llegué a creer que moriría en aquellas frías mazmorras a manos de aquel desquiciado mago y sus oscuros experimentos. Afortunadamente cuando los enemigos de Irenicus asaltaron su guarida, las ataduras mágicas que habían sobre Velvevlos se debilitaron, y gracias a eso, conseguimos huir.~ */   
   IF ~~ THEN REPLY @91 /* ~Vaya, muy interesante, pero dime, ¿cómo te capturó Irenicus?~ */ GOTO ThaelBanner03
   IF ~~ THEN REPLY @92 /* ~Una gran historia. Ya me la seguirás contando otro día. Ahora pongámonos en camino.~ */ DO ~SetGlobalTimer("ThaelDialogo","GLOBAL",FOUR_DAYS) IncrementGlobal("DialogosconThael","LOCALS",1) ~ EXIT
END

IF ~~ THEN BEGIN ThaelBanner03
  SAY @93 /* ~Bueno,... eso,... eso, paso por...(suspiro). Perdoname <CHARNAME>, pero son recuerdos muy dolorosos para mi. Si no te importa preferiría hablar de ello en otro momento. Ahora...ahora necesito dejar de recordar, necesito volver al trabajo.~ */
  IF ~~ THEN REPLY @94 /* ~Como quieras Thael. Veo que en tu interior guardas un gran pesar, cuando necesites hablar con alguien, aquí me tienes.~ */ DO ~SetGlobalTimer("ThaelDialogo","GLOBAL",FOUR_DAYS) IncrementGlobal("DialogosconThael","LOCALS",1) ~ EXIT
  IF ~~ THEN REPLY @95 /* ~Si es lo que quieres, así sea, pero cuando puedas me gustaría oir el resto de la historia, puede que esa información me sea muy valiosa.~ */ DO ~SetGlobalTimer("ThaelDialogo","GLOBAL",FIVE_DAYS) IncrementGlobal("DialogosconThael","LOCALS",1) ~ EXIT
END

IF ~Global("DialogosconThael","LOCALS",4)~ THEN BEGIN ThaelBanner04
  SAY @96 /* ~¿Quieres... quieres saber cómo es que llegué a ser prisionero de Irenicus?.~ */ 
  IF ~~ THEN REPLY @97 /* ~Sí claro, cuentame, ¿qué es lo que sucedió?.~ */ GOTO ThaelBanner05
  IF ~~ THEN REPLY @98 /* ~Lo siento Thael pero no es un buen momento. Tal vez en otra ocasión.~ */ DO ~IncrementGlobal("DialogosconThael","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN ThaelBanner05
  SAY @99 /* ~Verás, desde hace unos años dedico todas mis energías a un solo objetivo: le sigo la pista a una drow, a una asesina llamada Sendai... ¡Y ten por seguro que cuando la encuentre le arrancaré la cabeza con la afilada Velvevlos!.~ */
  IF ~~ THEN REPLY @100 /* ~Calma Thael, ¿cómo que una drow?. ¿ Qué tiene que ver esa tal Sendai con Irenicus?~ */ GOTO ThaelBanner06
END

IF ~~ THEN BEGIN ThaelBanner06
  SAY @101 /* ~Eso es una larga historia: Hace unos meses atras di con una buena pista sobre el paradero de Sendai, la drow de la que te hablaba. Me la había proporcionado un mago-adivino de Puerta de Baldur que me cobró por el servicio casi todo el oro que había conseguido ahorrar de mis anteriores trabajos en Luskan. La pista llevaba hasta Ust Natha, una ciudadela drow situada en la Infraoscuridad... Una vez supe esto, mi objetivo fue el de infiltrarme en Ust Natha, asesinar a esa zorra y volver a salir antes de que se diera la alarma...~ */
      =
      @102 /* ~Todo iba bien. Gracias a una objeto mágico polimorfizador que me agencié, adopté la forma de duergar y me infiltré con exito en una caravana de comerciantes de esta raza que se dirigía a Ust Natha. Desafortunadamente fui apresado por los drow justo antes de entrar en la ciudad...¡Estaba claro que sabían de mi llegada!~ */ 
      =
      @103 /* ~Con lo que no conté fue con el trabajo tan chapucero que realizó aquel adivino de Puerta de Baldur. Es cierto que averiguó donde se encontraba mi presa, pero el muy estúpido no se dió cuenta de que Sendai se había percatado de su magia adivinatoria.~ */ 
      =
      @104 /* ~Poco más tarde, durante mi encarcelamiento en Ust Natha, me enteré de que los drows no tardaron en localizar al adivino y procurarle una muerte dolorosa.~ */ 
      =
      @1042 /* ~Mientras tanto, yo me consumía en un potro de tortura a manos de la mismísima Sendai... Y ese hubiera sido mi final de no ser por la inesperada visita que ésta recibió...~  */ 
      =
      @105 /* ~Se trataba de Ardulaz, una poderosa Madre Matriarca y de Irenicus. Por lo poco que llegué a captar de la conversación que mantuvieron entre ellos, supe que yo acababa de ser vendido a Irenicus a cambio de algún tipo de fórmula mágica en la que estaba interesada Sendai. Por lo que le pude escuchar al mago, tenía algo que ver con la posibilidad de convertir estatuas de piedra en dobles de uno mismo, dotandolas de gran poder y movilidad.~ */
      =
      @106 /* ~Y eso nos lleva hasta la Guarida de Irenicus y sus experimentos... Afortunadamente hemos escapado y ahora es Irenicus el que se esconde de nosotros... Para mi, el mago es la mejor pista para llegar hasta Sendai... ¡<CHARNAME>, debemos encontrarlo!.~ */
  IF ~~ THEN REPLY @107 /* ~¡Y lo encontraremos amigo mio!... Pero hay una cosa más que me gustaría saber Thael, ¿qué es lo que te hizo Sendai?, ¿por qué la persigues con tanta saña?.~ */ GOTO ThaelBanner07
  IF ~~ THEN REPLY @108 /* ~Y así lo haremos Thael, encontraremos al mago y responderá de sus crimenes. Ahora, sigamos adelante.~ */ DO ~IncrementGlobal("DialogosconThael","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN ThaelBanner07
  SAY @109 /* ~(Suspiro) Bien, supongo que ha llegado el momento de contartelo... Hace... Hace mucho tiempo atrás, yo vivía en un pequeño poblado al sur del Bosque Alto llamado Lorenthelian. Era muy feliz, tenía una mujer y una hija a las que amaba con todo mi corazón. Además, la vida era tan fácil que podía dedicar la mayor parte de mi tiempo a mi pasatiempo favorito: dar clases de magia a las jovenes promesas.~ */
      =
      @110 /* ~Pero sucedió algo terrible...(suspiro)... Hace unos años, en una noche de verano en la que se celebraba una fiesta en mi poblado... Lorenthelian... Lorenthelian fue atacado salvajemente por una poderosa partida de guerra drow liderada por Sendai.~  */ 
      =
      @111 /* ~Aquella aciaga noche, perdí a mi mujer Nethessa, a mi hija Luriviel y a todos mis amigos...(suspiro)... Pude llegar a ver impotente, como mi archienemiga se encargaba de degollar a mi propia hija mientras se reía de sus llantos...(sollozo).~ */ 
      =
      @112 /* ~Yo... yo me salve gracias a la intervención de Velvevlos. El drow que la esgrimía se disponía a asestarme el golpe final cuando, de repente, Velvevlos desplegó su poder e hizo que mi verdugo pifiara automutilandose su pierna derecha y muriendo desangrado a los pocos segundos. Aún aturdido, sentí la llamada de Velvevlos, la empuñé y conseguí huir a la espesura del bosque.~ */
      =
      @113 /* ~A la mañana siguiente, volví a Lorenthelian dispuesto a todo, pero lo único que me encontré fue las ruinas de las casas y los arboles incinerados, los cuerpos de mis vecinos descuartizados y sus cabezas ensartadas en picas...fue...fue terrible...(sollozo).~*/
      =
      @114 /* ~Desde entonces Velvevlos y yo viajamos juntos. Nos une algunos de los vínculos más poderosos que puedan existir sobre Faerun: el Odio y la Venganza. A mi, particularmente, es lo único que me queda...(suspiro)...Hecho tanto de menos a mi esposa Nethessa y a mi hija...a mi pequeña Luriviel...(sollozo).~ */
  IF ~~ THEN REPLY @115 /* ~Lo siento mucho Thael, no tenía ni idea... ¡Amigo, te juro por todos los dioses que se hará justicia!.¡Un acto tan abyecto como ese no quedará impune!.~  */ DO ~AddexperienceParty(10000) IncrementGlobal("DialogosconThael","LOCALS",2) SetGlobal("ThaelyJaheira","GLOBAL",1)~ JOURNAL @116 /* ~Al fin Thael me abrió su corazón y me reveló su terrible pasado. Ver a sus seres queridos morir de aquella forma tuvo que ser traumático. Ahora entiendo mucho mejor la forma de ser y las motivaciones de mi compañero Thael. Por mi parte, haré todo lo que esté en mi mano para que Sendai pague por tales atrocidades.                                                                                              .~ */ EXIT
  IF ~~ THEN REPLY @117 /* ~¡Esa Sendai!... ¡Esa hija de puta!...¡Juro que si se nos cruza en el camino sabrá lo que es morir dolorosamente!.~ */ DO ~AddexperienceParty(10000) IncrementGlobal("DialogosconThael","LOCALS",2) SetGlobal("ThaelyJaheira","GLOBAL",1)~ JOURNAL @118 /* ~Por fin Thael me contó su pasado. Ahora comprendo a mi turbado camarada. No se que nos deparará el Destino, pero espero que los Hados nos den la oportunidad de arreglar cuentas con esa zorra de Sendai.                                                                                                .~ */ EXIT
  IF ~~ THEN REPLY @119 /* ~Vaya, esos drows usan unos métodos realmente sanguinarios... Mmm, tendremos que ir con cuidado si nos encontramos con ellos...¡Animo Thael, pongamonos en marcha!.~ */ DO ~AddexperienceParty(10000) IncrementGlobal("DialogosconThael","LOCALS",2) SetGlobal("ThaelyJaheira","GLOBAL",1)~ JOURNAL @120 /* ~Por fin me he enterado de qué es lo que le pasó a Thael. Al parecer su gente fue masacrada por una partida de guerra drow liderada por una tal Sendai. No sabría explicarlo, pero tengo la sensación que tarde o temprano me cruzaré con esa drow.                                                                                                .~ */ EXIT
END

//**********************

CHAIN
IF ~InParty("Yoshimo") See("Yoshimo") !StateCheck("Yoshimo",STATE_SLEEPING) Global("BThaelYoshi","LOCALS",0)~ THEN BTHAEL TCHAIN101
@121 /* ~Yoshimo, ¿puedo preguntarte algo?~ */ DO ~SetGlobal("BThaelYoshi","LOCALS",1)~
== BYOSHIM @122 /* ~Claro amigo, pregunta lo que quieras.~ */
== BTHAEL @123 /* ~Según me ha contado <CHARNAME>, os encontrasteis por primera vez en el interior de la Guarida de Irenicus, y le digiste que tu también habías sido prisionero del mago...Pero yo no te recuerdo, y estoy seguro de haber llegado a saber de todos los presos...~ */
== BYOSHIM @124 /* ~Eeuh...bueno, yo es que llevaba muy poco tiempo... Practicamente había llegado cuando atacaron al mago aquellos ladrones...~ */
== BTHAEL @125 /* ~Mmm, sí, realmente tuviste mucha suerte en llegar en la hora que lo hiciste. No tuviste que sufrir los dolorosos experimentos del mago...~ */
== BYOSHIM @126 /* ~Sí, es verdad. Como dice un viejo proverbio de Kara-Tur: "La suerte siempre favorece a los buenos de corazón", ¡je,je,je,!. Pero no le demos más vueltas amigo Thael, ¡ahora somos libres y junto a <CHARNAME> encontraremos la forma de devolversela a ese tal Irenicus!~ */
== BTHAEL @127 /* ~Por supuesto, Yoshimo... por supuesto.~ */
EXIT

CHAIN
IF ~InParty("Minsc") InParty("Thael") See("Minsc ") !StateCheck("Minsc",STATE_SLEEPING) Global("BThaelMinsc","LOCALS",0)~ THEN BMINSC TCHAIN102
@128 /* ~Bubu está confuso Thael. No se explica como una espada tan pequeñita puede llegar a ser tan poderosa.~ */ DO ~SetGlobal("BThaelMinsc","LOCALS",1)~
== BTHAEL @129 /* ~ Pues esto no es nada Minsc, Velvevlos tiene la capacidad de ir aumentando su poder a medida que absorbe la  esencia vital de sus enemigos. No te puedes hacer una idea de las cotas de poder a las que puede llegar. ¡La sed de Velvevlos no tiene limites!.~ */
== BMINSC @130 /* ~¡Ah!, veo entonces que a tu espada le pasa lo mismo que a Bubú. Como sabrás Bubú es un gigantesco hamster del espacio exterior en miniatura con un apetito voraz por las pipas... ¡A veces pienso que su hambre tampoco tiene limites!.~ */
== BTHAEL @131 /* ~¿Estás...estás comparando a Velvevlos con tu hamster?~ */
== BMINSC @132 /* ~ Bueno, no era mi intención acomplejarte al comparar a Bubú con Velvevlos. ¡Perdoname camarada!. ¡A veces me siento tan feliz de tener de compañero a Bubú que no caigo en que los demás no pueden disfrutar de un hamster como él, ja,ja,ja!.~ */
= @133 /* ~¡Venga, va!. No pongas esa cara Thael, cuando quieras te dejo que lo acaricies. Ven, toca, toca, ¿ves que suave es su pelaje?.~*/
== BTHAEL @134 /* ~...(suspiro)...~ */
EXIT

CHAIN
IF ~InParty("Aerie")  InParty("Thael") See("Aerie") !StateCheck("Aerie",STATE_SLEEPING) Global("BThaelAerie","LOCALS",0) Global("ThaelInfraoscuridad","GLOBAL",2)~ THEN BAERIE TCHAIN106
@135 /* ~Thael, ¿cómo era la vida en Bosque Alto?, sabes, algún día me gustaría visitar esa zona de Faerun~ */ DO ~SetGlobal("BThaelAerie","LOCALS",1)~
==BTHAEL @136 /* ~No me apetece hablar de ello Aerie, dejalo...~ */
==BAERIE @137 /* ~Oh vamos, dime, ¡seguro que era maravilloso!. Cuentame, ¿qué recuerdas de tu poblado en Bosque Alto?~ */
==BTHAEL @138 /* ~No insistas, no me gusta recordar mi pasado...~ */
==BAERIE @139 /* ~Jajaja, vengaaaa Thael, por favooor...~ */
==BTHAEL @140 /* ~Está bien, como quieras...Recuerdo...(suspiro)...~ */
         =
         @141 /* ~Recuerdo...las ruinas cenicientas de las casas y los arboles quemados hasta sus raices...~ */
         =
         @142 /* ~Recuerdo el olor a carne quemada de mis vecinos muertos...recuerdo las cabezas de mi mujer y de mi hija clavadas en picas justo en donde se encontraba la entrada de nuestra casa...~ */
         =
         @143 /* ~Recuerdo las veces que vomité y me mareé aquellos días mientras enterraba los cadaveres de todo mi pueblo...~ */ 
         =
         @144 /* ~Recuerdo como lloré y como recé a Corellon, a Rilifane...¡Supliqué a todos mis Dioses!...Aquella vez recé por última vez... Renegué para siempre de unos Dioses que permanecían impasibles ante la masacre de su pueblo elegido...(suspiro)...~ */
         =
         @145 /* ~¿Quieres qué siga contandote más cosas sobre Lorenthelian, Aerie?~ */
==BAERIE @146 /* ~Yo...yo...~ */
==BTHAEL @147 /* ~Como suponía... ¡Y ahora dejame en paz Aerie!.~ */
EXIT

CHAIN
IF ~InParty("Edwin") InParty("Thael") See("Edwin") !StateCheck("Edwin",STATE_SLEEPING) Global("BThaelEdwin","LOCALS",0)~ THEN BEDWIN TCHAIN107
@148 /* ~Cuando era aprendiz de mago en Thay tuve la oportunidad de leer los antiguos manuscritos del archimago Zarkeidas. Una gran parte de sus estudios versaban sobre las mutaciones de origen mágico en seres vivos... Me preguntaba si es cierto lo que decía este erudito Thael, ¿es verdad que los efectos secundarios incluyen la esterilidad sexual?.~ */ DO ~SetGlobal("BThaelEdwin","LOCALS",1)~
== BTHAEL @149 /* ~Cierta pérdida de sensibilidad en el tacto, problemas digestivos con alimentos sólidos, esterilidad sexual...Sí, son algunos de los sacrifios que tuve que hacer cuando acepté ser el portador de Velvevlos. Fue el pago por hacerme más fuerte, rápido y resistente. Verás Edwin, tengo tan clara mi meta en esta vida que no me importa renunciar a ciertas cosas con tal de alcanzarla.~ */
== BEDWIN @150 /* ~Sí, entiendo perfectamente lo que quieres decir. No obstante, estoy seguro de que existen otros medios menos dañinos para hacerse más poderoso.~ */
          =
          @151 /* ~ A lo largo de la Costa de la Espada se esconden increibles artefactos y libros de poderosa magia esperando a que yo vaya a reclamarlos.~ */
          =
          @152 /* ~¡Sí!. Con ellos conseguiré mis objetivos sin necesidad de sacrificar nada de lo que ya tengo (y mucho menos la hombría de un varón thayino tan atractivo como yo, ¿verdad?).~ */
==BTHAEL @153 /* ~¿Y cuáles son esos objetivos Mago Rojo?.~ */
==BEDWIN @154 /* ~¡Mis metas no son de tu incumbencia mutante!. ¡Y ahora dejame!.. tengo muchas cosas en las que pensar, muchos planes que hacer...~ */
EXIT

CHAIN
IF ~InParty("Viconia") InParty("Thael") See("Viconia") !StateCheck("Viconia",STATE_SLEEPING) Global("BThaelViconia","LOCALS",0)~ THEN BVICONI TCHAIN108
@155 /* ~Escucha darthiir, tengo que advertirte... Por si no lo sabes, eres el portador de una espada drow legendaria. ¡Esa es la milenaria Velvevlos!. Su nombre, traducido al común, viene a significar "Hoja Sangrienta" y te puedo asegurar que es un nombre que se ha ganado a pulso.~ */ 
=
@156 /* ~Una antigua leyenda drow dice que Velvevlos procede de los Planos Inferiores, que fue un regalo de Lolth a una de sus más fieles servidoras. Se cuenta que en su interior se retuercen cientos de almas sedientas de sangre. Son éstas mismas almas malditas las que no dudan en otorgar al portador de la espada todo el poder necesario para que lleve a cabo este propósito. Con cada nueva víctima, con cada nueva alma devorada, la espada se vuelve más poderosa.~ */ 
=
@157 /* ~¡Pero te lo advierto!: cuando el portador deja de cumplir su cometido, ella misma se encarga de deshacerse de él. Esgrimir esa espada es condenarse para la eternidad darthiir.~ */ DO ~SetGlobal("BThaelViconia","LOCALS",1)~
==BTHAEL @158 /* ~Sí, lo sé. Velvevlos me lo ha contado. Sé que estoy condenado drow, lo supe desde el momento en que acepté ser su portador. Pero ella me ha prometido la Venganza...Porque la Venganza es lo único que me queda y es lo único que me mantiene con vida.~ */
==BVICONI @159 /* ~¡No sabes lo que dices!. Has de saber que...~ */
==BTHAEL @160 /* ~¡Tanto a Velvevlos como a mi no nos interesan tus advertencias Viconia!. ¡Ella y yo hemos hecho un pacto y lo cumpliremos!.~ */
==BVICONI @161 /* ~¡Cómo quieras necio!. ¡Será la última vez que escuches a Viconia advertirte sobre el terrible destino que te aguarda!.~ */ 
EXIT

CHAIN 
IF ~InParty("Korgan") See("Korgan") !StateCheck("Korgan",STATE_SLEEPING) Global("BThaelKorgan","LOCALS",0)~ THEN BTHAEL TCHAIN109
@162 /* ~Al fin encuentro a alguien que trata a sus enemigos como se merecen. ¡Me gusta como haces tu trabajo Korgan!~ */ DO ~SetGlobal("BThaelKorgan","LOCALS",1)~
== BKORGAN @163 /* ~¡Ja!. Quién me lo iba a decir, por fin se me reconoce mi profesionalidad, ¿y de quién vienen los aplausos?...¡De un jodio elfo!. JAJAJAJAJA. ¡Puedes estar tranquilo orejas largas, seguiré matando con el mismo entusiasmo pá no defraudarte!.~ */
== BTHAEL @164 /* ~En serio, me he fijado como estudias a tus enemigos y como les asestas tus terribles y certeros golpes... Es simplemente increible tu depurada técnica para matar. Dime, ¿con qué tipo de herida podría conseguir que mi enemigo sufriera más?.~ */
== BKORGAN @165 /* ~Mira, no me gusta ser el jodio maestro de nada ni de nadie ¿vale?, pero ya que preguntas...¡Ejem!, lo primero es saber a que tipo de cabrón te estas enfrentando, es decir, no es lo mismo si estas tratando con un jodio orco que si lo haces con una japuta de serpiente gigante. Cada bichejo tiene sus puntos débiles y todo buen guerrero debe conocerlos, ¿entiendes?.~ */
== BTHAEL @166 /* ~Mmm entiendo Korgan... ¿Y si estuvieramos tratando con un drow?, ¿hay alguna herida especialmente dolorosa?.~ */
== BKORGAN @167 /* ~Los drows, aunque te joda admitirlo, son elfos como tu...Osease son unos estiraos y flacuchos enclenques. Si quieres hacer sufrir a un drow, lo primero es no pegarle muy fuerte, porque si lo haces lo matas a la primera y te quedas sin diversión. Pá que sufra, lo mejor es una buena y profunda herida en las tripas, ¡sí, esa es la mejor forma pá que el jodio drow sufra de verdad hasta morir!.~ */
== BTHAEL @168 /* ~Gracias Korgan, ten por seguro que algún día aplicaré tus enseñanzas sobre una drow que conozco.~ */
EXIT

CHAIN
IF ~InParty("Edwin") InParty("Thael") See("Edwin") !StateCheck("Edwin",STATE_SLEEPING) Global("BThaelEdwin","LOCALS",1)~ THEN BEDWIN TCHAIN110
@169 /* ~Mi buen amigo Thael, a veces he notado como tu espada irradia un enorme poder, me gustaría que me la dejaras estudiar. Lo mismo descubro nuevas capacidades que desconoces (Sí necio, dejamela y veré si me puedo quedar con su poder).~ */ DO ~SetGlobal("BThaelEdwin","LOCALS",2)~
== BTHAEL @170 /* ~Gracias por tu ofrecimiento "desinteresado" Edwin, pero no es aconsejable, Velvevlos me ha dicho que solo siente hacia ti un agudo desprecio y unas ganas terribles de cortarte la garganta y beber tu sangre. Será mejor que te apartes de ella.~ */
== BEDWIN @171 /* ~Mmm, vaya, lamento oir eso...(Interesante, una espada inteligente con vínculo telepático con su portador...Sí, muy interesante).~ */
EXIT

CHAIN
IF ~InParty("Keldorn") InParty("Thael") See("Keldorn") !StateCheck("Keldorn",STATE_SLEEPING) Global("BThaelKeldorn","LOCALS",0)~ THEN BKELDOR TCHAIN111
@172 /* ~Thael, me veo en la obligación de prevenirte. Sé que tu corazón no es malvado, pero llevas contigo una espada que desprende un halo de terrible maldad...~ */ DO ~SetGlobal("BThaelKeldorn","LOCALS",1)~
== BTHAEL @173 /* ~Lord Keldorn, ¿me está sugiriendo que me deshaga de Velvevlos?.~ */
== BKELDOR @174 /* ~Sí amigo mio, no sabría como explicartelo, pero a veces tu espada emite un aura tan maligna que sería capaz de hacer palidecer a los mismisimos demonios de los Planos Inferiores. Por tu bien deberías desprenderte de ella, o mejor aún, ¡destruirla!.~ */
== BTHAEL @175 /* ~Ya veo...Sé que mi espada no es muy apreciada dentro de los circulos por los que usted se mueve, pero eso ni me importa ni me preocupa paladín. Ahora soy yo quien le previene: ¡Velvevlos y yo somos uno, si usted tiene un problema con ella también lo tiene conmigo!.~ */
== BKELDOR @176 /* ~Urmff, veo que ese artefacto del mal ya ha empezado a afectar a tu voluntad y a tu buen juicio... Te estaré vigilando Thael, ¡juro que no permitiré que arrastres a este grupo a la senda del mal!.~ */
== BTHAEL @177 /* ~¡Dejame en paz paladín!. ¡Me hastían tus advertencias!.~ */
EXIT

CHAIN
IF ~InParty("Jan") InParty("Thael") See("Jan") !StateCheck("Jan",STATE_SLEEPING) Global("BThaelJan","LOCALS",0)~ THEN BJAN TCHAIN112
@178 /* ~Perdona mi buen amigo Thael, pero creo que tienes mala cara.... ese extraño color de piel dorado y esa luz verdosa en tus ojos... cualquiera que no te conociera diría que eres el avatar de algún dios cabreado... ¿Estás bien?.~ */ DO ~SetGlobal("BThaelJan","LOCALS",1)~
== BTHAEL @179 /* ~Mmm, sí , sí estoy bien Jan, mi color de piel, mis ojos...son mutaciones... Se deben al uso de Velvevlos. Sus emanaciones mágicas han ido modificado poco a poco mi estructura física con el fin de hacerme más fuerte y resistente.~ */
== BJAN @180 /* ~Ahh ya veo, es algo parecido a lo que le pasó a mi tía Petronila con su batido de nabos especial.~ */
== BTHAEL @181 /* ~¿Batido de nabos especial?~ */
== BJAN @182 /* ~Sí, ¿no te he contado nunca esa historia?. Verás, en el afan de mi tía Petronila por encontrar el batido de nabos definitivo, empezó a crear batidos con distintas mezclas de especias, pociones de sabores y tipos de nabos. Como no quería que nadie le robará la fórmula, era ella misma quien probaba sus batidos de prueba... Y pasó lo que pasó: Su cara se puso verde, sus ojos se agrandarón tanto que parecía que se les iban a salir de sus cuencas y además su estómago empezó a sonar de tal manera que todo el pueblo salió a la calle asustado pensando que un enorme dragón rojo había entrado en la cocina de mi pobre tía.~ */
= @183 /* ~Por suerte para ella, aquel efecto fue transitorio, pasados unos días, mi tía ya estaba bien y de vuelta a la faena...Por cierto, tanto hablar de batido de nabos, me ha entrado sed... Me queda un poco de zumo de nabos de mi propia cosecha... Dime, ¿te apetece probarlo?.~ */
== BTHAEL @184 /* ~Eeuh...No Jan, mejor, mejor otro día.~ */
EXIT


CHAIN 
IF ~InParty("Jaheira") InParty("Thael") See("Jaheira") !StateCheck("Jaheira",STATE_SLEEPING) Global("ThaelyJaheira","GLOBAL",1) Global("BThaelJaheira","LOCALS",0)~ THEN BJAHEIR TCHAIN113
@185 /* ~ Lamento  la perdida de los tuyos Thael. La masacre de Lorenthelian fue algo que nos afectó a muchos... Yo misma perdí un primo mio. Se llamaba Lequennal, seguramente llegaste a conocerle ¿verdad?.~ */ 
DO ~SetGlobal("BThaelJaheira","LOCALS",1)~
== BTHAEL @186 /* ~ Claro, el bueno de Lequennal, siempre pendiente de los arboles y las flores de los jardines. Era un excelente jardinero.~ */
== BJAHEIR @187 /* ~ Sí, al parecer el interes por cuidar la naturaleza nos viene de familia...~*/
== BTHAEL @188 /* ~ Sabes, no dejarón un arbol con vida, lo quemaron todo Jaheira.~ */
= @189 /* ~Como sabrás Lorenthelian estaba ubicada en una zona en donde la mayoría de los arboles eran más antiguos que el más anciano de los nuestros. ¡Fue una monstruosidad que me encargaré de que paguen con creces!.~ */
== BJAHEIR @190 /* ~ Pues has de saber que cuando llegue ese momento podrás contar conmigo para ajustarle las cuentas a la asesina del pueblo de Lorenthelian y de su bosque. ¡La Naturaleza encontrará la justicia que tanto anhela por aquellos infames actos!. Te doy mi palabra de druida de que así será. ~ */
== BTHAEL @191 /* ~Agradezco tu apoyo Jaheria... gracias.~*/
EXIT

////////////////////////////////////////////////////

CHAIN
IF ~InParty("Nalia") InParty("Thael") See("Nalia") !Detect(NearestEnemyOf(Myself)) !StateCheck("Nalia",STATE_SLEEPING) Global("BThaelNalia","LOCALS",0) Dead("Torgal")~ THEN BNALIA TCHAIN103
@192 /*~Thael, me vendría muy bien tu consejo. Tengo dificultad en la comprensión de un hechizo. ¿Serías tan amable de ayudarme?~*/ DO ~SetGlobal("BThaelNalia","LOCALS",1)~
== BTHAEL @193 /*~¿Necesitas mi ayuda?...Esto me recuerda a cuando enseñaba artes arcanas en Lorenthelian... Está bien, dejame echarle un vistazo...~*/
= @194 /*~A ver...mmm...¡ah, lo encontré!... a esta inscripción rúnica le falta una subramificación arcana aquí, ¿ves?~*/
== BNALIA @195 /*~¡Oh, es verdad! ¿Cómo no lo he visto antes? Vaya, no sé como voy a convertirme en una maga de prestigio si voy cometiendo fallos como estos...~*/  
== BTHAEL @196 /*~Paciencia joven. Como le decía a mis alumnos: "Es cuestión de perseverancia y práctica".~*/
== BNALIA @197 /*~Gracias Thael. Procuraré poner más empeño y practicar más.~*/
== BTHAEL @198 /*~Tienes mucho potencial Nalia. Sigue así. Llegarás lejos.~*/ DO ~AddXPObject("Nalia",10000)~
EXIT

CHAIN
IF ~InParty("Anomen") InParty("Thael") See("Anomen") !StateCheck("Anomen",STATE_SLEEPING) Global("BThaelAnomen","LOCALS",0)~ THEN BANOMEN TCHAIN104
@199 /*~¡Helmo!, tu siervo te  pide que nos ayudes a salir triunfantes ante los nuevos peligros que nos acechan y que tu ...~*/ DO ~SetGlobal("BThaelAnomen","LOCALS",1)~
== BTHAEL @200 /*~¡Basta ya Anomen! ¿Sería mucho pedir que te guardases tus rezos para ti mismo? Estoy cansado de oirte rogar a tu dios durante todo el día.~*/ 
=@201 /*~Mira, hazte un favor y no pierdas más el tiempo suplicando la ayuda a los dioses...seguramente, a la hora de la verdad, te dejarán tirado.~*/
== BANOMEN @202 /*~¡¡Cómo te atreves a hablar así de Helmo!!~*/
=@203 /*~¡Me sorprende que un elfo muestre tal menosprecio ante una entidad divina! Hasta ahora os tenía a los de vuestra raza como gente respetuosa para con los dioses.~*/  
= @204 /*~¡Te lo advierto! ¡No permitiré comentarios como esos en mi presencia! Que los elfos tengáis vuestros propios dioses no os da derecho a despreciar al resto de Panteones Divinos y menos aún a Helmo.~*/
== BTHAEL @205 /*~¿Preferencia por mis propios dioses?... no me has entendido Anomen... Todas las "entidades divinas" a la que tanto os aferráis los creyentes, TODAS ELLAS, se pueden medir por el mismo rasero. ¡Te lo digo por experiencia, confiar en un dios es como darle la espalda a un drow!~*/
=@206 /*~Pero haz lo que quieras clérigo, no añadiré más. Por alguna extraña razón <CHARNAME> te quiere en el grupo, así que no volverás a oir de mi ni media palabra más referente a tu dios...el tiempo se encargará de darme la razón.~*/
EXIT

CHAIN
IF ~InParty("HaerDalis") InParty("Thael") See("HaerDalis") !StateCheck("HaerDalis",STATE_SLEEPING) Global("BThaelHaerDalis","LOCALS",0)~ THEN BHAERDA TCHAIN105
@207 /*~Vaya, vaya, Thael, mi querido gorrión de plumas doradas...así que esa es la legendaria Velvevlos...vaya, vaya...mmm~*/ DO ~SetGlobal("BThaelHaerDalis","LOCALS",1)~
== BTHAEL @208 /*~¿La conoces?~*/ 
== BHAERDA @209 /*~¿Qué si la conozco?. ¿Has oido hablar de los Versos Prohibidos de Thratus Exolikitas de Sigil o de los Manuscritos Impios del Templo Perdido de Rijaj en los profundos Planos Inferiores?... Pues bien amigo mio, digamos que la Entropía me permitió en el pasado tener acceso a ciertos textos y ¡ooh, es fascinante lo que en ellos se relata sobre la Hoja Sangrienta!...¡Sí, tan fascinante como el canto de una bandada de Mirlos Árticos!~*/
== BTHAEL @210 /*~¿Ah sí?, y dime, ¿qué me puedes contar sobre ella?~*/
== BHAERDA @211 /*~¡Oh, mi dorado gorrión!, hablar de lo que me fue revelado está penado con una muerte horrible, pero para saciar tu curiosidad te diré que para encerrar a Velvevlos en esa espada hizo falta todo un ejercito de Celestiales y ...~*/
= @212 /*~...y bueno...hay mucho más que podría contarte sobre lo que fue la vida de Velvevlos, el Devorador de Almas, aunque...aunque debería callarme...nunca se sabe quien puede estar escuchando...(la cara de Haer'Dalis palidece notablemete tras decir estas palabras)~*/ 
= @213 /*~¿Sabes?, personalmente creo que quien escribió aquellos versos se dejó llevar bastante por la musa de la épica y la fantasía...yo personalmente no me creo que fuera tan poderoso...pero...~*/
== BTHAEL @214 /*~¿Pero?~*/
== BHAERDA @215 /*~Pero procura no hacerla enfadar, Portador de la Hoja Sangrienta.~*/
EXIT


///////////////////////////////////////////////////

//********************

CHAIN
IF ~Dead("Keldorn") Global("KeldornDie","LOCALS",0)~ THEN BTHAEL TCHAIN201
@216 /* ~El viejo paladín ha caido... (Un problema menos del que preocuparnos Velvevlos).~ */ DO ~SetGlobal("KeldornDie","LOCALS",1)~ 
EXIT


CHAIN 
IF ~Dead("Viconia") Global("ViconiaDie","LOCALS",0)~ THEN BTHAEL TCHAIN202
@217 /* ~La drow ha muerto... (Sí Velvevlos, se nos han adelantado).~ */ DO ~SetGlobal("ViconiaDie","LOCALS",1)~ 
EXIT

//********************

















