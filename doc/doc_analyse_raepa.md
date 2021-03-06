![GeoCompiegnois](img/geocompiegnois_2020_reduit_v2.png)

# Analyse du géostandard et problématiques d'implémentation locale

## Analyse geostandard RAEPA 1.2 (en complément de l'analyse de la version 1.1)

### partie B - Modèle conceptuel de données

#### Général

- Aucune spécification au niveau le plus fin. Pas de classes de regard, ou de STEP par exemple, avec des informations propres au type d'objet. Exemple : capacité équivalent habitant dans le cas d'une STEP (ouvrage).
- Domaine des matériaux : liste non pertinente qui ne gère pas les types de matériaux génériques. Exemple : un béton sera codé 99 comme un fibre. Nous perderons donc la valeur de l'information alors que nous l'avions initialement. Nécessite de revoir cette liste, probablement avec un double code (10 béton, 11 béton armé, 12 béton fibré, etc.)
- Définitions non identiques entre les parties B et C.

#### Classe de métadonnées

- propMD nommé autattrib dans le MCD et dans la Partie C, mais pas dans la définition des classes partie B.

#### Classe de noeud

- anMESSup et anMESInf nommés différemment dans la partie C
- anMESSup et anMESInf sont présents sur la classe noeud. Dans les associations, nous sommes en cardinalités 1. On ne peut avoir qu'un ouvrage ou un appareillage par noeud. Sur une extremité de linéaire avec un ouvrage et un ou plusieurs appareillages, cela implique la duplication d'autant de noeud que d'objets ? Cela ne correspond pas à l'aspect d'un réseau de topologie...


#### Canalisation

- idCanalisation nommé idcana dans la partie C.
- diametreNominal nommé diametre dans la partie C.
- anPoseSup nommé anfinpose dans la partie C.
- anPoseInf nommé andebpose dans la partie C.
- exploitant nommé gexploit dans la partie C.
- maitreOuvrage nommé mouvrage dans la partie C et définition différente.
- branchement nommé branchmt dans la partie C.
- modeCirculation nommé modecirc dans la partie C.
- longueur nommé longcana dans la partie C.
- manque attribut nbranche qui est présent partie C.
- Type booléen pour enservice et branchement alors que character varying (1) partie C.
- Précision de la longueur de canalisation en décimal, alors que de type entier dans la partie C.

#### Canalisation AE

- contCanAE nommé contcanaep partie C.
- fonctionCanAE nommé fonccanaep partie C.
- filGen nommé profgen partie C. Usage pour le DT-DICT qui n'a pas sa spécificité sur un réseau d'ae. L'emploi de la profondeur par rapport à la cote NGF est par ailleurs dangereuse et il aurait été plus pertinent d'utiliser la côte de la génératrice supérieure

#### Canalisation ASS

- fonctionCanAss nommé fonccanass partie C.
- typeReseau nommé typreseau partie C.
- altamont nommé zamont partie C.
- altaval nommé zaval partie C.
- sensecoul non présent alors que présent dans la partie C.

#### Noeud

- On retrouve maitreOuvrage et exploitant alors que déjà dans la classe métadonnées.
- anMESSUP nommé anfinpose dans la partie C.
- anMESInf nommé andebpose dans la partie C.
- Absence des attributs idcanamont et idcanaval présents dans la partie C pour les ouvrages et appareillages. Usage non pertinent dans le cas de noeuds joints par plusieurs canalisations (supérieur à 2).

#### Appareillage

- Absence de attribut diametre présent dans la partie C.

#### Appareillage AE

- typAppAE nommé fnappaep dans partie C.

#### Appareillage ASS

- typeReseau nommé typreseau partie C.
- typAppAss nommé fnappass partie C.

#### Ouvrage

- altRadierOuvrage nommé z partie C et définition non précise dans la partie C.

#### Ouvrage AE

- typOuvrageAE nommé fnouvaep dans partie C.

#### Ouvrage ASS

- typeReseau nommé typreseau partie C.
-typOuvrageAss nommé fnouvass partie C.

