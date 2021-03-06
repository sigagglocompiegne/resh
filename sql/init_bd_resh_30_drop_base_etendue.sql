/*BASE DONNEES RESEAU HUMIDE*/
/*Script de suppression de la base de données des réseaux humides (RAEPA étendu) */
/*init_bd_resh_30_drop_base_etendue.sql*/
/*PostGIS*/

/* GeoCompiegnois - https://geo.compiegnois.fr/ */
/* Auteurs : Léandre Béron  */



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        DROP                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

--vue
DROP MATERIALIZED VIEW IF EXISTS x_opendata.x_opendata_geo_vmr_raepa_canalaep_l;
DROP MATERIALIZED VIEW IF EXISTS x_opendata.x_opendata_geo_vmr_raepa_canalass_l;
DROP MATERIALIZED VIEW IF EXISTS x_opendata.x_opendata_geo_vmr_raepa_apparaep_p;
DROP MATERIALIZED VIEW IF EXISTS x_opendata.x_opendata_geo_vmr_raepa_apparass_p;
DROP MATERIALIZED VIEW IF EXISTS x_opendata.x_opendata_geo_vmr_raepa_ouvrass_p;
DROP MATERIALIZED VIEW IF EXISTS x_opendata.x_opendata_geo_vmr_raepa_ouvraep_p;

DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_geo_vmr_canalass;
DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_geo_vmr_canalae;
DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_geo_vmr_noeud_ass;
DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_geo_vmr_noeud_ae;
DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_an_vmr_ouvae;
DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_an_vmr_ouvass;
DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_an_vmr_appae;
DROP MATERIALIZED VIEW IF EXISTS x_apps.x_apps_an_vmr_appass;

-- templates
DROP VIEW IF EXISTS m_raepa.template_RAEPA_CANALAEP_L;
DROP VIEW IF EXISTS m_raepa.template_RAEPA_CANALASS_L;
DROP VIEW IF EXISTS m_raepa.template_RAEPA_APPARAEP_P;
DROP VIEW IF EXISTS m_raepa.template_RAEPA_APPARASS_P;
DROP VIEW IF EXISTS m_raepa.template_RAEPA_OUVRAEP_P;
DROP VIEW IF EXISTS m_raepa.template_RAEPA_OUVRASS_P;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_materiau;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_modecirc;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_contcanaep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_fonccanaep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnappaep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnouvaep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_fonccanass;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_typreseau;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnappass;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnouvass;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_qualgloc;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_qualanee;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_contcanass;
DROP VIEW IF EXISTS m_raepa.template_lt_raepa_sensecoul;


DROP VIEW IF EXISTS m_raepa.template_RAEPAL_CANALAEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_CANALASS;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_OUVRAEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_OUVRASS;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_APPARAEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_APPARASS;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_STATPOMP_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_STATTRAIT_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_RESERV_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_CAPTAG_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_CHAMBR_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_CHAMBR_COMPT_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_CITERN_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_DEB_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_VIDANG_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_VANNE_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_REG_PRESS_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_COMPT_AEP;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_BRANCHEMNT_ASS;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_STEP_ASS;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_BASS_ASS;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_REG_ASS;
DROP VIEW IF EXISTS m_raepa.template_RAEPAL_AVALOIR_ASS;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_materiau;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_positver;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_etat;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_boolean;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_formcana;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typprot;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typimpl;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_sensecoul;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_contcanaep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnouvaep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typpompe;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typtrait;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typres;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typcapt;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typusage_ae;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnappaep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_position;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typexut;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typvanne;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_etatvan;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typregul;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typcompt;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_foncompt;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typracc;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnouvass;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typpompa;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_charge;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typbass;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typreg;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_formreg;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typusage_ass;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typaval;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_typstep;
DROP VIEW IF EXISTS m_raepa.template_lt_raepal_fnappass;



--------------
-- ###fkey  --
--------------

-- #an_raepal_objet_reseau
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepal_materiau_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepal_positver_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepal_etat_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepal_criticit_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepal_domaine_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepa_qualglocxy_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepa_qualglocz_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_objet_reseau DROP CONSTRAINT IF EXISTS lt_raepa_qualannee_fkey;


-- #geo_raepal_tronc
ALTER TABLE IF EXISTS m_raepa.geo_raepal_tronc DROP CONSTRAINT IF EXISTS lt_raepa_idnini_fkey;
ALTER TABLE IF EXISTS m_raepa.geo_raepal_tronc DROP CONSTRAINT IF EXISTS lt_raepa_idnterm_fkey;
ALTER TABLE IF EXISTS m_raepa.geo_raepal_tronc DROP CONSTRAINT IF EXISTS lt_raepal_sensecoul_fkey;

