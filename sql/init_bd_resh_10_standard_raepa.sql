/*RAEPA V1.1*/
/*Creation du squelette de la structure des données (table, séquence, trigger,...) au standard RAEPA */
/*init_bd_resh_10_standard_raepa.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Florent Vanhoutte */



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        DROP                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- vue

DROP VIEW IF EXISTS m_reseau_humide.raepa_canalaep_l;
DROP VIEW IF EXISTS m_reseau_humide.raepa_canalass_l;
DROP VIEW IF EXISTS m_reseau_humide.raepa_apparaep_p;
DROP VIEW IF EXISTS m_reseau_humide.raepa_apparass_p;
DROP VIEW IF EXISTS m_reseau_humide.raepa_ouvraep_p;
DROP VIEW IF EXISTS m_reseau_humide.raepa_ouvrass_p;
DROP VIEW IF EXISTS m_reseau_humide.raepa_reparaep_p;
DROP VIEW IF EXISTS m_reseau_humide.raepa_reparass_p;

-- fkey

ALTER TABLE IF EXISTS m_reseau_humide.raepa_metadonnees DROP CONSTRAINT IF EXISTS val_raepa_qualite_anpose_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_metadonnees DROP CONSTRAINT IF EXISTS val_raepa_qualite_geoloc_xy_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_metadonnees DROP CONSTRAINT IF EXISTS val_raepa_qualite_geoloc_z_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_canal DROP CONSTRAINT IF EXISTS val_raepa_materiau_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_canal DROP CONSTRAINT IF EXISTS val_raepa_mode_circulation_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_canalaep DROP CONSTRAINT IF EXISTS val_raepa_cat_canal_ae_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_canalaep DROP CONSTRAINT IF EXISTS val_raepa_fonc_canal_ae_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_canalass DROP CONSTRAINT IF EXISTS val_raepa_cat_reseau_ass_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_canalass DROP CONSTRAINT IF EXISTS val_raepa_cat_canal_ass_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_canalass DROP CONSTRAINT IF EXISTS val_raepa_fonc_canal_ass_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_apparaep DROP CONSTRAINT IF EXISTS val_raepa_cat_app_ae_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_apparass DROP CONSTRAINT IF EXISTS val_raepa_cat_reseau_ass_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_apparass DROP CONSTRAINT IF EXISTS val_raepa_cat_app_ass_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_ouvraep DROP CONSTRAINT IF EXISTS val_raepa_cat_ouv_ae_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_ouvrass DROP CONSTRAINT IF EXISTS val_raepa_cat_reseau_ass_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_ouvrass DROP CONSTRAINT IF EXISTS val_raepa_cat_ouv_ass_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_repar DROP CONSTRAINT IF EXISTS val_raepa_support_incident_fkey;
ALTER TABLE IF EXISTS m_reseau_humide.raepa_repar DROP CONSTRAINT IF EXISTS val_raepa_defaillance_fkey;

-- classe

DROP TABLE IF EXISTS m_reseau_humide.raepa_metadonnees;
DROP TABLE IF EXISTS m_reseau_humide.raepa_canal;
DROP TABLE IF EXISTS m_reseau_humide.raepa_canalaep;
DROP TABLE IF EXISTS m_reseau_humide.raepa_canalass;
DROP TABLE IF EXISTS m_reseau_humide.raepa_noeud;
DROP TABLE IF EXISTS m_reseau_humide.raepa_appar;
DROP TABLE IF EXISTS m_reseau_humide.raepa_apparaep;
DROP TABLE IF EXISTS m_reseau_humide.raepa_apparass;
DROP TABLE IF EXISTS m_reseau_humide.raepa_ouvr;
DROP TABLE IF EXISTS m_reseau_humide.raepa_ouvraep;
DROP TABLE IF EXISTS m_reseau_humide.raepa_ouvrass;
DROP TABLE IF EXISTS m_reseau_humide.raepa_repar;

-- domaine de valeur

DROP TABLE IF EXISTS m_reseau_humide.val_raepa_materiau;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_mode_circulation;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_qualite_anpose;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_qualite_geoloc;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_support_incident;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_defaillance;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_cat_canal_ae;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_fonc_canal_ae;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_cat_app_ae;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_cat_ouv_ae;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_cat_reseau_ass;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_cat_canal_ass;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_fonc_canal_ass;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_cat_app_ass;
DROP TABLE IF EXISTS m_reseau_humide.val_raepa_cat_ouv_ass;

-- sequence
DROP SEQUENCE IF EXISTS m_reseau_humide.raepa_idraepa;
DROP SEQUENCE IF EXISTS m_reseau_humide.raepa_idrepar;

/*

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                       SCHEMA                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Schema: m_reseau_humide

-- DROP SCHEMA m_reseau_humide;

CREATE SCHEMA m_reseau_humide

COMMENT ON SCHEMA m_reseau_humide
  IS 'Données géographiques métiers sur le thème des réseaux humides';

*/


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ###################
-- ##    AEP/ASS    ##
-- ################### 


-- Table: m_reseau_humide.val_raepa_materiau

-- DROP TABLE m_reseau_humide.val_raepa_materiau;


CREATE TABLE m_reseau_humide.val_raepa_materiau
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_materiau_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_materiau
  IS 'Matériau constitutif des tuyaux composant une canalisation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_materiau.code IS 'Code de la liste énumérée relative au matériau constitutif des tuyaux composant une canalisation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_materiau.valeur IS 'Valeur de la liste énumérée relative au matériau constitutif des tuyaux composant une canalisation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_materiau.definition IS 'Définition de la liste énumérée relative au matériau constitutif des tuyaux composant une canalisation';

INSERT INTO m_reseau_humide.val_raepa_materiau(
            code, valeur, definition)
    VALUES
('00','Indéterminé','Canalisation composée de tuyaux dont le matériau est inconnu'),
('01','Acier','Canalisation composée de tuyaux d''acier'),
('02','Amiante-ciment','Canalisation composée de tuyaux d''amiante-ciment'),
('03','Béton âme tôle','Canalisation composée de tuyaux de béton âme tôle'),
('04','Béton armé','Canalisation composée de tuyaux de béton armé'),
('05','Béton fibré','Canalisation composée de tuyaux de béton fibré'),
('06','Béton non armé','Canalisation composée de tuyaux d''amiante-ciment'),
('07','Cuivre','Canalisation composée de tuyaux de cuivre'),
('08','Fibre ciment','Canalisation composée de tuyaux de fibre ciment'),
('09','Fibre de verre','Canalisation composée de tuyaux de fibre de verre'),
('10','Fibrociment','Canalisation composée de tuyaux de fibrociment'),
('11','Fonte ductile','Canalisation composée de tuyaux de fonte ductile'),
('12','Fonte grise','Canalisation composée de tuyaux de fonte grise'),
('13','Grès','Canalisation composée de tuyaux de grès'),
('14','Maçonné','Canalisation maçonnée'),
('15','Meulière','Canalisation construite en pierre meulière'),
('16','PEBD','Canalisation composée de tuyaux de polyéthylène basse densité'),
('17','PEHD annelé','Canalisation composée de tuyaux de polyéthylène haute densité annelés'),
('18','PEHD lisse','Canalisation composée de tuyaux de polyéthylène haute densité lisses'),
('19','Plomb','Canalisation composée de tuyaux de plomb'),
('20','PP annelé','Canalisation composée de tuyaux de polypropylène annelés'),
('21','PP lisse','Canalisation composée de tuyaux de polypropylène lisses'),
('22','PRV A','Canalisation composée de polyester renforcé de fibre de verre (série A)'),
('23','PRV B','Canalisation composée de polyester renforcé de fibre de verre (série B)'),
('24','PVC ancien','Canalisation composée de tuyaux de polychlorure de vinyle posés avant 1980'),
('25','PVC BO','Canalisation composée de tuyaux de polychlorure de vinyle bi-orienté'),
('26','PVC U annelé','Canalisation composée de tuyaux de polychlorure de vinyle rigide annelés'),
('27','PVC U lisse','Canalisation composée de tuyaux de polychlorure de vinyle rigide lisses'),
('28','Tôle galvanisée','Canalisation construite en tôle galvanisée'),
('99','Autre','Canalisation composée de tuyaux dont le matériau ne figure pas dans la liste ci-dessus');