#### Réparation

- idReparation nommé idrepar partie C.
- supportIncident nommé supprepar partie C.
- typeDefaillance nommé defreparee partie C.
- dateIntervention nommé daterepar partie C.
- maitreOuvrage nommé mouvrage partie C.
- Absence des attributs X et Y présents partie C. Possibilité de les générer avant export au standard raepa.

### partie C - Structure des données

- D'une manière générale, les types de sont pas correctement définis. Un entier (4) n'existe pas. De plus, un décimal (1,2) semble techniquement impossible, si l'on considère la définition de ce type pour un SGBD, où la première valeur correspond au nombre totaux de nombres, et la seconde aux nombres définit après la virgule.
-Sur le fichier raepa_ouvraep_p, les attributs dategeoloc et sourgeoloc sont respectivement de type caractère(2) et date(10). Il y a une coquille. De plus il manque le type de l'attribut qualannee, que l'on retrouve sur les autres fichiers.


#### Fichiers de ponctuels (ouvrage et appareillage de tout réseau)

- andebpose et anfinpose nommés différemment dans la partie B. Ces deux attributs sont nommés de manière identique que les fichiers de linéaires, mais la définition n'est pas la même. On parle, d'un côté, de la date de début et fin de pose, puis, de l'autre, de la date de mise en service et de mise hors service.
De plus, l'attribut anfinpose est obligatoire. Pour les appareils et ouvrages, toujours en service, on remplit quoi ?
Il y a ici un incohérence. Soit, nous parlons de mise en service pour les ponctuels, avec un nom d'attribut tel que définit dans la partie B (anMESInf et anMESSup) et l'on rend obligatoire anMESInf et non pas anMESSUp, soit on estime que ce sont des années de début et fin de pose, et dans ce cas, on peut rattacher ces informations à la super classe d'obejt de réseau. 
On pourrait aussi imaginer mettre l'attribut enservice O/N de canalisation à la superclasse. Nous aurions donc l'information sur les années de début et fin de pose d'un ouvrage ou appareillage, et la connaissance de son fonctionnement ou non.

-idcanamont et idcanaval obligatoire. Dans le cas d'une fin de réseau, ou d'un linéaire de branchement, il n'y a pas de idcanaval. Si ouvrage = captage, pas de canalisation en amont non plus.

### partie Gabarit shp

- Dans le fichier shape raepa_canalaep_l, le diamètre est de type caractère (5) au lieu d'entier.

## Analyse geostandard RAEPA 1.1

### partie B - Modèle conceptuel de données

- ensemble des id est de type char(254)
- a priori, la précision x,y,z est au millimètre

#### classe canalisation

- contraintes : canalisation sont des noeuds aux 2 extrémités sauf pour une canalisation de branchement individuel ...
Ceci semble diverger avec les règles, même adaptées pour les branchements, qui sont posées en B.1.3. Le reste du document donne plutôt l'impression qu'au noeud non coupant sur une canalisation, on place à minima un noeud appareillage de type piquage non sécant.
- maitreOuvrage : prévoir des domaines de valeurs
- exploitant : prévoir des domaines de valeurs
- longueur : réelle ou calculée ??

#### ss classe canalisation ae

- filGen : pourquoi cet attribut est considéré comme spécifique d'un réseau ae ?

#### super classe noeud

- choix de modélisation sur le fait qu'un noeud est obligatoirement un appareillage et/ou un ouvrage. Cette classe ne peut pas gérer des noeuds de raccord "fictifs" pour faire des jonctions hors présence d'ouvrage ou d'appareillage (ex noeud fictif de raccord entre 2 communes pour besoin de la base de données)

#### classe appareillage

- altiNoeud : de quelle référence parle t-on ?

### partie C - Structure des données

- de manière générale, le choix de l'ordre des attributs des classes implémentées mérite d'être explicité ...

#### table canalisation

