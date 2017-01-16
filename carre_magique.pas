//ALGORITHME : CARRE_MAGIQUE
//BUT : faire un programme qui fait apparaître un carré magique. Ce carré magique aura une dimension impaire défini en constante.
//On pourra ainsi changer la taille du carré en changeant la constante.
//Un carré magique est un tableau d’entier à deux dimensions dont toutes les lignes,
//toutes les colonnes et les deux diagonales ont la même somme.
//ENTREE : les fonctions
//SORTIE: le carré magique
//CONSTANTE : 
//			N<== 5
//TYPE carre_magique = Tableau[1..N,1..N] de ENTIER
//
//
//Procedure affichage(tabA:carre_magique)
//	VAR
//		i,j:ENTIER
//			
//	DEBUT
//		POUR j <- 1 A N FAIRE
//			DEBUT
//				POUR i <- 1 A N FAIRE
//					DEBUT
//						SI tabA[i,j]<=9 ALORS  
//							ECRIRE("  "& tabA[i,j]) 
//						SINON
//							ECRIRE(" "& tabA[i,j])	
//						FINSI
//					FIN
//				ECRIRE 
//				FINPOUR
//			FIN
//		FINPOUR
//	FIN
//Procédure BordureDroite(var bdx:ENTIER; var bdy:ENTIER)
//
//	DEBUT
//		SI bdx>N ALORS 
//			DEBUT
//				bdx <- 1  		
//			FIN
//		FINSI
//		SI bdy<1 ALORS 
//			DEBUT
//				bdy <- N 
//			FIN
//		FINSI
//	FIN


//Procédure BordureGauche(var bgx:ENTIER; var bgy:ENTIER) 

//	DEBUT
//		SI bgx-1<1 ALORS
//			bgx <- N  
//		SINON
//			bgx <- bgx-1  
//		FINSI
//		SI bgy-1<1 ALORS
//			bgy <-N  
//		SINON
//			bgy <- bgy-1  
//		FINSI
//	FIN


//Fonction Test (tabB:Tableau2dim; tx:ENTIER ; ty:ENTIER) 
	
//	DEBUT
//		SI tabB[tx,ty]=0 ALORS
//			Test <- VRAI 
//		SINON
//			Test <- FAUX  
//		FINSI
//	FIN
	

//Procedure Initialisation(VAR mtrcA:Tableau2dim; VAR abs:ENTIER; VAR ord:ENTIER);
	
//	VAR
//		i,j:ENTIER
			
//	DEBUT
//		POUR j <- 1 A N FAIRE
//			DEBUT
//				POUR i <- 1 A N FAIRE
//					DEBUT
//						mtrcA[i,j] <- 0
//					FIN
//				ECRIRE
//				FINPOUR
//			FIN
//		mtrcA[(N/2)+1,(N/2) <- 1]
//		abs <- ((N/2)+1)
//		ord <- (N/2)
//		FINPOUR
//	FIN
	

//Procédure Remplissage(VAR tab:Tableau2dim; VAR x:ENTIER; VAR y:ENTIER)  
	
//	VAR
//		i,j:ENTIER
			
//	DEBUT
//		POUR i <- 2 A (N*N) FAIRE 
//			x <- x+1
//			y <- y-1 
//			BordureDroite(x,y) 
//			SI (Test(tab,x,y)=FAUX) ALORS 
//				DEBUT
//					REPETER
//						BordureGauche(x,y)  
//					JUSQU'A (Test(tab,x,y)=VRAI)
//					FINREPETER 
//				FIN
//			tab[x,y] <- i  
//			affichage(tab)
//			FINSI  
//		FINPOUR
//	FIN
//VAR
//	mtrc:Tableau2dim
//	abscisse,ordonnee:ENTIER
	
//DEBUT
//	mtrc <- Initialisation 
//	abscisse <- Initialisation
//	ordonnee <- Initialisation
//	Remplissage(Matrice,abscisse,ordonnee)
//	LIRE
//FIN

PROGRAM TP_CARRE_MAGIQUE;

USES crt;

CONST
	N=5;

TYPE
	carre_magique = array[1..N,1..N] of INTEGER;	//Cree une matrice de 5x5 cases

Procedure affichage(tabA:carre_magique);		//Cette procédure permet de creer le carre magique
	VAR
		i,j:INTEGER;
			
	BEGIN
		FOR j:= 1 TO N DO 						// cree les colonnes
			BEGIN
				FOR i:= 1 TO N DO 				// cree les lignes
					BEGIN
						IF (tabA[i,j] <= 9) THEN 	// creation d'espace entre les chiffres
							write ('  ',tabA[i,j])
						ELSE
							write (' ',tabA[i,j])
					END;
				writeln;				
			END;		
	END;

Procedure BordureDroite(var bdx:INTEGER; var bdy:INTEGER);	// teste si le caractère actuel a atteint la bordure droite ou haute

	BEGIN
		IF (bdx>N) THEN 
			BEGIN
				bdx:=1;  					//renvoie le caractère a la bordure gauche
			END;
		IF (bdy<1) THEN 
			BEGIN
				bdy:=N;						// renvoie le caractère a la bordure basse
			END;
	END;

Procedure BordureGauche(var bgx:INTEGER; var bgy:INTEGER);	//	teste si le caractère a atteint la bordure gauche ou basse

	BEGIN
		IF (bgx-1<1) THEN
		BEGIN
			bgx:=N;
		END 
		ELSE
		BEGIN
			bgx:=bgx-1; 
		END;
		IF (bgy-1<1) THEN
		BEGIN
			bgy:=N; 
		END
		ELSE
		BEGIN
			bgy:=bgy-1;
		END;
	END;

Function Test (tabB:carre_magique; tx:INTEGER ; ty:INTEGER): BOOLEAN;	// teste si la case actuelle est occupé ou non par une autre valeur non nulle
	
	BEGIN
		IF (tabB[tx,ty]=0) THEN
		BEGIN
			Test := TRUE;
		END
		ELSE
		BEGIN
			Test:= FALSE; 
		END;
	END;

Procedure Initialisation(VAR mtrcA:carre_magique; VAR abs:INTEGER; VAR ord:INTEGER); // place le 1 en position (3,2)
	
	VAR
		i,j: integer;
			
	BEGIN
		FOR j:=1 TO N DO
		BEGIN
			FOR i := 1 TO N DO
			BEGIN
				mtrcA[i,j] := 0;
			END;
			writeln;
		END;
		mtrcA[(N DIV 2)+1,(N DIV 2)]:=1;
		abs:= ((N DIV 2)+1);
		ord:= (N DIV 2);
	END;

Procedure Remplissage(VAR tab:carre_magique; VAR x:INTEGER; VAR y:INTEGER); //remplit les cases du carre magique
	
	VAR
		i,j:INTEGER;
			
	BEGIN
		FOR i:=2 TO (N * N) DO
		BEGIN 
			x := x+1;
			y := y-1;
			BordureDroite(x,y); 
			IF (Test(tab,x,y)=FALSE) THEN 
				BEGIN
					REPEAT
						BordureGauche(x,y);  
					UNTIL (Test(tab,x,y)=TRUE);
				END;
			tab[x,y] := i;		//Remplace la valeur de la case(0) par un chiffre allant de 2 à 25 
			clrscr;
			affichage(tab);  	// Affiche le carre magique
		END;
	END;


VAR
	mtrc:carre_magique;
	abscisse,ordonnee:INTEGER;
	
BEGIN
	clrscr;
	Initialisation(mtrc,abscisse,ordonnee);
	Remplissage(mtrc,abscisse,ordonnee);
	readln;
END.