-- Table: m_reseau_humide.val_raepa_mode_circulation

-- DROP TABLE m_reseau_humide.val_raepa_mode_circulation;

CREATE TABLE m_reseau_humide.val_raepa_mode_circulation
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_mode_circulation_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_mode_circulation
  IS 'Modalité de circulation de l''eau dans une canalisation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_mode_circulation.code IS 'Code de la liste énumérée relative au mode de circualtion de l''eau dans une canalisation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_mode_circulation.valeur IS 'Valeur de la liste énumérée relative au mode de circualtion de l''eau dans une canalisation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_mode_circulation.definition IS 'Définition de la liste énumérée relative au mode de circualtion de l''eau dans une canalisation';

INSERT INTO m_reseau_humide.val_raepa_mode_circulation(
            code, valeur, definition)
    VALUES
('00','Indéterminé','Mode de circulation inconnu'),
('01','Gravitaire','L''eau s''écoule par l''effet de la pesanteur dans la canalisation en pente'),
('02','Forcé','L''eau circule sous pression dans la canalisation grâce à un système de pompage'),
('03','Sous-vide','L''eau circule par l''effet de la mise sous vide de la canalisation par une centrale d''aspiration'),
('99','Autre','L''eau circule tantôt dans un des modes ci-dessus tantôt dans un autre');


-- Table: m_reseau_humide.val_raepa_qualite_anpose

-- DROP TABLE m_reseau_humide.val_raepa_qualite_anpose;

CREATE TABLE m_reseau_humide.val_raepa_qualite_anpose
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_qualite_anpose_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_qualite_anpose
  IS 'Qualité de l''information "année de pose" ou "année de mise en service" d''un équipement';
COMMENT ON COLUMN m_reseau_humide.val_raepa_qualite_anpose.code IS 'Code de la liste énumérée relative à la qualité de l''information "année de pose" ou "année de mise en service" d''un équipement';
COMMENT ON COLUMN m_reseau_humide.val_raepa_qualite_anpose.valeur IS 'Valeur de la liste énumérée relative à la qualité de l''information "année de pose" ou "année de mise en service" d''un équipement';
COMMENT ON COLUMN m_reseau_humide.val_raepa_qualite_anpose.definition IS 'Définition de la liste énumérée relative à la qualité de l''information "année de pose" ou "année de mise en service" d''un équipement';

INSERT INTO m_reseau_humide.val_raepa_qualite_anpose(
            code, valeur, definition)
    VALUES
('00','Indéterminé','Information ou qualité de l''information inconnue'),
('01','Certaine','Année constatée durant les travaux de pose'),
('02','Récolement','Année reprise sur plans de récolement'),
('03','Projet','Année reprise sur plans de projet'),
('04','Mémoire','Année issue de souvenir(s) individuel(s)'),
('05','Déduite','Année déduite du matériau ou de l''état de l''équipement');


-- Table: m_reseau_humide.val_raepa_qualite_geoloc

-- DROP TABLE m_reseau_humide.val_raepa_qualite_geoloc;

CREATE TABLE m_reseau_humide.val_raepa_qualite_geoloc
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_qualite_geoloc_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_qualite_geoloc
  IS 'Classe de précision au sens de l''arrêté interministériel du 15 février 2012 modifié (DT-DICT)';
COMMENT ON COLUMN m_reseau_humide.val_raepa_qualite_geoloc.code IS 'Code de la liste énumérée relative à la classe de précision au sens de l''arrêté interministériel du 15 février 2012 modifié (DT-DICT)';
COMMENT ON COLUMN m_reseau_humide.val_raepa_qualite_geoloc.valeur IS 'Valeur de la liste énumérée relative à la classe de précision au sens de l''arrêté interministériel du 15 février 2012 modifié (DT-DICT)';
COMMENT ON COLUMN m_reseau_humide.val_raepa_qualite_geoloc.definition IS 'Définition de la liste énumérée relative à la classe de précision au sens de l''arrêté interministériel du 15 février 2012 modifié (DT-DICT)';

INSERT INTO m_reseau_humide.val_raepa_qualite_geoloc(
            code, valeur, definition)
    VALUES
('01','Classe A','Classe de précision inférieure 40 cm'),
('02','Classe B','Classe de précision supérieure à 40 cm et inférieure à 1,50 m'),
('03','Classe C','Classe de précision supérieure à 1,50 m');


-- Table: m_reseau_humide.val_raepa_support_incident

-- DROP TABLE m_reseau_humide.val_raepa_support_incident;

CREATE TABLE m_reseau_humide.val_raepa_support_incident
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_support_incident_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_support_incident
  IS 'Type d''élément de réseau concerné par un incident';
COMMENT ON COLUMN m_reseau_humide.val_raepa_support_incident.code IS 'Code de la liste énumérée relative au type d''élément de réseau concerné par une réparation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_support_incident.valeur IS 'Valeur de la liste énumérée relative au type d''élément de réseau concerné par une réparation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_support_incident.definition IS 'Définition de la liste énumérée relative au type d''élément de réseau concerné par une réparation';

INSERT INTO m_reseau_humide.val_raepa_support_incident(
            code, valeur, definition)
    VALUES
('01','Canalisation','Réparation sur une canalisation'),
('02','Appareillage','Réparation d''un appareillage'),
('03','Ouvrage','Réparation d''un ouvrage');

 

-- Table: m_reseau_humide.val_raepa_defaillance

-- DROP TABLE m_reseau_humide.val_raepa_defaillance;

CREATE TABLE m_reseau_humide.val_raepa_defaillance
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_defaillance_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_defaillance
  IS 'Type de défaillance ayant rendu nécessaire une réparation';
COMMENT ON COLUMN m_reseau_humide.val_raepa_defaillance.code IS 'Code de la liste énumérée relative au type de défaillance';
COMMENT ON COLUMN m_reseau_humide.val_raepa_defaillance.valeur IS 'Valeur de la liste énumérée relative au type de défaillance';
COMMENT ON COLUMN m_reseau_humide.val_raepa_defaillance.definition IS 'Définition de la liste énumérée relative au type de défaillance';

INSERT INTO m_reseau_humide.val_raepa_defaillance(
            code, valeur, definition)
VALUES
('00','Indéterminé','Défaillance de type inconnu'),
('01','Casse longitudinale','Canalisation fendue sur sa longueur'),
('02','Casse nette','Canalisation cassée'),
('03','Déboîtement','Déboîtement de tuyau(x) de la canalisation'),
('04','Fissure','Canalisation fissurée'),
('05','Joint','Joint défectueux'),
('06','Percement','Canalisation percée'),
('99','Autre','Défaillance dont le type ne figure pas dans la liste ci-dessus');


-- ###################
-- ##      AEP      ##
-- ################### 

-- Table: m_reseau_humide.val_raepa_cat_canal_ae

-- DROP TABLE m_reseau_humide.val_raepa_cat_canal_ae;

CREATE TABLE m_reseau_humide.val_raepa_cat_canal_ae
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_cat_canal_ae_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_cat_canal_ae
  IS 'Nature des eaux véhiculées par une canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_canal_ae.code IS 'Code de la liste énumérée relative à la nature des eaux véhiculées par une canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_canal_ae.valeur IS 'Valeur de la liste énumérée relative à la nature des eaux véhiculées par une canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_canal_ae.definition IS 'Définition de la liste énumérée relative à la nature des eaux véhiculées par une canalisation d''adduction d''eau';