- IDCANPPALE : ne semble présenter un interet que dans le cas d'un branchement avec un piquage sur une cana maitresse (cad, par la présence d'un noeud de piquage "non coupant" 
- LONGCANA : pourquoi simplifier en déclarant de l'entier (mètre) ? cela correspond il a un calcul ou une longueur réelle ?
- CONTCANAEP/CONTCANASS : pourquoi "CONT" alors que cela fait référence à un domaine de valeur parlant de "catégorie" donc plutôt "CAT" ?

#### table apparaep

- DIAMETRE : d'où vient cet attribut par rapport au MCD ? à priori, devrait être placer au niveau de classe appareillage car l'attribut est présent dans les tables d'appareillage ae et ass et absent pour les tables d'ouvrages
- IDCANAVAL et IDCANAMONT : voir dans quelle mesure ces info peuvent être héritées des propriétés relationnelles plutot que saisie manuellement ... a priori cela devrait dépendre du sens d'écoulement de la cana.

#### table reparation


## Problématiques d'implémentation

### modélisation

- id de type char(254) alors que nous utilisons classiquement des entiers
- des sous classes spécialisées à prévoir pour porter des attributs spécifiques (ex : différents type d'avaloir)
- besoin de classe d'habillage (ex : emprise de bassin)
- besoin attribut "insee" pour filtrer et gestion des droits ==> implication sur la modélisation globale. Attention au cas de réseau sur voie entre 2 communes (ex : verberie/St Vaast), comment traiter le sujet ?
- urbanisation geom entre pcrs et base métier raepa ??? ==> complexe à ce stade (absence de base topo locale)
- IDSUPREPAR : voir comment gérer la vérification de l'id (fkey) en fonction de l'attribut qui dit le type de support. en fonction, il faudra vérifier soit l'idcana, soit l'idappareil, soit l'idouvrage ??? en passant l'id en type texte comme attendu, on doit pouvoir préfixer l'id par le type de classe puis un numero de sequence. de cette façon, pas de doublon de numero d'ordre pour l'id possible entre plusieurs classes. A cela s'ajoute l'obligation d'avoir une table de passage contenant l'ensemble des id des différentes classes du réseaux (cana, noeud, appar, ouvr) pour pouvoir placer la fkey sur celle-ci. Si cela n'est pas fait, le controle ne se fera pas par le biais d'une fkey mais par un trigger en cas de mise à jour. Ceci est autant que possible à proscrire. Cette table des id pourrait peut être également servir de table de correspondance et accueillir l'id externe du producteur de la donnée.
- prévoir de gérer l'archivage ou à défaut, l'état "actif", "abandonner" ou "supprimé" du réseau. Ne pas oublier que pour les DT-DICT, un réseau "abandonné" reste cartographier car physiquement présent mais plus en fonctionnement. En revanche, un réseau supprimé physiquement n'est plus à faire figurer pour le dt-dict.

### test reprise de données

- le domaine de valeur "materiau" est trop fin et n'a pas été conçu pour gérer des logiques d'emboitement (ex : 10 pour du PVC dont 11 pour du PVC ancien, 12 pour du PVC BO etc ...). Il en resulte une incapacité de migration d'information entre les sources et le domaine cible en raepa. Ceci induit une perte importante d'information ou un ajout inconsidéré d'attributs optionnels locaux. Voir dans quelle mesure une adaptation n'est pas possible (domaine local reconstruit avec table de passage pour export RAEPA ...)
- absence attribut date_pose alors que cette information est parfois connue. Si pas d'ajout d'un champ optionnel, perte d'info
- absent attribut hauteur, largeur qui permettrait de gérer les formes de "cana" type dalot rectangulaire en plus de l'attribut diametre
- prévoir peut être un attribut complémentaire "section" permetant de préciser le type de section de la canalisation avec un domaine de valeur associé (ex : circulaire, ovoide, dalot rectangulaire ...). voir si c'est une propriété de cana, ou propriété de sstype AEP/ASS 

### extension du modèle d'échange

- id_delegat varchar(254) : id des objets propre au delegataire, à ajouter afin de maintenir un appariement avec la base de la collectivité