-- #geo_raepa_noeud

-- #an_raepa_canal
ALTER TABLE IF EXISTS m_raepa.an_raepa_canal DROP CONSTRAINT IF EXISTS lt_raepal_formcana_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canal DROP CONSTRAINT IF EXISTS lt_raepa_modecirc_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canal DROP CONSTRAINT IF EXISTS lt_raepal_idtronc_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canal DROP CONSTRAINT IF EXISTS lt_raepal_protext_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canal DROP CONSTRAINT IF EXISTS lt_raepal_protint_fkey;

-- #an_raepa_app
ALTER TABLE IF EXISTS m_raepa.an_raepa_app DROP CONSTRAINT IF EXISTS lt_raepal_acces_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_app DROP CONSTRAINT IF EXISTS lt_raepa_idouvrage_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_app DROP CONSTRAINT IF EXISTS lt_raepa_idnoeud_fkey;

-- #an_raepa_ouv
ALTER TABLE IF EXISTS m_raepa.an_raepa_ouv DROP CONSTRAINT IF EXISTS lt_raepal_acces_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_ouv DROP CONSTRAINT IF EXISTS lt_raepal_typimpl_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_ouv DROP CONSTRAINT IF EXISTS lt_raepa_idnoeud_fkey;

-- #an_raepa_canalass
ALTER TABLE IF EXISTS m_raepa.an_raepa_canalass DROP CONSTRAINT IF EXISTS lt_raepa_contcanass_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canalass DROP CONSTRAINT IF EXISTS lt_raepa_fonccanass_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canalass DROP CONSTRAINT IF EXISTS lt_raepa_typreseau_fkey;

-- #an_raepa_canalae
ALTER TABLE IF EXISTS m_raepa.an_raepa_canalae DROP CONSTRAINT IF EXISTS lt_raepal_contcanaep_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canalae DROP CONSTRAINT IF EXISTS lt_raepa_fonccanaep_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_canalae DROP CONSTRAINT IF EXISTS lt_raepal_protcath_fkey;

-- #an_raepa_ouvass
ALTER TABLE IF EXISTS m_raepa.an_raepa_ouvass DROP CONSTRAINT IF EXISTS lt_raepal_fnouvass_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_ouvass DROP CONSTRAINT IF EXISTS lt_raepa_typreseau_fkey;

-- #an_raepa_ouvae
ALTER TABLE IF EXISTS m_raepa.an_raepa_ouvae DROP CONSTRAINT IF EXISTS lt_raepal_fnouvaep_fkey;

-- #an_raepa_appass
ALTER TABLE IF EXISTS m_raepa.an_raepa_appass DROP CONSTRAINT IF EXISTS lt_raepal_fnappass_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepa_appass DROP CONSTRAINT IF EXISTS lt_raepa_typreseau_fkey;


-- #an_raepa_ouvae
ALTER TABLE IF EXISTS m_raepa.an_raepa_appae DROP CONSTRAINT IF EXISTS lt_raepal_fnappaep_fkey;

-- #an_raepal_brcht_ass
ALTER TABLE IF EXISTS m_raepa.an_raepal_brcht_ass DROP CONSTRAINT IF EXISTS lt_raepal_conform_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_brcht_ass DROP CONSTRAINT IF EXISTS lt_raepal_typracc_fkey;

-- #an_raepal_vidange_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_vidange_ae DROP CONSTRAINT IF EXISTS lt_raepal_positvid_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_vidange_ae DROP CONSTRAINT IF EXISTS lt_raepal_typexut_fkey;

-- #an_raepal_vanne_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_vanne_ae DROP CONSTRAINT IF EXISTS lt_raepal_etatvan_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_vanne_ae DROP CONSTRAINT IF EXISTS lt_raepal_typvanne_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_vanne_ae DROP CONSTRAINT IF EXISTS lt_raepal_positvan_fkey;

-- #an_raepal_deb_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_deb_ae DROP CONSTRAINT IF EXISTS lt_raepal_positdeb_fkey;


-- #an_raepal_reg_press_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_reg_press_ae DROP CONSTRAINT IF EXISTS lt_raepal_typregul_fkey;

