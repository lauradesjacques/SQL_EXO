# 1. Quelle requête utiliser pour afficher l'ensemble des enregistrements de la table 
#Coucou_Livres ?
SELECT * FROM exo.Coucou_Livres;

#2. Quelle requête utiliser pour sélectionner uniquement les livres qui ont un prix
#strictement supérieur à 20 de la table Coucou_Livres ?
SELECT * FROM Coucou_Livres WHERE prix > 20 ;

#3. Quelle requête utiliser pour trier les enregistrements de la table Coucou_Livres du
#prix le plus élevé aux prix le plus bas ?
SELECT * FROM Coucou_Livres ORDER BY prix DESC;

#4. Quelle requête utiliser pour récupérer le prix du livre le plus élevé de la table
#Coucou_Livres ?
SELECT MAX(prix) FROM Coucou_Livres ;

#5. Quelle requête utiliser pour récupérer les livres de la table Coucou_Livres qui ont un
#prix compris entre 20 et 22 ?
SELECT * FROM Coucou_Livres WHERE prix BETWEEN '20' AND '22';

#6. Quelle requête utiliser pour récupérer tous les livres de la table Coucou_Livres à
#l'exception de celui portant la valeur pour la colonne isbn_10 : 2092589547 ?
SELECT * FROM Coucou_Livres WHERE isbn_10 != '2092589547';


#7. Quelle requête utiliser pour récupérer le prix du livre le moins élevé de la table
#Coucou_Livres en renommant la colonne dans les résultats par minus ?
SELECT MIN(prix) AS minus FROM Coucou_Livres;

#8. Quelle requête utiliser pour sélectionner uniquement les 3 premiers résultats sans le
#tout premier de la table Coucou_Livres ?
SELECT * FROM Coucou_Livres LIMIT 3 OFFSET 1;


