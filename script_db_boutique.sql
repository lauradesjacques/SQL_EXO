#1. Créer la base de donnée sous le nom de 'Boutique'
CREATE DATABASE IF NOT EXISTS Boutique ;

#2. Création des tables (Manufacturers, Products)
CREATE TABLE Manufacturers ( Code INT PRIMARY KEY NOT NULL
        AUTO_INCREMENT, Name VARCHAR(50) );
CREATE TABLE Products ( Code INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        Name VARCHAR(50), Price REAL, ManuID INT, FOREIGN KEY (ManuID)
        REFERENCES Manufacturers(Code));

#3. Inserer dans la table Manufacturers les valeurs
INSERT INTO `Manufacturers` (`Name`) VALUES ('Sony');
INSERT INTO `Manufacturers` (`Name`) VALUES ('Creative Labs');
INSERT INTO `Manufacturers` (`Name`) VALUES ('Hewlett-Packard');
INSERT INTO `Manufacturers` (`Name`) VALUES ('Lenovo');
INSERT INTO `Manufacturers` (`Name`) VALUES ('Winchester');
INSERT INTO `Manufacturers` (`Name`) VALUES ('Apple');

#4. Inserer dans la table Products les valeurs
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('Hard drive', '240','5');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('Memory', '120','6');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('ZIP drive', '150','4');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('Floppy Disk', '5','6');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('Monitor', '240','1');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('DVD drive', '180','2');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('CD drive', '90','2');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('Printer', '270','3');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('Toner cartridge', '66','3');
INSERT INTO `Products` (`Name`, `Price`, `ManuID`) VALUES ('DVD burner', '180','2');

#5. Selectionner le nom de tout les produits
SELECT Name FROM Products;

#6. Sélectionner les noms et les prix de tous les produits présents dans votre database
SELECT Name, Price FROM Products;

#7. Sélectionner le nom des produits dont le prix est inférieur ou égal à 200
SELECT Name FROM Products WHERE Price <= 200;

#8. Sélectionner tous les produits dont le prix est compris entre 50 et 120
SELECT * FROM Products WHERE Price BETWEEN '50' AND '120';

#9. Sélectionner le nom et le prix en centimes (càd le prix doit être multiplié par 100)
 SELECT Name, Price*100 AS PriceCents FROM Products;

 #10. Calculer le prix moyen de tous les produits
 SELECT SUM(Price)/COUNT(Price) AS PriceMean FROM Products;

 #11. Calculer le prix moyen de tous les produits dont le code fabriquant est égal à 2
 SELECT SUM(Price)/COUNT(Price) AS PriceMean FROM Products WHERE ManuID = 2;

 #12. Calculer le nombre de produits dont le prix est supérieur ou égal à 180
 SELECT COUNT(Price) AS nb_products FROM Products WHERE Price >= 180;

#13. Sélectionner le nom et le prix de tous les produits dont le prix est supérieur ou égal à 180$,
#et trier par prix par ordre décroissant puis nom par ordre croissant
 SELECT Name, Price FROM Products WHERE Price >= 180 ORDER BY Price DESC, Name ASC;

 #14. Sélectionner toutes les données des produits y compris les données relatives aux fabricants
 SELECT * FROM Products JOIN Manufacturers ON Products.ManuID=Manufacturers.code;

 #Je renomme mes colonnes
ALTER TABLE Products CHANGE Name NameP VARCHAR(50) ;
ALTER TABLE Manufacturers CHANGE Name NameM VARCHAR(50);

#15. Sélectionner le nom du produit, le prix et le nom du fabriquant de tous les produits
SELECT NameP, Price, NameM FROM Products JOIN Manufacturers ON Products.ManuID=Manufacturers.code;

#16. Calculer le prix moyen des produits de chaque fabricant, en indiquant uniquement celui-ci
#par son code.
 SELECT AVG(Price) AS MeanProduct, Manufacturers.Code FROM Products JOIN Manufacturers ON Products.ManuID=Manufacturers.code GROUP BY Manufacturers.Code;

#17. Calculer le prix maximum d'un produit vendu par fabriquant.
  SELECT MAX(Price) AS MaxPrice, Manufacturers.NameM FROM Products JOIN Manufacturers ON Products.ManuID=Manufacturers.code GROUP BY Manufacturers.NameM ;

#18. Sélectionner les noms des fabricants dont les produits ont un prix moyen supérieur
  #ou égal à 150
  SELECT Manufacturers.NameM FROM Products JOIN Manufacturers ON Products.ManuID=Manufacturers.code WHERE (SELECT AVG(Price) >= 150) GROUP BY Manufacturers.NameM;

  #19. Sélectionner les noms et les prix du produit le moins cher et le plus cher
  SELECT NameP, Price FROM Products WHERE price IN ((SELECT MIN(Price) FROM Products),( SELECT MAX(Price)FROM Products)) ;

  #20. Ajouter un nouveau produit : Loudspeakers, 70$, manufacturer 2
  INSERT INTO `Products` (`NameP`, `Price`, `ManuID`) VALUES ('Loudspeakers', '70','2');

  #21. Mettre à jour le nom du produit 8 en « Laser Print »
  UPDATE Products SET NameP='Laser Print' WHERE Code=8;

  #22. Appliquer une remise de 10% à tous les produits et stocker ce résultat dans une nouvelle
 #colonne de la table
 ALTER TABLE Products ADD Remise FLOAT;
UPDATE Products SET Remise = Price*0.90;
#Pensez à decocher safe update dans preferences SQL

#23. Appliquer une remise de 10% à tous les produits dont le prix est supérieur ou égal à 120
UPDATE Products SET Remise = Price*0.90 WHERE Price >= 120;