INSERT INTO m_reseau_humide.val_raepa_cat_canal_ae(
            code, valeur, definition)
    VALUES
('00','Indéterminée','Nature des eaux véhiculées par la canalisation inconnue'),
('01','Eau brute','Canalisation véhiculant de l''eau brute'),
('02','Eau potable','Canalisation véhiculant de l''eau potable'),
('99','Autre','Canalisation véhiculant tantôt de l''eau brute, tantôt de l''eau potable');

-- Table: m_reseau_humide.val_raepa_fonc_canal_ae

-- DROP TABLE m_reseau_humide.val_raepa_fonc_canal_ae;

CREATE TABLE m_reseau_humide.val_raepa_fonc_canal_ae
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_fonc_canal_ae_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_fonc_canal_ae
  IS 'Fonction dans le réseau d''une canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_fonc_canal_ae.code IS 'Code de la liste énumérée relative à la fonction dans le réseau d''une canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_fonc_canal_ae.valeur IS 'Valeur de la liste énumérée relative à la fonction dans le réseau d''une canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_fonc_canal_ae.definition IS 'Définition de la liste énumérée relative à la fonction dans le réseau d''une canalisation d''adduction d''eau';

INSERT INTO m_reseau_humide.val_raepa_fonc_canal_ae(
            code, valeur, definition)
    VALUES
('00','Indéterminée','Fonction de la canalisation dans le réseau inconnue'),
('01','Transport','Canalisation de transport'),
('02','Distribution','Canalisation de distribution'),
('99','Autre','Canalisation dont la fonction dans le réseau ne figure pas dans la liste ci-dessus');


-- Table: m_reseau_humide.val_raepa_cat_app_ae

-- DROP TABLE m_reseau_humide.val_raepa_cat_app_ae;

CREATE TABLE m_reseau_humide.val_raepa_cat_app_ae
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_cat_app_ae_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_cat_app_ae
  IS 'Type d''un appareillage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_app_ae.code IS 'Code de la liste énumérée relative au type d''un appareillage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_app_ae.valeur IS 'Valeur de la liste énumérée relative au type d''un appareillage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_app_ae.definition IS 'Définition de la liste énumérée relative au type d''un appareillage d''adduction d''eau';

INSERT INTO m_reseau_humide.val_raepa_cat_app_ae(
            code, valeur, definition)
    VALUES
('00','Indéterminé','Type d''appareillage inconnu'),
('01','Point de branchement','Piquage de branchement individuel'),
('02','Ventouse','Ventouse d''adduction d''eau'),
('03','Vanne','Vanne d''adduction d''eau'),
('04','Vidange','Vidange d''adduction d''eau'),
('05','Régulateur de pression','Régulateur de pression'),
('06','Hydrant','Poteau de défense contre l''incendie'),
('07','Compteur','Appareil de mesure des volumes transités'),
('08','Débitmètre','Appareil de mesure des débits transit'),
('99','Autre','Appareillage dont le type ne figure pas dans la liste ci-dessus');


-- Table: m_reseau_humide.val_raepa_cat_ouv_ae

-- DROP TABLE m_reseau_humide.val_raepa_cat_ouv_ae;

CREATE TABLE m_reseau_humide.val_raepa_cat_ouv_ae
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_cat_ouv_ae_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_cat_ouv_ae
  IS 'Type d''un ouvrage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_ouv_ae.code IS 'Code de la liste énumérée relative au type d''un ouvrage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_ouv_ae.valeur IS 'Valeur de la liste énumérée relative au type d''un ouvrage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_ouv_ae.definition IS 'Définition de la liste énumérée relative au type d''un ouvrage d''adduction d''eau';

INSERT INTO m_reseau_humide.val_raepa_cat_ouv_ae(
            code, valeur, definition)
    VALUES
('00','Indéterminé','Type d''ouvrage inconnu'),
('01','Station de pompage','Station de pompage d''eau potable'),
('02','Station de traitement','Station de traitement d''eau potable'),
('03','Réservoir','Réservoir d''eau potable'),
('04','Chambre de comptage','Chambre de comptage'),
('05','Captage','Captage'),
('99','Autre','Ouvrage dont le type ne figure pas dans la liste ci-dessus');


-- ###################
-- ##      ASS      ##
-- ################### 

-- Table: m_reseau_humide.val_raepa_cat_reseau_ass

-- DROP TABLE m_reseau_humide.val_raepa_cat_reseau_ass;

CREATE TABLE m_reseau_humide.val_raepa_cat_reseau_ass
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_cat_reseau_ass_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);


COMMENT ON TABLE m_reseau_humide.val_raepa_cat_reseau_ass
  IS 'Type de réseau d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_reseau_ass.code IS 'Code de la liste énumérée relative au type de réseau d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_reseau_ass.valeur IS 'Valeur de la liste énumérée relative au type de réseau d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_reseau_ass.definition IS 'Définition de la liste énumérée relative au type de réseau d''assainissement collectif';

INSERT INTO m_reseau_humide.val_raepa_cat_reseau_ass(
            code, valeur, definition)
    VALUES
('01','Pluvial','Réseau de collecte de seules eaux pluviales'),
('02','Eaux usées','Réseau de collecte de seules eaux usées'),
('03','Unitaire','Réseau de collecte des eaux usées et des eaux pluviales');


-- Table: m_reseau_humide.val_raepa_cat_canal_ass

-- DROP TABLE m_reseau_humide.val_raepa_cat_canal_ass;

CREATE TABLE m_reseau_humide.val_raepa_cat_canal_ass
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_cat_canal_ass_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);


COMMENT ON TABLE m_reseau_humide.val_raepa_cat_canal_ass
  IS 'Nature des eaux véhiculées par une canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_canal_ass.code IS 'Code de la liste énumérée relative à la nature des eaux véhiculées par une canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_canal_ass.valeur IS 'Valeur de la liste énumérée relative à la nature des eaux véhiculées par une canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_canal_ass.definition IS 'Définition de la liste énumérée relative à la nature des eaux véhiculées par une canalisation d''assainissement collectif';

INSERT INTO m_reseau_humide.val_raepa_cat_canal_ass(
            code, valeur, definition)
    VALUES
('00','Indéterminée','Nature des eaux véhiculées par la canalisation inconnue'),
('01','Eaux pluviales','Canalisation véhiculant des eaux pluviales'),
('02','Eaux usées','Canalisation véhiculant des eaux usées'),
('03','Unitaire','Canalisation véhiculant des eaux usées et pluviales en fonctionnement normal'),
('99','Autre','Canalisation véhiculant tantôt des eaux pluviales, tantôt des eaux usées');


-- Table: m_reseau_humide.val_raepa_fonc_canal_ass

-- DROP TABLE m_reseau_humide.val_raepa_fonc_canal_ass;

CREATE TABLE m_reseau_humide.val_raepa_fonc_canal_ass
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_fonc_canal_ass_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_fonc_canal_ass
  IS 'Fonction dans le réseau d''une canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_fonc_canal_ass.code IS 'Code de la liste énumérée relative à la fonction dans le réseau d''une canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_fonc_canal_ass.valeur IS 'Valeur de la liste énumérée relative à la fonction dans le réseau d''une canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_fonc_canal_ass.definition IS 'Définition de la liste énumérée relative à la fonction dans le réseau d''une canalisation d''assainissement collectif';

INSERT INTO m_reseau_humide.val_raepa_fonc_canal_ass(
            code, valeur, definition)
    VALUES
('00','Indéterminée','Fonction de la canalisation dans le réseau inconnue'),
('01','Transport','Canalisation de transport'),
('02','Collecte','Canalisation de collecte'),
('99','Autre','Canalisation dont la fonction dans le réseau ne figure pas dans la liste ci-dessus');