-- #an_raepal_compt_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_compt_ae DROP CONSTRAINT IF EXISTS lt_raepal_foncompt_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_compt_ae DROP CONSTRAINT IF EXISTS lt_raepal_typcompt_fkey;

-- #an_raepal_stat_pomp_ass
ALTER TABLE IF EXISTS m_raepa.an_raepal_stat_pomp_ass DROP CONSTRAINT IF EXISTS lt_raepal_traith2s_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_stat_pomp_ass DROP CONSTRAINT IF EXISTS lt_raepal_troplein_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_stat_pomp_ass DROP CONSTRAINT IF EXISTS lt_raepal_typpompa_fkey;

-- #an_raepal_step_ass
ALTER TABLE IF EXISTS m_raepa.an_raepal_step_ass DROP CONSTRAINT IF EXISTS lt_raepal_charge_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_step_ass DROP CONSTRAINT IF EXISTS lt_raepal_typstep_fkey;

-- #an_raepal_bass_stock_ass
ALTER TABLE IF EXISTS m_raepa.an_raepal_bass_stock_ass DROP CONSTRAINT IF EXISTS lt_raepal_typbass_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_bass_stock_ass DROP CONSTRAINT IF EXISTS lt_raepal_telegest_fkey;

-- #an_raepal_regard_ass
ALTER TABLE IF EXISTS m_raepa.an_raepal_regard_ass DROP CONSTRAINT IF EXISTS lt_raepal_decant_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_regard_ass DROP CONSTRAINT IF EXISTS lt_raepal_formreg_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_regard_ass DROP CONSTRAINT IF EXISTS lt_raepal_grille_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_regard_ass DROP CONSTRAINT IF EXISTS lt_raepal_tampon_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_regard_ass DROP CONSTRAINT IF EXISTS lt_raepal_typreg_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_regard_ass DROP CONSTRAINT IF EXISTS lt_raepal_visit_fkey;

-- #an_raepal_avaloir_ass
ALTER TABLE IF EXISTS m_raepa.an_raepal_avaloir_ass DROP CONSTRAINT IF EXISTS lt_raepal_decant_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_avaloir_ass DROP CONSTRAINT IF EXISTS lt_raepal_modpass_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_avaloir_ass DROP CONSTRAINT IF EXISTS lt_raepal_nivvoiri_fkey;
ALTER TABLE IF EXISTS m_raepa.an_raepal_avaloir_ass DROP CONSTRAINT IF EXISTS lt_raepal_typaval_fkey;

-- #an_raepal_reg_bt_brchmt_ass
ALTER TABLE IF EXISTS m_raepa.an_raepal_reg_bt_brchmt_ass DROP CONSTRAINT IF EXISTS lt_raepal_typusage_fkey;

-- #an_raepal_stat_pomp_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_stat_pomp_ae DROP CONSTRAINT IF EXISTS lt_raepal_typpomp_fkey;

-- #an_raepal_stat_trait_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_stat_trait_ae DROP CONSTRAINT IF EXISTS lt_raepal_typtrait_fkey;

-- #an_raepal_reservoir_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_reservoir_ae DROP CONSTRAINT IF EXISTS lt_raepal_typres_fkey;

-- #an_raepal_captage_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_captage_ae DROP CONSTRAINT IF EXISTS lt_raepal_typcapt_fkey;

-- #an_raepal_chambr_ae

-- #an_raepal_citerneau_ae
ALTER TABLE IF EXISTS m_raepa.an_raepal_citerneau_ae DROP CONSTRAINT IF EXISTS lt_raepal_typusage_fkey;

-- #an_raepal_chambr_compt_ae

------------
-- classe --                                   
------------

-- classe
DROP TABLE IF EXISTS m_raepa.an_raepal_correspondance;
DROP TABLE IF EXISTS m_raepa.geo_raepal_comparateur;

DROP TABLE IF EXISTS m_raepa.an_raepal_objet_reseau;

DROP TABLE IF EXISTS m_raepa.geo_raepal_tronc;
DROP TABLE IF EXISTS m_raepa.geo_raepa_noeud;

DROP TABLE IF EXISTS m_raepa.an_raepa_canal;
DROP TABLE IF EXISTS m_raepa.an_raepa_app;
DROP TABLE IF EXISTS m_raepa.an_raepa_ouv;

