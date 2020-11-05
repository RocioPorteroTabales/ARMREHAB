
centHombroVerde=[];
centCodo=[];
centMunecaRojo=[];
centCadera=[];
CHombro=[];
CCadera=[];
CMuneca=[];
CCodo=[];

%�ngulos de las diferentes articulaciones
angHombroPitchFinal=[];
angCodoPitchFinal=[];


%%%%%%%%%%%%%%CALCULO DE �NGULOS%%%%%%%%%%%%%%%%%%%%%%%%%%
%�NGULO DE FLEXOEXTENSI�N DEL HOMBRO
%El objetivo es construir un tri�ngulo escaleno con los centros del
%hombro,codo y cadera para sacar el �ngulo de flexoextensi�n del hombro, para ello sacamos la
%distancia que hay entre el hombro y el codo(brazo), entre el hombro y la
%cadera (tronco) y entre el codo y cadera.

%el centroide nos da dos coordenadas por lo que la distancia del brazo se
%descompondr� en x e y para luego caclular la distancia de la misma 
distanciaBrazo= centCodo-centHombroVerde;
disBrazoX=(distanciaBrazo(1));
disBrazoY=(distanciaBrazo(2));

distanciaTronco= centCadera-centHombroVerde;
disTroncoX=(distanciaTronco(1));
disTroncoY=(distanciaTronco(2));

distanciaCodo_Cadera= centCadera-centCodo;
disCodo_CaderaX=(distanciaCodo_Cadera(1));
disCodo_CaderaY=(distanciaCodo_Cadera(2));

%C�lculamos las distancias del tri�ngulo escaleno
brazo=sqrt((disBrazoX^2)+ (disBrazoY^2));
codo_cadera=sqrt((disCodo_CaderaX^2)+ (disCodo_CaderaY^2));
tronco=sqrt((disTroncoX^2)+(disTroncoY^2));

%Una vez que hemos construido el tri�ngulo conociendo sus distancia ,
%calcularemos el �ngulo de flexoextensi�n que forma el hombro con el
%teorema del coseno ----> a^2=b^2+c^2-2*b*a*cos(ang), despejando coseno del
%angulo nos queda lo siguiente a^2-b^^-c^
tCoseno=((codo_cadera^2-tronco^2-brazo^2)/((-2)*(tronco*brazo)));%siendo a=codo_cadera,b=tronco,c=brazo)

%Hemos obtenido el cos(ang) para extraer el ang debemos hacer la
%arccoseno
arcHombro= acos(tCoseno);
%El �ngulo nos lo dan en radianes y hay que pasarlo a grados para su uso
angHP= rad2deg(arcHombro);
angHombroPitchFinal=[angHombroPitchFinal,angHP];

%%%%%%%%%%%%%ANGULO DE FLEXOEXTENSION DEL CODO%%%%%%%%%%%%%%%%%%%
distanciaAntebrazo= centMunecaRojo-centCodo;
disAntebrazoX=(distanciaAntebrazo(1));
disAntebrazoY=(distanciaAntebrazo(2));

distanciaHombro_Muneca= centMunecaRojo-centHombroVerde;
disHombro_MunecaX=(distanciaHombro_Muneca(1));
disHombro_MunecaY=(distanciaHombro_Muneca(2));

%C�lculamos las distancias del tri�ngulo escaleno
antebrazo=sqrt((disAntebrazoX^2)+ (disAntebrazoY^2));
hombro_muneca=sqrt((disHombro_MunecaX^2)+ (disHombro_MunecaY^2));

%Una vez que hemos construido el tri�ngulo conociendo sus distancia ,
%calcularemos el �ngulo de flexoextensi�n que forma el hombro con el
%teorema del coseno ----> a^2=b^2+c^2-2*b*a*cos(ang), despejando coseno del
%angulo nos queda lo siguiente a^2-b^^-c^
tCoseno1=((hombro_muneca^2-antebrazo^2-brazo^2)/((-2)*(antebrazo*brazo)));%siendo a=codo_cadera,b=tronco,c=brazo)

%Hemos obtenido el cos(ang) para extraer el ang debemos hacer la
%arccoseno
arcCodo= acos(tCoseno1);
%El �ngulo nos lo dan en radianes y hay que pasarlo a grados para su uso
angCPITCH= rad2deg(arcCodo);
angCodoPitchFinal=[angCodoPitchFinal,angCPITCH];


 