-- Table: m_reseau_humide.val_raepa_cat_app_ass

-- DROP TABLE m_reseau_humide.val_raepa_cat_app_ass;

CREATE TABLE m_reseau_humide.val_raepa_cat_app_ass
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_cat_app_ass_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_cat_app_ass
  IS 'Type d''un appareillage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_app_ass.code IS 'Code de la liste énumérée relative au type d''un appareillage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_app_ass.valeur IS 'Valeur de la liste énumérée relative au type d''un appareillage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_app_ass.definition IS 'Définition de la liste énumérée relative au type d''un appareillage d''assainissement collectif';

INSERT INTO m_reseau_humide.val_raepa_cat_app_ass(
            code, valeur, definition)
    VALUES
('00','Indéterminé','Type d''appareillage inconnu'),
('01','Point de branchement','Piquage de branchement individuel'),
('02','Ventouse','Ventouse d''assainissement'),
('03','Vanne','Vanne d''assainissement'),
('04','Débitmètre','Appareil de mesure des débits transités'),
('99','Autre','Appareillage dont le type ne figure pas dans la liste ci-dessus');


-- Table: m_reseau_humide.val_raepa_cat_ouv_ass

-- DROP TABLE m_reseau_humide.val_raepa_cat_ouv_ass;

CREATE TABLE m_reseau_humide.val_raepa_cat_ouv_ass
(
  code character varying(2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(255),
  CONSTRAINT raepa_cat_ouv_ass_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.val_raepa_cat_ouv_ass
  IS 'Type d''un ouvrage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_ouv_ass.code IS 'Code de la liste énumérée relative au type d''un ouvrage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_ouv_ass.valeur IS 'Valeur de la liste énumérée relative au type d''un ouvrage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.val_raepa_cat_ouv_ass.definition IS 'Définition de la liste énumérée relative au type d''un ouvrage d''assainissement collectif';

INSERT INTO m_reseau_humide.val_raepa_cat_ouv_ass(
            code, valeur, definition)
    VALUES
('00','Indéterminé','Type d''ouvrage inconnu'),
('01','Station de pompage','Station de pompage d''eaux usées et/ou pluviales'),
('02','Station d''épuration','Station de traitement d''eaux usées'),
('03','Bassin de stockage','Ouvrage de stockage d''eaux usées et/ou pluviales'),
('04','Déversoir d''orage','Ouvrage de décharge du trop-plein d''effluents d''une canalisation d''assainissement collectif  vers un milieu naturel récepteur'),
('05','Rejet','Rejet (exutoire) dans le milieu naturel d''eaux usées et/ou pluviales'),
('06','Regard','Regard'),
('07','Avaloir','Avaloir'),
('99','Autre','Ouvrage dont le type ne figure pas dans la liste ci-dessus');




-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                     SEQUENCE                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Sequence: m_reseau_humide.raepa_idraepa

-- DROP SEQUENCE m_reseau_humide.raepa_idraepa;

CREATE SEQUENCE m_reseau_humide.raepa_idraepa
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

-- Sequence: m_reseau_humide.raepa_idrepar

-- DROP SEQUENCE m_reseau_humide.raepa_idrepar;

CREATE SEQUENCE m_reseau_humide.raepa_idrepar
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                  CLASSE OBJET                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ################################################################ CLASSE METADONNEES RAEPA ##############################################

-- Table: m_reseau_humide.raepa_metadonnees

-- DROP TABLE m_reseau_humide.raepa_metadonnees;

CREATE TABLE m_reseau_humide.raepa_metadonnees
(
  idraepa character varying(254) NOT NULL,
  qualglocxy character varying(2) NOT NULL, -- fkey vers domaine de valeur
  qualglocz character varying(2) NOT NULL, -- fkey vers domaine de valeur
  datemaj date NOT NULL,
  sourmaj character varying(100) NOT NULL,
  dategeoloc date,
  sourgeoloc character varying(100),
  sourattrib character varying(100),
  qualannee character varying(2), -- information à renseignée uniquement si anposedeb=anposfin pour une canalisation ou un noeud, fkey vers domaine de valeur
  CONSTRAINT raepa_metadonnees_pkey PRIMARY KEY (idraepa)  
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_metadonnees
  IS 'Classe décrivant les métadonnées d''un objet du réseau humide';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.datemaj IS 'Date de la dernière mise à jour des informations';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.sourmaj IS 'Source de la mise à jour';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.dategeoloc IS 'Date de la géolocalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.sourgeoloc IS 'Auteur de la géolocalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.sourattrib IS 'Auteur de la saisie des données attributaires (lorsque différent de l''auteur de la géolocalisation)';
COMMENT ON COLUMN m_reseau_humide.raepa_metadonnees.qualannee IS 'Fiabilité de l''année de pose ou de mise en service';



-- #################################################################### CLASSE CANALISATION ###############################################

-- Table: m_reseau_humide.raepa_canal

-- DROP TABLE m_reseau_humide.raepa_canal;

CREATE TABLE m_reseau_humide.raepa_canal
(
  idcana character varying(254) NOT NULL,
  mouvrage character varying(100), 
  gexploit character varying(100),  
  enservice character varying(1),
  branchemnt character varying(1),  
  materiau character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  diametre integer,  
  anfinpose character varying(4),
  modecircu character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur    
  idnini character varying(254),
  idnterm character varying(254),
  idcanppale character varying(254),
  andebpose character varying(4),
  longcana integer,    -- unité en mètre et de type entier, pourquoi cette simplification  ?
  nbranche integer,
  geom geometry(LineString,2154),
  CONSTRAINT raepa_canal_pkey PRIMARY KEY (idcana)  
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_canal
  IS 'Tronçon de conduite';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.idcana IS 'Identifiant de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.mouvrage IS 'Maître d''ouvrage du réseau';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.gexploit IS 'Gestionnaire exploitant du réseau';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.enservice IS 'Canalisation en service (O/N)';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.branchemnt IS 'Canalisation de branchement individuel (O/N)';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.materiau IS 'Matériau de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.diametre IS 'Diamètre nominal de la canalisation (en millimètres)';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.anfinpose IS 'Année marquant la fin de la période de pose de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.modecircu IS 'Mode de circulation de l''eau à l''intérieur de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.idnini IS 'Identifiant du noeud de début de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.idnterm IS 'Identifiant du noeud de fin de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.idcanppale IS 'Identifiant de la canalisation principale';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.andebpose IS 'Année marquant le début de la période de pose de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.longcana IS 'Longueur mesurée de la canalisation (en mètres)';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.nbranche IS 'Nombre de branchements individuels sur la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canal.geom IS 'Géométrie linéaire de l''objet';

ALTER TABLE m_reseau_humide.raepa_canal ALTER COLUMN idcana SET DEFAULT nextval('m_reseau_humide.raepa_idraepa'::regclass);


-- #################################################################### SSCLASSE CANALISATION AEP ###############################################

-- Table: m_reseau_humide.raepa_canalaep

-- DROP TABLE m_reseau_humide.raepa_canalaep;

CREATE TABLE m_reseau_humide.raepa_canalaep
(
  idcana character varying(254) NOT NULL, -- fkey vers attribut idcana de la classe canalisation
  contcanaep character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  fonccanaep character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  profgen numeric (3,2) -- !!!!!! usage pour le DT-DICT qui n'a pas sa spécificité sur un réseau d'ae. L'emploi de la profondeur par rapport à la côté NGF est par ailleurs dangereuse
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_canalaep
  IS 'Tronçon de conduite d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.raepa_canalaep.idcana IS 'Identifiant de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canalaep.contcanaep IS 'Catégorie de la canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.raepa_canalaep.fonccanaep IS 'Fonction de la canalisation d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.raepa_canalaep.profgen IS 'Profondeur moyenne de la génératrice supérieure de la canalisation (en mètres)';


-- #################################################################### SSCLASSE CANALISATION ASS ###############################################

-- Table: m_reseau_humide.raepa_canalass

-- DROP TABLE m_reseau_humide.raepa_canalass;

CREATE TABLE m_reseau_humide.raepa_canalass
(
  idcana character varying(254) NOT NULL, -- fkey vers attribut idcana de la classe canalisation
  typreseau character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  contcanass character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  fonccanass character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  zamont numeric (6,2),
  zaval numeric (6,2),
  sensecoul character varying(1) -- !!!!!! existe dans le modèle implementé en fichier mais absent du MCD RAEPA
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_canalass
  IS 'Tronçon de conduite d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_canalass.idcana IS 'Identifiant de la canalisation';
COMMENT ON COLUMN m_reseau_humide.raepa_canalass.typreseau IS 'Type du réseau d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_canalass.contcanass IS 'Catégorie de la canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_canalass.fonccanass IS 'Fonction de la canalisation d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_canalass.zamont IS 'Altitude à l''extrémité amont (en mètres, référentiel NGF-IGN69)';  
COMMENT ON COLUMN m_reseau_humide.raepa_canalass.zaval IS 'Altitude à l''extrémité aval (en mètres, référentiel NGF-IGN69)';   
COMMENT ON COLUMN m_reseau_humide.raepa_canalass.sensecoul IS 'Sens de l''écoulement dans la canalisation d''assainissement collectif';  


-- #################################################################### SUPER CLASSE NOEUD ###############################################

-- Table: m_reseau_humide.raepa_noeud

-- DROP TABLE m_reseau_humide.raepa_noeud;

CREATE TABLE m_reseau_humide.raepa_noeud
(
  idnoeud character varying(254) NOT NULL,
  x numeric(10,3) NOT NULL,
  y numeric(11,3) NOT NULL,
  mouvrage character varying(100),
  gexploit character varying(100),
  anfinpose character varying(4),
  idcanppale character varying(254), -- fkey vers attribut idcana de la classe canalisation. Valeur NULL admise car ne sert à renseigner la cana principale pour noeud de raccord avec un branchement
  andebpose character varying(4),
  geom geometry(Point,2154),
  CONSTRAINT raepa_noeud_pkey PRIMARY KEY (idnoeud) 
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_noeud
  IS 'Lieu de jonction de plusieurs tronçons de conduite ou de percement d''un tronçon de conduite';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.idnoeud IS 'Identifiant du noeud';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.x IS 'Coordonnée X Lambert 93 (en mètres)';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.y IS 'Coordonnée X Lambert 93 (en mètres)';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.mouvrage IS 'Maître d''ouvrage du réseau';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.gexploit IS 'Gestionnaire exploitant du réseau';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.anfinpose IS 'Année marquant la fin de la période de mise en service de l''appareillage et/ou de l''ouvrage';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.idcanppale IS 'Identifiant de la canalisation principale en cas de piquage';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.andebpose IS 'Année marquant le début de la période de mise en service de l''appareillage et/ou de l''ouvrage';
COMMENT ON COLUMN m_reseau_humide.raepa_noeud.geom IS 'Géométrie ponctuelle de l''objet';


ALTER TABLE m_reseau_humide.raepa_noeud ALTER COLUMN idnoeud SET DEFAULT nextval('m_reseau_humide.raepa_idraepa'::regclass);


-- #################################################################### CLASSE APPAREILLAGE ###############################################

-- Table: m_reseau_humide.raepa_appar

-- DROP TABLE m_reseau_humide.raepa_appar;

CREATE TABLE m_reseau_humide.raepa_appar
(
  idappareil character varying(254) NOT NULL,
--  idnoeud character varying(254) NOT NULL, -- fkey vers attribut idnoeud de la classe noeud
--  idouvrage character varying(254), -- fkey vers attribut idouvrage de la classe ouvrage. Valeur NULL admise car il n'y a pas forcement un ouvrage qui accueille l'appareillage
-- diametre integer, -- A PRIORI attribut manquant dans la modélisation à ce niveau car présent dans les gabartis des livrables d'appareillage ae et ass et absent pour les ouvrages
  z numeric(6,2),
  CONSTRAINT raepa_appar_pkey PRIMARY KEY (idappareil) 
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_appar
  IS 'Appareillage';
COMMENT ON COLUMN m_reseau_humide.raepa_appar.idappareil IS 'Identifiant de l''appareillage';
-- COMMENT ON COLUMN m_reseau_humide.raepa_appar.idnoeud IS 'Identifiant du noeud';
-- COMMENT ON COLUMN m_reseau_humide.raepa_appar.idouvrage IS 'Identifiant de l''éventuel ouvrage d''accueil';
COMMENT ON COLUMN m_reseau_humide.raepa_appar.z IS 'Altitude du noeud (en mètres, Référentiel NGFIGN69)';  
  
-- #################################################################### SSCLASSE APPAREILLAGE AEP ###############################################

-- Table: m_reseau_humide.raepa_apparaep

-- DROP TABLE m_reseau_humide.raepa_apparaep;

CREATE TABLE m_reseau_humide.raepa_apparaep
(
  idappareil character varying(254) NOT NULL, -- fkey vers attribut idappareil de la classe appareillage
  fnappaep character varying(2) NOT NULL DEFAULT '00' -- fkey vers domaine de valeur
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_apparaep
  IS 'Appareillage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.raepa_apparaep.idappareil IS 'Identifiant de l''appareillage';
COMMENT ON COLUMN m_reseau_humide.raepa_apparaep.fnappaep IS 'Fonction de l''appareillage d''adduction d''eau potable';

  
-- #################################################################### SSCLASSE APPAREILLAGE ASS ###############################################

-- Table: m_reseau_humide.raepa_apparass

-- DROP TABLE m_reseau_humide.raepa_apparass;

CREATE TABLE m_reseau_humide.raepa_apparass
(
  idappareil character varying(254) NOT NULL, -- fkey vers attribut idappareil de la classe appareillage
  typreseau character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  fnappass character varying(2) NOT NULL DEFAULT '00' -- fkey vers domaine de valeur
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_apparass
  IS 'Appareillage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_apparass.idappareil IS 'Identifiant de l''appareillage';
COMMENT ON COLUMN m_reseau_humide.raepa_apparass.typreseau IS 'Type du réseau d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_apparass.fnappass IS 'Fonction de l''appareillage d''assainissement collectif';
  

-- #################################################################### CLASSE OUVRAGE ###############################################

-- Table: m_reseau_humide.raepa_ouvr

-- DROP TABLE m_reseau_humide.raepa_ouvr;

CREATE TABLE m_reseau_humide.raepa_ouvr
(
  idouvrage character varying(254) NOT NULL,
--  idnoeud character varying(254) NOT NULL, -- fkey vers attribut idnoeud de la classe noeud
  z numeric(6,2),
  CONSTRAINT raepa_ouvr_pkey PRIMARY KEY (idouvrage) 
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_ouvr
  IS 'Ouvrage';
COMMENT ON COLUMN m_reseau_humide.raepa_ouvr.idouvrage IS 'Identifiant de l''ouvrage';
-- COMMENT ON COLUMN m_reseau_humide.raepa_ouvr.idnoeud IS 'Identifiant du noeud';
COMMENT ON COLUMN m_reseau_humide.raepa_ouvr.z IS 'Altitude radier de l''ouvrage (en mètres, Référentiel NGFIGN69)';  
  


-- #################################################################### SSCLASSE OUVRAGE AE ###############################################

-- Table: m_reseau_humide.raepa_ouvraep

-- DROP TABLE m_reseau_humide.raepa_ouvraep;

CREATE TABLE m_reseau_humide.raepa_ouvraep
(
  idouvrage character varying(254) NOT NULL, -- fkey vers attribut idouvrage de la classe ouvrage
  fnouvaep character varying(2) NOT NULL DEFAULT '00' -- fkey vers domaine de valeur
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_ouvraep
  IS 'Ouvrage d''adduction d''eau';
COMMENT ON COLUMN m_reseau_humide.raepa_ouvraep.idouvrage IS 'Identifiant de l''ouvrage';
COMMENT ON COLUMN m_reseau_humide.raepa_ouvraep.fnouvaep IS 'Fonction de l''ouvrage d''adduction d''eau potable';


-- #################################################################### SSCLASSE OUVRAGE ASS ###############################################

-- Table: m_reseau_humide.raepa_ouvrass

-- DROP TABLE m_reseau_humide.raepa_ouvrass;

CREATE TABLE m_reseau_humide.raepa_ouvrass
(
  idouvrage character varying(254) NOT NULL, -- fkey vers attribut idouvrage de la classe ouvrage
  typreseau character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  fnouvass character varying(2) NOT NULL DEFAULT '00' -- fkey vers domaine de valeur
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_ouvrass
  IS 'Ouvrage d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_ouvrass.idouvrage IS 'Identifiant de l''ouvrage';
COMMENT ON COLUMN m_reseau_humide.raepa_ouvrass.typreseau IS 'Type du réseau d''assainissement collectif';
COMMENT ON COLUMN m_reseau_humide.raepa_ouvrass.fnouvass IS 'Fonction de l''ouvrage d''assainissement collectif';


-- #################################################################### CLASSE REPARATION ###############################################


CREATE TABLE m_reseau_humide.raepa_repar
(
  idrepar character varying(254) NOT NULL,
  x numeric(10,3) NOT NULL,
  y numeric(11,3) NOT NULL,
  supprepare character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  defreparee character varying(2) NOT NULL DEFAULT '00', -- fkey vers domaine de valeur
  idsuprepar character varying(254) NOT NULL, -- fkey vers attribut idraepa de la classe raepa_id
  daterepar date,
  mouvrage character varying(100), -- *******  voir pour privilégier des domaines de valeur  *******
  geom geometry(Point,2154),
  CONSTRAINT raepa_repar_pkey PRIMARY KEY (idrepar) 
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_reseau_humide.raepa_repar
  IS 'Lieu d''une intervention sur le réseau effectuée suite à une défaillance dudit réseau';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.idrepar IS 'Identifiant de la réparation effectuée';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.x IS 'Coordonnée X Lambert 93 (en mètres)';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.y IS 'Coordonnée X Lambert 93 (en mètres)';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.supprepare IS 'Type de support de la réparation';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.defreparee IS 'Type de défaillance';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.idsuprepar IS 'Identifiant du support de la réparation';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.daterepar IS 'Date de l''intervention en réparation';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.mouvrage IS 'Maître d''ouvrage de la réparation';
COMMENT ON COLUMN m_reseau_humide.raepa_repar.geom IS 'Géométrie ponctuelle de l''objet';


ALTER TABLE m_reseau_humide.raepa_repar ALTER COLUMN idrepar SET DEFAULT nextval('m_reseau_humide.raepa_idrepar'::regclass);



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                           FKEY (clé étrangère)                                                               ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ID



-- DOMAINE DE VALEUR

-- ############ METADONNEES RAEPA ############

ALTER TABLE m_reseau_humide.raepa_metadonnees

  ADD CONSTRAINT val_raepa_qualite_anpose_fkey FOREIGN KEY (qualannee)
      REFERENCES m_reseau_humide.val_raepa_qualite_anpose (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT val_raepa_qualite_geoloc_xy_fkey FOREIGN KEY (qualglocxy)
      REFERENCES m_reseau_humide.val_raepa_qualite_geoloc (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,         
  ADD CONSTRAINT val_raepa_qualite_geoloc_z_fkey FOREIGN KEY (qualglocz)
      REFERENCES m_reseau_humide.val_raepa_qualite_geoloc (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;   


-- ############ CANALISATION ############

-- ************ RAEPA_CANAL ************  

ALTER TABLE m_reseau_humide.raepa_canal

  ADD CONSTRAINT val_raepa_materiau_fkey FOREIGN KEY (materiau)
      REFERENCES m_reseau_humide.val_raepa_materiau (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT val_raepa_mode_circulation_fkey FOREIGN KEY (modecircu)
      REFERENCES m_reseau_humide.val_raepa_mode_circulation (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
    
-- ************ RAEPA_CANAL_AEP ************       
           
ALTER TABLE m_reseau_humide.raepa_canalaep

  ADD CONSTRAINT val_raepa_cat_canal_ae_fkey FOREIGN KEY (contcanaep)
      REFERENCES m_reseau_humide.val_raepa_cat_canal_ae (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,           
  ADD CONSTRAINT val_raepa_fonc_canal_ae_fkey FOREIGN KEY (fonccanaep)
      REFERENCES m_reseau_humide.val_raepa_fonc_canal_ae (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
-- ************ RAEPA_CANAL_ASS ************   

ALTER TABLE m_reseau_humide.raepa_canalass

  ADD CONSTRAINT val_raepa_cat_reseau_ass_fkey FOREIGN KEY (typreseau)
      REFERENCES m_reseau_humide.val_raepa_cat_reseau_ass (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  ADD CONSTRAINT val_raepa_cat_canal_ass_fkey FOREIGN KEY (contcanass)
      REFERENCES m_reseau_humide.val_raepa_cat_canal_ass (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,           
  ADD CONSTRAINT val_raepa_fonc_canal_ass_fkey FOREIGN KEY (fonccanass)
      REFERENCES m_reseau_humide.val_raepa_fonc_canal_ass (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;


-- ############ APPAREILLAGE ############

-- ************ RAEPA_APPAR_AEP ************  

ALTER TABLE m_reseau_humide.raepa_apparaep

  ADD CONSTRAINT val_raepa_cat_app_ae_fkey FOREIGN KEY (fnappaep)
      REFERENCES m_reseau_humide.val_raepa_cat_app_ae (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;   

-- ************ RAEPA_APPAR_ASS ************  

ALTER TABLE m_reseau_humide.raepa_apparass

  ADD CONSTRAINT val_raepa_cat_reseau_ass_fkey FOREIGN KEY (typreseau)
      REFERENCES m_reseau_humide.val_raepa_cat_reseau_ass (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,        
  ADD CONSTRAINT val_raepa_cat_app_ass_fkey FOREIGN KEY (fnappass)
      REFERENCES m_reseau_humide.val_raepa_cat_app_ass (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;                     

 
-- ############ OUVRAGE ############

-- ************ RAEPA_OUVR_AEP ************  

ALTER TABLE m_reseau_humide.raepa_ouvraep

  ADD CONSTRAINT val_raepa_cat_ouv_ae_fkey FOREIGN KEY (fnouvaep)
      REFERENCES m_reseau_humide.val_raepa_cat_ouv_ae (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;   

-- ************ RAEPA_APPAR_ASS ************  

ALTER TABLE m_reseau_humide.raepa_ouvrass

  ADD CONSTRAINT val_raepa_cat_reseau_ass_fkey FOREIGN KEY (typreseau)
      REFERENCES m_reseau_humide.val_raepa_cat_reseau_ass (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,        
  ADD CONSTRAINT val_raepa_cat_ouv_ass_fkey FOREIGN KEY (fnouvass)
      REFERENCES m_reseau_humide.val_raepa_cat_ouv_ass (code) MATCH SIMPLE

      ON UPDATE NO ACTION ON DELETE NO ACTION;  


-- ############ REPARATION ############

-- ************ RAEPA_REPAR ************       

ALTER TABLE m_reseau_humide.raepa_repar

  ADD CONSTRAINT val_raepa_support_incident_fkey FOREIGN KEY (supprepare)
      REFERENCES m_reseau_humide.val_raepa_support_incident (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,        
  ADD CONSTRAINT val_raepa_defaillance_fkey FOREIGN KEY (defreparee)
      REFERENCES m_reseau_humide.val_raepa_defaillance (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

      
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        VUES                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- #################################################################### VUE CANALISATION AEP ###############################################
        
-- View: m_reseau_humide.raepa_canalaep_l

-- DROP VIEW m_reseau_humide.raepa_canalaep_l;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_canalaep_l AS 
 SELECT 
  g.idcana,
  g.mouvrage,
  g.gexploit, 
  g.enservice,
  g.branchemnt,
  g.materiau,
  g.diametre,  
  g.anfinpose,
  g.modecircu,
  a.contcanaep,
  a.fonccanaep,     
  g.idnini,
  g.idnterm,
  g.idcanppale,
  a.profgen,
  g.andebpose,
  g.longcana,
  g.nbranche,
  m.qualglocxy,
  m.qualglocz, 
  m.datemaj,
  m.sourmaj,
  m.qualannee,
  m.dategeoloc,
  m.sourgeoloc,
  m.sourattrib,
  g.geom
  
FROM m_reseau_humide.raepa_canal g
RIGHT JOIN m_reseau_humide.raepa_canalaep a ON g.idcana = a.idcana
RIGHT JOIN m_reseau_humide.raepa_metadonnees m ON g.idcana = m.idraepa
ORDER BY g.idcana;

COMMENT ON VIEW m_reseau_humide.raepa_canalaep_l
  IS 'Canalisation d''adduction d''eau';
  
  
-- #################################################################### VUE CANALISATION ASS ###############################################

-- View: m_reseau_humide.raepa_canalass_l

-- DROP VIEW m_reseau_humide.raepa_canalass_l;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_canalass_l AS 
 SELECT 
  g.idcana,
  g.mouvrage,
  g.gexploit, 
  g.enservice,
  g.branchemnt,
  a.typreseau,  
  g.materiau,
  g.diametre,  
  g.anfinpose,
  g.modecircu,
  a.contcanass,
  a.fonccanass,     
  g.idnini,
  g.idnterm,
  g.idcanppale,
  a.zamont,
  a.zaval,
  a.sensecoul,
  g.andebpose,
  g.longcana,
  g.nbranche,
  m.qualglocxy,
  m.qualglocz, 
  m.datemaj,
  m.sourmaj,
  m.qualannee,
  m.dategeoloc,
  m.sourgeoloc,
  m.sourattrib,
  g.geom
  
FROM m_reseau_humide.raepa_canal g
RIGHT JOIN m_reseau_humide.raepa_canalass a ON g.idcana = a.idcana
RIGHT JOIN m_reseau_humide.raepa_metadonnees m ON g.idcana = m.idraepa
ORDER BY g.idcana;

COMMENT ON VIEW m_reseau_humide.raepa_canalass_l
  IS 'Canalisation d''assainissement collectif';


-- #################################################################### VUE APPAREILLAGE AEP ###############################################


-- View: m_reseau_humide.raepa_apparaep_p

-- DROP VIEW m_reseau_humide.raepa_apparaep_p;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_apparaep_p AS 
 SELECT
  g.idnoeud as idappareil,
  g.x,
  g.y,
  g.mouvrage,
  g.gexploit,
  p.fnappaep,
  g.anfinpose,
-- diametre integer, -- A PRIORI soit : attribut manquant dans la modélisation à ce niveau car présent dans les gabarits des livrables d'appareillage ae et ass et absent pour les ouvrages / soit : attribut implémenté et qui ne devrait pas l'être / MCD
-- idcanamont,
-- idcanaval,  
  g.idcanppale,
  g.idnoeud as idouvrage,  -- prb si on gère séquence unique de noeud sans géré sequence ouvrage et appareil
  a.z,
  g.andebpose,      
  m.qualglocxy,
  m.qualglocz, 
  m.datemaj,
  m.sourmaj,
  m.qualannee,
  m.dategeoloc,
  m.sourgeoloc,
  m.sourattrib,
  g.geom

FROM m_reseau_humide.raepa_noeud g
RIGHT JOIN m_reseau_humide.raepa_appar a ON g.idnoeud = a.idappareil
RIGHT JOIN m_reseau_humide.raepa_apparaep p ON p.idappareil = a.idappareil
RIGHT JOIN m_reseau_humide.raepa_metadonnees m ON g.idnoeud = m.idraepa
ORDER BY g.idnoeud;

COMMENT ON VIEW m_reseau_humide.raepa_apparaep_p
  IS 'Appareillage d''adduction d''eau';


-- #################################################################### VUE APPAREILLAGE ASS ###############################################


-- View: m_reseau_humide.raepa_apparass_p

-- DROP VIEW m_reseau_humide.raepa_apparass_p;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_apparass_p AS 
 SELECT
  g.idnoeud as idappareil,
  g.x,
  g.y,
  g.mouvrage,
  g.gexploit,
  p.typreseau,
  p.fnappass,
  g.anfinpose,
-- diametre integer, -- A PRIORI soit : attribut manquant dans la modélisation à ce niveau car présent dans les tables implémentées d'appareillage ae et ass et absent pour les ouvrages / soit : attribut implémenté et qui ne devrait pas l'être / MCD
-- idcanamont,
-- idcanaval,  
  g.idcanppale,
  g.idnoeud as idouvrage,  -- prb si on gère séquence unique de noeud sans géré sequence ouvrage et appareil
  a.z,
  g.andebpose,      
  m.qualglocxy,
  m.qualglocz, 
  m.datemaj,
  m.sourmaj,
  m.qualannee,
  m.dategeoloc,
  m.sourgeoloc,
  m.sourattrib,
  g.geom

FROM m_reseau_humide.raepa_noeud g
RIGHT JOIN m_reseau_humide.raepa_appar a ON g.idnoeud = a.idappareil
RIGHT JOIN m_reseau_humide.raepa_apparass p ON p.idappareil = a.idappareil
RIGHT JOIN m_reseau_humide.raepa_metadonnees m ON g.idnoeud = m.idraepa
ORDER BY g.idnoeud;

COMMENT ON VIEW m_reseau_humide.raepa_apparass_p
  IS 'Appareillage d''assanissement collectif';



-- #################################################################### VUE OUVRAGE AEP ###############################################

-- View: m_reseau_humide.raepa_ouvraep_p

-- DROP VIEW m_reseau_humide.raepa_ouvraep_p;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_ouvraep_p AS 
 SELECT
  g.idnoeud as idouvrage,
  g.x,
  g.y,
  g.mouvrage,
  g.gexploit,
  p.fnouvaep,
  g.anfinpose,
-- idcanamont,
-- idcanaval,  
  g.idcanppale,
  a.z,
  g.andebpose,      
  m.qualglocxy,
  m.qualglocz, 
  m.datemaj,
  m.sourmaj,
  m.qualannee,
  m.dategeoloc,
  m.sourgeoloc,
  m.sourattrib,
  g.geom

FROM m_reseau_humide.raepa_noeud g
RIGHT JOIN m_reseau_humide.raepa_ouvr a ON g.idnoeud = a.idouvrage
RIGHT JOIN m_reseau_humide.raepa_ouvraep p ON p.idouvrage = a.idouvrage
RIGHT JOIN m_reseau_humide.raepa_metadonnees m ON g.idnoeud = m.idraepa
ORDER BY g.idnoeud;

COMMENT ON VIEW m_reseau_humide.raepa_apparaep_p
  IS 'Ouvrage d''adduction d''eau';


-- #################################################################### VUE OUVRAGE ASS ###############################################

-- View: m_reseau_humide.raepa_ouvrass_p

-- DROP VIEW m_reseau_humide.raepa_ouvrass_p;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_ouvrass_p AS 
 SELECT
  g.idnoeud as idouvrage,
  g.x,
  g.y,
  g.mouvrage,
  g.gexploit,
  p.typreseau,
  p.fnouvass,
  g.anfinpose,
-- idcanamont,
-- idcanaval,  
  g.idcanppale,
  a.z,
  g.andebpose,      
  m.qualglocxy,
  m.qualglocz, 
  m.datemaj,
  m.sourmaj,
  m.qualannee,
  m.dategeoloc,
  m.sourgeoloc,
  m.sourattrib,
  g.geom

FROM m_reseau_humide.raepa_noeud g
RIGHT JOIN m_reseau_humide.raepa_ouvr a ON g.idnoeud = a.idouvrage
RIGHT JOIN m_reseau_humide.raepa_ouvrass p ON p.idouvrage = a.idouvrage
RIGHT JOIN m_reseau_humide.raepa_metadonnees m ON g.idnoeud = m.idraepa
ORDER BY g.idnoeud;

COMMENT ON VIEW m_reseau_humide.raepa_apparass_p
  IS 'Ouvrage d''assainissement collectif';



-- #################################################################### VUE REPARATION AEP ###############################################

-- View: m_reseau_humide.raepa_reparaep_p

-- DROP VIEW m_reseau_humide.raepa_reparaep_p;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_reparaep_p AS 
 SELECT
  g.idrepar,
  g.x,
  g.y,
  g.supprepare,
  g.defreparee,
  g.idsuprepar,
  g.daterepar,
  g.mouvrage,
  g.geom

FROM m_reseau_humide.raepa_repar g
-- voir comment gérer le WHERE pour récup uniquement AEP
ORDER BY g.idrepar;

COMMENT ON VIEW m_reseau_humide.raepa_apparaep_p
  IS 'Reparation du réseau d''adduction d''eau';

-- #################################################################### VUE REPARATION ASS ###############################################

-- View: m_reseau_humide.raepa_reparass_p

-- DROP VIEW m_reseau_humide.raepa_reparass_p;

CREATE OR REPLACE VIEW m_reseau_humide.raepa_reparass_p AS 
 SELECT
  g.idrepar,
  g.x,
  g.y,
  g.supprepare,
  g.defreparee,
  g.idsuprepar,
  g.daterepar,
  g.mouvrage,
  g.geom

FROM m_reseau_humide.raepa_repar g
-- voir comment gérer le WHERE pour récup uniquement ASS
ORDER BY g.idrepar;

COMMENT ON VIEW m_reseau_humide.raepa_apparass_p
  IS 'Reparation du réseau d''assainissement collectif';



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                  BAC A SABLE                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- données fictives pour test

-- ### METADONNEES ###

INSERT INTO m_reseau_humide.raepa_metadonnees (
            idraepa, qualglocxy, qualglocz, datemaj, sourmaj, qualannee, dategeoloc, sourgeoloc, sourattrib)
    VALUES
('1', '03', '03', '03/01/2018', 'service eau', NULL, NULL, 'dupont', NULL),
('2', '01', '01', '25/03/2019', 'service eau', '00', '25/03/2019', 'dupont', 'durand'),
('3', '01', '01', '25/03/2019', 'service eau', '00', '25/03/2019', 'dupont', NULL),
('4', '03', '03', '01/01/2018', 'service eau', '00', NULL, NULL, NULL),
('5', '02', '02', '01/01/2018', 'service eau', '00', NULL, 'dupond', NULL),
('6', '03', '03', '01/01/2018', 'service eau', '00', NULL, NULL, NULL);


-- ### CANALISATION ###

INSERT INTO m_reseau_humide.raepa_canal(
            idcana, mouvrage, gexploit, enservice, branchemnt, materiau, diametre, anfinpose, modecircu, idnini, idnterm, idcanppale, andebpose, longcana, nbranche, geom)
    VALUES
('1', 'Collectivité 1','Exploitant A', 'O', 'N', '01', 200, '2019', '01', NULL, NULL, NULL, NULL, NULL, NULL, ST_GeomFromText('LINESTRING(689315 6920280, 689318 6920282, 689330 6920285)', 2154)),
('2', 'Collectivité 1','Exploitant B', 'O', 'N', '02', 600, '2015', '02', NULL, NULL, NULL, NULL, NULL, NULL, ST_GeomFromText('LINESTRING(689310 6920276, 689320 6920278, 689325 6920281)', 2154));


-- ### CANALISATION AEP ###

INSERT INTO m_reseau_humide.raepa_canalaep(
            idcana, contcanaep, fonccanaep, profgen)
    VALUES
('1', '00', '00', NULL);

-- ### CANALISATION ASS ###

INSERT INTO m_reseau_humide.raepa_canalass(
            idcana, typreseau, contcanass, fonccanass, zamont, zaval, sensecoul)
    VALUES
('2', '02', '00', '00', NULL, NULL, NULL);


-- ### NOEUD ###

INSERT INTO m_reseau_humide.raepa_noeud(
            idnoeud, x, y, mouvrage, gexploit, anfinpose, idcanppale, andebpose, geom)
    VALUES
('3', 689315, 6920280, 'Collectivité 1', 'Exploitant A', NULL, NULL, NULL, ST_GeomFromText('POINT(689315 6920280)', 2154)),
('4', 689330, 6920285, 'Collectivité 1', 'Exploitant A', NULL, NULL, NULL, ST_GeomFromText('POINT(689330 6920285)', 2154)),
('5', 689310, 6920276, 'Collectivité 1', 'Exploitant B', NULL, NULL, NULL, ST_GeomFromText('POINT(689310 6920276)', 2154)),
('6', 689325, 6920281, 'Collectivité 1', 'Exploitant B', NULL, NULL, NULL, ST_GeomFromText('POINT(689325 6920281)', 2154));


-- ### APPAREILLAGE ###

INSERT INTO m_reseau_humide.raepa_appar(
            idappareil, z)
    VALUES
('3', NULL),
('5', NULL);

-- ### APPAREILLAGE AEP ###

INSERT INTO m_reseau_humide.raepa_apparaep(
            idappareil, fnappaep)
    VALUES
('3', '07');

-- ### APPAREILLAGE ASS ###

INSERT INTO m_reseau_humide.raepa_apparass(
            idappareil, typreseau, fnappass)
    VALUES
('5', '02', '04');

-- ### OUVRAGE ###

INSERT INTO m_reseau_humide.raepa_ouvr(
            idouvrage, z)
    VALUES
('4', NULL),
('6', NULL);

-- ### OUVRAGE AEP ###

INSERT INTO m_reseau_humide.raepa_ouvraep(
            idouvrage, fnouvaep)
    VALUES
('4', '05');

-- ### OUVRAGE ASS ###

INSERT INTO m_reseau_humide.raepa_ouvrass(
            idouvrage, typreseau, fnouvass)
    VALUES
('6', '02', '06');


-- ### REPARATION ###

INSERT INTO m_reseau_humide.raepa_repar(
            idrepar, x, y, supprepare, defreparee, idsuprepar, daterepar, mouvrage, geom)
    VALUES
('1', 689318, 6920282, '01','04','01','15/02/2019','Collectivité 1', ST_GeomFromText('POINT(689318 6920282)', 2154)),
('2', 689320, 6920278, '01','02','02','22/01/2019','Collectivité 1', ST_GeomFromText('POINT(689320 6920278)', 2154)),
('3', 689315, 6920280, '02','05','03','17/10/2018','Collectivité 1', ST_GeomFromText('POINT(689315 6920280)', 2154)),
('4', 689325, 6920281, '03','03','06','01/01/2017','Collectivité 1', ST_GeomFromText('POINT(689325 6920281)', 2154));

/*



*/