DROP TABLE IF EXISTS m_raepa.an_raepa_canalass;
DROP TABLE IF EXISTS m_raepa.an_raepa_canalae;
DROP TABLE IF EXISTS m_raepa.an_raepa_ouvass;
DROP TABLE IF EXISTS m_raepa.an_raepa_ouvae;
DROP TABLE IF EXISTS m_raepa.an_raepa_appass;
DROP TABLE IF EXISTS m_raepa.an_raepa_appae;

DROP TABLE IF EXISTS m_raepa.an_raepal_brcht_ass;
DROP TABLE IF EXISTS m_raepa.an_raepal_vidange_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_deb_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_vanne_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_reg_press_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_compt_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_stat_pomp_ass;
DROP TABLE IF EXISTS m_raepa.an_raepal_step_ass;
DROP TABLE IF EXISTS m_raepa.an_raepal_regard_ass;
DROP TABLE IF EXISTS m_raepa.an_raepal_bass_stock_ass;
DROP TABLE IF EXISTS m_raepa.an_raepal_reg_bt_brchmt_ass;
DROP TABLE IF EXISTS m_raepa.an_raepal_avaloir_ass;
DROP TABLE IF EXISTS m_raepa.an_raepal_stat_pomp_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_stat_trait_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_reservoir_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_captage_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_chambr_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_citerneau_ae;
DROP TABLE IF EXISTS m_raepa.an_raepal_chambr_compt_ae;

DROP TABLE IF EXISTS m_raepa.geo_raepa_repar;



-- domaine de valeur
DROP TABLE IF EXISTS m_raepa.lt_raepa_boolean;
DROP TABLE IF EXISTS m_raepa.lt_raepal_contcanaep;
DROP TABLE IF EXISTS m_raepa.lt_raepa_contcanass;
DROP TABLE IF EXISTS m_raepa.lt_raepa_defaillance;
DROP TABLE IF EXISTS m_raepa.lt_raepal_fnappaep;
DROP TABLE IF EXISTS m_raepa.lt_raepal_fnappass;
DROP TABLE IF EXISTS m_raepa.lt_raepa_fonccanaep;
DROP TABLE IF EXISTS m_raepa.lt_raepa_fonccanass;
DROP TABLE IF EXISTS m_raepa.lt_raepa_modecirc;
DROP TABLE IF EXISTS m_raepa.lt_raepa_qualannee;
DROP TABLE IF EXISTS m_raepa.lt_raepa_qualgloc;
DROP TABLE IF EXISTS m_raepa.lt_raepa_support_incident;
DROP TABLE IF EXISTS m_raepa.lt_raepa_typreseau;
DROP TABLE IF EXISTS m_raepa.lt_raepal_boolean;
DROP TABLE IF EXISTS m_raepa.lt_raepal_charge;
DROP TABLE IF EXISTS m_raepa.lt_raepal_domaine;
DROP TABLE IF EXISTS m_raepa.lt_raepal_etat;
DROP TABLE IF EXISTS m_raepa.lt_raepal_etatvan;
DROP TABLE IF EXISTS m_raepa.lt_raepal_fnouvaep;
DROP TABLE IF EXISTS m_raepa.lt_raepal_fnouvass;
DROP TABLE IF EXISTS m_raepa.lt_raepal_foncompt;
DROP TABLE IF EXISTS m_raepa.lt_raepal_formcana;
DROP TABLE IF EXISTS m_raepa.lt_raepal_formreg;
DROP TABLE IF EXISTS m_raepa.lt_raepal_materiau;
DROP TABLE IF EXISTS m_raepa.lt_raepal_positver;
DROP TABLE IF EXISTS m_raepa.lt_raepal_position;
DROP TABLE IF EXISTS m_raepa.lt_raepal_sensecoul;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typaval;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typbass;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typcapt;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typcompt;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typexut;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typimpl;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typpompa;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typpompe;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typprot;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typracc;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typreg;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typregul;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typres;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typstep;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typtrait;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typusage_ae;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typusage_ass;
DROP TABLE IF EXISTS m_raepa.lt_raepal_typvanne;


-- sequence
DROP SEQUENCE IF EXISTS m_raepa.raepa_id_obj_reseau_seq; -- séquence d'objet du réseau
DROP SEQUENCE IF EXISTS m_raepa.raepa_id_noeud_seq; -- séquence des noeuds
DROP SEQUENCE IF EXISTS m_raepa.raepa_id_tronc_seq; -- séquence des tronçons
DROP SEQUENCE IF EXISTS m_raepa.raepa_id_repar_seq; -- pour réparation plus tard                                                   

-- schema
DROP SCHEMA IF EXISTS m_raepa;
 
