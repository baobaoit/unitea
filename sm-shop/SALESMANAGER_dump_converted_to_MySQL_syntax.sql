/*
------------------------------
-- After create the database SALESMANAGER on MySQL
-- Please execute this command: mysql -uroot SALESMANAGER < /path/to/SALESMANAGER_dump_converted_to_MySQL_syntax.sql
------------------------------
*/
DELIMITER $$
    DROP FUNCTION IF EXISTS `STRINGDECODE`$$ 
    CREATE FUNCTION `STRINGDECODE`(X TEXT) RETURNS TEXT CHARSET latin1 DETERMINISTIC
    BEGIN 

    DECLARE TextString TEXT ; 
    SET TextString = X ; 

    #quotation mark 
    IF INSTR( X , '&quot;' ) 
    THEN SET TextString = REPLACE(TextString, '&quot;','"') ; 
    END IF ; 

    #apostrophe  
    IF INSTR( X , '&apos;' ) 
    THEN SET TextString = REPLACE(TextString, '&apos;','"') ; 
    END IF ; 

    #ampersand 
    IF INSTR( X , '&amp;' ) 
    THEN SET TextString = REPLACE(TextString, '&amp;','&') ; 
    END IF ; 

    #less-than 
    IF INSTR( X , '&lt;' ) 
    THEN SET TextString = REPLACE(TextString, '&lt;','<') ; 
    END IF ; 

    #greater-than 
    IF INSTR( X , '&gt;' ) 
    THEN SET TextString = REPLACE(TextString, '&gt;','>') ; 
    END IF ; 

    #non-breaking space 
    IF INSTR( X , '&nbsp;' ) 
    THEN SET TextString = REPLACE(TextString, '&nbsp;',' ') ; 
    END IF ; 

    #inverted exclamation mark 
    IF INSTR( X , '&iexcl;' ) 
    THEN SET TextString = REPLACE(TextString, '&iexcl;','¡') ; 
    END IF ; 

    #cent 
    IF INSTR( X , '&cent;' ) 
    THEN SET TextString = REPLACE(TextString, '&cent;','¢') ; 
    END IF ; 

    #pound 
    IF INSTR( X , '&pound;' ) 
    THEN SET TextString = REPLACE(TextString, '&pound;','£') ; 
    END IF ; 

    #currency 
    IF INSTR( X , '&curren;' ) 
    THEN SET TextString = REPLACE(TextString, '&curren;','¤') ; 
    END IF ; 

    #yen 
    IF INSTR( X , '&yen;' ) 
    THEN SET TextString = REPLACE(TextString, '&yen;','¥') ; 
    END IF ; 

    #broken vertical bar 
    IF INSTR( X , '&brvbar;' ) 
    THEN SET TextString = REPLACE(TextString, '&brvbar;','¦') ; 
    END IF ; 

    #section 
    IF INSTR( X , '&sect;' ) 
    THEN SET TextString = REPLACE(TextString, '&sect;','§') ; 
    END IF ; 

    #spacing diaeresis 
    IF INSTR( X , '&uml;' ) 
    THEN SET TextString = REPLACE(TextString, '&uml;','¨') ; 
    END IF ; 

    #copyright 
    IF INSTR( X , '&copy;' ) 
    THEN SET TextString = REPLACE(TextString, '&copy;','©') ; 
    END IF ; 

    #feminine ordinal indicator 
    IF INSTR( X , '&ordf;' ) 
    THEN SET TextString = REPLACE(TextString, '&ordf;','ª') ; 
    END IF ; 

    #angle quotation mark (left) 
    IF INSTR( X , '&laquo;' ) 
    THEN SET TextString = REPLACE(TextString, '&laquo;','«') ; 
    END IF ; 

    #negation 
    IF INSTR( X , '&not;' ) 
    THEN SET TextString = REPLACE(TextString, '&not;','¬') ; 
    END IF ; 

    #soft hyphen 
    IF INSTR( X , '&shy;' ) 
    THEN SET TextString = REPLACE(TextString, '&shy;','­') ; 
    END IF ; 

    #registered trademark 
    IF INSTR( X , '&reg;' ) 
    THEN SET TextString = REPLACE(TextString, '&reg;','®') ; 
    END IF ; 

    #spacing macron 
    IF INSTR( X , '&macr;' ) 
    THEN SET TextString = REPLACE(TextString, '&macr;','¯') ; 
    END IF ; 

    #degree 
    IF INSTR( X , '&deg;' ) 
    THEN SET TextString = REPLACE(TextString, '&deg;','°') ; 
    END IF ; 

    #plus-or-minus  
    IF INSTR( X , '&plusmn;' ) 
    THEN SET TextString = REPLACE(TextString, '&plusmn;','±') ; 
    END IF ; 

    #superscript 2 
    IF INSTR( X , '&sup2;' ) 
    THEN SET TextString = REPLACE(TextString, '&sup2;','²') ; 
    END IF ; 

    #superscript 3 
    IF INSTR( X , '&sup3;' ) 
    THEN SET TextString = REPLACE(TextString, '&sup3;','³') ; 
    END IF ; 

    #spacing acute 
    IF INSTR( X , '&acute;' ) 
    THEN SET TextString = REPLACE(TextString, '&acute;','´') ; 
    END IF ; 

    #micro 
    IF INSTR( X , '&micro;' ) 
    THEN SET TextString = REPLACE(TextString, '&micro;','µ') ; 
    END IF ; 

    #paragraph 
    IF INSTR( X , '&para;' ) 
    THEN SET TextString = REPLACE(TextString, '&para;','¶') ; 
    END IF ; 

    #middle dot 
    IF INSTR( X , '&middot;' ) 
    THEN SET TextString = REPLACE(TextString, '&middot;','·') ; 
    END IF ; 

    #spacing cedilla 
    IF INSTR( X , '&cedil;' ) 
    THEN SET TextString = REPLACE(TextString, '&cedil;','¸') ; 
    END IF ; 

    #superscript 1 
    IF INSTR( X , '&sup1;' ) 
    THEN SET TextString = REPLACE(TextString, '&sup1;','¹') ; 
    END IF ; 

    #masculine ordinal indicator 
    IF INSTR( X , '&ordm;' ) 
    THEN SET TextString = REPLACE(TextString, '&ordm;','º') ; 
    END IF ; 

    #angle quotation mark (right) 
    IF INSTR( X , '&raquo;' ) 
    THEN SET TextString = REPLACE(TextString, '&raquo;','»') ; 
    END IF ; 

    #fraction 1/4 
    IF INSTR( X , '&frac14;' ) 
    THEN SET TextString = REPLACE(TextString, '&frac14;','¼') ; 
    END IF ; 

    #fraction 1/2 
    IF INSTR( X , '&frac12;' ) 
    THEN SET TextString = REPLACE(TextString, '&frac12;','½') ; 
    END IF ; 

    #fraction 3/4 
    IF INSTR( X , '&frac34;' ) 
    THEN SET TextString = REPLACE(TextString, '&frac34;','¾') ; 
    END IF ; 

    #inverted question mark 
    IF INSTR( X , '&iquest;' ) 
    THEN SET TextString = REPLACE(TextString, '&iquest;','¿') ; 
    END IF ; 

    #multiplication 
    IF INSTR( X , '&times;' ) 
    THEN SET TextString = REPLACE(TextString, '&times;','×') ; 
    END IF ; 

    #division 
    IF INSTR( X , '&divide;' ) 
    THEN SET TextString = REPLACE(TextString, '&divide;','÷') ; 
    END IF ; 

    #capital a, grave accent 
    IF INSTR( X , '&Agrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Agrave;','À') ; 
    END IF ; 

    #capital a, acute accent 
    IF INSTR( X , '&Aacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Aacute;','Á') ; 
    END IF ; 

    #capital a, circumflex accent 
    IF INSTR( X , '&Acirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Acirc;','Â') ; 
    END IF ; 

    #capital a, tilde 
    IF INSTR( X , '&Atilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&Atilde;','Ã') ; 
    END IF ; 

    #capital a, umlaut mark 
    IF INSTR( X , '&Auml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Auml;','Ä') ; 
    END IF ; 

    #capital a, ring 
    IF INSTR( X , '&Aring;' ) 
    THEN SET TextString = REPLACE(TextString, '&Aring;','Å') ; 
    END IF ; 

    #capital ae 
    IF INSTR( X , '&AElig;' ) 
    THEN SET TextString = REPLACE(TextString, '&AElig;','Æ') ; 
    END IF ; 

    #capital c, cedilla 
    IF INSTR( X , '&Ccedil;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ccedil;','Ç') ; 
    END IF ; 

    #capital e, grave accent 
    IF INSTR( X , '&Egrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Egrave;','È') ; 
    END IF ; 

    #capital e, acute accent 
    IF INSTR( X , '&Eacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Eacute;','É') ; 
    END IF ; 

    #capital e, circumflex accent 
    IF INSTR( X , '&Ecirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ecirc;','Ê') ; 
    END IF ; 

    #capital e, umlaut mark 
    IF INSTR( X , '&Euml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Euml;','Ë') ; 
    END IF ; 

    #capital i, grave accent 
    IF INSTR( X , '&Igrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Igrave;','Ì') ; 
    END IF ; 

    #capital i, acute accent 
    IF INSTR( X , '&Iacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Iacute;','Í') ; 
    END IF ; 

    #capital i, circumflex accent 
    IF INSTR( X , '&Icirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Icirc;','Î') ; 
    END IF ; 

    #capital i, umlaut mark 
    IF INSTR( X , '&Iuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Iuml;','Ï') ; 
    END IF ; 

    #capital eth, Icelandic 
    IF INSTR( X , '&ETH;' ) 
    THEN SET TextString = REPLACE(TextString, '&ETH;','Ð') ; 
    END IF ; 

    #capital n, tilde 
    IF INSTR( X , '&Ntilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ntilde;','Ñ') ; 
    END IF ; 

    #capital o, grave accent 
    IF INSTR( X , '&Ograve;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ograve;','Ò') ; 
    END IF ; 

    #capital o, acute accent 
    IF INSTR( X , '&Oacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Oacute;','Ó') ; 
    END IF ; 

    #capital o, circumflex accent 
    IF INSTR( X , '&Ocirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ocirc;','Ô') ; 
    END IF ; 

    #capital o, tilde 
    IF INSTR( X , '&Otilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&Otilde;','Õ') ; 
    END IF ; 

    #capital o, umlaut mark 
    IF INSTR( X , '&Ouml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ouml;','Ö') ; 
    END IF ; 

    #capital o, slash 
    IF INSTR( X , '&Oslash;' ) 
    THEN SET TextString = REPLACE(TextString, '&Oslash;','Ø') ; 
    END IF ; 

    #capital u, grave accent 
    IF INSTR( X , '&Ugrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ugrave;','Ù') ; 
    END IF ; 

    #capital u, acute accent 
    IF INSTR( X , '&Uacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Uacute;','Ú') ; 
    END IF ; 

    #capital u, circumflex accent 
    IF INSTR( X , '&Ucirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ucirc;','Û') ; 
    END IF ; 

    #capital u, umlaut mark 
    IF INSTR( X , '&Uuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Uuml;','Ü') ; 
    END IF ; 

    #capital y, acute accent 
    IF INSTR( X , '&Yacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Yacute;','Ý') ; 
    END IF ; 

    #capital THORN, Icelandic 
    IF INSTR( X , '&THORN;' ) 
    THEN SET TextString = REPLACE(TextString, '&THORN;','Þ') ; 
    END IF ; 

    #small sharp s, German 
    IF INSTR( X , '&szlig;' ) 
    THEN SET TextString = REPLACE(TextString, '&szlig;','ß') ; 
    END IF ; 

    #small a, grave accent 
    IF INSTR( X , '&agrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&agrave;','à') ; 
    END IF ; 

    #small a, acute accent 
    IF INSTR( X , '&aacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&aacute;','á') ; 
    END IF ; 

    #small a, circumflex accent 
    IF INSTR( X , '&acirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&acirc;','â') ; 
    END IF ; 

    #small a, tilde 
    IF INSTR( X , '&atilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&atilde;','ã') ; 
    END IF ; 

    #small a, umlaut mark 
    IF INSTR( X , '&auml;' ) 
    THEN SET TextString = REPLACE(TextString, '&auml;','ä') ; 
    END IF ; 

    #small a, ring 
    IF INSTR( X , '&aring;' ) 
    THEN SET TextString = REPLACE(TextString, '&aring;','å') ; 
    END IF ; 

    #small ae 
    IF INSTR( X , '&aelig;' ) 
    THEN SET TextString = REPLACE(TextString, '&aelig;','æ') ; 
    END IF ; 

    #small c, cedilla 
    IF INSTR( X , '&ccedil;' ) 
    THEN SET TextString = REPLACE(TextString, '&ccedil;','ç') ; 
    END IF ; 

    #small e, grave accent 
    IF INSTR( X , '&egrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&egrave;','è') ; 
    END IF ; 

    #small e, acute accent 
    IF INSTR( X , '&eacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&eacute;','é') ; 
    END IF ; 

    #small e, circumflex accent 
    IF INSTR( X , '&ecirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&ecirc;','ê') ; 
    END IF ; 

    #small e, umlaut mark 
    IF INSTR( X , '&euml;' ) 
    THEN SET TextString = REPLACE(TextString, '&euml;','ë') ; 
    END IF ; 

    #small i, grave accent 
    IF INSTR( X , '&igrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&igrave;','ì') ; 
    END IF ; 

    #small i, acute accent 
    IF INSTR( X , '&iacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&iacute;','í') ; 
    END IF ; 

    #small i, circumflex accent 
    IF INSTR( X , '&icirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&icirc;','î') ; 
    END IF ; 

    #small i, umlaut mark 
    IF INSTR( X , '&iuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&iuml;','ï') ; 
    END IF ; 

    #small eth, Icelandic 
    IF INSTR( X , '&eth;' ) 
    THEN SET TextString = REPLACE(TextString, '&eth;','ð') ; 
    END IF ; 

    #small n, tilde 
    IF INSTR( X , '&ntilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&ntilde;','ñ') ; 
    END IF ; 

    #small o, grave accent 
    IF INSTR( X , '&ograve;' ) 
    THEN SET TextString = REPLACE(TextString, '&ograve;','ò') ; 
    END IF ; 

    #small o, acute accent 
    IF INSTR( X , '&oacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&oacute;','ó') ; 
    END IF ; 

    #small o, circumflex accent 
    IF INSTR( X , '&ocirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&ocirc;','ô') ; 
    END IF ; 

    #small o, tilde 
    IF INSTR( X , '&otilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&otilde;','õ') ; 
    END IF ; 

    #small o, umlaut mark 
    IF INSTR( X , '&ouml;' ) 
    THEN SET TextString = REPLACE(TextString, '&ouml;','ö') ; 
    END IF ; 

    #small o, slash 
    IF INSTR( X , '&oslash;' ) 
    THEN SET TextString = REPLACE(TextString, '&oslash;','ø') ; 
    END IF ; 

    #small u, grave accent 
    IF INSTR( X , '&ugrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&ugrave;','ù') ; 
    END IF ; 

    #small u, acute accent 
    IF INSTR( X , '&uacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&uacute;','ú') ; 
    END IF ; 

    #small u, circumflex accent 
    IF INSTR( X , '&ucirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&ucirc;','û') ; 
    END IF ; 

    #small u, umlaut mark 
    IF INSTR( X , '&uuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&uuml;','ü') ; 
    END IF ; 

    #small y, acute accent 
    IF INSTR( X , '&yacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&yacute;','ý') ; 
    END IF ; 

    #small thorn, Icelandic 
    IF INSTR( X , '&thorn;' ) 
    THEN SET TextString = REPLACE(TextString, '&thorn;','þ') ; 
    END IF ; 

    #small y, umlaut mark 
    IF INSTR( X , '&yuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&yuml;','ÿ') ; 
    END IF ; 

    RETURN TextString ; 

    END$$ 

DELIMITER ;
;              
CREATE TABLE SALESMANAGER.CATEGORY(
    CATEGORY_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CATEGORY_IMAGE VARCHAR(100),
    CATEGORY_STATUS BOOLEAN,
    CODE VARCHAR(100) NOT NULL,
    DEPTH INTEGER,
    FEATURED BOOLEAN,
    LINEAGE VARCHAR(255),
    SORT_ORDER INTEGER,
    VISIBLE BOOLEAN,
    MERCHANT_ID INTEGER NOT NULL,
    PARENT_ID BIGINT
);          
ALTER TABLE SALESMANAGER.CATEGORY ADD PRIMARY KEY(CATEGORY_ID); 
-- 4 +/- SELECT COUNT(*) FROM SALESMANAGER.CATEGORY;           
INSERT INTO SALESMANAGER.CATEGORY VALUES
(1, TIMESTAMP '2019-03-06 21:36:50.346', TIMESTAMP '2019-03-06 21:36:50.346', 'admin', NULL, FALSE, 'beachbags', 0, FALSE, '/1', 10, TRUE, 1, NULL),
(2, TIMESTAMP '2019-03-06 21:36:37.672', TIMESTAMP '2019-03-06 21:36:37.672', 'admin', NULL, FALSE, 'handbags', 0, FALSE, '/2', 0, TRUE, 1, NULL),
(3, TIMESTAMP '2019-03-06 21:37:50.455', TIMESTAMP '2019-03-06 21:37:50.455', 'admin', NULL, FALSE, 'laptop', 0, FALSE, '/3', 20, TRUE, 1, NULL),
(4, TIMESTAMP '2019-07-19 08:00:47.087', TIMESTAMP '2019-07-19 08:00:47.087', 'admin', NULL, FALSE, 'bags', 0, FALSE, '/4', 30, TRUE, 1, NULL);         
CREATE TABLE SALESMANAGER.CATEGORY_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    CATEGORY_HIGHLIGHT VARCHAR(255),
    META_DESCRIPTION VARCHAR(255),
    META_KEYWORDS VARCHAR(255),
    META_TITLE VARCHAR(120),
    SEF_URL VARCHAR(120),
    LANGUAGE_ID INTEGER NOT NULL,
    CATEGORY_ID BIGINT NOT NULL
);  
ALTER TABLE SALESMANAGER.CATEGORY_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);  
-- 5 +/- SELECT COUNT(*) FROM SALESMANAGER.CATEGORY_DESCRIPTION;               
INSERT INTO SALESMANAGER.CATEGORY_DESCRIPTION VALUES
(700, TIMESTAMP '2019-03-06 21:36:50.346', TIMESTAMP '2019-03-06 21:36:50.346', NULL, '', 'Beach bags', NULL, '', '', '', 'Vintage Bags - Beach bags', 'beach-bags', 1, 1),
(701, TIMESTAMP '2019-03-06 21:36:37.673', TIMESTAMP '2019-03-06 21:36:37.673', NULL, '', 'Handbags', NULL, '', '', '', 'Vintage Bags - Handbags', 'handbags', 1, 2),
(702, TIMESTAMP '2019-03-06 21:37:50.455', TIMESTAMP '2019-03-06 21:37:50.455', NULL, '', 'Laptop Bags', NULL, '', '', '', 'Vintage Bags - Laptop bags', 'laptop-bags', 1, 3),
(703, TIMESTAMP '2019-07-19 08:00:47.087', TIMESTAMP '2019-07-19 08:00:47.087', NULL, '', 'Bags', NULL, '', '', '', 'Vintage Bags - Bags', 'bags', 1, 4),
(900, TIMESTAMP '2019-07-19 08:00:47.071', TIMESTAMP '2019-07-19 08:00:47.071', NULL, '', 'Sacs', NULL, '', '', '', '', 'sacs', 2, 4);     
CREATE TABLE SALESMANAGER.CONTENT(
    CONTENT_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CODE VARCHAR(100) NOT NULL,
    CONTENT_POSITION VARCHAR(10),
    CONTENT_TYPE VARCHAR(10),
    LINK_TO_MENU BOOLEAN,
    PRODUCT_GROUP VARCHAR(255),
    SORT_ORDER INTEGER,
    VISIBLE BOOLEAN,
    MERCHANT_ID INTEGER NOT NULL
);             
ALTER TABLE SALESMANAGER.CONTENT ADD PRIMARY KEY(CONTENT_ID);   
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.CONTENT;            
INSERT INTO SALESMANAGER.CONTENT VALUES
(1, NULL, NULL, NULL, 'LANDING_PAGE', NULL, 'SECTION', FALSE, NULL, 0, TRUE, 1),
(2, NULL, NULL, NULL, 'bannerImage', 'LEFT', 'BOX', FALSE, NULL, 0, TRUE, 1),
(3, NULL, NULL, NULL, 'headerMessage', NULL, 'BOX', FALSE, NULL, 0, TRUE, 1),
(50, NULL, NULL, NULL, 'footerImage', 'LEFT', 'BOX', FALSE, NULL, 0, TRUE, 1);      
CREATE INDEX CODE_IDX ON SALESMANAGER.CONTENT(CODE);    
CREATE TABLE SALESMANAGER.CONTENT_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    META_DESCRIPTION VARCHAR(255),
    META_KEYWORDS VARCHAR(255),
    META_TITLE VARCHAR(255),
    SEF_URL VARCHAR(120),
    LANGUAGE_ID INTEGER NOT NULL,
    CONTENT_ID BIGINT NOT NULL
);           
ALTER TABLE SALESMANAGER.CONTENT_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);   
-- 5 +/- SELECT COUNT(*) FROM SALESMANAGER.CONTENT_DESCRIPTION;
INSERT INTO SALESMANAGER.CONTENT_DESCRIPTION VALUES
(5, TIMESTAMP '2021-06-09 15:45:13.915', TIMESTAMP '2021-06-09 15:45:13.915', NULL, STRINGDECODE('<p>Free delivery on order over  US$59.99</p>'), 'headerMessage', NULL, NULL, NULL, NULL, NULL, 1, 3),
(6, TIMESTAMP '2021-06-09 15:50:13.915', TIMESTAMP '2021-06-09 15:50:13.915', NULL, STRINGDECODE('<p>Livraison gratuite sur tout achat de plus de  US$79.99</p>'), 'headerMessage', NULL, NULL, NULL, NULL, NULL, 2, 3),
(650, TIMESTAMP '2019-03-06 21:22:49.645', TIMESTAMP '2020-03-11 19:44:29.607', NULL, STRINGDECODE('<style type=\text/css\>\r\n.my-featured-title {\r\n   background: #fff;\r\n   padding: 20px;\r\n}\r\n\r\n.ilt {\r\n    text-align: center;\r\n}\r\n\r\n.ilt p {\r\n    font-family: \Lucida Grande\,Tahoma;\r\n    font-size: 12px;\r\n    font-weight: lighter;\r\n    font-variant: normal;\r\n    text-transform: uppercase;\r\n    color: #666;\r\n    margin-top: 10px;\r\n    text-align: center!important;\r\n    letter-spacing: .3em;\r\n}\r\n\r\n.ilt h2 {\r\n    font-family: Georgia,\Times New Roman\,Times,serif;\r\n    font-size: 36px;\r\n    margin-top: 5px;\r\n    margin-bottom: 0;\r\n    letter-spacing: 0;\r\n    text-align: center;\r\n    font-weight: 400;\r\n    color: #222;\r\n    text-transform: none;\r\n}</style>\r\n<div class=\my-featured-title\>\r\n\t<div class=\ilt\>\r\n\t\t<h2>\r\n\t\t\tFeatured items</h2>\r\n\t\t<p>\r\n\t\t\tThis is a list of our favorite findings</p>\r\n\t</div>\r\n</div>'), 'Vintage Bags - Shopizer demo', 'Vintage Bags - Shopizer demo', '', '', NULL, NULL, 1, 1),
(651, TIMESTAMP '2020-03-11 19:45:24.702', TIMESTAMP '2020-03-11 19:45:24.702', NULL, STRINGDECODE('<section id=\home-banner\ style=\margin-top:0px !important;\>\r\n\t<article>\r\n\t\t<div class=\image-content\>\r\n\t\t\t<img alt=\text\ src=\/static/files/DEFAULT/IMAGE/banner-resized.jpg\ /></div>\r\n\t</article>\r\n</section>\r\n'), 'bannerImage', NULL, NULL, NULL, NULL, NULL, 1, 2),
(950, TIMESTAMP '2020-03-11 19:32:01.466', TIMESTAMP '2020-03-11 19:32:01.466', NULL, STRINGDECODE('<p>\r\n\t<img alt=\\ src=\/static/files/DEFAULT/IMAGE/bag-picture-text.jpg\ style=\width: 360px; height: 200px;\ /></p>\r\n'), 'footerImage', NULL, NULL, NULL, NULL, NULL, 1, 50),
(951, TIMESTAMP '2020-03-11 19:32:01.468', TIMESTAMP '2020-03-11 19:32:01.468', NULL, STRINGDECODE('<p>\r\n\t<img alt=\\ src=\/static/files/DEFAULT/IMAGE/bag-picture-text.jpg\ style=\width: 360px; height: 200px;\ /></p>\r\n'), 'footerImage', NULL, NULL, NULL, NULL, NULL, 2, 50),
(952, TIMESTAMP '2020-03-11 19:44:29.606', TIMESTAMP '2020-03-11 19:44:29.606', NULL, STRINGDECODE('<style type=\text/css\>\r\n.my-featured-title {\r\n   background: #fff;\r\n   padding: 20px;\r\n}\r\n\r\n.ilt {\r\n    text-align: center;\r\n}\r\n\r\n.ilt p {\r\n    font-family: \Lucida Grande\,Tahoma;\r\n    font-size: 12px;\r\n    font-weight: lighter;\r\n    font-variant: normal;\r\n    text-transform: uppercase;\r\n    color: #666;\r\n    margin-top: 10px;\r\n    text-align: center!important;\r\n    letter-spacing: .3em;\r\n}\r\n\r\n.ilt h2 {\r\n    font-family: Georgia,\Times New Roman\,Times,serif;\r\n    font-size: 36px;\r\n    margin-top: 5px;\r\n    margin-bottom: 0;\r\n    letter-spacing: 0;\r\n    text-align: center;\r\n    font-weight: 400;\r\n    color: #222;\r\n    text-transform: none;\r\n}</style>\r\n<div class=\my-featured-title\>\r\n\t<div class=\ilt\>\r\n\t\t<h2>\r\n\t\t\tArticles vedettes</h2>\r\n\t</div>\r\n</div>'), 'Vintage Bags - Shopizer demo', NULL, '', '', NULL, NULL, 2, 1); 
CREATE TABLE SALESMANAGER.COUNTRY(
    COUNTRY_ID INTEGER NOT NULL,
    COUNTRY_ISOCODE VARCHAR(255) NOT NULL,
    COUNTRY_SUPPORTED BOOLEAN,
    GEOZONE_ID BIGINT
);      
ALTER TABLE SALESMANAGER.COUNTRY ADD PRIMARY KEY(COUNTRY_ID);  
-- 95 +/- SELECT COUNT(*) FROM SALESMANAGER.COUNTRY;           
INSERT INTO SALESMANAGER.COUNTRY VALUES
(1, 'AL', TRUE, NULL),
(2, 'DZ', TRUE, NULL),
(3, 'AR', TRUE, NULL),
(4, 'AU', TRUE, NULL),
(5, 'AT', TRUE, NULL),
(6, 'BH', TRUE, NULL),
(7, 'BY', TRUE, NULL),
(8, 'BE', TRUE, NULL),
(9, 'BO', TRUE, NULL),
(10, 'BA', TRUE, NULL),
(11, 'BR', TRUE, NULL),
(12, 'BG', TRUE, NULL),
(13, 'CA', TRUE, NULL),
(14, 'CL', TRUE, NULL),
(15, 'CN', TRUE, NULL),
(16, 'CO', TRUE, NULL),
(17, 'CR', TRUE, NULL),
(18, 'HR', TRUE, NULL),
(19, 'CU', TRUE, NULL),
(20, 'CY', TRUE, NULL),
(21, 'CZ', TRUE, NULL),
(22, 'DK', TRUE, NULL),
(23, 'DO', TRUE, NULL),
(24, 'EC', TRUE, NULL),
(25, 'EG', TRUE, NULL),
(26, 'SV', TRUE, NULL),
(27, 'EE', TRUE, NULL),
(28, 'FI', TRUE, NULL),
(29, 'FR', TRUE, NULL),
(30, 'DE', TRUE, NULL),
(31, 'GR', TRUE, NULL),
(32, 'GT', TRUE, NULL),
(33, 'HN', TRUE, NULL),
(34, 'HK', TRUE, NULL),
(35, 'HU', TRUE, NULL),
(36, 'IS', TRUE, NULL),
(37, 'IN', TRUE, NULL),
(38, 'ID', TRUE, NULL),
(39, 'IQ', TRUE, NULL),
(40, 'IE', TRUE, NULL),
(41, 'IL', TRUE, NULL),
(42, 'IT', TRUE, NULL),
(43, 'JP', TRUE, NULL),
(44, 'JO', TRUE, NULL),
(45, 'KR', TRUE, NULL),
(46, 'KW', TRUE, NULL),
(47, 'LV', TRUE, NULL),
(48, 'LB', TRUE, NULL),
(49, 'LY', TRUE, NULL),
(50, 'LT', TRUE, NULL),
(51, 'LU', TRUE, NULL),
(52, 'MK', TRUE, NULL),
(53, 'MY', TRUE, NULL),
(54, 'MT', TRUE, NULL),
(55, 'MX', TRUE, NULL),
(56, 'ME', TRUE, NULL),
(57, 'MA', TRUE, NULL),
(58, 'NL', TRUE, NULL),
(59, 'NZ', TRUE, NULL),
(60, 'NI', TRUE, NULL),
(61, 'NO', TRUE, NULL),
(62, 'OM', TRUE, NULL),
(63, 'PA', TRUE, NULL),
(64, 'PY', TRUE, NULL),
(65, 'PE', TRUE, NULL),
(66, 'PH', TRUE, NULL),
(67, 'PL', TRUE, NULL),
(68, 'PT', TRUE, NULL),
(69, 'PR', TRUE, NULL),
(70, 'QA', TRUE, NULL),
(71, 'RO', TRUE, NULL),
(72, 'RU', TRUE, NULL),
(73, 'SA', TRUE, NULL),
(74, 'RS', TRUE, NULL),
(75, 'SG', TRUE, NULL),
(76, 'SK', TRUE, NULL),
(77, 'SI', TRUE, NULL),
(78, 'ZA', TRUE, NULL),
(79, 'ES', TRUE, NULL),
(80, 'SD', TRUE, NULL),
(81, 'SE', TRUE, NULL),
(82, 'CH', TRUE, NULL),
(83, 'SY', TRUE, NULL),
(84, 'TW', TRUE, NULL),
(85, 'TH', TRUE, NULL),
(86, 'TN', TRUE, NULL),
(87, 'TR', TRUE, NULL),
(88, 'UA', TRUE, NULL),
(89, 'AE', TRUE, NULL),
(90, 'GB', TRUE, NULL),
(91, 'US', TRUE, NULL),
(92, 'UY', TRUE, NULL),
(93, 'VE', TRUE, NULL),
(94, 'VN', TRUE, NULL),
(95, 'YE', TRUE, NULL);     
CREATE TABLE SALESMANAGER.COUNTRY_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    COUNTRY_ID INTEGER NOT NULL
);            
ALTER TABLE SALESMANAGER.COUNTRY_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);   
-- 190 +/- SELECT COUNT(*) FROM SALESMANAGER.COUNTRY_DESCRIPTION;              
INSERT INTO SALESMANAGER.COUNTRY_DESCRIPTION VALUES
(1, TIMESTAMP '2019-03-06 19:55:19.479', TIMESTAMP '2019-03-06 19:55:19.479', NULL, NULL, 'Albania', NULL, 1, 1),
(2, TIMESTAMP '2019-03-06 19:55:19.489', TIMESTAMP '2019-03-06 19:55:19.489', NULL, NULL, 'Albanie', NULL, 2, 1),
(3, TIMESTAMP '2019-03-06 19:55:19.491', TIMESTAMP '2019-03-06 19:55:19.491', NULL, NULL, 'Algeria', NULL, 1, 2),
(4, TIMESTAMP '2019-03-06 19:55:19.493', TIMESTAMP '2019-03-06 19:55:19.493', NULL, NULL, STRINGDECODE('Alg\u00e9rie'), NULL, 2, 2),
(5, TIMESTAMP '2019-03-06 19:55:19.497', TIMESTAMP '2019-03-06 19:55:19.497', NULL, NULL, 'Argentina', NULL, 1, 3),
(6, TIMESTAMP '2019-03-06 19:55:19.499', TIMESTAMP '2019-03-06 19:55:19.499', NULL, NULL, 'Argentine', NULL, 2, 3),
(7, TIMESTAMP '2019-03-06 19:55:19.501', TIMESTAMP '2019-03-06 19:55:19.501', NULL, NULL, 'Australia', NULL, 1, 4),
(8, TIMESTAMP '2019-03-06 19:55:19.503', TIMESTAMP '2019-03-06 19:55:19.503', NULL, NULL, 'Australie', NULL, 2, 4),
(9, TIMESTAMP '2019-03-06 19:55:19.507', TIMESTAMP '2019-03-06 19:55:19.507', NULL, NULL, 'Austria', NULL, 1, 5),
(10, TIMESTAMP '2019-03-06 19:55:19.509', TIMESTAMP '2019-03-06 19:55:19.509', NULL, NULL, 'Autriche', NULL, 2, 5),
(11, TIMESTAMP '2019-03-06 19:55:19.513', TIMESTAMP '2019-03-06 19:55:19.513', NULL, NULL, 'Bahrain', NULL, 1, 6),
(12, TIMESTAMP '2019-03-06 19:55:19.515', TIMESTAMP '2019-03-06 19:55:19.515', NULL, NULL, STRINGDECODE('Bahre\u00efn'), NULL, 2, 6),
(13, TIMESTAMP '2019-03-06 19:55:19.518', TIMESTAMP '2019-03-06 19:55:19.518', NULL, NULL, 'Belarus', NULL, 1, 7),
(14, TIMESTAMP '2019-03-06 19:55:19.521', TIMESTAMP '2019-03-06 19:55:19.521', NULL, NULL, STRINGDECODE('Bi\u00e9lo-Russie'), NULL, 2, 7),
(15, TIMESTAMP '2019-03-06 19:55:19.526', TIMESTAMP '2019-03-06 19:55:19.526', NULL, NULL, 'Belgium', NULL, 1, 8),
(16, TIMESTAMP '2019-03-06 19:55:19.529', TIMESTAMP '2019-03-06 19:55:19.529', NULL, NULL, 'Belgique', NULL, 2, 8),
(17, TIMESTAMP '2019-03-06 19:55:19.533', TIMESTAMP '2019-03-06 19:55:19.533', NULL, NULL, 'Bolivia', NULL, 1, 9),
(18, TIMESTAMP '2019-03-06 19:55:19.535', TIMESTAMP '2019-03-06 19:55:19.535', NULL, NULL, 'Bolivie', NULL, 2, 9),
(19, TIMESTAMP '2019-03-06 19:55:19.538', TIMESTAMP '2019-03-06 19:55:19.538', NULL, NULL, 'Bosnia and Herzegovina', NULL, 1, 10),
(20, TIMESTAMP '2019-03-06 19:55:19.54', TIMESTAMP '2019-03-06 19:55:19.54', NULL, NULL, STRINGDECODE('Bosnie-Herz\u00e9govine'), NULL, 2, 10),
(21, TIMESTAMP '2019-03-06 19:55:19.545', TIMESTAMP '2019-03-06 19:55:19.545', NULL, NULL, 'Brazil', NULL, 1, 11),
(22, TIMESTAMP '2019-03-06 19:55:19.547', TIMESTAMP '2019-03-06 19:55:19.547', NULL, NULL, STRINGDECODE('Br\u00e9sil'), NULL, 2, 11),
(23, TIMESTAMP '2019-03-06 19:55:19.55', TIMESTAMP '2019-03-06 19:55:19.55', NULL, NULL, 'Bulgaria', NULL, 1, 12),
(24, TIMESTAMP '2019-03-06 19:55:19.551', TIMESTAMP '2019-03-06 19:55:19.551', NULL, NULL, 'Bulgarie', NULL, 2, 12),
(25, TIMESTAMP '2019-03-06 19:55:19.554', TIMESTAMP '2019-03-06 19:55:19.554', NULL, NULL, 'Canada', NULL, 1, 13),
(26, TIMESTAMP '2019-03-06 19:55:19.555', TIMESTAMP '2019-03-06 19:55:19.555', NULL, NULL, 'Canada', NULL, 2, 13),
(27, TIMESTAMP '2019-03-06 19:55:19.558', TIMESTAMP '2019-03-06 19:55:19.558', NULL, NULL, 'Chile', NULL, 1, 14),
(28, TIMESTAMP '2019-03-06 19:55:19.559', TIMESTAMP '2019-03-06 19:55:19.559', NULL, NULL, 'Chili', NULL, 2, 14),
(29, TIMESTAMP '2019-03-06 19:55:19.561', TIMESTAMP '2019-03-06 19:55:19.561', NULL, NULL, 'China', NULL, 1, 15),
(30, TIMESTAMP '2019-03-06 19:55:19.562', TIMESTAMP '2019-03-06 19:55:19.562', NULL, NULL, 'Chine', NULL, 2, 15),
(31, TIMESTAMP '2019-03-06 19:55:19.565', TIMESTAMP '2019-03-06 19:55:19.565', NULL, NULL, 'Colombia', NULL, 1, 16),
(32, TIMESTAMP '2019-03-06 19:55:19.567', TIMESTAMP '2019-03-06 19:55:19.567', NULL, NULL, 'Colombie', NULL, 2, 16),
(33, TIMESTAMP '2019-03-06 19:55:19.57', TIMESTAMP '2019-03-06 19:55:19.57', NULL, NULL, 'Costa Rica', NULL, 1, 17),
(34, TIMESTAMP '2019-03-06 19:55:19.572', TIMESTAMP '2019-03-06 19:55:19.572', NULL, NULL, 'Costa Rica', NULL, 2, 17);           
INSERT INTO SALESMANAGER.COUNTRY_DESCRIPTION VALUES
(35, TIMESTAMP '2019-03-06 19:55:19.575', TIMESTAMP '2019-03-06 19:55:19.575', NULL, NULL, 'Croatia', NULL, 1, 18),
(36, TIMESTAMP '2019-03-06 19:55:19.576', TIMESTAMP '2019-03-06 19:55:19.576', NULL, NULL, 'Croatie', NULL, 2, 18),
(37, TIMESTAMP '2019-03-06 19:55:19.579', TIMESTAMP '2019-03-06 19:55:19.579', NULL, NULL, 'Cuba', NULL, 1, 19),
(38, TIMESTAMP '2019-03-06 19:55:19.58', TIMESTAMP '2019-03-06 19:55:19.58', NULL, NULL, 'Cuba', NULL, 2, 19),
(39, TIMESTAMP '2019-03-06 19:55:19.583', TIMESTAMP '2019-03-06 19:55:19.583', NULL, NULL, 'Cyprus', NULL, 1, 20),
(40, TIMESTAMP '2019-03-06 19:55:19.584', TIMESTAMP '2019-03-06 19:55:19.584', NULL, NULL, 'Chypre', NULL, 2, 20),
(41, TIMESTAMP '2019-03-06 19:55:19.586', TIMESTAMP '2019-03-06 19:55:19.586', NULL, NULL, 'Czech Republic', NULL, 1, 21),
(42, TIMESTAMP '2019-03-06 19:55:19.588', TIMESTAMP '2019-03-06 19:55:19.588', NULL, NULL, STRINGDECODE('R\u00e9publique Tch\u00e8que'), NULL, 2, 21),
(43, TIMESTAMP '2019-03-06 19:55:19.59', TIMESTAMP '2019-03-06 19:55:19.59', NULL, NULL, 'Denmark', NULL, 1, 22),
(44, TIMESTAMP '2019-03-06 19:55:19.592', TIMESTAMP '2019-03-06 19:55:19.592', NULL, NULL, 'Danemark', NULL, 2, 22),
(45, TIMESTAMP '2019-03-06 19:55:19.595', TIMESTAMP '2019-03-06 19:55:19.595', NULL, NULL, 'Dominican Republic', NULL, 1, 23),
(46, TIMESTAMP '2019-03-06 19:55:19.596', TIMESTAMP '2019-03-06 19:55:19.596', NULL, NULL, STRINGDECODE('R\u00e9publique Dominicaine'), NULL, 2, 23),
(47, TIMESTAMP '2019-03-06 19:55:19.599', TIMESTAMP '2019-03-06 19:55:19.599', NULL, NULL, 'Ecuador', NULL, 1, 24),
(48, TIMESTAMP '2019-03-06 19:55:19.6', TIMESTAMP '2019-03-06 19:55:19.6', NULL, NULL, 'Equateur', NULL, 2, 24),
(49, TIMESTAMP '2019-03-06 19:55:19.602', TIMESTAMP '2019-03-06 19:55:19.602', NULL, NULL, 'Egypt', NULL, 1, 25),
(50, TIMESTAMP '2019-03-06 19:55:19.603', TIMESTAMP '2019-03-06 19:55:19.603', NULL, NULL, 'Egypte', NULL, 2, 25),
(51, TIMESTAMP '2019-03-06 19:55:19.607', TIMESTAMP '2019-03-06 19:55:19.607', NULL, NULL, 'El Salvador', NULL, 1, 26),
(52, TIMESTAMP '2019-03-06 19:55:19.609', TIMESTAMP '2019-03-06 19:55:19.609', NULL, NULL, 'El Salvador', NULL, 2, 26),
(53, TIMESTAMP '2019-03-06 19:55:19.612', TIMESTAMP '2019-03-06 19:55:19.612', NULL, NULL, 'Estonia', NULL, 1, 27),
(54, TIMESTAMP '2019-03-06 19:55:19.614', TIMESTAMP '2019-03-06 19:55:19.614', NULL, NULL, 'Estonie', NULL, 2, 27),
(55, TIMESTAMP '2019-03-06 19:55:19.617', TIMESTAMP '2019-03-06 19:55:19.617', NULL, NULL, 'Finland', NULL, 1, 28),
(56, TIMESTAMP '2019-03-06 19:55:19.619', TIMESTAMP '2019-03-06 19:55:19.619', NULL, NULL, 'Finlande', NULL, 2, 28),
(57, TIMESTAMP '2019-03-06 19:55:19.623', TIMESTAMP '2019-03-06 19:55:19.623', NULL, NULL, 'France', NULL, 1, 29),
(58, TIMESTAMP '2019-03-06 19:55:19.624', TIMESTAMP '2019-03-06 19:55:19.624', NULL, NULL, 'France', NULL, 2, 29),
(59, TIMESTAMP '2019-03-06 19:55:19.626', TIMESTAMP '2019-03-06 19:55:19.626', NULL, NULL, 'Germany', NULL, 1, 30),
(60, TIMESTAMP '2019-03-06 19:55:19.629', TIMESTAMP '2019-03-06 19:55:19.629', NULL, NULL, 'Allemagne', NULL, 2, 30),
(61, TIMESTAMP '2019-03-06 19:55:19.631', TIMESTAMP '2019-03-06 19:55:19.631', NULL, NULL, 'Greece', NULL, 1, 31),
(62, TIMESTAMP '2019-03-06 19:55:19.633', TIMESTAMP '2019-03-06 19:55:19.633', NULL, NULL, STRINGDECODE('Gr\u00e8ce'), NULL, 2, 31),
(63, TIMESTAMP '2019-03-06 19:55:19.635', TIMESTAMP '2019-03-06 19:55:19.635', NULL, NULL, 'Guatemala', NULL, 1, 32),
(64, TIMESTAMP '2019-03-06 19:55:19.637', TIMESTAMP '2019-03-06 19:55:19.637', NULL, NULL, 'Guatemala', NULL, 2, 32),
(65, TIMESTAMP '2019-03-06 19:55:19.64', TIMESTAMP '2019-03-06 19:55:19.64', NULL, NULL, 'Honduras', NULL, 1, 33),
(66, TIMESTAMP '2019-03-06 19:55:19.642', TIMESTAMP '2019-03-06 19:55:19.642', NULL, NULL, 'Honduras', NULL, 2, 33),
(67, TIMESTAMP '2019-03-06 19:55:19.645', TIMESTAMP '2019-03-06 19:55:19.645', NULL, NULL, 'Hong Kong', NULL, 1, 34),
(68, TIMESTAMP '2019-03-06 19:55:19.646', TIMESTAMP '2019-03-06 19:55:19.646', NULL, NULL, 'Hong-Kong', NULL, 2, 34);         
INSERT INTO SALESMANAGER.COUNTRY_DESCRIPTION VALUES
(69, TIMESTAMP '2019-03-06 19:55:19.649', TIMESTAMP '2019-03-06 19:55:19.649', NULL, NULL, 'Hungary', NULL, 1, 35),
(70, TIMESTAMP '2019-03-06 19:55:19.65', TIMESTAMP '2019-03-06 19:55:19.65', NULL, NULL, 'Hongrie', NULL, 2, 35),
(71, TIMESTAMP '2019-03-06 19:55:19.652', TIMESTAMP '2019-03-06 19:55:19.652', NULL, NULL, 'Iceland', NULL, 1, 36),
(72, TIMESTAMP '2019-03-06 19:55:19.654', TIMESTAMP '2019-03-06 19:55:19.654', NULL, NULL, 'Islande', NULL, 2, 36),
(73, TIMESTAMP '2019-03-06 19:55:19.657', TIMESTAMP '2019-03-06 19:55:19.657', NULL, NULL, 'India', NULL, 1, 37),
(74, TIMESTAMP '2019-03-06 19:55:19.659', TIMESTAMP '2019-03-06 19:55:19.659', NULL, NULL, 'Inde', NULL, 2, 37),
(75, TIMESTAMP '2019-03-06 19:55:19.662', TIMESTAMP '2019-03-06 19:55:19.662', NULL, NULL, 'Indonesia', NULL, 1, 38),
(76, TIMESTAMP '2019-03-06 19:55:19.663', TIMESTAMP '2019-03-06 19:55:19.663', NULL, NULL, STRINGDECODE('Indon\u00e9sie'), NULL, 2, 38),
(77, TIMESTAMP '2019-03-06 19:55:19.665', TIMESTAMP '2019-03-06 19:55:19.665', NULL, NULL, 'Iraq', NULL, 1, 39),
(78, TIMESTAMP '2019-03-06 19:55:19.666', TIMESTAMP '2019-03-06 19:55:19.666', NULL, NULL, 'Irak', NULL, 2, 39),
(79, TIMESTAMP '2019-03-06 19:55:19.669', TIMESTAMP '2019-03-06 19:55:19.669', NULL, NULL, 'Ireland', NULL, 1, 40),
(80, TIMESTAMP '2019-03-06 19:55:19.67', TIMESTAMP '2019-03-06 19:55:19.67', NULL, NULL, 'Irlande', NULL, 2, 40),
(81, TIMESTAMP '2019-03-06 19:55:19.673', TIMESTAMP '2019-03-06 19:55:19.673', NULL, NULL, 'Israel', NULL, 1, 41),
(82, TIMESTAMP '2019-03-06 19:55:19.674', TIMESTAMP '2019-03-06 19:55:19.674', NULL, NULL, STRINGDECODE('Isra\u00ebl'), NULL, 2, 41),
(83, TIMESTAMP '2019-03-06 19:55:19.677', TIMESTAMP '2019-03-06 19:55:19.677', NULL, NULL, 'Italy', NULL, 1, 42),
(84, TIMESTAMP '2019-03-06 19:55:19.679', TIMESTAMP '2019-03-06 19:55:19.679', NULL, NULL, 'Italie', NULL, 2, 42),
(85, TIMESTAMP '2019-03-06 19:55:19.683', TIMESTAMP '2019-03-06 19:55:19.683', NULL, NULL, 'Japan', NULL, 1, 43),
(86, TIMESTAMP '2019-03-06 19:55:19.685', TIMESTAMP '2019-03-06 19:55:19.685', NULL, NULL, 'Japon', NULL, 2, 43),
(87, TIMESTAMP '2019-03-06 19:55:19.687', TIMESTAMP '2019-03-06 19:55:19.687', NULL, NULL, 'Jordan', NULL, 1, 44),
(88, TIMESTAMP '2019-03-06 19:55:19.688', TIMESTAMP '2019-03-06 19:55:19.688', NULL, NULL, 'Jordanie', NULL, 2, 44),
(89, TIMESTAMP '2019-03-06 19:55:19.691', TIMESTAMP '2019-03-06 19:55:19.691', NULL, NULL, 'South Korea', NULL, 1, 45),
(90, TIMESTAMP '2019-03-06 19:55:19.692', TIMESTAMP '2019-03-06 19:55:19.692', NULL, NULL, STRINGDECODE('Cor\u00e9e du Sud'), NULL, 2, 45),
(91, TIMESTAMP '2019-03-06 19:55:19.695', TIMESTAMP '2019-03-06 19:55:19.695', NULL, NULL, 'Kuwait', NULL, 1, 46),
(92, TIMESTAMP '2019-03-06 19:55:19.697', TIMESTAMP '2019-03-06 19:55:19.697', NULL, NULL, 'Koweit', NULL, 2, 46),
(93, TIMESTAMP '2019-03-06 19:55:19.7', TIMESTAMP '2019-03-06 19:55:19.7', NULL, NULL, 'Latvia', NULL, 1, 47),
(94, TIMESTAMP '2019-03-06 19:55:19.702', TIMESTAMP '2019-03-06 19:55:19.702', NULL, NULL, 'Lettonie', NULL, 2, 47),
(95, TIMESTAMP '2019-03-06 19:55:19.704', TIMESTAMP '2019-03-06 19:55:19.704', NULL, NULL, 'Lebanon', NULL, 1, 48),
(96, TIMESTAMP '2019-03-06 19:55:19.705', TIMESTAMP '2019-03-06 19:55:19.705', NULL, NULL, 'Liban', NULL, 2, 48),
(97, TIMESTAMP '2019-03-06 19:55:19.708', TIMESTAMP '2019-03-06 19:55:19.708', NULL, NULL, 'Libya', NULL, 1, 49),
(98, TIMESTAMP '2019-03-06 19:55:19.709', TIMESTAMP '2019-03-06 19:55:19.709', NULL, NULL, 'Libye', NULL, 2, 49),
(99, TIMESTAMP '2019-03-06 19:55:19.713', TIMESTAMP '2019-03-06 19:55:19.713', NULL, NULL, 'Lithuania', NULL, 1, 50),
(100, TIMESTAMP '2019-03-06 19:55:19.714', TIMESTAMP '2019-03-06 19:55:19.714', NULL, NULL, 'Lithuanie', NULL, 2, 50),
(101, TIMESTAMP '2019-03-06 19:55:19.716', TIMESTAMP '2019-03-06 19:55:19.716', NULL, NULL, 'Luxembourg', NULL, 1, 51),
(102, TIMESTAMP '2019-03-06 19:55:19.718', TIMESTAMP '2019-03-06 19:55:19.718', NULL, NULL, 'Luxembourg', NULL, 2, 51),
(103, TIMESTAMP '2019-03-06 19:55:19.72', TIMESTAMP '2019-03-06 19:55:19.72', NULL, NULL, 'Macedonia', NULL, 1, 52);            
INSERT INTO SALESMANAGER.COUNTRY_DESCRIPTION VALUES
(104, TIMESTAMP '2019-03-06 19:55:19.721', TIMESTAMP '2019-03-06 19:55:19.721', NULL, NULL, STRINGDECODE('Mac\u00e9doine'), NULL, 2, 52),
(105, TIMESTAMP '2019-03-06 19:55:19.724', TIMESTAMP '2019-03-06 19:55:19.724', NULL, NULL, 'Malaysia', NULL, 1, 53),
(106, TIMESTAMP '2019-03-06 19:55:19.725', TIMESTAMP '2019-03-06 19:55:19.725', NULL, NULL, 'Malaisie', NULL, 2, 53),
(107, TIMESTAMP '2019-03-06 19:55:19.728', TIMESTAMP '2019-03-06 19:55:19.728', NULL, NULL, 'Malta', NULL, 1, 54),
(108, TIMESTAMP '2019-03-06 19:55:19.73', TIMESTAMP '2019-03-06 19:55:19.73', NULL, NULL, 'Malte', NULL, 2, 54),
(109, TIMESTAMP '2019-03-06 19:55:19.733', TIMESTAMP '2019-03-06 19:55:19.733', NULL, NULL, 'Mexico', NULL, 1, 55),
(110, TIMESTAMP '2019-03-06 19:55:19.734', TIMESTAMP '2019-03-06 19:55:19.734', NULL, NULL, 'Mexique', NULL, 2, 55),
(111, TIMESTAMP '2019-03-06 19:55:19.736', TIMESTAMP '2019-03-06 19:55:19.736', NULL, NULL, 'Montenegro', NULL, 1, 56),
(112, TIMESTAMP '2019-03-06 19:55:19.738', TIMESTAMP '2019-03-06 19:55:19.738', NULL, NULL, STRINGDECODE('Mont\u00e9n\u00e9gro'), NULL, 2, 56),
(113, TIMESTAMP '2019-03-06 19:55:19.741', TIMESTAMP '2019-03-06 19:55:19.741', NULL, NULL, 'Morocco', NULL, 1, 57),
(114, TIMESTAMP '2019-03-06 19:55:19.743', TIMESTAMP '2019-03-06 19:55:19.743', NULL, NULL, 'Maroc', NULL, 2, 57),
(115, TIMESTAMP '2019-03-06 19:55:19.745', TIMESTAMP '2019-03-06 19:55:19.745', NULL, NULL, 'Netherlands', NULL, 1, 58),
(116, TIMESTAMP '2019-03-06 19:55:19.746', TIMESTAMP '2019-03-06 19:55:19.746', NULL, NULL, 'Pays-Bas', NULL, 2, 58),
(117, TIMESTAMP '2019-03-06 19:55:19.749', TIMESTAMP '2019-03-06 19:55:19.749', NULL, NULL, 'New Zealand', NULL, 1, 59),
(118, TIMESTAMP '2019-03-06 19:55:19.75', TIMESTAMP '2019-03-06 19:55:19.75', NULL, NULL, STRINGDECODE('Nouvelle-Z\u00e9lande'), NULL, 2, 59),
(119, TIMESTAMP '2019-03-06 19:55:19.752', TIMESTAMP '2019-03-06 19:55:19.752', NULL, NULL, 'Nicaragua', NULL, 1, 60),
(120, TIMESTAMP '2019-03-06 19:55:19.754', TIMESTAMP '2019-03-06 19:55:19.754', NULL, NULL, 'Nicaragua', NULL, 2, 60),
(121, TIMESTAMP '2019-03-06 19:55:19.756', TIMESTAMP '2019-03-06 19:55:19.756', NULL, NULL, 'Norway', NULL, 1, 61),
(122, TIMESTAMP '2019-03-06 19:55:19.758', TIMESTAMP '2019-03-06 19:55:19.758', NULL, NULL, STRINGDECODE('Norv\u00e8ge'), NULL, 2, 61),
(123, TIMESTAMP '2019-03-06 19:55:19.761', TIMESTAMP '2019-03-06 19:55:19.761', NULL, NULL, 'Oman', NULL, 1, 62),
(124, TIMESTAMP '2019-03-06 19:55:19.763', TIMESTAMP '2019-03-06 19:55:19.763', NULL, NULL, 'Oman', NULL, 2, 62),
(125, TIMESTAMP '2019-03-06 19:55:19.765', TIMESTAMP '2019-03-06 19:55:19.765', NULL, NULL, 'Panama', NULL, 1, 63),
(126, TIMESTAMP '2019-03-06 19:55:19.767', TIMESTAMP '2019-03-06 19:55:19.767', NULL, NULL, 'Panama', NULL, 2, 63),
(127, TIMESTAMP '2019-03-06 19:55:19.77', TIMESTAMP '2019-03-06 19:55:19.77', NULL, NULL, 'Paraguay', NULL, 1, 64),
(128, TIMESTAMP '2019-03-06 19:55:19.772', TIMESTAMP '2019-03-06 19:55:19.772', NULL, NULL, 'Paraguay', NULL, 2, 64),
(129, TIMESTAMP '2019-03-06 19:55:19.775', TIMESTAMP '2019-03-06 19:55:19.775', NULL, NULL, 'Peru', NULL, 1, 65),
(130, TIMESTAMP '2019-03-06 19:55:19.777', TIMESTAMP '2019-03-06 19:55:19.777', NULL, NULL, STRINGDECODE('P\u00e9rou'), NULL, 2, 65),
(131, TIMESTAMP '2019-03-06 19:55:19.78', TIMESTAMP '2019-03-06 19:55:19.78', NULL, NULL, 'Philippines', NULL, 1, 66),
(132, TIMESTAMP '2019-03-06 19:55:19.782', TIMESTAMP '2019-03-06 19:55:19.782', NULL, NULL, 'Philippines', NULL, 2, 66),
(133, TIMESTAMP '2019-03-06 19:55:19.785', TIMESTAMP '2019-03-06 19:55:19.785', NULL, NULL, 'Poland', NULL, 1, 67),
(134, TIMESTAMP '2019-03-06 19:55:19.787', TIMESTAMP '2019-03-06 19:55:19.787', NULL, NULL, 'Pologne', NULL, 2, 67),
(135, TIMESTAMP '2019-03-06 19:55:19.791', TIMESTAMP '2019-03-06 19:55:19.791', NULL, NULL, 'Portugal', NULL, 1, 68),
(136, TIMESTAMP '2019-03-06 19:55:19.792', TIMESTAMP '2019-03-06 19:55:19.792', NULL, NULL, 'Portugal', NULL, 2, 68),
(137, TIMESTAMP '2019-03-06 19:55:19.796', TIMESTAMP '2019-03-06 19:55:19.796', NULL, NULL, 'Puerto Rico', NULL, 1, 69);        
INSERT INTO SALESMANAGER.COUNTRY_DESCRIPTION VALUES
(138, TIMESTAMP '2019-03-06 19:55:19.797', TIMESTAMP '2019-03-06 19:55:19.797', NULL, NULL, 'Porto Rico', NULL, 2, 69),
(139, TIMESTAMP '2019-03-06 19:55:19.8', TIMESTAMP '2019-03-06 19:55:19.8', NULL, NULL, 'Qatar', NULL, 1, 70),
(140, TIMESTAMP '2019-03-06 19:55:19.801', TIMESTAMP '2019-03-06 19:55:19.801', NULL, NULL, 'Qatar', NULL, 2, 70),
(141, TIMESTAMP '2019-03-06 19:55:19.804', TIMESTAMP '2019-03-06 19:55:19.804', NULL, NULL, 'Romania', NULL, 1, 71),
(142, TIMESTAMP '2019-03-06 19:55:19.806', TIMESTAMP '2019-03-06 19:55:19.806', NULL, NULL, 'Roumanie', NULL, 2, 71),
(143, TIMESTAMP '2019-03-06 19:55:19.809', TIMESTAMP '2019-03-06 19:55:19.809', NULL, NULL, 'Russia', NULL, 1, 72),
(144, TIMESTAMP '2019-03-06 19:55:19.81', TIMESTAMP '2019-03-06 19:55:19.81', NULL, NULL, 'Russie', NULL, 2, 72),
(145, TIMESTAMP '2019-03-06 19:55:19.813', TIMESTAMP '2019-03-06 19:55:19.813', NULL, NULL, 'Saudi Arabia', NULL, 1, 73),
(146, TIMESTAMP '2019-03-06 19:55:19.815', TIMESTAMP '2019-03-06 19:55:19.815', NULL, NULL, 'Arabie Saoudite', NULL, 2, 73),
(147, TIMESTAMP '2019-03-06 19:55:19.818', TIMESTAMP '2019-03-06 19:55:19.818', NULL, NULL, 'Serbia', NULL, 1, 74),
(148, TIMESTAMP '2019-03-06 19:55:19.819', TIMESTAMP '2019-03-06 19:55:19.819', NULL, NULL, 'Serbie', NULL, 2, 74),
(149, TIMESTAMP '2019-03-06 19:55:19.822', TIMESTAMP '2019-03-06 19:55:19.822', NULL, NULL, 'Singapore', NULL, 1, 75),
(150, TIMESTAMP '2019-03-06 19:55:19.823', TIMESTAMP '2019-03-06 19:55:19.823', NULL, NULL, 'Singapour', NULL, 2, 75),
(151, TIMESTAMP '2019-03-06 19:55:19.828', TIMESTAMP '2019-03-06 19:55:19.828', NULL, NULL, 'Slovakia', NULL, 1, 76),
(152, TIMESTAMP '2019-03-06 19:55:19.83', TIMESTAMP '2019-03-06 19:55:19.83', NULL, NULL, 'Slovaquie', NULL, 2, 76),
(153, TIMESTAMP '2019-03-06 19:55:19.834', TIMESTAMP '2019-03-06 19:55:19.834', NULL, NULL, 'Slovenia', NULL, 1, 77),
(154, TIMESTAMP '2019-03-06 19:55:19.836', TIMESTAMP '2019-03-06 19:55:19.836', NULL, NULL, STRINGDECODE('Slov\u00e9nie'), NULL, 2, 77),
(155, TIMESTAMP '2019-03-06 19:55:19.839', TIMESTAMP '2019-03-06 19:55:19.839', NULL, NULL, 'South Africa', NULL, 1, 78),
(156, TIMESTAMP '2019-03-06 19:55:19.841', TIMESTAMP '2019-03-06 19:55:19.841', NULL, NULL, 'Afrique du Sud', NULL, 2, 78),
(157, TIMESTAMP '2019-03-06 19:55:19.844', TIMESTAMP '2019-03-06 19:55:19.844', NULL, NULL, 'Spain', NULL, 1, 79),
(158, TIMESTAMP '2019-03-06 19:55:19.846', TIMESTAMP '2019-03-06 19:55:19.846', NULL, NULL, 'Espagne', NULL, 2, 79),
(159, TIMESTAMP '2019-03-06 19:55:19.849', TIMESTAMP '2019-03-06 19:55:19.849', NULL, NULL, 'Sudan', NULL, 1, 80),
(160, TIMESTAMP '2019-03-06 19:55:19.85', TIMESTAMP '2019-03-06 19:55:19.85', NULL, NULL, 'Soudan', NULL, 2, 80),
(161, TIMESTAMP '2019-03-06 19:55:19.853', TIMESTAMP '2019-03-06 19:55:19.853', NULL, NULL, 'Sweden', NULL, 1, 81),
(162, TIMESTAMP '2019-03-06 19:55:19.855', TIMESTAMP '2019-03-06 19:55:19.855', NULL, NULL, STRINGDECODE('Su\u00e8de'), NULL, 2, 81),
(163, TIMESTAMP '2019-03-06 19:55:19.857', TIMESTAMP '2019-03-06 19:55:19.857', NULL, NULL, 'Switzerland', NULL, 1, 82),
(164, TIMESTAMP '2019-03-06 19:55:19.859', TIMESTAMP '2019-03-06 19:55:19.859', NULL, NULL, 'Suisse', NULL, 2, 82),
(165, TIMESTAMP '2019-03-06 19:55:19.862', TIMESTAMP '2019-03-06 19:55:19.862', NULL, NULL, 'Syria', NULL, 1, 83),
(166, TIMESTAMP '2019-03-06 19:55:19.863', TIMESTAMP '2019-03-06 19:55:19.863', NULL, NULL, 'Syrie', NULL, 2, 83),
(167, TIMESTAMP '2019-03-06 19:55:19.866', TIMESTAMP '2019-03-06 19:55:19.866', NULL, NULL, 'Taiwan', NULL, 1, 84),
(168, TIMESTAMP '2019-03-06 19:55:19.868', TIMESTAMP '2019-03-06 19:55:19.868', NULL, NULL, 'Taiwan', NULL, 2, 84),
(169, TIMESTAMP '2019-03-06 19:55:19.873', TIMESTAMP '2019-03-06 19:55:19.873', NULL, NULL, 'Thailand', NULL, 1, 85),
(170, TIMESTAMP '2019-03-06 19:55:19.875', TIMESTAMP '2019-03-06 19:55:19.875', NULL, NULL, STRINGDECODE('Tha\u00eflande'), NULL, 2, 85),
(171, TIMESTAMP '2019-03-06 19:55:19.88', TIMESTAMP '2019-03-06 19:55:19.879', NULL, NULL, 'Tunisia', NULL, 1, 86);          
INSERT INTO SALESMANAGER.COUNTRY_DESCRIPTION VALUES
(172, TIMESTAMP '2019-03-06 19:55:19.881', TIMESTAMP '2019-03-06 19:55:19.881', NULL, NULL, 'Tunisie', NULL, 2, 86),
(173, TIMESTAMP '2019-03-06 19:55:19.884', TIMESTAMP '2019-03-06 19:55:19.884', NULL, NULL, 'Turkey', NULL, 1, 87),
(174, TIMESTAMP '2019-03-06 19:55:19.885', TIMESTAMP '2019-03-06 19:55:19.885', NULL, NULL, 'Turquie', NULL, 2, 87),
(175, TIMESTAMP '2019-03-06 19:55:19.887', TIMESTAMP '2019-03-06 19:55:19.887', NULL, NULL, 'Ukraine', NULL, 1, 88),
(176, TIMESTAMP '2019-03-06 19:55:19.888', TIMESTAMP '2019-03-06 19:55:19.888', NULL, NULL, 'Ukraine', NULL, 2, 88),
(177, TIMESTAMP '2019-03-06 19:55:19.891', TIMESTAMP '2019-03-06 19:55:19.891', NULL, NULL, 'United Arab Emirates', NULL, 1, 89),
(178, TIMESTAMP '2019-03-06 19:55:19.892', TIMESTAMP '2019-03-06 19:55:19.892', NULL, NULL, 'Emirats Arabes Unis', NULL, 2, 89),
(179, TIMESTAMP '2019-03-06 19:55:19.896', TIMESTAMP '2019-03-06 19:55:19.896', NULL, NULL, 'United Kingdom', NULL, 1, 90),
(180, TIMESTAMP '2019-03-06 19:55:19.897', TIMESTAMP '2019-03-06 19:55:19.897', NULL, NULL, 'Royaume-Uni', NULL, 2, 90),
(181, TIMESTAMP '2019-03-06 19:55:19.9', TIMESTAMP '2019-03-06 19:55:19.9', NULL, NULL, 'United States', NULL, 1, 91),
(182, TIMESTAMP '2019-03-06 19:55:19.902', TIMESTAMP '2019-03-06 19:55:19.902', NULL, NULL, 'Etats-Unis', NULL, 2, 91),
(183, TIMESTAMP '2019-03-06 19:55:19.904', TIMESTAMP '2019-03-06 19:55:19.904', NULL, NULL, 'Uruguay', NULL, 1, 92),
(184, TIMESTAMP '2019-03-06 19:55:19.905', TIMESTAMP '2019-03-06 19:55:19.905', NULL, NULL, 'Uruguay', NULL, 2, 92),
(185, TIMESTAMP '2019-03-06 19:55:19.908', TIMESTAMP '2019-03-06 19:55:19.908', NULL, NULL, 'Venezuela', NULL, 1, 93),
(186, TIMESTAMP '2019-03-06 19:55:19.909', TIMESTAMP '2019-03-06 19:55:19.909', NULL, NULL, STRINGDECODE('V\u00e9n\u00e9zuela'), NULL, 2, 93),
(187, TIMESTAMP '2019-03-06 19:55:19.912', TIMESTAMP '2019-03-06 19:55:19.912', NULL, NULL, 'Vietnam', NULL, 1, 94),
(188, TIMESTAMP '2019-03-06 19:55:19.913', TIMESTAMP '2019-03-06 19:55:19.913', NULL, NULL, 'Vietnam', NULL, 2, 94),
(189, TIMESTAMP '2019-03-06 19:55:19.917', TIMESTAMP '2019-03-06 19:55:19.917', NULL, NULL, 'Yemen', NULL, 1, 95),
(190, TIMESTAMP '2019-03-06 19:55:19.919', TIMESTAMP '2019-03-06 19:55:19.919', NULL, NULL, STRINGDECODE('Y\u00e9men'), NULL, 2, 95);      
CREATE TABLE SALESMANAGER.CURRENCY(
    CURRENCY_ID BIGINT NOT NULL,
    CURRENCY_CODE VARCHAR(255),
    CURRENCY_CURRENCY_CODE VARCHAR(255) NOT NULL,
    CURRENCY_NAME VARCHAR(255),
    CURRENCY_SUPPORTED BOOLEAN
);  
ALTER TABLE SALESMANAGER.CURRENCY ADD PRIMARY KEY(CURRENCY_ID);
-- 158 +/- SELECT COUNT(*) FROM SALESMANAGER.CURRENCY;         
INSERT INTO SALESMANAGER.CURRENCY VALUES
(1, 'FJD', 'FJD', 'FJD', TRUE),
(2, 'MXN', 'MXN', 'MXN', TRUE),
(3, 'STD', 'STD', 'STD', TRUE),
(4, 'LVL', 'LVL', 'LVL', TRUE),
(5, 'SCR', 'SCR', 'SCR', TRUE),
(6, 'CDF', 'CDF', 'CDF', TRUE),
(7, 'BBD', 'BBD', 'BBD', TRUE),
(8, 'GTQ', 'GTQ', 'GTQ', TRUE),
(9, 'CLP', 'CLP', 'CLP', TRUE),
(10, 'HNL', 'HNL', 'HNL', TRUE),
(11, 'UGX', 'UGX', 'UGX', TRUE),
(12, 'ZAR', 'ZAR', 'ZAR', TRUE),
(13, 'MXV', 'MXV', 'MXV', TRUE),
(14, 'TND', 'TND', 'TND', TRUE),
(15, 'BSD', 'BSD', 'BSD', TRUE),
(16, 'SLL', 'SLL', 'SLL', TRUE),
(17, 'SDG', 'SDG', 'SDG', TRUE),
(18, 'IQD', 'IQD', 'IQD', TRUE),
(19, 'CUP', 'CUP', 'CUP', TRUE),
(20, 'GMD', 'GMD', 'GMD', TRUE),
(21, 'TWD', 'TWD', 'TWD', TRUE),
(22, 'RSD', 'RSD', 'RSD', TRUE),
(23, 'DOP', 'DOP', 'DOP', TRUE),
(24, 'KMF', 'KMF', 'KMF', TRUE),
(25, 'MYR', 'MYR', 'MYR', TRUE),
(26, 'FKP', 'FKP', 'FKP', TRUE),
(27, 'XOF', 'XOF', 'XOF', TRUE),
(28, 'GEL', 'GEL', 'GEL', TRUE),
(29, 'UYU', 'UYU', 'UYU', TRUE),
(30, 'MAD', 'MAD', 'MAD', TRUE),
(31, 'CVE', 'CVE', 'CVE', TRUE),
(32, 'AZN', 'AZN', 'AZN', TRUE),
(33, 'OMR', 'OMR', 'OMR', TRUE),
(34, 'PGK', 'PGK', 'PGK', TRUE),
(35, 'KES', 'KES', 'KES', TRUE),
(36, 'SEK', 'SEK', 'SEK', TRUE),
(37, 'BTN', 'BTN', 'BTN', TRUE),
(38, 'UAH', 'UAH', 'UAH', TRUE),
(39, 'GNF', 'GNF', 'GNF', TRUE),
(40, 'ERN', 'ERN', 'ERN', TRUE),
(41, 'MZN', 'MZN', 'MZN', TRUE),
(42, 'SVC', 'SVC', 'SVC', TRUE),
(43, 'ARS', 'ARS', 'ARS', TRUE),
(44, 'QAR', 'QAR', 'QAR', TRUE),
(45, 'IRR', 'IRR', 'IRR', TRUE),
(46, 'MRO', 'MRO', 'MRO', TRUE),
(47, 'CNY', 'CNY', 'CNY', TRUE),
(48, 'XPF', 'XPF', 'XPF', TRUE),
(49, 'THB', 'THB', 'THB', TRUE),
(50, 'UZS', 'UZS', 'UZS', TRUE),
(51, 'BDT', 'BDT', 'BDT', TRUE),
(52, 'LYD', 'LYD', 'LYD', TRUE),
(53, 'BMD', 'BMD', 'BMD', TRUE),
(54, 'KWD', 'KWD', 'KWD', TRUE),
(55, 'PHP', 'PHP', 'PHP', TRUE),
(56, 'RUB', 'RUB', 'RUB', TRUE),
(57, 'PYG', 'PYG', 'PYG', TRUE),
(58, 'ISK', 'ISK', 'ISK', TRUE),
(59, 'JMD', 'JMD', 'JMD', TRUE),
(60, 'COP', 'COP', 'COP', TRUE),
(61, 'USD', 'USD', 'USD', TRUE),
(62, 'MKD', 'MKD', 'MKD', TRUE),
(63, 'DZD', 'DZD', 'DZD', TRUE),
(64, 'PAB', 'PAB', 'PAB', TRUE),
(65, 'SGD', 'SGD', 'SGD', TRUE),
(66, 'ETB', 'ETB', 'ETB', TRUE),
(67, 'KGS', 'KGS', 'KGS', TRUE),
(68, 'SOS', 'SOS', 'SOS', TRUE),
(69, 'VUV', 'VUV', 'VUV', TRUE),
(70, 'VEF', 'VEF', 'VEF', TRUE),
(71, 'LAK', 'LAK', 'LAK', TRUE),
(72, 'BND', 'BND', 'BND', TRUE),
(73, 'ZMK', 'ZMK', 'ZMK', TRUE),
(74, 'XAF', 'XAF', 'XAF', TRUE),
(75, 'LRD', 'LRD', 'LRD', TRUE),
(76, 'HRK', 'HRK', 'HRK', TRUE),
(77, 'CHF', 'CHF', 'CHF', TRUE),
(78, 'ALL', 'ALL', 'ALL', TRUE),
(79, 'DJF', 'DJF', 'DJF', TRUE),
(80, 'TZS', 'TZS', 'TZS', TRUE),
(81, 'VND', 'VND', 'VND', TRUE),
(82, 'AUD', 'AUD', 'AUD', TRUE),
(83, 'ILS', 'ILS', 'ILS', TRUE),
(84, 'GHS', 'GHS', 'GHS', TRUE),
(85, 'GYD', 'GYD', 'GYD', TRUE),
(86, 'KPW', 'KPW', 'KPW', TRUE),
(87, 'BOB', 'BOB', 'BOB', TRUE),
(88, 'KHR', 'KHR', 'KHR', TRUE),
(89, 'MDL', 'MDL', 'MDL', TRUE),
(90, 'IDR', 'IDR', 'IDR', TRUE),
(91, 'KYD', 'KYD', 'KYD', TRUE),
(92, 'AMD', 'AMD', 'AMD', TRUE),
(93, 'BWP', 'BWP', 'BWP', TRUE),
(94, 'SHP', 'SHP', 'SHP', TRUE),
(95, 'TRY', 'TRY', 'TRY', TRUE),
(96, 'LBP', 'LBP', 'LBP', TRUE),
(97, 'TJS', 'TJS', 'TJS', TRUE),
(98, 'JOD', 'JOD', 'JOD', TRUE),
(99, 'HKD', 'HKD', 'HKD', TRUE),
(100, 'RWF', 'RWF', 'RWF', TRUE),
(101, 'AED', 'AED', 'AED', TRUE),
(102, 'EUR', 'EUR', 'EUR', TRUE),
(103, 'LSL', 'LSL', 'LSL', TRUE),
(104, 'DKK', 'DKK', 'DKK', TRUE),
(105, 'CAD', 'CAD', 'CAD', TRUE),
(106, 'BOV', 'BOV', 'BOV', TRUE),
(107, 'BGN', 'BGN', 'BGN', TRUE),
(108, 'MMK', 'MMK', 'MMK', TRUE),
(109, 'NOK', 'NOK', 'NOK', TRUE),
(110, 'MUR', 'MUR', 'MUR', TRUE),
(111, 'SYP', 'SYP', 'SYP', TRUE),
(112, 'GIP', 'GIP', 'GIP', TRUE),
(113, 'RON', 'RON', 'RON', TRUE),
(114, 'LKR', 'LKR', 'LKR', TRUE),
(115, 'NGN', 'NGN', 'NGN', TRUE),
(116, 'CRC', 'CRC', 'CRC', TRUE),
(117, 'CZK', 'CZK', 'CZK', TRUE),
(118, 'PKR', 'PKR', 'PKR', TRUE),
(119, 'XCD', 'XCD', 'XCD', TRUE),
(120, 'ANG', 'ANG', 'ANG', TRUE),
(121, 'HTG', 'HTG', 'HTG', TRUE),
(122, 'BHD', 'BHD', 'BHD', TRUE),
(123, 'KZT', 'KZT', 'KZT', TRUE);         
INSERT INTO SALESMANAGER.CURRENCY VALUES
(124, 'SRD', 'SRD', 'SRD', TRUE),
(125, 'SZL', 'SZL', 'SZL', TRUE),
(126, 'LTL', 'LTL', 'LTL', TRUE),
(127, 'SAR', 'SAR', 'SAR', TRUE),
(128, 'TTD', 'TTD', 'TTD', TRUE),
(129, 'YER', 'YER', 'YER', TRUE),
(130, 'MVR', 'MVR', 'MVR', TRUE),
(131, 'AFN', 'AFN', 'AFN', TRUE),
(132, 'INR', 'INR', 'INR', TRUE),
(133, 'AWG', 'AWG', 'AWG', TRUE),
(134, 'KRW', 'KRW', 'KRW', TRUE),
(135, 'NPR', 'NPR', 'NPR', TRUE),
(136, 'JPY', 'JPY', 'JPY', TRUE),
(137, 'MNT', 'MNT', 'MNT', TRUE),
(138, 'AOA', 'AOA', 'AOA', TRUE),
(139, 'PLN', 'PLN', 'PLN', TRUE),
(140, 'GBP', 'GBP', 'GBP', TRUE),
(141, 'SBD', 'SBD', 'SBD', TRUE),
(142, 'HUF', 'HUF', 'HUF', TRUE),
(143, 'BYR', 'BYR', 'BYR', TRUE),
(144, 'BIF', 'BIF', 'BIF', TRUE),
(145, 'MWK', 'MWK', 'MWK', TRUE),
(146, 'MGA', 'MGA', 'MGA', TRUE),
(147, 'XDR', 'XDR', 'XDR', TRUE),
(148, 'BZD', 'BZD', 'BZD', TRUE),
(149, 'BAM', 'BAM', 'BAM', TRUE),
(150, 'EGP', 'EGP', 'EGP', TRUE),
(151, 'MOP', 'MOP', 'MOP', TRUE),
(152, 'NAD', 'NAD', 'NAD', TRUE),
(153, 'NIO', 'NIO', 'NIO', TRUE),
(154, 'PEN', 'PEN', 'PEN', TRUE),
(155, 'NZD', 'NZD', 'NZD', TRUE),
(156, 'WST', 'WST', 'WST', TRUE),
(157, 'CLF', 'CLF', 'CLF', TRUE),
(158, 'BRL', 'BRL', 'BRL', TRUE);             
CREATE TABLE SALESMANAGER.CUSTOMER(
    CUSTOMER_ID BIGINT NOT NULL,
    CUSTOMER_ANONYMOUS BOOLEAN,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    BILLING_STREET_ADDRESS VARCHAR(256),
    BILLING_CITY VARCHAR(100),
    BILLING_COMPANY VARCHAR(100),
    BILLING_FIRST_NAME VARCHAR(64) NOT NULL,
    BILLING_LAST_NAME VARCHAR(64) NOT NULL,
    LATITUDE VARCHAR(100),
    LONGITUDE VARCHAR(100),
    BILLING_POSTCODE VARCHAR(20),
    BILLING_STATE VARCHAR(100),
    BILLING_TELEPHONE VARCHAR(32),
    CUSTOMER_COMPANY VARCHAR(100),
    REVIEW_AVG DECIMAL(19, 2),
    REVIEW_COUNT INTEGER,
    CUSTOMER_DOB TIMESTAMP,
    DELIVERY_STREET_ADDRESS VARCHAR(256),
    DELIVERY_CITY VARCHAR(100),
    DELIVERY_COMPANY VARCHAR(100),
    DELIVERY_FIRST_NAME VARCHAR(64),
    DELIVERY_LAST_NAME VARCHAR(64),
    DELIVERY_POSTCODE VARCHAR(20),
    DELIVERY_STATE VARCHAR(100),
    DELIVERY_TELEPHONE VARCHAR(32),
    CUSTOMER_EMAIL_ADDRESS VARCHAR(96) NOT NULL,
    CUSTOMER_GENDER VARCHAR(1),
    CUSTOMER_NICK VARCHAR(96),
    CUSTOMER_PASSWORD VARCHAR(60),
    PROVIDER VARCHAR(255),
    BILLING_COUNTRY_ID INTEGER NOT NULL,
    BILLING_ZONE_ID BIGINT,
    LANGUAGE_ID INTEGER NOT NULL,
    DELIVERY_COUNTRY_ID INTEGER,
    DELIVERY_ZONE_ID BIGINT,
    MERCHANT_ID INTEGER NOT NULL,
    RESET_CREDENTIALS_REQ VARCHAR(256),
    RESET_CREDENTIALS_EXP DATE
);          
ALTER TABLE SALESMANAGER.CUSTOMER ADD PRIMARY KEY(CUSTOMER_ID);
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER;           
INSERT INTO SALESMANAGER.CUSTOMER VALUES
(1, FALSE, NULL, NULL, NULL, '123 E Street', 'Toronto', '2018-12-12', 'John', 'Doe', NULL, NULL, 'H2H 2H2', NULL, '8888888888', NULL, 0.00, 0, NULL, '123 E Street', 'Toronto', '2018-12-12', 'John', 'Doe', 'H2H 2H2', NULL, NULL, 'test@gmail.com', 'M', 'EyCJri', '$2a$11$SEBXesrU30jaLKu8mR2fiOTKZk4k45znAnFTiMOIr9soP3Ie.NJs.', NULL, 13, 166, 1, 13, 166, 1, NULL, NULL),
(50, FALSE, NULL, TIMESTAMP '2020-09-01 08:25:26.015', NULL, '134 Rue du Languedoc', 'Boucherville', '', 'Carl', 'X', NULL, NULL, 'J4B 8J7', NULL, '5148047865', NULL, 0.00, 0, NULL, '134 Rue du Languedoc', 'Boucherville', '', 'Carl', 'X', 'J4B 8J7', NULL, NULL, 'csamson888@yahoo.com', 'M', 'Hucxfc', '$2a$10$a0/kMN3szAnq6..UXWd8fuqArdvv.FN.hTwd5MLUH6MR3f7Ft9eCW', NULL, 13, 8, 1, 13, 8, 1, NULL, NULL),
(51, FALSE, NULL, TIMESTAMP '2020-09-01 08:26:50.292', NULL, '325 Rue Bridge', STRINGDECODE('Montr\u00e9al'), 'CSTI Consulting', 'Johny', 'Utah', NULL, NULL, 'H3K 2C7', NULL, '4445556666', NULL, 0.00, 0, NULL, '325 Rue Bridge', STRINGDECODE('Montr\u00e9al'), 'CSTI Consulting', 'Johny', 'Utah', 'H3K 2C7', NULL, NULL, 'test@test.com', 'M', '_mspsJ', '$2a$10$z5zR.wU4.vGl7hIMxXV5R.Df0JV1eQofY/EQtBvzxRc953ljJOdai', NULL, 13, 8, 1, 13, 8, 1, NULL, NULL);          
CREATE TABLE SALESMANAGER.CUSTOMER_ATTRIBUTE(
    CUSTOMER_ATTRIBUTE_ID BIGINT NOT NULL,
    CUSTOMER_ATTR_TXT_VAL VARCHAR(255),
    CUSTOMER_ID BIGINT NOT NULL,
    OPTION_ID BIGINT NOT NULL,
    OPTION_VALUE_ID BIGINT NOT NULL
);   
ALTER TABLE SALESMANAGER.CUSTOMER_ATTRIBUTE ADD PRIMARY KEY(CUSTOMER_ATTRIBUTE_ID);            
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_ATTRIBUTE; 
CREATE TABLE SALESMANAGER.CUSTOMER_GROUP(
    CUSTOMER_ID BIGINT NOT NULL,
    GROUP_ID INTEGER NOT NULL
);     
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_GROUP;     
CREATE TABLE SALESMANAGER.CUSTOMER_OPT_VAL_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    CUSTOMER_OPT_VAL_ID BIGINT
);    
ALTER TABLE SALESMANAGER.CUSTOMER_OPT_VAL_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);         
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_OPT_VAL_DESCRIPTION;       
CREATE TABLE SALESMANAGER.CUSTOMER_OPTIN(
    CUSTOMER_OPTIN_ID BIGINT NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    FIRST VARCHAR(255),
    LAST VARCHAR(255),
    OPTIN_DATE TIMESTAMP,
    VALUE TEXT,
    MERCHANT_ID INTEGER NOT NULL,
    OPTIN_ID BIGINT
);  
ALTER TABLE SALESMANAGER.CUSTOMER_OPTIN ADD PRIMARY KEY(CUSTOMER_OPTIN_ID);    
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_OPTIN;     
CREATE TABLE SALESMANAGER.CUSTOMER_OPTION(
    CUSTOMER_OPTION_ID BIGINT NOT NULL,
    CUSTOMER_OPT_ACTIVE BOOLEAN,
    CUSTOMER_OPT_CODE VARCHAR(255),
    CUSTOMER_OPTION_TYPE VARCHAR(10),
    CUSTOMER_OPT_PUBLIC BOOLEAN,
    SORT_ORDER INTEGER,
    MERCHANT_ID INTEGER NOT NULL
);            
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION ADD PRIMARY KEY(CUSTOMER_OPTION_ID);  
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_OPTION;    
CREATE INDEX CUST_OPT_CODE_IDX ON SALESMANAGER.CUSTOMER_OPTION(CUSTOMER_OPT_CODE);      
CREATE TABLE SALESMANAGER.CUSTOMER_OPTION_DESC(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    CUSTOMER_OPTION_COMMENT TEXT,
    LANGUAGE_ID INTEGER NOT NULL,
    CUSTOMER_OPTION_ID BIGINT NOT NULL
); 
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_DESC ADD PRIMARY KEY(DESCRIPTION_ID);  
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_OPTION_DESC;               
CREATE TABLE SALESMANAGER.CUSTOMER_OPTION_SET(
    CUSTOMER_OPTIONSET_ID BIGINT NOT NULL,
    SORT_ORDER INTEGER,
    CUSTOMER_OPTION_ID BIGINT NOT NULL,
    CUSTOMER_OPTION_VALUE_ID BIGINT NOT NULL
);   
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_SET ADD PRIMARY KEY(CUSTOMER_OPTIONSET_ID);           
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_OPTION_SET;
CREATE TABLE SALESMANAGER.CUSTOMER_OPTION_VALUE(
    CUSTOMER_OPTION_VALUE_ID BIGINT NOT NULL,
    CUSTOMER_OPT_VAL_CODE VARCHAR(255),
    CUSTOMER_OPT_VAL_IMAGE VARCHAR(255),
    SORT_ORDER INTEGER,
    MERCHANT_ID INTEGER NOT NULL
);               
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_VALUE ADD PRIMARY KEY(CUSTOMER_OPTION_VALUE_ID);      
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_OPTION_VALUE;              
CREATE INDEX CUST_OPT_VAL_CODE_IDX ON SALESMANAGER.CUSTOMER_OPTION_VALUE(CUSTOMER_OPT_VAL_CODE);        
CREATE TABLE SALESMANAGER.CUSTOMER_REVIEW(
    CUSTOMER_REVIEW_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    REVIEW_DATE TIMESTAMP,
    REVIEWS_RATING DOUBLE,
    REVIEWS_READ BIGINT,
    STATUS INTEGER,
    CUSTOMERS_ID BIGINT,
    REVIEWED_CUSTOMER_ID BIGINT
);             
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW ADD PRIMARY KEY(CUSTOMER_REVIEW_ID);  
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_REVIEW;    
CREATE TABLE SALESMANAGER.CUSTOMER_REVIEW_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    CUSTOMER_REVIEW_ID BIGINT
);      
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);          
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CUSTOMER_REVIEW_DESCRIPTION;        
CREATE TABLE SALESMANAGER.FILE_HISTORY(
    FILE_HISTORY_ID BIGINT NOT NULL,
    ACCOUNTED_DATE TIMESTAMP,
    DATE_ADDED TIMESTAMP NOT NULL,
    DATE_DELETED TIMESTAMP,
    DOWNLOAD_COUNT INTEGER NOT NULL,
    FILE_ID BIGINT,
    FILESIZE INTEGER NOT NULL,
    MERCHANT_ID INTEGER NOT NULL
);               
ALTER TABLE SALESMANAGER.FILE_HISTORY ADD PRIMARY KEY(FILE_HISTORY_ID);         
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.FILE_HISTORY;       
CREATE TABLE SALESMANAGER.GEOZONE(
    GEOZONE_ID BIGINT NOT NULL,
    GEOZONE_CODE VARCHAR(255),
    GEOZONE_NAME VARCHAR(255)
);            
ALTER TABLE SALESMANAGER.GEOZONE ADD PRIMARY KEY(GEOZONE_ID);   
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.GEOZONE;            
CREATE TABLE SALESMANAGER.GEOZONE_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    GEOZONE_ID BIGINT
);      
ALTER TABLE SALESMANAGER.GEOZONE_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);   
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.GEOZONE_DESCRIPTION;
CREATE TABLE SALESMANAGER.LANGUAGE(
    LANGUAGE_ID INTEGER NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CODE VARCHAR(255) NOT NULL,
    SORT_ORDER INTEGER
);       
ALTER TABLE SALESMANAGER.LANGUAGE ADD PRIMARY KEY(LANGUAGE_ID); 
-- 2 +/- SELECT COUNT(*) FROM SALESMANAGER.LANGUAGE;           
INSERT INTO SALESMANAGER.LANGUAGE VALUES
(1, TIMESTAMP '2019-03-06 19:55:19.403', TIMESTAMP '2019-03-06 19:55:19.403', NULL, 'en', NULL),
(2, TIMESTAMP '2019-03-06 19:55:19.449', TIMESTAMP '2019-03-06 19:55:19.449', NULL, 'fr', NULL); 
CREATE INDEX CODE_IDX2 ON SALESMANAGER.LANGUAGE(CODE);  
CREATE TABLE SALESMANAGER.MANUFACTURER(
    MANUFACTURER_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CODE VARCHAR(100) NOT NULL,
    MANUFACTURER_IMAGE VARCHAR(255),
    SORT_ORDER INTEGER,
    MERCHANT_ID INTEGER NOT NULL
);     
ALTER TABLE SALESMANAGER.MANUFACTURER ADD PRIMARY KEY(MANUFACTURER_ID);        
-- 6 +/- SELECT COUNT(*) FROM SALESMANAGER.MANUFACTURER;       
INSERT INTO SALESMANAGER.MANUFACTURER VALUES
(1, TIMESTAMP '2019-03-06 19:55:21.371', TIMESTAMP '2019-03-06 19:55:21.371', NULL, 'DEFAULT', NULL, 0, 1),
(50, TIMESTAMP '2019-03-06 21:51:37.66', TIMESTAMP '2019-03-06 21:51:37.66', NULL, 'chic', NULL, 0, 1),
(51, TIMESTAMP '2019-03-06 21:54:01.916', TIMESTAMP '2019-03-06 21:54:01.916', NULL, 'retro', NULL, 0, 1),
(52, TIMESTAMP '2019-03-06 21:59:19.957', TIMESTAMP '2019-03-06 21:59:19.957', NULL, 'vintage', NULL, 0, 1),
(54, TIMESTAMP '2019-03-06 22:02:28.275', TIMESTAMP '2019-03-06 22:02:28.275', NULL, 'beach', NULL, 0, 1),
(55, TIMESTAMP '2019-03-06 22:02:42.37', TIMESTAMP '2019-03-06 22:02:42.37', NULL, 'courier', NULL, 0, 1);             
CREATE TABLE SALESMANAGER.MANUFACTURER_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    DATE_LAST_CLICK TIMESTAMP,
    MANUFACTURERS_URL VARCHAR(255),
    URL_CLICKED INTEGER,
    LANGUAGE_ID INTEGER NOT NULL,
    MANUFACTURER_ID BIGINT NOT NULL
); 
ALTER TABLE SALESMANAGER.MANUFACTURER_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);             
-- 6 +/- SELECT COUNT(*) FROM SALESMANAGER.MANUFACTURER_DESCRIPTION;           
INSERT INTO SALESMANAGER.MANUFACTURER_DESCRIPTION VALUES
(600, TIMESTAMP '2019-03-06 19:55:21.372', TIMESTAMP '2019-03-06 19:55:21.372', NULL, 'DEFAULT', 'DEFAULT', NULL, NULL, NULL, NULL, 1, 1),
(750, TIMESTAMP '2019-03-06 21:51:37.661', TIMESTAMP '2019-03-06 21:51:37.661', NULL, '', 'Chic', 'chic', NULL, 'chic', NULL, 1, 50),
(751, TIMESTAMP '2019-03-06 21:54:01.916', TIMESTAMP '2019-03-06 21:54:01.916', NULL, '', 'Retro', '', NULL, 'retro', NULL, 1, 51),
(752, TIMESTAMP '2019-03-06 21:59:19.958', TIMESTAMP '2019-03-06 21:59:19.958', NULL, '', 'Vintage', '', NULL, 'vintage', NULL, 1, 52),
(754, TIMESTAMP '2019-03-06 22:02:28.275', TIMESTAMP '2019-03-06 22:02:28.275', NULL, '', 'Beach', '', NULL, 'beach', NULL, 1, 54),
(755, TIMESTAMP '2019-03-06 22:02:42.37', TIMESTAMP '2019-03-06 22:02:42.37', NULL, '', 'Courier', '', NULL, 'courier', NULL, 1, 55);            
CREATE TABLE SALESMANAGER.MERCHANT_CONFIGURATION(
    MERCHANT_CONFIG_ID BIGINT NOT NULL,
    ACTIVE BOOLEAN,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CONFIG_KEY VARCHAR(255),
    TYPE VARCHAR(255),
    VALUE TEXT,
    MERCHANT_ID INTEGER
);     
ALTER TABLE SALESMANAGER.MERCHANT_CONFIGURATION ADD PRIMARY KEY(MERCHANT_CONFIG_ID);            
-- 7 +/- SELECT COUNT(*) FROM SALESMANAGER.MERCHANT_CONFIGURATION;             
INSERT INTO SALESMANAGER.MERCHANT_CONFIGURATION VALUES
(1, FALSE, TIMESTAMP '2019-03-06 19:55:21.649', TIMESTAMP '2019-03-06 21:32:35.239', NULL, 'CONFIG', 'CONFIG', '{"allowPurchaseItems":true,"displayContactUs":true,"displayCustomerAgreement":false,"defaultSearchConfigPath":{},"displayCustomerSection":true,"displayAddToCartOnFeaturedItems":true,"testMode":false,"displayStoreAddress":true,"displaySearchBox":true,"debugMode":false,"useDefaultSearchConfig":{}}', 1),
(50, FALSE, TIMESTAMP '2019-03-06 21:32:14.526', TIMESTAMP '2019-03-06 21:32:14.526', NULL, 'facebook_page_url', 'SOCIAL', 'https://www.facebook.com/Shopizer/', 1),
(51, FALSE, TIMESTAMP '2019-03-06 22:05:55.884', TIMESTAMP '2019-03-06 22:12:48.586', NULL, 'PAYMENT', 'INTEGRATION', 'df02614ab6600db0eb4d78e2c4df5574f9ba1903c78f9da01dded48dcbe5fa1395559a2eb8160dd8615b22e900932a7bac035d6eaa57b1ec05f4cedf94c2d8054819918ba0b244669d6987678949825eee5e06278ad1acdb473840b69721531c51e62999ba70c79fdd7257895873ce0ebb136ea4bfa7ee95231625ca57f2c94012ddad9d774a6b68b3a3331130111ebc99db9b5ef8c00007963dda645844e341494a84594ec5a9f82e4480d7390e2c49753ef4fc8b98c8eb1b3690599001cd70', 1),
(52, FALSE, TIMESTAMP '2019-03-06 22:06:34.944', TIMESTAMP '2019-03-06 22:06:34.944', NULL, 'SHIPPING_CONFIG', 'INTEGRATION', '{"boxLength":0,"orderTotalFreeShipping":null,"shipBaseType":"SHIPPING","shipOptionPriceType":"ALL","maxWeight":0,"boxHeight":0,"taxOnShipping":false,"shipPackageType":"ITEM","freeShippingEnabled":false,"boxWeight":0,"shipType":"INTERNATIONAL","boxWidth":0,"handlingFees":null,"shipDescription":"SHORT_DESCRIPTION"}', 1),
(53, FALSE, TIMESTAMP '2019-03-06 22:06:49.5', TIMESTAMP '2019-03-06 22:09:02.511', NULL, 'SUPPORTED_CNTR', 'INTEGRATION', '["AU","BE","BR","CA","CN","FI","FR","IN","US","GB"]', 1),
(54, FALSE, TIMESTAMP '2019-03-06 22:09:20.204', TIMESTAMP '2019-03-06 22:09:44.233', NULL, 'SHIPPING', 'INTEGRATION', 'df02614ab6600db0eb4d78e2c4df55740a3632c23495d207674f0bdef76266c50f2e31f12af589c92a6e67ad4d1e9a7b0dbe808d05c409e47270b39aa0cc7a5791f650aaabfe5baf8e29ab102ea6cdab71b5cfe0b271d3610f9fa5e758a93cbf092a100bd0ad88ab9c4fb7ef61c18305ed89f81233ce4660ce4384d205b656f3fdb6fc8b80c87428ccf58808533c23920d58e2f048c35fd0bc04023933b9aafe8c5eef3012fd0cda2984614938f5162f', 1),
(55, FALSE, TIMESTAMP '2019-03-06 22:09:44.234', TIMESTAMP '2019-03-06 22:12:10.129', NULL, 'weightBased', 'INTEGRATION', '{"moduleCode":"weightBased","active":true,"regions":[{"customRegionName":"US","countries":["US"],"quoteItems":[{"price":12,"maximumWeight":200}]},{"customRegionName":"INDIA","countries":["IN"],"quoteItems":[{"price":19,"maximumWeight":200}]},{"customRegionName":"CHINA","countries":["CN"],"quoteItems":[{"price":26,"maximumWeight":200}]},{"customRegionName":"CANADA","countries":["CA"],"quoteItems":[{"price":14,"maximumWeight":200}]}]}', 1);        
CREATE TABLE SALESMANAGER.MERCHANT_LANGUAGE(
    STORES_MERCHANT_ID INTEGER NOT NULL,
    LANGUAGES_LANGUAGE_ID INTEGER NOT NULL
);             
-- 2 +/- SELECT COUNT(*) FROM SALESMANAGER.MERCHANT_LANGUAGE;  
INSERT INTO SALESMANAGER.MERCHANT_LANGUAGE VALUES
(1, 1),
(1, 2);          
CREATE TABLE SALESMANAGER.MERCHANT_LOG(
    MERCHANT_LOG_ID BIGINT NOT NULL,
    LOG TEXT,
    MODULE VARCHAR(25),
    MERCHANT_ID INTEGER NOT NULL
);       
ALTER TABLE SALESMANAGER.MERCHANT_LOG ADD PRIMARY KEY(MERCHANT_LOG_ID);         
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.MERCHANT_LOG;       
CREATE TABLE SALESMANAGER.MERCHANT_STORE(
    MERCHANT_ID INTEGER NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    STORE_CODE VARCHAR(100) NOT NULL,
    CONTINUESHOPPINGURL VARCHAR(150),
    CURRENCY_FORMAT_NATIONAL BOOLEAN,
    DOMAIN_NAME VARCHAR(80),
    IN_BUSINESS_SINCE DATE,
    INVOICE_TEMPLATE VARCHAR(25),
    SEIZEUNITCODE VARCHAR(5),
    STORE_EMAIL VARCHAR(60) NOT NULL,
    STORE_LOGO VARCHAR(100),
    STORE_TEMPLATE VARCHAR(25),
    STORE_ADDRESS VARCHAR(255),
    STORE_CITY VARCHAR(100),
    STORE_NAME VARCHAR(100) NOT NULL,
    STORE_PHONE VARCHAR(50),
    STORE_POSTAL_CODE VARCHAR(15),
    STORE_STATE_PROV VARCHAR(100),
    USE_CACHE BOOLEAN,
    WEIGHTUNITCODE VARCHAR(5),
    COUNTRY_ID INTEGER NOT NULL,
    CURRENCY_ID BIGINT NOT NULL,
    LANGUAGE_ID INTEGER NOT NULL,
    ZONE_ID BIGINT,
    IS_RETAILER BOOLEAN,
    PARENT_ID INTEGER
);           
ALTER TABLE SALESMANAGER.MERCHANT_STORE ADD PRIMARY KEY(MERCHANT_ID);          
-- 1 +/- SELECT COUNT(*) FROM SALESMANAGER.MERCHANT_STORE;     
INSERT INTO SALESMANAGER.MERCHANT_STORE VALUES
(1, NULL, NULL, NULL, 'DEFAULT', NULL, FALSE, 'http://localhost:8080', DATE '2019-03-06', NULL, 'IN', 'john@test.com', 'Vintage-Bags.jpg', 'december', '1234 Street address', 'My city', 'Default store', '888-888-8888', 'H2H-2H2', '', FALSE, 'LB', 13, 61, 1, 8, FALSE, NULL);           
CREATE TABLE SALESMANAGER.MODULE_CONFIGURATION(
    MODULE_CONF_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CODE VARCHAR(255) NOT NULL,
    DETAILS TEXT,
    CONFIGURATION TEXT,
    CUSTOM_IND BOOLEAN,
    IMAGE VARCHAR(255),
    MODULE VARCHAR(255),
    REGIONS VARCHAR(255),
    TYPE VARCHAR(255)
);   
ALTER TABLE SALESMANAGER.MODULE_CONFIGURATION ADD PRIMARY KEY(MODULE_CONF_ID);
-- 12 +/- SELECT COUNT(*) FROM SALESMANAGER.MODULE_CONFIGURATION;              
INSERT INTO SALESMANAGER.MODULE_CONFIGURATION VALUES
(1, TIMESTAMP '2019-03-06 19:55:21.295', TIMESTAMP '2019-03-06 19:55:21.295', NULL, 'usps', NULL, '[{"scheme":"http","host":"testing.shippingapis.com","port":"80","uri":"/ShippingAPI.dll","env":"TEST","config1":null,"config2":null},{"scheme":"http","host":"production.shippingapis.com","port":"80","uri":"/ShippingAPI.dll","env":"PROD","config1":null,"config2":null}]', FALSE, 'usps.jpg', 'SHIPPING', '["US"]', NULL),
(2, TIMESTAMP '2019-03-06 19:55:21.298', TIMESTAMP '2019-03-06 19:55:21.298', NULL, 'canadapost', NULL, '[{"scheme":"https","host":"ct.soa-gw.canadapost.ca","port":"443","uri":"/rs/ship/price","env":"TEST","config1":null,"config2":null},{"scheme":"https","host":"soa-gw.canadapost.ca","port":"443","uri":"/rs/ship/price","env":"PROD","config1":null,"config2":null}]', FALSE, 'canadapost.jpg', 'SHIPPING', '["CA"]', NULL),
(3, TIMESTAMP '2019-03-06 19:55:21.3', TIMESTAMP '2019-03-06 19:55:21.3', NULL, 'ups', '{"01":"UPS Next Day Air","02":"UPS Second Day Air","03":"UPS Ground","07":"UPS Worldwide Express","08":"UPS Worldwide Expedited","11":"UPS Standard","12":"UPS Three-Day Select","13":"UPS Next Day Air Saver","14":"UPS Next Day Air Early A.M.","54":"UPS Worldwide Express Plus","59":"UPS Second Day Air A.M.","69":"UPS Saver"}', '[{"scheme":"https","host":"wwwcie.ups.com","port":"443","uri":"/ups.app/xml/Rate","env":"TEST","config1":null,"config2":null},{"scheme":"https","host":"onlinetools.ups.com","port":"443","uri":"/xml/Rate","env":"PROD","config1":null,"config2":null}]', FALSE, 'ups.jpg', 'SHIPPING', '["US","CA","FR","GB"]', NULL),
(4, TIMESTAMP '2019-03-06 19:55:21.302', TIMESTAMP '2019-03-06 19:55:21.302', NULL, 'weightBased', NULL, NULL, TRUE, NULL, 'SHIPPING', '["*"]', NULL),
(5, TIMESTAMP '2019-03-06 19:55:21.303', TIMESTAMP '2019-03-06 19:55:21.303', NULL, 'customQuotesRules', NULL, NULL, FALSE, NULL, 'SHIPPING', '["*"]', NULL),
(6, TIMESTAMP '2019-03-06 19:55:21.305', TIMESTAMP '2019-03-06 19:55:21.305', NULL, 'priceByDistance', NULL, NULL, FALSE, NULL, 'SHIPPING', '["*"]', NULL),
(7, TIMESTAMP '2019-03-06 19:55:21.306', TIMESTAMP '2019-03-06 19:55:21.306', NULL, 'storePickUp', NULL, NULL, FALSE, NULL, 'SHIPPING', '["*"]', NULL),
(8, TIMESTAMP '2019-03-06 19:55:21.308', TIMESTAMP '2019-03-06 19:55:21.308', NULL, 'moneyorder', NULL, NULL, FALSE, 'moneyorder.gif', 'PAYMENT', '["*"]', 'moneyorder'),
(9, TIMESTAMP '2019-03-06 19:55:21.31', TIMESTAMP '2019-03-06 19:55:21.31', NULL, 'paypal-express-checkout', NULL, '[{"scheme":null,"host":null,"port":null,"uri":null,"env":"TEST","config1":"https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=","config2":null},{"scheme":null,"host":null,"port":null,"uri":null,"env":"PROD","config1":"https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=","config2":null}]', FALSE, 'icon-paypal.png', 'PAYMENT', '["*"]', 'paypal'),
(10, TIMESTAMP '2019-03-06 19:55:21.313', TIMESTAMP '2019-03-06 19:55:21.313', NULL, 'beanstream', NULL, '[{"scheme":"https","host":"www.beanstream.com","port":"443","uri":"/scripts/process_transaction.asp","env":"TEST","config1":null,"config2":null},{"scheme":"https","host":"www.beanstream.com","port":"443","uri":"/scripts/process_transaction.asp","env":"PROD","config1":null,"config2":null}]', FALSE, 'beanstream.gif', 'PAYMENT', '["US","CA","GB"]', 'creditcard'),
(11, TIMESTAMP '2019-03-06 19:55:21.315', TIMESTAMP '2019-03-06 19:55:21.315', NULL, 'stripe', NULL, '[{"scheme":"https","host":"www.stripe.com","port":"443","uri":"/","env":"TEST","config1":null,"config2":null},{"scheme":"https","host":"www.stripe.com","port":"443","uri":"/","env":"PROD","config1":null,"config2":null}]', FALSE, 'stripe.png', 'PAYMENT', '["US","CA","GB","AU","FI","DK","IE","NO","SE"]', 'creditcard'),
(12, TIMESTAMP '2019-03-06 19:55:21.316', TIMESTAMP '2019-03-06 19:55:21.316', NULL, 'braintree', NULL, '[{"scheme":"https","host":"NOTREQUIRED","port":"NOTREQUIRED","uri":"NOTREQUIRED","env":"TEST","config1":null,"config2":null},{"scheme":"https","host":"NOTREQUIRED","port":"NOTREQUIRED","uri":"NOTREQUIRED","env":"PROD","config1":null,"config2":null}]', FALSE, 'braintree.jpg', 'PAYMENT', '["US","CA","GB","AU","FI","DK","IE","NO","SE","AL","AD","AT","BY","BE","BG","HY","CY","CZ","FR","GR","IS","IE","IM","IT","PL","LU","CH","RS","SG","MY","HK","NZ"]', 'creditcard');
CREATE INDEX MODULE_CONFIGURATION_MODULE ON SALESMANAGER.MODULE_CONFIGURATION(MODULE);  
CREATE TABLE SALESMANAGER.OPTIN(
    OPTIN_ID BIGINT NOT NULL,
    CODE VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(255),
    END_DATE TIMESTAMP,
    TYPE VARCHAR(255) NOT NULL,
    START_DATE TIMESTAMP,
    MERCHANT_ID INTEGER
);             
ALTER TABLE SALESMANAGER.OPTIN ADD PRIMARY KEY(OPTIN_ID);      
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.OPTIN;              
CREATE TABLE SALESMANAGER.ORDER_ACCOUNT(
    ORDER_ACCOUNT_ID BIGINT NOT NULL,
    ORDER_ACCOUNT_BILL_DAY INTEGER NOT NULL,
    ORDER_ACCOUNT_END_DATE DATE,
    ORDER_ACCOUNT_START_DATE DATE NOT NULL,
    ORDER_ID BIGINT NOT NULL
);  
ALTER TABLE SALESMANAGER.ORDER_ACCOUNT ADD PRIMARY KEY(ORDER_ACCOUNT_ID);      
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_ACCOUNT;      
CREATE TABLE SALESMANAGER.ORDER_ACCOUNT_PRODUCT(
    ORDER_ACCOUNT_PRODUCT_ID BIGINT NOT NULL,
    ORDER_ACCOUNT_PRODUCT_ACCNT_DT DATE,
    ORDER_ACCOUNT_PRODUCT_END_DT DATE,
    ORDER_ACCOUNT_PRODUCT_EOT TIMESTAMP,
    ORDER_ACCOUNT_PRODUCT_L_ST_DT TIMESTAMP,
    ORDER_ACCOUNT_PRODUCT_L_TRX_ST INTEGER NOT NULL,
    ORDER_ACCOUNT_PRODUCT_PM_FR_TY INTEGER NOT NULL,
    ORDER_ACCOUNT_PRODUCT_ST_DT DATE NOT NULL,
    ORDER_ACCOUNT_PRODUCT_STATUS INTEGER NOT NULL,
    ORDER_ACCOUNT_ID BIGINT NOT NULL,
    ORDER_PRODUCT_ID BIGINT NOT NULL
);
ALTER TABLE SALESMANAGER.ORDER_ACCOUNT_PRODUCT ADD PRIMARY KEY(ORDER_ACCOUNT_PRODUCT_ID);      
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_ACCOUNT_PRODUCT;              
CREATE TABLE SALESMANAGER.ORDER_ATTRIBUTE(
    ORDER_ATTRIBUTE_ID BIGINT NOT NULL,
    IDENTIFIER VARCHAR(255) NOT NULL,
    VALUE VARCHAR(255) NOT NULL,
    ORDER_ID BIGINT NOT NULL
);   
ALTER TABLE SALESMANAGER.ORDER_ATTRIBUTE ADD PRIMARY KEY(ORDER_ATTRIBUTE_ID);   
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_ATTRIBUTE;    
CREATE TABLE SALESMANAGER.ORDER_PRODUCT(
    ORDER_PRODUCT_ID BIGINT NOT NULL,
    ONETIME_CHARGE DECIMAL(19, 2) NOT NULL,
    PRODUCT_NAME VARCHAR(64) NOT NULL,
    PRODUCT_QUANTITY INTEGER,
    PRODUCT_SKU VARCHAR(255),
    ORDER_ID BIGINT NOT NULL
);           
ALTER TABLE SALESMANAGER.ORDER_PRODUCT ADD PRIMARY KEY(ORDER_PRODUCT_ID);      
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_PRODUCT;      
INSERT INTO SALESMANAGER.ORDER_PRODUCT VALUES
(1, 49.00, 'Sace tissu multi usge', 1, 'NK028', 1),
(50, 60.00, 'Chic vintage DeVille', 1, 'NK035', 50),
(51, 78.00, 'Vintage laptop bag', 1, 'NK124', 51);  
CREATE TABLE SALESMANAGER.ORDER_PRODUCT_ATTRIBUTE(
    ORDER_PRODUCT_ATTRIBUTE_ID BIGINT NOT NULL,
    PRODUCT_ATTRIBUTE_IS_FREE BOOLEAN NOT NULL,
    PRODUCT_ATTRIBUTE_NAME VARCHAR(255),
    PRODUCT_ATTRIBUTE_PRICE DECIMAL(15, 4) NOT NULL,
    PRODUCT_ATTRIBUTE_VAL_NAME VARCHAR(255),
    PRODUCT_ATTRIBUTE_WEIGHT DECIMAL(15, 4),
    PRODUCT_OPTION_ID BIGINT NOT NULL,
    PRODUCT_OPTION_VALUE_ID BIGINT NOT NULL,
    ORDER_PRODUCT_ID BIGINT NOT NULL
);            
ALTER TABLE SALESMANAGER.ORDER_PRODUCT_ATTRIBUTE ADD PRIMARY KEY(ORDER_PRODUCT_ATTRIBUTE_ID);  
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_PRODUCT_ATTRIBUTE;            
CREATE TABLE SALESMANAGER.ORDER_PRODUCT_DOWNLOAD(
    ORDER_PRODUCT_DOWNLOAD_ID BIGINT NOT NULL,
    DOWNLOAD_COUNT INTEGER NOT NULL,
    DOWNLOAD_MAXDAYS INTEGER NOT NULL,
    ORDER_PRODUCT_FILENAME VARCHAR(255) NOT NULL,
    ORDER_PRODUCT_ID BIGINT NOT NULL
);    
ALTER TABLE SALESMANAGER.ORDER_PRODUCT_DOWNLOAD ADD PRIMARY KEY(ORDER_PRODUCT_DOWNLOAD_ID);    
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_PRODUCT_DOWNLOAD;             
CREATE TABLE SALESMANAGER.ORDER_PRODUCT_PRICE(
    ORDER_PRODUCT_PRICE_ID BIGINT NOT NULL,
    DEFAULT_PRICE BOOLEAN NOT NULL,
    PRODUCT_PRICE DECIMAL(19, 2) NOT NULL,
    PRODUCT_PRICE_CODE VARCHAR(64) NOT NULL,
    PRODUCT_PRICE_NAME VARCHAR(255),
    PRODUCT_PRICE_SPECIAL DECIMAL(19, 2),
    PRD_PRICE_SPECIAL_END_DT TIMESTAMP,
    PRD_PRICE_SPECIAL_ST_DT TIMESTAMP,
    ORDER_PRODUCT_ID BIGINT NOT NULL
);      
ALTER TABLE SALESMANAGER.ORDER_PRODUCT_PRICE ADD PRIMARY KEY(ORDER_PRODUCT_PRICE_ID);          
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_PRODUCT_PRICE;
INSERT INTO SALESMANAGER.ORDER_PRODUCT_PRICE VALUES
(1, TRUE, 49.00, 'base', 'DEFAULT', 49.00, NULL, NULL, 1),
(50, TRUE, 60.00, 'base', 'DEFAULT', 60.00, NULL, NULL, 50),
(51, TRUE, 78.00, 'base', 'DEFAULT', NULL, NULL, NULL, 51);    
CREATE TABLE SALESMANAGER.ORDER_STATUS_HISTORY(
    ORDER_STATUS_HISTORY_ID BIGINT NOT NULL,
    COMMENTS TEXT,
    CUSTOMER_NOTIFIED INTEGER,
    DATE_ADDED TIMESTAMP NOT NULL,
    STATUS VARCHAR(255),
    ORDER_ID BIGINT NOT NULL
);               
ALTER TABLE SALESMANAGER.ORDER_STATUS_HISTORY ADD PRIMARY KEY(ORDER_STATUS_HISTORY_ID);        
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_STATUS_HISTORY;               
INSERT INTO SALESMANAGER.ORDER_STATUS_HISTORY VALUES
(1, NULL, NULL, TIMESTAMP '2019-03-06 22:21:14.931', 'ORDERED', 1),
(50, NULL, NULL, TIMESTAMP '2020-09-01 08:25:26.163', 'ORDERED', 50),
(51, NULL, NULL, TIMESTAMP '2020-09-01 08:26:50.392', 'ORDERED', 51);       
CREATE TABLE SALESMANAGER.ORDER_TOTAL(
    ORDER_ACCOUNT_ID BIGINT NOT NULL,
    MODULE VARCHAR(60),
    CODE VARCHAR(255) NOT NULL,
    ORDER_TOTAL_TYPE VARCHAR(255),
    ORDER_VALUE_TYPE VARCHAR(255),
    SORT_ORDER INTEGER NOT NULL,
    TEXT TEXT,
    TITLE VARCHAR(255),
    VALUE DECIMAL(15, 4) NOT NULL,
    ORDER_ID BIGINT NOT NULL
);            
ALTER TABLE SALESMANAGER.ORDER_TOTAL ADD PRIMARY KEY(ORDER_ACCOUNT_ID);        
-- 9 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDER_TOTAL;        
INSERT INTO SALESMANAGER.ORDER_TOTAL VALUES
(1, 'subtotal', 'order.total.subtotal', 'SUBTOTAL', 'ONE_TIME', 5, NULL, 'subtotal', 49.0000, 1),
(2, 'shipping', 'order.total.shipping', 'SHIPPING', 'ONE_TIME', 100, NULL, 'shipping', 14.0000, 1),
(3, 'total', 'order.total.total', 'TOTAL', 'ONE_TIME', 500, NULL, 'total', 63.0000, 1),
(50, 'subtotal', 'order.total.subtotal', 'SUBTOTAL', 'ONE_TIME', 5, NULL, 'subtotal', 60.0000, 50),
(51, 'shipping', 'order.total.shipping', 'SHIPPING', 'ONE_TIME', 100, NULL, 'shipping', 14.0000, 50),
(52, 'total', 'order.total.total', 'TOTAL', 'ONE_TIME', 500, NULL, 'total', 74.0000, 50),
(53, 'subtotal', 'order.total.subtotal', 'SUBTOTAL', 'ONE_TIME', 5, NULL, 'subtotal', 78.0000, 51),
(54, 'shipping', 'order.total.shipping', 'SHIPPING', 'ONE_TIME', 100, NULL, 'shipping', 14.0000, 51),
(55, 'total', 'order.total.total', 'TOTAL', 'ONE_TIME', 500, NULL, 'total', 92.0000, 51);          
CREATE TABLE SALESMANAGER.PRODUCT_OPT_SET_OPT_VALUE(
    PRODUCTOPTIONSET_PRODUCT_OPTION_SET_ID BIGINT NOT NULL,
    VALUES_PRODUCT_OPTION_VALUE_ID BIGINT NOT NULL
);          
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_OPT_SET_OPT_VALUE;          
CREATE TABLE SALESMANAGER.PRODUCT_OPTION_SET(
    PRODUCT_OPTION_SET_ID BIGINT NOT NULL,
    PRODUCT_OPTION_SET_CODE VARCHAR(255),
    PRODUCT_OPTION_SET_DISP BOOLEAN,
    PRODUCT_OPTION_ID BIGINT NOT NULL,
    MERCHANT_ID INTEGER NOT NULL
);        
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_SET ADD PRIMARY KEY(PRODUCT_OPTION_SET_ID);           
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_OPTION_SET; 
CREATE TABLE SALESMANAGER.PERMISSION(
    PERMISSION_ID INTEGER NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    PERMISSION_NAME VARCHAR(255)
);           
ALTER TABLE SALESMANAGER.PERMISSION ADD PRIMARY KEY(PERMISSION_ID);            
-- 13 +/- SELECT COUNT(*) FROM SALESMANAGER.PERMISSION;        
INSERT INTO SALESMANAGER.PERMISSION VALUES
(1, TIMESTAMP '2019-03-06 19:55:21.413', TIMESTAMP '2019-03-06 19:55:21.413', NULL, 'STORE_ADMIN'),
(2, TIMESTAMP '2019-03-06 19:55:21.424', TIMESTAMP '2019-03-06 19:55:21.424', NULL, 'SUPERADMIN'),
(3, TIMESTAMP '2019-03-06 19:55:21.425', TIMESTAMP '2019-03-06 19:55:21.425', NULL, 'ADMIN'),
(4, TIMESTAMP '2019-03-06 19:55:21.427', TIMESTAMP '2019-03-06 19:55:21.427', NULL, 'AUTH'),
(5, TIMESTAMP '2019-03-06 19:55:21.439', TIMESTAMP '2019-03-06 19:55:21.439', NULL, 'PRODUCTS'),
(6, TIMESTAMP '2019-03-06 19:55:21.442', TIMESTAMP '2019-03-06 19:55:21.442', NULL, 'ORDER'),
(7, TIMESTAMP '2019-03-06 19:55:21.447', TIMESTAMP '2019-03-06 19:55:21.447', NULL, 'CONTENT'),
(8, TIMESTAMP '2019-03-06 19:55:21.451', TIMESTAMP '2019-03-06 19:55:21.451', NULL, 'STORE'),
(9, TIMESTAMP '2019-03-06 19:55:21.454', TIMESTAMP '2019-03-06 19:55:21.454', NULL, 'TAX'),
(10, TIMESTAMP '2019-03-06 19:55:21.458', TIMESTAMP '2019-03-06 19:55:21.458', NULL, 'PAYMENT'),
(11, TIMESTAMP '2019-03-06 19:55:21.462', TIMESTAMP '2019-03-06 19:55:21.462', NULL, 'CUSTOMER'),
(12, TIMESTAMP '2019-03-06 19:55:21.467', TIMESTAMP '2019-03-06 19:55:21.467', NULL, 'SHIPPING'),
(13, TIMESTAMP '2019-03-06 19:55:21.471', TIMESTAMP '2019-03-06 19:55:21.471', NULL, 'AUTH_CUSTOMER');          
CREATE TABLE SALESMANAGER.PERMISSION_GROUP(
    PERMISSION_ID INTEGER NOT NULL,
    GROUP_ID INTEGER NOT NULL
);
-- 35 +/- SELECT COUNT(*) FROM SALESMANAGER.PERMISSION_GROUP;  
INSERT INTO SALESMANAGER.PERMISSION_GROUP VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 5),
(7, 1),
(7, 2),
(7, 6),
(8, 1),
(8, 2),
(8, 4),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 2),
(10, 4),
(11, 1),
(11, 2),
(11, 4),
(12, 1),
(12, 2),
(12, 4),
(13, 7);         
CREATE TABLE SALESMANAGER.PRODUCT(
    PRODUCT_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    AVAILABLE BOOLEAN,
    COND INTEGER,
    DATE_AVAILABLE TIMESTAMP,
    PREORDER BOOLEAN,
    PRODUCT_HEIGHT DECIMAL(19, 2),
    PRODUCT_FREE BOOLEAN,
    PRODUCT_LENGTH DECIMAL(19, 2),
    QUANTITY_ORDERED INTEGER,
    REVIEW_AVG DECIMAL(19, 2),
    REVIEW_COUNT INTEGER,
    PRODUCT_SHIP BOOLEAN,
    PRODUCT_VIRTUAL BOOLEAN,
    PRODUCT_WEIGHT DECIMAL(19, 2),
    PRODUCT_WIDTH DECIMAL(19, 2),
    REF_SKU VARCHAR(255),
    RENTAL_DURATION INTEGER,
    RENTAL_PERIOD INTEGER,
    RENTAL_STATUS INTEGER,
    SKU VARCHAR(255),
    SORT_ORDER INTEGER,
    MANUFACTURER_ID BIGINT,
    MERCHANT_ID INTEGER NOT NULL,
    CUSTOMER_ID BIGINT,
    TAX_CLASS_ID BIGINT,
    PRODUCT_TYPE_ID BIGINT
);              
ALTER TABLE SALESMANAGER.PRODUCT ADD PRIMARY KEY(PRODUCT_ID);  
-- 10 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT;           
INSERT INTO SALESMANAGER.PRODUCT VALUES
(1, TIMESTAMP '2019-03-06 22:03:30.264', TIMESTAMP '2020-09-29 19:18:48.619', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 20.00, FALSE, 4.00, NULL, 0.00, 0, TRUE, FALSE, 1.00, 30.00, 'NK071', 0, 0, NULL, 'NK071', 8, 51, 1, NULL, 1, 1),
(2, TIMESTAMP '2019-03-06 22:03:30.618', TIMESTAMP '2021-02-06 21:23:04.795', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 17.00, FALSE, 4.00, NULL, 0.00, 0, TRUE, FALSE, 1.00, 28.00, 'NK125', 0, 0, NULL, 'NK125', 2, 52, 1, NULL, 1, 1),
(3, TIMESTAMP '2019-03-06 22:03:30.741', TIMESTAMP '2020-03-13 10:37:59.691', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 20.00, FALSE, 4.00, NULL, 0.00, 0, TRUE, FALSE, 1.00, 30.00, 'NK089', 0, 0, NULL, 'NK089', 3, 52, 1, NULL, 1, 1),
(4, TIMESTAMP '2019-03-06 22:03:30.842', TIMESTAMP '2020-12-01 13:44:56.591', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 17.00, FALSE, 4.00, NULL, 0.00, 0, TRUE, FALSE, 1.00, 28.00, 'NK035', 0, 0, NULL, 'NK035', 1, 50, 1, NULL, 1, 1),
(5, TIMESTAMP '2019-03-06 22:03:30.953', TIMESTAMP '2020-03-13 10:37:12.54', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 18.00, FALSE, 5.00, NULL, 0.00, 0, TRUE, FALSE, 1.00, 29.00, 'NK028', 0, 0, NULL, 'NK028', 2, 52, 1, NULL, 1, 1),
(6, TIMESTAMP '2019-03-06 22:03:31.06', TIMESTAMP '2020-03-13 10:42:11.382', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 19.00, FALSE, 4.00, NULL, 0.00, 0, TRUE, FALSE, 1.00, 27.00, 'NK033', 0, 0, NULL, 'NK033', 5, 51, 1, NULL, 1, 1),
(7, TIMESTAMP '2019-03-06 22:03:31.168', TIMESTAMP '2020-03-13 10:39:50.79', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 20.00, FALSE, 8.00, NULL, 0.00, 0, TRUE, FALSE, 1.00, 30.00, 'NK095', 0, 0, NULL, 'NK095', 4, 54, 1, NULL, 1, 1),
(8, TIMESTAMP '2019-03-06 22:03:31.282', TIMESTAMP '2020-09-01 08:26:39.246', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 18.00, FALSE, 4.00, NULL, 0.00, 0, TRUE, FALSE, 2.00, 20.00, 'NK124', 0, 0, NULL, 'NK124', 3, 52, 1, NULL, 1, 1),
(9, TIMESTAMP '2019-03-06 22:03:31.377', TIMESTAMP '2020-03-13 10:40:44.477', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 17.00, FALSE, 5.00, NULL, 0.00, 0, TRUE, FALSE, 2.00, 28.00, 'NK019', 0, 0, NULL, 'NK019', 4, 50, 1, NULL, 1, 1),
(10, TIMESTAMP '2019-03-06 22:03:31.476', TIMESTAMP '2021-02-06 21:13:45.341', 'admin', TRUE, NULL, TIMESTAMP '2019-03-06 00:00:00', FALSE, 18.00, FALSE, 10.00, NULL, 0.00, 0, TRUE, FALSE, 2.00, 22.00, 'NK022', 0, 0, NULL, 'NK022', 0, 55, 1, NULL, 1, 1);   
CREATE TABLE SALESMANAGER.PRODUCT_ATTRIBUTE(
    PRODUCT_ATTRIBUTE_ID BIGINT NOT NULL,
    PRODUCT_ATTRIBUTE_DEFAULT BOOLEAN,
    PRODUCT_ATTRIBUTE_DISCOUNTED BOOLEAN,
    PRODUCT_ATTRIBUTE_FOR_DISP BOOLEAN,
    PRODUCT_ATTRIBUTE_REQUIRED BOOLEAN,
    PRODUCT_ATTRIBUTE_FREE BOOLEAN,
    PRODUCT_ATRIBUTE_PRICE DECIMAL(19, 2),
    PRODUCT_ATTRIBUTE_WEIGHT DECIMAL(19, 2),
    PRODUCT_ATTRIBUTE_SORT_ORD INTEGER,
    PRODUCT_ID BIGINT NOT NULL,
    OPTION_ID BIGINT NOT NULL,
    OPTION_VALUE_ID BIGINT NOT NULL
);           
ALTER TABLE SALESMANAGER.PRODUCT_ATTRIBUTE ADD PRIMARY KEY(PRODUCT_ATTRIBUTE_ID);              
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_ATTRIBUTE;  
CREATE TABLE SALESMANAGER.PRODUCT_TYPE(
    PRODUCT_TYPE_ID BIGINT NOT NULL,
    PRD_TYPE_ADD_TO_CART BOOLEAN,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    PRD_TYPE_CODE VARCHAR(255),
    MERCHANT_ID INTEGER,
    PRD_TYPE_VISIBLE BOOLEAN
);           
ALTER TABLE SALESMANAGER.PRODUCT_TYPE ADD PRIMARY KEY(PRODUCT_TYPE_ID);        
-- 1 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_TYPE;       
INSERT INTO SALESMANAGER.PRODUCT_TYPE VALUES
(1, NULL, TIMESTAMP '2019-03-06 19:55:21.268', TIMESTAMP '2019-03-06 19:55:21.268', NULL, 'GENERAL', NULL, NULL);             
CREATE TABLE SALESMANAGER.PRODUCT_CATEGORY(
    PRODUCT_ID BIGINT NOT NULL,
    CATEGORY_ID BIGINT NOT NULL
);  
ALTER TABLE SALESMANAGER.PRODUCT_CATEGORY ADD PRIMARY KEY(PRODUCT_ID, CATEGORY_ID);          
-- 10 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_CATEGORY;  
INSERT INTO SALESMANAGER.PRODUCT_CATEGORY VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 4),
(7, 1),
(8, 3),
(9, 2),
(10, 2);          
CREATE TABLE SALESMANAGER.PRODUCT_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    META_DESCRIPTION VARCHAR(255),
    META_KEYWORDS VARCHAR(255),
    META_TITLE VARCHAR(255),
    DOWNLOAD_LNK VARCHAR(255),
    PRODUCT_HIGHLIGHT VARCHAR(255),
    SEF_URL VARCHAR(255),
    LANGUAGE_ID INTEGER NOT NULL,
    PRODUCT_ID BIGINT NOT NULL
);    
ALTER TABLE SALESMANAGER.PRODUCT_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);  
-- 20 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_DESCRIPTION;               
INSERT INTO SALESMANAGER.PRODUCT_DESCRIPTION VALUES
(850, TIMESTAMP '2020-03-13 10:42:37.976', TIMESTAMP '2020-03-13 10:42:37.976', NULL, STRINGDECODE('<p>\r\n\tRetro style bag with leather stripe</p>\r\n'), 'Retro style bag', NULL, '', '', '', '', '', 'retro-style-bag', 1, 1),
(851, TIMESTAMP '2020-03-13 10:42:37.976', TIMESTAMP '2020-03-13 10:42:37.976', NULL, STRINGDECODE('<p>\r\n\tSac style retro avec banieres en cuir</p>\r\n'), 'Sac look retro', NULL, '', '', '', '', '', 'sac-look-retro', 2, 1),
(852, TIMESTAMP '2020-03-13 10:35:24.884', TIMESTAMP '2020-03-13 10:35:24.884', NULL, STRINGDECODE('<p>\r\n\tSac exotique de style vintage</p>\r\n'), 'Sac exotique style vintage', NULL, '', '', '', '', '', 'sac-exotique-style-vintage', 2, 2),
(853, TIMESTAMP '2020-03-13 10:35:24.884', TIMESTAMP '2020-03-13 10:35:24.884', NULL, STRINGDECODE('<p>\r\n\tVintage exotik carry bag</p>\r\n'), 'Vintage exotik carry bag', NULL, '', '', '', '', '', 'vintage-exotik-carry-bag', 1, 2),
(854, TIMESTAMP '2020-03-13 10:37:59.691', TIMESTAMP '2020-03-13 10:37:59.691', NULL, STRINGDECODE('<p>\r\n\tVintage handbag</p>\r\n'), 'Vintage bag', NULL, '', '', '', '', '', 'vintage-bag', 1, 3),
(855, TIMESTAMP '2020-03-13 10:37:59.691', TIMESTAMP '2020-03-13 10:37:59.691', NULL, STRINGDECODE('<p>\r\n\tSac vintage</p>\r\n'), 'Sac vintage', NULL, '', '', '', '', '', 'sac-vintage', 2, 3),
(856, TIMESTAMP '2020-03-13 10:34:02.081', TIMESTAMP '2020-03-13 10:34:02.081', NULL, STRINGDECODE('<p>\r\n\tChic vintage DeVille</p>\r\n'), 'Chic vintage DeVille', NULL, '', '', '', '', '', 'chic-vintage-deville', 1, 4),
(857, TIMESTAMP '2020-03-13 10:34:02.081', TIMESTAMP '2020-03-13 10:34:02.081', NULL, STRINGDECODE('<p>\r\n\tChic vintage DeVille</p>\r\n'), 'Chic vintage DeVille', NULL, '', '', '', '', '', 'chic-vintage-deville', 2, 4),
(858, TIMESTAMP '2020-03-13 10:37:12.54', TIMESTAMP '2020-03-13 10:37:12.54', NULL, STRINGDECODE('<p>\r\n\tMulti use hand bag vintage bag</p>\r\n'), 'Multi use hand bag', NULL, '', '', '', '', '', 'multi-use-hand-bag', 1, 5),
(859, TIMESTAMP '2020-03-13 10:37:12.54', TIMESTAMP '2020-03-13 10:37:12.54', NULL, STRINGDECODE('<p>\r\n\tSace tissu multi usge look vintage</p>\r\n'), 'Sace tissu multi usge', NULL, '', '', '', '', '', 'sace-tissu-multi-usge', 2, 5),
(860, TIMESTAMP '2020-03-13 10:42:11.382', TIMESTAMP '2020-03-13 10:42:11.382', NULL, STRINGDECODE('<p>\r\n\tSac vintage bandouilleres de cuir</p>\r\n'), 'Sac vintage bandouilleres de cuir', NULL, '', '', '', '', '', 'sac-vintage-bandouilleres-de-cuir', 2, 6),
(861, TIMESTAMP '2020-03-13 10:42:11.382', TIMESTAMP '2020-03-13 10:42:11.382', NULL, STRINGDECODE('<p>\r\n\tVintage bag with leather bands</p>\r\n'), 'Vintage bag with leather bands', NULL, '', '', '', '', '', 'vintage-bag-with-leather-bands', 1, 6),
(862, TIMESTAMP '2020-03-13 10:39:50.79', TIMESTAMP '2020-03-13 10:39:50.79', NULL, STRINGDECODE('<p>\r\n\tVintage beach bag</p>\r\n'), 'Vintage beach bag', NULL, '', '', '', '', '', 'vintage-beach-bag', 1, 7),
(863, TIMESTAMP '2020-03-13 10:39:50.79', TIMESTAMP '2020-03-13 10:39:50.79', NULL, STRINGDECODE('<p>\r\n\tSac de plage vintage</p>\r\n'), 'Sac de plage vintage', NULL, '', '', '', '', '', 'sac-de-plage-vintage', 2, 7),
(864, TIMESTAMP '2020-03-13 10:38:58.991', TIMESTAMP '2020-03-13 10:38:58.991', NULL, STRINGDECODE('<p>\r\n\tVintage laptop bag</p>\r\n'), 'Vintage laptop bag', NULL, '', '', '', '', '', 'vintage-laptop-bag', 1, 8),
(865, TIMESTAMP '2020-03-13 10:38:58.991', TIMESTAMP '2020-03-13 10:38:58.991', NULL, STRINGDECODE('<p>\r\n\tSac pour portable vintage</p>\r\n'), 'Sac pour portable vintage', NULL, '', '', '', '', '', 'sac-pour-portable-vintage', 2, 8),
(866, TIMESTAMP '2020-03-13 10:41:33.376', TIMESTAMP '2020-03-13 10:41:33.376', NULL, STRINGDECODE('<p>\r\n\tCoffre antique. Importation des Indes</p>\r\n'), 'Sac chic vintage', NULL, '', '', '', '', '', 'sac-chic-vintage', 2, 9),
(867, TIMESTAMP '2020-03-13 10:41:33.377', TIMESTAMP '2020-03-13 10:41:33.377', NULL, STRINGDECODE('<p>\r\n\tVintage chic handbag with leather bands</p>\r\n'), 'Vintage chic handbag', NULL, '', '', '', '', '', 'vintage-chic-handbag', 1, 9);    
INSERT INTO SALESMANAGER.PRODUCT_DESCRIPTION VALUES
(868, TIMESTAMP '2020-03-13 10:28:55.288', TIMESTAMP '2020-03-13 10:28:55.288', NULL, STRINGDECODE('<p>\r\n\tVintage courier bag</p>\r\n'), 'Vintage courier bag', NULL, '', '', '', '', '', 'vintage-courier-bag', 1, 10),
(869, TIMESTAMP '2020-03-13 10:28:55.288', TIMESTAMP '2020-03-13 10:28:55.288', NULL, STRINGDECODE('<p>\r\n\tSac vintage style courier</p>\r\n'), 'Sac vintage style courier', NULL, '', '', '', '', '', 'sac-vintage-style-courier', 2, 10);              
CREATE INDEX PRODUCT_DESCRIPTION_SEF_URL ON SALESMANAGER.PRODUCT_DESCRIPTION(SEF_URL);  
CREATE TABLE SALESMANAGER.PRODUCT_DIGITAL(
    PRODUCT_DIGITAL_ID BIGINT NOT NULL,
    FILE_NAME VARCHAR(255) NOT NULL,
    PRODUCT_ID BIGINT NOT NULL
);     
ALTER TABLE SALESMANAGER.PRODUCT_DIGITAL ADD PRIMARY KEY(PRODUCT_DIGITAL_ID); 
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_DIGITAL;    
CREATE TABLE SALESMANAGER.PRODUCT_IMAGE(
    PRODUCT_IMAGE_ID BIGINT NOT NULL,
    DEFAULT_IMAGE BOOLEAN,
    IMAGE_CROP BOOLEAN,
    IMAGE_TYPE INTEGER,
    PRODUCT_IMAGE VARCHAR(255),
    PRODUCT_IMAGE_URL VARCHAR(255),
    PRODUCT_ID BIGINT NOT NULL
);       
ALTER TABLE SALESMANAGER.PRODUCT_IMAGE ADD PRIMARY KEY(PRODUCT_IMAGE_ID);      
-- 12 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_IMAGE;     
INSERT INTO SALESMANAGER.PRODUCT_IMAGE VALUES
(100, TRUE, FALSE, 0, 'image2.jpg', NULL, 10),
(101, TRUE, FALSE, 0, 'image9.jpg', NULL, 4),
(102, TRUE, FALSE, 0, 'image1.jpg', NULL, 2),
(103, FALSE, FALSE, 0, 'image4.jpg', NULL, 2),
(104, TRUE, FALSE, 0, 'image7.jpg', NULL, 5),
(105, TRUE, FALSE, 0, 'image4.1.jpg', NULL, 3),
(106, FALSE, FALSE, 0, 'image4.jpg', NULL, 3),
(107, TRUE, FALSE, 0, 'image6.jpg', NULL, 8),
(108, TRUE, FALSE, 0, 'image8.jpg', NULL, 7),
(110, TRUE, FALSE, 0, 'image11.jpg', NULL, 9),
(111, TRUE, FALSE, 0, 'image5.jpg', NULL, 6),
(112, TRUE, FALSE, 0, 'image3.jpg', NULL, 1);
CREATE TABLE SALESMANAGER.PRODUCT_IMAGE_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    ALT_TAG VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    PRODUCT_IMAGE_ID BIGINT NOT NULL
);     
ALTER TABLE SALESMANAGER.PRODUCT_IMAGE_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);             
-- 20 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_IMAGE_DESCRIPTION;         
INSERT INTO SALESMANAGER.PRODUCT_IMAGE_DESCRIPTION VALUES
(1050, TIMESTAMP '2020-03-13 10:28:55.523', TIMESTAMP '2020-03-13 10:28:55.523', NULL, NULL, 'image2.jpg', NULL, NULL, 1, 100),
(1051, TIMESTAMP '2020-03-13 10:28:55.524', TIMESTAMP '2020-03-13 10:28:55.524', NULL, NULL, 'image2.jpg', NULL, NULL, 2, 100),
(1052, TIMESTAMP '2020-03-13 10:34:02.212', TIMESTAMP '2020-03-13 10:34:02.212', NULL, NULL, 'image9.jpg', NULL, NULL, 1, 101),
(1053, TIMESTAMP '2020-03-13 10:34:02.213', TIMESTAMP '2020-03-13 10:34:02.213', NULL, NULL, 'image9.jpg', NULL, NULL, 2, 101),
(1054, TIMESTAMP '2020-03-13 10:35:24.94', TIMESTAMP '2020-03-13 10:35:24.94', NULL, NULL, 'image1.jpg', NULL, NULL, 1, 102),
(1055, TIMESTAMP '2020-03-13 10:35:24.94', TIMESTAMP '2020-03-13 10:35:24.94', NULL, NULL, 'image1.jpg', NULL, NULL, 2, 102),
(1056, TIMESTAMP '2020-03-13 10:37:12.683', TIMESTAMP '2020-03-13 10:37:12.683', NULL, NULL, 'image7.jpg', NULL, NULL, 1, 104),
(1057, TIMESTAMP '2020-03-13 10:37:12.684', TIMESTAMP '2020-03-13 10:37:12.684', NULL, NULL, 'image7.jpg', NULL, NULL, 2, 104),
(1058, TIMESTAMP '2020-03-13 10:37:59.875', TIMESTAMP '2020-03-13 10:37:59.875', NULL, NULL, 'image4.1.jpg', NULL, NULL, 1, 105),
(1059, TIMESTAMP '2020-03-13 10:37:59.876', TIMESTAMP '2020-03-13 10:37:59.876', NULL, NULL, 'image4.1.jpg', NULL, NULL, 2, 105),
(1060, TIMESTAMP '2020-03-13 10:38:59.045', TIMESTAMP '2020-03-13 10:38:59.045', NULL, NULL, 'image6.jpg', NULL, NULL, 1, 107),
(1061, TIMESTAMP '2020-03-13 10:38:59.045', TIMESTAMP '2020-03-13 10:38:59.045', NULL, NULL, 'image6.jpg', NULL, NULL, 2, 107),
(1062, TIMESTAMP '2020-03-13 10:39:50.84', TIMESTAMP '2020-03-13 10:39:50.84', NULL, NULL, 'image8.jpg', NULL, NULL, 1, 108),
(1063, TIMESTAMP '2020-03-13 10:39:50.841', TIMESTAMP '2020-03-13 10:39:50.841', NULL, NULL, 'image8.jpg', NULL, NULL, 2, 108),
(1066, TIMESTAMP '2020-03-13 10:41:33.437', TIMESTAMP '2020-03-13 10:41:33.437', NULL, NULL, 'image11.jpg', NULL, NULL, 1, 110),
(1067, TIMESTAMP '2020-03-13 10:41:33.437', TIMESTAMP '2020-03-13 10:41:33.437', NULL, NULL, 'image11.jpg', NULL, NULL, 2, 110),
(1068, TIMESTAMP '2020-03-13 10:42:11.437', TIMESTAMP '2020-03-13 10:42:11.437', NULL, NULL, 'image5.jpg', NULL, NULL, 1, 111),
(1069, TIMESTAMP '2020-03-13 10:42:11.437', TIMESTAMP '2020-03-13 10:42:11.437', NULL, NULL, 'image5.jpg', NULL, NULL, 2, 111),
(1070, TIMESTAMP '2020-03-13 10:42:38.027', TIMESTAMP '2020-03-13 10:42:38.027', NULL, NULL, 'image3.jpg', NULL, NULL, 1, 112),
(1071, TIMESTAMP '2020-03-13 10:42:38.027', TIMESTAMP '2020-03-13 10:42:38.027', NULL, NULL, 'image3.jpg', NULL, NULL, 2, 112);  
CREATE TABLE SALESMANAGER.PRODUCT_OPTION(
    PRODUCT_OPTION_ID BIGINT NOT NULL,
    PRODUCT_OPTION_CODE VARCHAR(255),
    PRODUCT_OPTION_SORT_ORD INTEGER,
    PRODUCT_OPTION_TYPE VARCHAR(10),
    PRODUCT_OPTION_READ BOOLEAN,
    MERCHANT_ID INTEGER NOT NULL
);   
ALTER TABLE SALESMANAGER.PRODUCT_OPTION ADD PRIMARY KEY(PRODUCT_OPTION_ID);   
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_OPTION;     
CREATE INDEX PRD_OPTION_CODE_IDX ON SALESMANAGER.PRODUCT_OPTION(PRODUCT_OPTION_CODE);   
CREATE TABLE SALESMANAGER.PRODUCT_OPTION_DESC(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    PRODUCT_OPTION_COMMENT TEXT,
    LANGUAGE_ID INTEGER NOT NULL,
    PRODUCT_OPTION_ID BIGINT NOT NULL
);    
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_DESC ADD PRIMARY KEY(DESCRIPTION_ID);  
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_OPTION_DESC;
CREATE TABLE SALESMANAGER.PRODUCT_OPTION_VALUE(
    PRODUCT_OPTION_VALUE_ID BIGINT NOT NULL,
    PRODUCT_OPTION_VAL_CODE VARCHAR(255),
    PRODUCT_OPT_FOR_DISP BOOLEAN,
    PRODUCT_OPT_VAL_IMAGE VARCHAR(255),
    PRODUCT_OPT_VAL_SORT_ORD INTEGER,
    MERCHANT_ID INTEGER NOT NULL
);              
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_VALUE ADD PRIMARY KEY(PRODUCT_OPTION_VALUE_ID);       
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_OPTION_VALUE;               
CREATE INDEX PRD_OPTION_VAL_CODE_IDX ON SALESMANAGER.PRODUCT_OPTION_VALUE(PRODUCT_OPTION_VAL_CODE);     
CREATE TABLE SALESMANAGER.PRODUCT_OPTION_VALUE_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    PRODUCT_OPTION_VALUE_ID BIGINT
);            
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_VALUE_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);     
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_OPTION_VALUE_DESCRIPTION;   
CREATE TABLE SALESMANAGER.PRODUCT_PRICE(
    PRODUCT_PRICE_ID BIGINT NOT NULL,
    PRODUCT_PRICE_CODE VARCHAR(255) NOT NULL,
    DEFAULT_PRICE BOOLEAN,
    PRODUCT_PRICE_AMOUNT DECIMAL(19, 2) NOT NULL,
    PRODUCT_PRICE_SPECIAL_AMOUNT DECIMAL(19, 2),
    PRODUCT_PRICE_SPECIAL_END_DATE DATE,
    PRODUCT_PRICE_SPECIAL_ST_DATE DATE,
    PRODUCT_PRICE_TYPE VARCHAR(20),
    PRODUCT_AVAIL_ID BIGINT NOT NULL
);           
ALTER TABLE SALESMANAGER.PRODUCT_PRICE ADD PRIMARY KEY(PRODUCT_PRICE_ID);     
-- 10 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_PRICE;     
INSERT INTO SALESMANAGER.PRODUCT_PRICE VALUES
(1, 'base', TRUE, 48.00, NULL, NULL, NULL, 'ONE_TIME', 1),
(2, 'base', TRUE, 62.00, NULL, NULL, NULL, 'ONE_TIME', 2),
(3, 'base', TRUE, 69.00, NULL, NULL, NULL, 'ONE_TIME', 3),
(4, 'base', TRUE, 88.00, 60.00, NULL, NULL, 'ONE_TIME', 4),
(5, 'base', TRUE, 65.00, 49.00, NULL, NULL, 'ONE_TIME', 5),
(6, 'base', TRUE, 68.00, NULL, NULL, NULL, 'ONE_TIME', 6),
(7, 'base', TRUE, 60.00, NULL, NULL, NULL, 'ONE_TIME', 7),
(8, 'base', TRUE, 78.00, NULL, NULL, NULL, 'ONE_TIME', 8),
(9, 'base', TRUE, 82.00, 74.00, NULL, NULL, 'ONE_TIME', 9),
(10, 'base', TRUE, 60.00, NULL, NULL, NULL, 'ONE_TIME', 10);           
CREATE TABLE SALESMANAGER.PRODUCT_VARIANT(
    PRODUCT_VARIANT_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(60),
    PRODUCT_AQUANTITY INTEGER,
    PRODUCT_ATTRIBUTE_ID BIGINT NOT NULL,
    PRODUCT_AVAIL_ID BIGINT NOT NULL
); 
ALTER TABLE SALESMANAGER.PRODUCT_VARIANT ADD PRIMARY KEY(PRODUCT_VARIANT_ID);  
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_VARIANT;    
CREATE TABLE SALESMANAGER.PRODUCT_RELATIONSHIP(
    PRODUCT_RELATIONSHIP_ID BIGINT NOT NULL,
    ACTIVE BOOLEAN,
    CODE VARCHAR(255),
    PRODUCT_ID BIGINT,
    RELATED_PRODUCT_ID BIGINT,
    MERCHANT_ID INTEGER NOT NULL
);       
ALTER TABLE SALESMANAGER.PRODUCT_RELATIONSHIP ADD PRIMARY KEY(PRODUCT_RELATIONSHIP_ID);        
-- 4 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_RELATIONSHIP;               
INSERT INTO SALESMANAGER.PRODUCT_RELATIONSHIP VALUES
(1, TRUE, 'FEATURED_ITEM', NULL, 4, 1),
(2, TRUE, 'FEATURED_ITEM', NULL, 7, 1),
(3, TRUE, 'FEATURED_ITEM', NULL, 1, 1),
(5, TRUE, 'FEATURED_ITEM', NULL, 8, 1);       
CREATE TABLE SALESMANAGER.PRODUCT_REVIEW(
    PRODUCT_REVIEW_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    REVIEW_DATE TIMESTAMP,
    REVIEWS_RATING DOUBLE,
    REVIEWS_READ BIGINT,
    STATUS INTEGER,
    CUSTOMERS_ID BIGINT,
    PRODUCT_ID BIGINT
);         
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW ADD PRIMARY KEY(PRODUCT_REVIEW_ID);    
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_REVIEW;     
CREATE TABLE SALESMANAGER.PRODUCT_REVIEW_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    PRODUCT_REVIEW_ID BIGINT
);        
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);           
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_REVIEW_DESCRIPTION;         
CREATE TABLE SALESMANAGER.PRODUCT_TYPE_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    PRODUCT_TYPE_ID BIGINT NOT NULL
);   
ALTER TABLE SALESMANAGER.PRODUCT_TYPE_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);             
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_TYPE_DESCRIPTION;           
CREATE TABLE SALESMANAGER.SHIPING_ORIGIN(
    SHIP_ORIGIN_ID BIGINT NOT NULL,
    ACTIVE BOOLEAN,
    STREET_ADDRESS VARCHAR(256),
    CITY VARCHAR(100),
    POSTCODE VARCHAR(20),
    STATE VARCHAR(100),
    COUNTRY_ID INTEGER,
    MERCHANT_ID INTEGER NOT NULL,
    ZONE_ID BIGINT
);       
ALTER TABLE SALESMANAGER.SHIPING_ORIGIN ADD PRIMARY KEY(SHIP_ORIGIN_ID);       
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.SHIPING_ORIGIN;     
CREATE TABLE SALESMANAGER.SHOPPING_CART(
    SHP_CART_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CUSTOMER_ID BIGINT,
    SHP_CART_CODE VARCHAR(255) NOT NULL,
    MERCHANT_ID INTEGER NOT NULL,
    IP_ADDRESS VARCHAR(255),
    ORDER_ID BIGINT,
    PROMO_ADDED TIMESTAMP,
    PROMO_CODE VARCHAR(255)
);    
ALTER TABLE SALESMANAGER.SHOPPING_CART ADD PRIMARY KEY(SHP_CART_ID);           
-- 11 +/- SELECT COUNT(*) FROM SALESMANAGER.SHOPPING_CART;     
INSERT INTO SALESMANAGER.SHOPPING_CART VALUES
(50, TIMESTAMP '2019-12-23 13:57:08.613', TIMESTAMP '2019-12-23 13:57:08.613', NULL, NULL, '6a7c6c183a6646f18cb8fa2be9400970', 1, NULL, NULL, NULL, NULL),
(150, TIMESTAMP '2020-09-01 08:23:25.158', TIMESTAMP '2020-09-01 08:25:26.221', NULL, NULL, '5fdf4a8203b541ccbbdb73f66a182666', 1, '0:0:0:0:0:0:0:1', 50, NULL, NULL),
(151, TIMESTAMP '2020-09-01 08:25:42.248', TIMESTAMP '2020-09-01 08:26:50.428', NULL, NULL, '72a17875d1544dfc93e0c87d9590c93c', 1, '0:0:0:0:0:0:0:1', 51, NULL, NULL),
(152, TIMESTAMP '2020-09-01 08:27:04.359', TIMESTAMP '2020-09-01 08:27:04.364', NULL, NULL, '4be4b45c5b204172bc80035a0486478c', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL),
(200, TIMESTAMP '2020-09-29 19:18:37.096', TIMESTAMP '2020-09-29 19:18:37.147', NULL, NULL, 'd8fdc8e099ed4d1d928e9da4d2bca460', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL),
(250, TIMESTAMP '2020-12-01 13:44:46.961', TIMESTAMP '2020-12-01 13:44:47.013', NULL, NULL, 'c900e95addda471ea5c333f33e9c0c37', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL),
(300, TIMESTAMP '2021-01-14 16:56:58.457', TIMESTAMP '2021-01-14 16:56:58.555', NULL, NULL, '1f398c31814d432db8dfa5ed27d4461b', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL),
(350, TIMESTAMP '2021-02-06 21:13:35.518', TIMESTAMP '2021-02-06 21:13:35.566', NULL, NULL, 'f7c1b5bfc611422293959e9761552ccb', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL),
(400, TIMESTAMP '2021-02-06 21:22:10.165', TIMESTAMP '2021-02-06 21:22:10.251', NULL, NULL, '49f6cb45c2104bd5a05fc3939445aafb', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL),
(450, TIMESTAMP '2021-02-09 20:58:40.021', TIMESTAMP '2021-02-09 20:58:40.101', NULL, NULL, '632dd71b46a64dd9a41d92deff95eb47', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL),
(500, TIMESTAMP '2021-02-11 09:54:42.903', TIMESTAMP '2021-02-11 09:54:42.998', NULL, NULL, '19607554468f4f05831e19cd4d1d6713', 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL);             
CREATE INDEX SHP_CART_CODE_IDX ON SALESMANAGER.SHOPPING_CART(SHP_CART_CODE);            
CREATE INDEX SHP_CART_CUSTOMER_IDX ON SALESMANAGER.SHOPPING_CART(CUSTOMER_ID);          
CREATE TABLE SALESMANAGER.SHOPPING_CART_ATTR_ITEM(
    SHP_CART_ATTR_ITEM_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    PRODUCT_ATTR_ID BIGINT NOT NULL,
    SHP_CART_ITEM_ID BIGINT NOT NULL
);            
ALTER TABLE SALESMANAGER.SHOPPING_CART_ATTR_ITEM ADD PRIMARY KEY(SHP_CART_ATTR_ITEM_ID);       
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.SHOPPING_CART_ATTR_ITEM;            
CREATE TABLE SALESMANAGER.SHOPPING_CART_ITEM(
    SHP_CART_ITEM_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    PRODUCT_ID BIGINT NOT NULL,
    QUANTITY INTEGER,
    SHP_CART_ID BIGINT NOT NULL
);        
ALTER TABLE SALESMANAGER.SHOPPING_CART_ITEM ADD PRIMARY KEY(SHP_CART_ITEM_ID); 
-- 10 +/- SELECT COUNT(*) FROM SALESMANAGER.SHOPPING_CART_ITEM;
INSERT INTO SALESMANAGER.SHOPPING_CART_ITEM VALUES
(50, TIMESTAMP '2019-12-23 13:57:08.662', TIMESTAMP '2019-12-23 13:57:08.662', NULL, 4, 1, 50),
(150, TIMESTAMP '2020-09-01 08:23:25.237', TIMESTAMP '2020-09-01 08:23:25.237', NULL, 4, 1, 150),
(151, TIMESTAMP '2020-09-01 08:25:42.255', TIMESTAMP '2020-09-01 08:25:42.255', NULL, 8, 1, 151),
(152, TIMESTAMP '2020-09-01 08:27:04.363', TIMESTAMP '2020-09-01 08:27:04.363', NULL, 2, 1, 152),
(200, TIMESTAMP '2020-09-29 19:18:37.146', TIMESTAMP '2020-09-29 19:18:37.146', NULL, 1, 1, 200),
(250, TIMESTAMP '2020-12-01 13:44:47.011', TIMESTAMP '2020-12-01 13:44:47.011', NULL, 4, 1, 250),
(300, TIMESTAMP '2021-01-14 16:56:58.553', TIMESTAMP '2021-01-14 16:56:58.553', NULL, 4, 1, 300),
(350, TIMESTAMP '2021-02-06 21:13:35.563', TIMESTAMP '2021-02-06 21:13:35.563', NULL, 10, 1, 350),
(450, TIMESTAMP '2021-02-09 20:58:40.04', TIMESTAMP '2021-02-09 20:58:40.04', NULL, 10, 1, 450),
(500, TIMESTAMP '2021-02-11 09:54:42.925', TIMESTAMP '2021-02-11 09:54:42.925', NULL, 7, 1, 500);       
CREATE TABLE SALESMANAGER.SM_GROUP(
    GROUP_ID INTEGER NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    GROUP_NAME VARCHAR(255),
    GROUP_TYPE VARCHAR(255)
);        
ALTER TABLE SALESMANAGER.SM_GROUP ADD PRIMARY KEY(GROUP_ID);   
-- 7 +/- SELECT COUNT(*) FROM SALESMANAGER.SM_GROUP;           
INSERT INTO SALESMANAGER.SM_GROUP VALUES
(1, TIMESTAMP '2019-03-06 19:55:21.407', TIMESTAMP '2019-03-06 19:55:21.407', NULL, 'SUPERADMIN', 'ADMIN'),
(2, TIMESTAMP '2019-03-06 19:55:21.414', TIMESTAMP '2019-03-06 19:55:21.414', NULL, 'ADMIN', 'ADMIN'),
(3, TIMESTAMP '2019-03-06 19:55:21.43', TIMESTAMP '2019-03-06 19:55:21.43', NULL, 'ADMIN_CATALOGUE', 'ADMIN'),
(4, TIMESTAMP '2019-03-06 19:55:21.432', TIMESTAMP '2019-03-06 19:55:21.432', NULL, 'ADMIN_STORE', 'ADMIN'),
(5, TIMESTAMP '2019-03-06 19:55:21.436', TIMESTAMP '2019-03-06 19:55:21.436', NULL, 'ADMIN_ORDER', 'ADMIN'),
(6, TIMESTAMP '2019-03-06 19:55:21.449', TIMESTAMP '2019-03-06 19:55:21.449', NULL, 'ADMIN_CONTENT', 'ADMIN'),
(7, TIMESTAMP '2019-03-06 19:55:21.47', TIMESTAMP '2019-03-06 19:55:21.47', NULL, 'CUSTOMER', 'ADMIN');
CREATE INDEX SM_GROUP_GROUP_TYPE ON SALESMANAGER.SM_GROUP(GROUP_TYPE);  
CREATE TABLE SALESMANAGER.SM_SEQUENCER(
    SEQ_NAME VARCHAR(255) NOT NULL,
    SEQ_COUNT BIGINT
);             
ALTER TABLE SALESMANAGER.SM_SEQUENCER ADD PRIMARY KEY(SEQ_NAME);              
-- 31 +/- SELECT COUNT(*) FROM SALESMANAGER.SM_SEQUENCER;      
INSERT INTO SALESMANAGER.SM_SEQUENCER VALUES
('LANG_SEQ_NEXT_VAL', 1),
('COUNTRY_SEQ_NEXT_VAL', 2),
('ZONE_SEQ_NEXT_VAL', 4),
('CURRENCY_SEQ_NEXT_VAL', 4),
('PRD_TYPE_SEQ_NEXT_VAL', 1),
('MOD_CONF_SEQ_NEXT_VAL', 1),
('STORE_SEQ_NEXT_VAL', 1),
('TX_CLASS_SEQ_NEXT_VAL', 1),
('GROUP_SEQ_NEXT_VAL', 1),
('PERMISSION_SEQ_NEXT_VAL', 1),
('USER_SEQ_NEXT_VAL', 2),
('CONTENT_SEQ_NEXT_VAL', 2),
('MERCH_CONF_SEQ_NEXT_VAL', 2),
('CATEGORY_SEQ_NEXT_VAL', 1),
('MANUFACT_SEQ_NEXT_VAL', 2),
('PRODUCT_SEQ_NEXT_VAL', 1),
('PRODUCT_AVAIL_SEQ_NEXT_VAL', 1),
('PRODUCT_PRICE_SEQ_NEXT_VAL', 1),
('PRODUCT_IMG_SEQ_NEXT_VAL', 3),
('SHP_CRT_SEQ_NEXT_VAL', 11),
('SHP_CRT_ITM_SEQ_NEXT_VAL', 11),
('SHIP_QUOTE_ID_NEXT_VALUE', 8),
('PRODUCT_RELATION_SEQ_NEXT_VAL', 1),
('CUSTOMER_SEQ_NEXT_VAL', 2),
('TRANSACT_SEQ_NEXT_VAL', 2),
('ORDER_ID_SEQ_NEXT_VAL', 2),
('STATUS_HIST_ID_NEXT_VALUE', 2),
('ORDER_PRODUCT_ID_NEXT_VALUE', 2),
('ORDER_PRD_PRICE_ID_NEXT_VAL', 2),
('ORDER_TOTAL_ID_NEXT_VALUE', 2),
('DESCRIPTION_SEQ_NEXT_VAL', 22);          
CREATE TABLE SALESMANAGER.SM_TRANSACTION(
    TRANSACTION_ID BIGINT NOT NULL,
    AMOUNT DECIMAL(19, 2),
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DETAILS TEXT,
    PAYMENT_TYPE VARCHAR(255),
    TRANSACTION_DATE TIMESTAMP,
    TRANSACTION_TYPE VARCHAR(255),
    ORDER_ID BIGINT
);            
ALTER TABLE SALESMANAGER.SM_TRANSACTION ADD PRIMARY KEY(TRANSACTION_ID);       
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.SM_TRANSACTION;     
INSERT INTO SALESMANAGER.SM_TRANSACTION VALUES
(1, 63.00, TIMESTAMP '2019-03-06 22:21:14.93', TIMESTAMP '2019-03-06 22:21:14.942', NULL, NULL, 'MONEYORDER', TIMESTAMP '2019-03-06 22:21:14.919', 'AUTHORIZECAPTURE', 1),
(50, 74.00, TIMESTAMP '2020-09-01 08:25:26.162', TIMESTAMP '2020-09-01 08:25:26.177', NULL, NULL, 'MONEYORDER', TIMESTAMP '2020-09-01 08:25:26.149', 'AUTHORIZECAPTURE', 50),
(51, 92.00, TIMESTAMP '2020-09-01 08:26:50.391', TIMESTAMP '2020-09-01 08:26:50.402', NULL, NULL, 'MONEYORDER', TIMESTAMP '2020-09-01 08:26:50.391', 'AUTHORIZECAPTURE', 51);      
CREATE TABLE SALESMANAGER.SYSTEM_CONFIGURATION(
    SYSTEM_CONFIG_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CONFIG_KEY VARCHAR(255),
    VALUE VARCHAR(255)
);          
ALTER TABLE SALESMANAGER.SYSTEM_CONFIGURATION ADD PRIMARY KEY(SYSTEM_CONFIG_ID);               
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.SYSTEM_CONFIGURATION;               
CREATE TABLE SALESMANAGER.SYSTEM_NOTIFICATION(
    SYSTEM_NOTIF_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    END_DATE DATE,
    CONFIG_KEY VARCHAR(255),
    START_DATE DATE,
    VALUE VARCHAR(255),
    MERCHANT_ID INTEGER,
    USER_ID BIGINT
);               
ALTER TABLE SALESMANAGER.SYSTEM_NOTIFICATION ADD PRIMARY KEY(SYSTEM_NOTIF_ID); 
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.SYSTEM_NOTIFICATION;
CREATE TABLE SALESMANAGER.TAX_CLASS(
    TAX_CLASS_ID BIGINT NOT NULL,
    TAX_CLASS_CODE VARCHAR(10) NOT NULL,
    TAX_CLASS_TITLE VARCHAR(32) NOT NULL,
    MERCHANT_ID INTEGER
);        
ALTER TABLE SALESMANAGER.TAX_CLASS ADD PRIMARY KEY(TAX_CLASS_ID);             
-- 1 +/- SELECT COUNT(*) FROM SALESMANAGER.TAX_CLASS;          
INSERT INTO SALESMANAGER.TAX_CLASS VALUES
(1, 'DEFAULT', 'DEFAULT', 1);    
CREATE INDEX TAX_CLASS_CODE_IDX ON SALESMANAGER.TAX_CLASS(TAX_CLASS_CODE);              
CREATE TABLE SALESMANAGER.TAX_RATE(
    TAX_RATE_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    TAX_CODE VARCHAR(255),
    PIGGYBACK BOOLEAN,
    STORE_STATE_PROV VARCHAR(100),
    TAX_PRIORITY INTEGER,
    TAX_RATE DECIMAL(7, 4) NOT NULL,
    COUNTRY_ID INTEGER NOT NULL,
    MERCHANT_ID INTEGER NOT NULL,
    PARENT_ID BIGINT,
    TAX_CLASS_ID BIGINT NOT NULL,
    ZONE_ID BIGINT
);             
ALTER TABLE SALESMANAGER.TAX_RATE ADD PRIMARY KEY(TAX_RATE_ID);
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.TAX_RATE;           
CREATE TABLE SALESMANAGER.TAX_RATE_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    TAX_RATE_ID BIGINT
);    
ALTER TABLE SALESMANAGER.TAX_RATE_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID); 
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.TAX_RATE_DESCRIPTION;               
CREATE TABLE SALESMANAGER.USERS(
    USER_ID BIGINT NOT NULL,
    ACTIVE BOOLEAN,
    ADMIN_EMAIL VARCHAR(255),
    ADMIN_NAME VARCHAR(100),
    ADMIN_PASSWORD VARCHAR(60),
    ADMIN_A1 VARCHAR(255),
    ADMIN_A2 VARCHAR(255),
    ADMIN_A3 VARCHAR(255),
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    ADMIN_FIRST_NAME VARCHAR(255),
    LAST_ACCESS TIMESTAMP,
    ADMIN_LAST_NAME VARCHAR(255),
    LOGIN_ACCESS TIMESTAMP,
    ADMIN_Q1 VARCHAR(255),
    ADMIN_Q2 VARCHAR(255),
    ADMIN_Q3 VARCHAR(255),
    LANGUAGE_ID INTEGER,
    MERCHANT_ID INTEGER NOT NULL,
    PASSWORD_TOKEN VARCHAR(255),
    EXPIRED_P_TOKEN TIMESTAMP,
    RESET_CREDENTIALS_REQ VARCHAR(256),
    RESET_CREDENTIALS_EXP DATE
);   
ALTER TABLE SALESMANAGER.USERS ADD PRIMARY KEY(USER_ID);       
-- 2 +/- SELECT COUNT(*) FROM SALESMANAGER.USERS;              
INSERT INTO SALESMANAGER.USERS VALUES
(1, TRUE, 'admin@shopizer.com', 'admin@shopizer.com', '$2a$11$1.PxSb9XDizgHY1p.bj7luahY1ltOKrj/O9sWAell9LSyTQuCAb8.', NULL, NULL, NULL, TIMESTAMP '2019-03-06 19:55:21.639', TIMESTAMP '2021-02-13 16:33:37.447', NULL, 'Administrator', TIMESTAMP '2021-02-06 21:12:28.056', 'User', TIMESTAMP '2021-02-13 16:33:37.402', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(50, TRUE, 'testuser@test.com', 'testuser', '$2a$10$PguuLek3Z3ZqW1vB1Irp7uL1dV9GJcZUCTKbfhhOT6vKrQC4sdojC', 'blue', 'matane', 'max', TIMESTAMP '2020-10-30 11:30:03.099', TIMESTAMP '2020-10-30 11:30:03.099', NULL, 'Test', NULL, 'User', NULL, 'What was the color of your first car?', 'In what city were you born?', 'What was the name of your first pet?', 1, 1, NULL, NULL, NULL, NULL);       
CREATE TABLE SALESMANAGER.USER_GROUP(
    USER_ID BIGINT NOT NULL,
    GROUP_ID INTEGER NOT NULL
);             
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.USER_GROUP;         
INSERT INTO SALESMANAGER.USER_GROUP VALUES
(1, 2),
(1, 1),
(50, 2);        
CREATE TABLE SALESMANAGER.ZONE(
    ZONE_ID BIGINT NOT NULL,
    ZONE_CODE VARCHAR(255) NOT NULL,
    COUNTRY_ID INTEGER NOT NULL
);          
ALTER TABLE SALESMANAGER.ZONE ADD PRIMARY KEY(ZONE_ID);        
-- 189 +/- SELECT COUNT(*) FROM SALESMANAGER.ZONE;             
INSERT INTO SALESMANAGER.ZONE VALUES
(1, 'Guipuzcoa', 79),
(2, 'HI', 91),
(3, 'PR', 91),
(4, 'Zamora', 79),
(5, 'Vizcaya', 79),
(6, 'Albacete', 79),
(7, 'Lleida', 79),
(8, 'QC', 13),
(9, 'NRW', 30),
(10, 'IA', 91),
(11, 'ID', 91),
(12, 'YT', 13),
(13, 'Leon', 79),
(14, 'ACorua', 79),
(15, 'Castellon', 79),
(16, 'LasPalmas', 79),
(17, 'Pontevedra', 79),
(18, 'AA', 91),
(19, 'Teruel', 79),
(20, 'AB', 13),
(21, 'AC', 91),
(22, 'IL', 91),
(23, 'AE', 91),
(24, 'AF', 91),
(25, 'IN', 91),
(26, 'AG', 82),
(27, 'A Corua', 79),
(28, 'AI', 82),
(29, 'AK', 91),
(30, 'Caceres', 79),
(31, 'Segovia', 79),
(32, 'AL', 91),
(33, 'AM', 91),
(34, 'ZG', 82),
(35, 'Malaga', 79),
(36, 'ZH', 82),
(37, 'LaRioja', 79),
(38, 'AP', 91),
(39, 'Melilla', 79),
(40, 'AR', 91),
(41, 'AS', 91),
(42, 'NSW', 4),
(43, 'Madrid', 79),
(44, 'RI', 91),
(45, 'AZ', 91),
(46, 'Ceuta', 79),
(47, 'BC', 13),
(48, 'Huelva', 79),
(49, 'BE', 82),
(50, 'Huesca', 79),
(51, 'ARCH', 82),
(52, 'BL', 82),
(53, 'JU', 82),
(54, 'Asturias', 79),
(55, 'SA', 4),
(56, 'SB', 5),
(57, 'TIAT', 5),
(58, 'SC', 91),
(59, 'THE', 30),
(60, 'SD', 91),
(61, 'BS', 82),
(62, 'Cordoba', 79),
(63, 'Tarragona', 79),
(64, 'Valladolid', 79),
(65, 'SG', 82),
(66, 'SH', 82),
(67, 'WAAU', 4),
(68, 'SK', 13),
(69, 'NDS', 30),
(70, 'SO', 82),
(71, 'CA', 91),
(72, 'NTAU', 4),
(73, 'ST', 5),
(74, 'KN', 5),
(75, 'Jaen', 79),
(76, 'CiudadReal', 79),
(77, 'SZ', 82),
(78, 'Alava', 79),
(79, 'KS', 91),
(80, 'CO', 91),
(81, 'KY', 91),
(82, 'BER', 30),
(83, 'CT', 91),
(84, 'ACT', 4),
(85, 'TG', 82),
(86, 'LA', 91),
(87, 'HAM', 30),
(88, 'TI', 82),
(89, 'Lugo', 79),
(90, 'NECH', 82),
(91, 'TN', 91),
(92, 'Toledo', 79),
(93, 'DC', 91),
(94, 'Palencia', 79),
(95, 'DE', 91),
(96, 'TX', 91),
(97, 'TAS', 4),
(98, 'QLD', 4),
(99, 'LU', 82),
(100, 'Burgos', 79),
(101, 'Cadiz', 79),
(102, 'SantaCruzdeTenerife', 79),
(103, 'MA', 91),
(104, 'MB', 13),
(105, 'MD', 91),
(106, 'Girona', 79),
(107, 'ME', 91),
(108, 'Alicante', 79),
(109, 'Guadalajara', 79),
(110, 'Cantabria', 79),
(111, 'MH', 91),
(112, 'MI', 91),
(113, 'UR', 82),
(114, 'UT', 91),
(115, 'MN', 91),
(116, 'MO', 91),
(117, 'MP', 91),
(118, 'Barcelona', 79),
(119, 'MS', 91),
(120, 'MT', 91),
(121, 'Badajoz', 79),
(122, 'MEC', 30),
(123, 'VA', 91),
(124, 'VB', 5),
(125, 'Cuenca', 79),
(126, 'WIAT', 5),
(127, 'VD', 82),
(128, 'Sevilla', 79),
(129, 'VI', 91),
(130, 'Zaragoza', 79),
(131, 'NB', 13),
(132, 'SAC', 30),
(133, 'NC', 91),
(134, 'ND', 91),
(135, 'NE', 91),
(136, 'NF', 13),
(137, 'NH', 91),
(138, 'NJ', 91),
(139, 'VS', 82),
(140, 'VT', 91),
(141, 'NM', 91),
(142, 'NO', 5),
(143, 'SAS', 30),
(144, 'NS', 13),
(145, 'SAR', 30),
(146, 'FL', 91),
(147, 'NT', 13),
(148, 'FM', 91),
(149, 'NU', 13),
(150, 'NV', 91),
(151, 'NW', 82),
(152, 'WA', 91),
(153, 'NY', 91),
(154, 'Granada', 79),
(155, 'Soria', 79),
(156, 'FR', 82),
(157, 'RHE', 30),
(158, 'Ourense', 79),
(159, 'WI', 91),
(160, 'OH', 91),
(161, 'GA', 91),
(162, 'Murcia', 79),
(163, 'OK', 91),
(164, 'GE', 82),
(165, 'WV', 91),
(166, 'ON', 13),
(167, 'OO', 5),
(168, 'WY', 91),
(169, 'BLAT', 5),
(170, 'Avila', 79),
(171, 'OR', 91),
(172, 'Salamanca', 79),
(173, 'GL', 82),
(174, 'Baleares', 79),
(175, 'OW', 82),
(176, 'GR', 82),
(177, 'GU', 91),
(178, 'PA', 91),
(179, 'VIC', 4),
(180, 'BRE', 30),
(181, 'PE', 13),
(182, 'BRG', 30),
(183, 'HES', 30),
(184, 'Almeria', 79),
(185, 'BAW', 30),
(186, 'BAY', 30),
(187, 'Navarra', 79),
(188, 'Valencia', 79),
(189, 'SCN', 30);             
CREATE TABLE SALESMANAGER.ZONE_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    ZONE_ID BIGINT NOT NULL
);   
ALTER TABLE SALESMANAGER.ZONE_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);     
-- 376 +/- SELECT COUNT(*) FROM SALESMANAGER.ZONE_DESCRIPTION; 
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(200, TIMESTAMP '2019-03-06 19:55:19.945', TIMESTAMP '2019-03-06 19:55:19.945', NULL, NULL, 'Guipuzcoa', NULL, 1, 1),
(201, TIMESTAMP '2019-03-06 19:55:19.949', TIMESTAMP '2019-03-06 19:55:19.949', NULL, NULL, 'Guipuzcoa', NULL, 2, 1),
(202, TIMESTAMP '2019-03-06 19:55:19.955', TIMESTAMP '2019-03-06 19:55:19.955', NULL, NULL, 'Hawaii', NULL, 1, 2),
(203, TIMESTAMP '2019-03-06 19:55:19.956', TIMESTAMP '2019-03-06 19:55:19.956', NULL, NULL, 'Hawaii', NULL, 2, 2),
(204, TIMESTAMP '2019-03-06 19:55:19.959', TIMESTAMP '2019-03-06 19:55:19.959', NULL, NULL, 'Puerto Rico', NULL, 1, 3),
(205, TIMESTAMP '2019-03-06 19:55:19.961', TIMESTAMP '2019-03-06 19:55:19.961', NULL, NULL, 'Puerto Rico', NULL, 2, 3),
(206, TIMESTAMP '2019-03-06 19:55:19.964', TIMESTAMP '2019-03-06 19:55:19.964', NULL, NULL, 'Zamora', NULL, 1, 4),
(207, TIMESTAMP '2019-03-06 19:55:19.966', TIMESTAMP '2019-03-06 19:55:19.966', NULL, NULL, 'Zamora', NULL, 2, 4),
(208, TIMESTAMP '2019-03-06 19:55:19.969', TIMESTAMP '2019-03-06 19:55:19.969', NULL, NULL, 'Vizcaya', NULL, 1, 5),
(209, TIMESTAMP '2019-03-06 19:55:19.97', TIMESTAMP '2019-03-06 19:55:19.97', NULL, NULL, 'Vizcaya', NULL, 2, 5),
(210, TIMESTAMP '2019-03-06 19:55:19.973', TIMESTAMP '2019-03-06 19:55:19.973', NULL, NULL, 'Albacete', NULL, 1, 6),
(211, TIMESTAMP '2019-03-06 19:55:19.975', TIMESTAMP '2019-03-06 19:55:19.975', NULL, NULL, 'Albacete', NULL, 2, 6),
(212, TIMESTAMP '2019-03-06 19:55:19.978', TIMESTAMP '2019-03-06 19:55:19.978', NULL, NULL, 'Lleida', NULL, 1, 7),
(213, TIMESTAMP '2019-03-06 19:55:19.98', TIMESTAMP '2019-03-06 19:55:19.98', NULL, NULL, 'Lleida', NULL, 2, 7),
(214, TIMESTAMP '2019-03-06 19:55:19.983', TIMESTAMP '2019-03-06 19:55:19.983', NULL, NULL, 'Quebec', NULL, 1, 8),
(215, TIMESTAMP '2019-03-06 19:55:19.984', TIMESTAMP '2019-03-06 19:55:19.984', NULL, NULL, STRINGDECODE('Qu\u00e9bec'), NULL, 2, 8),
(216, TIMESTAMP '2019-03-06 19:55:19.987', TIMESTAMP '2019-03-06 19:55:19.987', NULL, NULL, 'Nordrhein-Westfalen', NULL, 1, 9),
(217, TIMESTAMP '2019-03-06 19:55:19.99', TIMESTAMP '2019-03-06 19:55:19.99', NULL, NULL, 'Nordrhein-Westfalen', NULL, 2, 9),
(218, TIMESTAMP '2019-03-06 19:55:19.995', TIMESTAMP '2019-03-06 19:55:19.995', NULL, NULL, 'Iowa', NULL, 1, 10),
(219, TIMESTAMP '2019-03-06 19:55:19.997', TIMESTAMP '2019-03-06 19:55:19.997', NULL, NULL, 'Iowa', NULL, 2, 10),
(220, TIMESTAMP '2019-03-06 19:55:20.001', TIMESTAMP '2019-03-06 19:55:20.001', NULL, NULL, 'Idaho', NULL, 1, 11),
(221, TIMESTAMP '2019-03-06 19:55:20.002', TIMESTAMP '2019-03-06 19:55:20.002', NULL, NULL, 'Idaho', NULL, 2, 11),
(222, TIMESTAMP '2019-03-06 19:55:20.006', TIMESTAMP '2019-03-06 19:55:20.006', NULL, NULL, 'Yukon Territory', NULL, 1, 12),
(223, TIMESTAMP '2019-03-06 19:55:20.007', TIMESTAMP '2019-03-06 19:55:20.007', NULL, NULL, 'Yukon', NULL, 2, 12),
(224, TIMESTAMP '2019-03-06 19:55:20.011', TIMESTAMP '2019-03-06 19:55:20.011', NULL, NULL, 'Leon', NULL, 1, 13),
(225, TIMESTAMP '2019-03-06 19:55:20.013', TIMESTAMP '2019-03-06 19:55:20.013', NULL, NULL, 'Leon', NULL, 2, 13),
(226, TIMESTAMP '2019-03-06 19:55:20.016', TIMESTAMP '2019-03-06 19:55:20.016', NULL, NULL, 'A Corua', NULL, 1, 14),
(227, TIMESTAMP '2019-03-06 19:55:20.02', TIMESTAMP '2019-03-06 19:55:20.02', NULL, NULL, 'Castellon', NULL, 1, 15),
(228, TIMESTAMP '2019-03-06 19:55:20.021', TIMESTAMP '2019-03-06 19:55:20.021', NULL, NULL, 'Castellon', NULL, 2, 15),
(229, TIMESTAMP '2019-03-06 19:55:20.024', TIMESTAMP '2019-03-06 19:55:20.024', NULL, NULL, 'Las Palmas', NULL, 1, 16),
(230, TIMESTAMP '2019-03-06 19:55:20.026', TIMESTAMP '2019-03-06 19:55:20.026', NULL, NULL, 'Las Palmas', NULL, 2, 16),
(231, TIMESTAMP '2019-03-06 19:55:20.03', TIMESTAMP '2019-03-06 19:55:20.03', NULL, NULL, 'Pontevedra', NULL, 1, 17),
(232, TIMESTAMP '2019-03-06 19:55:20.031', TIMESTAMP '2019-03-06 19:55:20.031', NULL, NULL, 'Pontevedra', NULL, 2, 17),
(233, TIMESTAMP '2019-03-06 19:55:20.036', TIMESTAMP '2019-03-06 19:55:20.036', NULL, NULL, 'Armed Forces Americas', NULL, 1, 18),
(234, TIMESTAMP '2019-03-06 19:55:20.037', TIMESTAMP '2019-03-06 19:55:20.037', NULL, NULL, 'Armed Forces Americas', NULL, 2, 18);     
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(235, TIMESTAMP '2019-03-06 19:55:20.041', TIMESTAMP '2019-03-06 19:55:20.041', NULL, NULL, 'Teruel', NULL, 1, 19),
(236, TIMESTAMP '2019-03-06 19:55:20.043', TIMESTAMP '2019-03-06 19:55:20.043', NULL, NULL, 'Teruel', NULL, 2, 19),
(237, TIMESTAMP '2019-03-06 19:55:20.047', TIMESTAMP '2019-03-06 19:55:20.047', NULL, NULL, 'Alberta', NULL, 1, 20),
(238, TIMESTAMP '2019-03-06 19:55:20.048', TIMESTAMP '2019-03-06 19:55:20.048', NULL, NULL, 'Alberta', NULL, 2, 20),
(239, TIMESTAMP '2019-03-06 19:55:20.051', TIMESTAMP '2019-03-06 19:55:20.051', NULL, NULL, 'Armed Forces Canada', NULL, 1, 21),
(240, TIMESTAMP '2019-03-06 19:55:20.052', TIMESTAMP '2019-03-06 19:55:20.052', NULL, NULL, 'Armed Forces Canada', NULL, 2, 21),
(241, TIMESTAMP '2019-03-06 19:55:20.056', TIMESTAMP '2019-03-06 19:55:20.056', NULL, NULL, 'Illinois', NULL, 1, 22),
(242, TIMESTAMP '2019-03-06 19:55:20.057', TIMESTAMP '2019-03-06 19:55:20.057', NULL, NULL, 'Illinois', NULL, 2, 22),
(243, TIMESTAMP '2019-03-06 19:55:20.06', TIMESTAMP '2019-03-06 19:55:20.06', NULL, NULL, 'Armed Forces Europe', NULL, 1, 23),
(244, TIMESTAMP '2019-03-06 19:55:20.062', TIMESTAMP '2019-03-06 19:55:20.062', NULL, NULL, 'Armed Forces Europe', NULL, 2, 23),
(245, TIMESTAMP '2019-03-06 19:55:20.065', TIMESTAMP '2019-03-06 19:55:20.065', NULL, NULL, 'Armed Forces Africa', NULL, 1, 24),
(246, TIMESTAMP '2019-03-06 19:55:20.067', TIMESTAMP '2019-03-06 19:55:20.067', NULL, NULL, 'Armed Forces Africa', NULL, 2, 24),
(247, TIMESTAMP '2019-03-06 19:55:20.07', TIMESTAMP '2019-03-06 19:55:20.07', NULL, NULL, 'Indiana', NULL, 1, 25),
(248, TIMESTAMP '2019-03-06 19:55:20.073', TIMESTAMP '2019-03-06 19:55:20.073', NULL, NULL, 'Indiana', NULL, 2, 25),
(249, TIMESTAMP '2019-03-06 19:55:20.078', TIMESTAMP '2019-03-06 19:55:20.078', NULL, NULL, 'Aargau', NULL, 1, 26),
(250, TIMESTAMP '2019-03-06 19:55:20.081', TIMESTAMP '2019-03-06 19:55:20.081', NULL, NULL, 'Aargau', NULL, 2, 26),
(251, TIMESTAMP '2019-03-06 19:55:20.085', TIMESTAMP '2019-03-06 19:55:20.085', NULL, NULL, 'A Corua', NULL, 2, 27),
(252, TIMESTAMP '2019-03-06 19:55:20.088', TIMESTAMP '2019-03-06 19:55:20.088', NULL, NULL, 'Appenzell Innerrhoden', NULL, 1, 28),
(253, TIMESTAMP '2019-03-06 19:55:20.09', TIMESTAMP '2019-03-06 19:55:20.09', NULL, NULL, 'Appenzell Innerrhoden', NULL, 2, 28),
(254, TIMESTAMP '2019-03-06 19:55:20.093', TIMESTAMP '2019-03-06 19:55:20.093', NULL, NULL, 'Alaska', NULL, 1, 29),
(255, TIMESTAMP '2019-03-06 19:55:20.096', TIMESTAMP '2019-03-06 19:55:20.096', NULL, NULL, 'Alaska', NULL, 2, 29),
(256, TIMESTAMP '2019-03-06 19:55:20.101', TIMESTAMP '2019-03-06 19:55:20.101', NULL, NULL, 'Caceres', NULL, 1, 30),
(257, TIMESTAMP '2019-03-06 19:55:20.102', TIMESTAMP '2019-03-06 19:55:20.102', NULL, NULL, 'Caceres', NULL, 2, 30),
(258, TIMESTAMP '2019-03-06 19:55:20.106', TIMESTAMP '2019-03-06 19:55:20.106', NULL, NULL, 'Segovia', NULL, 1, 31),
(259, TIMESTAMP '2019-03-06 19:55:20.108', TIMESTAMP '2019-03-06 19:55:20.108', NULL, NULL, 'Segovia', NULL, 2, 31),
(260, TIMESTAMP '2019-03-06 19:55:20.112', TIMESTAMP '2019-03-06 19:55:20.112', NULL, NULL, 'Alabama', NULL, 1, 32),
(261, TIMESTAMP '2019-03-06 19:55:20.114', TIMESTAMP '2019-03-06 19:55:20.114', NULL, NULL, 'Alabama', NULL, 2, 32),
(262, TIMESTAMP '2019-03-06 19:55:20.118', TIMESTAMP '2019-03-06 19:55:20.118', NULL, NULL, 'Armed Forces Middle East', NULL, 1, 33),
(263, TIMESTAMP '2019-03-06 19:55:20.121', TIMESTAMP '2019-03-06 19:55:20.121', NULL, NULL, 'Armed Forces Middle East', NULL, 2, 33),
(264, TIMESTAMP '2019-03-06 19:55:20.126', TIMESTAMP '2019-03-06 19:55:20.126', NULL, NULL, 'Zug', NULL, 1, 34),
(265, TIMESTAMP '2019-03-06 19:55:20.129', TIMESTAMP '2019-03-06 19:55:20.129', NULL, NULL, 'Zug', NULL, 2, 34),
(266, TIMESTAMP '2019-03-06 19:55:20.133', TIMESTAMP '2019-03-06 19:55:20.133', NULL, NULL, 'Malaga', NULL, 1, 35),
(267, TIMESTAMP '2019-03-06 19:55:20.135', TIMESTAMP '2019-03-06 19:55:20.135', NULL, NULL, 'Malaga', NULL, 2, 35),
(268, TIMESTAMP '2019-03-06 19:55:20.138', TIMESTAMP '2019-03-06 19:55:20.138', NULL, NULL, 'Zrich', NULL, 1, 36); 
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(269, TIMESTAMP '2019-03-06 19:55:20.14', TIMESTAMP '2019-03-06 19:55:20.14', NULL, NULL, 'Zrich', NULL, 2, 36),
(270, TIMESTAMP '2019-03-06 19:55:20.143', TIMESTAMP '2019-03-06 19:55:20.143', NULL, NULL, 'La Rioja', NULL, 1, 37),
(271, TIMESTAMP '2019-03-06 19:55:20.146', TIMESTAMP '2019-03-06 19:55:20.146', NULL, NULL, 'La Rioja', NULL, 2, 37),
(272, TIMESTAMP '2019-03-06 19:55:20.149', TIMESTAMP '2019-03-06 19:55:20.149', NULL, NULL, 'Armed Forces Pacific', NULL, 1, 38),
(273, TIMESTAMP '2019-03-06 19:55:20.151', TIMESTAMP '2019-03-06 19:55:20.151', NULL, NULL, 'Armed Forces Pacific', NULL, 2, 38),
(274, TIMESTAMP '2019-03-06 19:55:20.157', TIMESTAMP '2019-03-06 19:55:20.157', NULL, NULL, 'Melilla', NULL, 1, 39),
(275, TIMESTAMP '2019-03-06 19:55:20.158', TIMESTAMP '2019-03-06 19:55:20.158', NULL, NULL, 'Melilla', NULL, 2, 39),
(276, TIMESTAMP '2019-03-06 19:55:20.162', TIMESTAMP '2019-03-06 19:55:20.162', NULL, NULL, 'Arkansas', NULL, 1, 40),
(277, TIMESTAMP '2019-03-06 19:55:20.164', TIMESTAMP '2019-03-06 19:55:20.164', NULL, NULL, 'Arkansas', NULL, 2, 40),
(278, TIMESTAMP '2019-03-06 19:55:20.168', TIMESTAMP '2019-03-06 19:55:20.168', NULL, NULL, 'American Samoa', NULL, 1, 41),
(279, TIMESTAMP '2019-03-06 19:55:20.17', TIMESTAMP '2019-03-06 19:55:20.17', NULL, NULL, 'American Samoa', NULL, 2, 41),
(280, TIMESTAMP '2019-03-06 19:55:20.173', TIMESTAMP '2019-03-06 19:55:20.173', NULL, NULL, 'New South Wales', NULL, 1, 42),
(281, TIMESTAMP '2019-03-06 19:55:20.175', TIMESTAMP '2019-03-06 19:55:20.175', NULL, NULL, 'Nouvelle-Galles du Sud', NULL, 2, 42),
(282, TIMESTAMP '2019-03-06 19:55:20.179', TIMESTAMP '2019-03-06 19:55:20.179', NULL, NULL, 'Madrid', NULL, 1, 43),
(283, TIMESTAMP '2019-03-06 19:55:20.181', TIMESTAMP '2019-03-06 19:55:20.181', NULL, NULL, 'Madrid', NULL, 2, 43),
(284, TIMESTAMP '2019-03-06 19:55:20.185', TIMESTAMP '2019-03-06 19:55:20.185', NULL, NULL, 'Rhode Island', NULL, 1, 44),
(285, TIMESTAMP '2019-03-06 19:55:20.187', TIMESTAMP '2019-03-06 19:55:20.187', NULL, NULL, 'Rhode Island', NULL, 2, 44),
(286, TIMESTAMP '2019-03-06 19:55:20.19', TIMESTAMP '2019-03-06 19:55:20.19', NULL, NULL, 'Arizona', NULL, 1, 45),
(287, TIMESTAMP '2019-03-06 19:55:20.192', TIMESTAMP '2019-03-06 19:55:20.192', NULL, NULL, 'Arizona', NULL, 2, 45),
(288, TIMESTAMP '2019-03-06 19:55:20.198', TIMESTAMP '2019-03-06 19:55:20.198', NULL, NULL, 'Ceuta', NULL, 1, 46),
(289, TIMESTAMP '2019-03-06 19:55:20.199', TIMESTAMP '2019-03-06 19:55:20.199', NULL, NULL, 'Ceuta', NULL, 2, 46),
(290, TIMESTAMP '2019-03-06 19:55:20.203', TIMESTAMP '2019-03-06 19:55:20.203', NULL, NULL, 'British Columbia', NULL, 1, 47),
(291, TIMESTAMP '2019-03-06 19:55:20.205', TIMESTAMP '2019-03-06 19:55:20.205', NULL, NULL, 'Columbie Britanique', NULL, 2, 47),
(292, TIMESTAMP '2019-03-06 19:55:20.209', TIMESTAMP '2019-03-06 19:55:20.209', NULL, NULL, 'Huelva', NULL, 1, 48),
(293, TIMESTAMP '2019-03-06 19:55:20.211', TIMESTAMP '2019-03-06 19:55:20.211', NULL, NULL, 'Huelva', NULL, 2, 48),
(294, TIMESTAMP '2019-03-06 19:55:20.215', TIMESTAMP '2019-03-06 19:55:20.215', NULL, NULL, 'Bern', NULL, 1, 49),
(295, TIMESTAMP '2019-03-06 19:55:20.217', TIMESTAMP '2019-03-06 19:55:20.217', NULL, NULL, 'Bern', NULL, 2, 49),
(296, TIMESTAMP '2019-03-06 19:55:20.222', TIMESTAMP '2019-03-06 19:55:20.222', NULL, NULL, 'Huesca', NULL, 1, 50),
(297, TIMESTAMP '2019-03-06 19:55:20.223', TIMESTAMP '2019-03-06 19:55:20.223', NULL, NULL, 'Huesca', NULL, 2, 50),
(298, TIMESTAMP '2019-03-06 19:55:20.227', TIMESTAMP '2019-03-06 19:55:20.227', NULL, NULL, 'Appenzell Ausserrhoden', NULL, 1, 51),
(299, TIMESTAMP '2019-03-06 19:55:20.23', TIMESTAMP '2019-03-06 19:55:20.23', NULL, NULL, 'Appenzell Ausserrhoden', NULL, 2, 51),
(300, TIMESTAMP '2019-03-06 19:55:20.236', TIMESTAMP '2019-03-06 19:55:20.236', NULL, NULL, 'Basel-Landschaft', NULL, 1, 52),
(301, TIMESTAMP '2019-03-06 19:55:20.239', TIMESTAMP '2019-03-06 19:55:20.239', NULL, NULL, 'Basel-Landschaft', NULL, 2, 52),
(302, TIMESTAMP '2019-03-06 19:55:20.242', TIMESTAMP '2019-03-06 19:55:20.242', NULL, NULL, 'Jura', NULL, 1, 53);            
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(303, TIMESTAMP '2019-03-06 19:55:20.245', TIMESTAMP '2019-03-06 19:55:20.245', NULL, NULL, 'Jura', NULL, 2, 53),
(304, TIMESTAMP '2019-03-06 19:55:20.249', TIMESTAMP '2019-03-06 19:55:20.249', NULL, NULL, 'Asturias', NULL, 1, 54),
(305, TIMESTAMP '2019-03-06 19:55:20.251', TIMESTAMP '2019-03-06 19:55:20.251', NULL, NULL, 'Asturias', NULL, 2, 54),
(306, TIMESTAMP '2019-03-06 19:55:20.255', TIMESTAMP '2019-03-06 19:55:20.255', NULL, NULL, 'South Australia', NULL, 1, 55),
(307, TIMESTAMP '2019-03-06 19:55:20.257', TIMESTAMP '2019-03-06 19:55:20.257', NULL, NULL, 'Australie-Mridionale', NULL, 2, 55),
(308, TIMESTAMP '2019-03-06 19:55:20.261', TIMESTAMP '2019-03-06 19:55:20.261', NULL, NULL, 'Salzburg', NULL, 1, 56),
(309, TIMESTAMP '2019-03-06 19:55:20.263', TIMESTAMP '2019-03-06 19:55:20.263', NULL, NULL, 'Salzburg', NULL, 2, 56),
(310, TIMESTAMP '2019-03-06 19:55:20.267', TIMESTAMP '2019-03-06 19:55:20.267', NULL, NULL, 'Tirol', NULL, 1, 57),
(311, TIMESTAMP '2019-03-06 19:55:20.269', TIMESTAMP '2019-03-06 19:55:20.269', NULL, NULL, 'Tirol', NULL, 2, 57),
(312, TIMESTAMP '2019-03-06 19:55:20.275', TIMESTAMP '2019-03-06 19:55:20.275', NULL, NULL, 'South Carolina', NULL, 1, 58),
(313, TIMESTAMP '2019-03-06 19:55:20.277', TIMESTAMP '2019-03-06 19:55:20.277', NULL, NULL, 'Caroline du Sud', NULL, 2, 58),
(314, TIMESTAMP '2019-03-06 19:55:20.281', TIMESTAMP '2019-03-06 19:55:20.281', NULL, NULL, 'Thringen', NULL, 1, 59),
(315, TIMESTAMP '2019-03-06 19:55:20.283', TIMESTAMP '2019-03-06 19:55:20.283', NULL, NULL, 'Thringen', NULL, 2, 59),
(316, TIMESTAMP '2019-03-06 19:55:20.287', TIMESTAMP '2019-03-06 19:55:20.287', NULL, NULL, 'South Dakota', NULL, 1, 60),
(317, TIMESTAMP '2019-03-06 19:55:20.289', TIMESTAMP '2019-03-06 19:55:20.289', NULL, NULL, 'Dakota du Sud', NULL, 2, 60),
(318, TIMESTAMP '2019-03-06 19:55:20.293', TIMESTAMP '2019-03-06 19:55:20.293', NULL, NULL, 'Basel-Stadt', NULL, 1, 61),
(319, TIMESTAMP '2019-03-06 19:55:20.295', TIMESTAMP '2019-03-06 19:55:20.295', NULL, NULL, 'Basel-Stadt', NULL, 2, 61),
(320, TIMESTAMP '2019-03-06 19:55:20.299', TIMESTAMP '2019-03-06 19:55:20.299', NULL, NULL, 'Cordoba', NULL, 1, 62),
(321, TIMESTAMP '2019-03-06 19:55:20.301', TIMESTAMP '2019-03-06 19:55:20.301', NULL, NULL, 'Cordoba', NULL, 2, 62),
(322, TIMESTAMP '2019-03-06 19:55:20.305', TIMESTAMP '2019-03-06 19:55:20.305', NULL, NULL, 'Tarragona', NULL, 1, 63),
(323, TIMESTAMP '2019-03-06 19:55:20.309', TIMESTAMP '2019-03-06 19:55:20.309', NULL, NULL, 'Tarragona', NULL, 2, 63),
(324, TIMESTAMP '2019-03-06 19:55:20.314', TIMESTAMP '2019-03-06 19:55:20.314', NULL, NULL, 'Valladolid', NULL, 1, 64),
(325, TIMESTAMP '2019-03-06 19:55:20.315', TIMESTAMP '2019-03-06 19:55:20.315', NULL, NULL, 'Valladolid', NULL, 2, 64),
(326, TIMESTAMP '2019-03-06 19:55:20.319', TIMESTAMP '2019-03-06 19:55:20.319', NULL, NULL, 'St. Gallen', NULL, 1, 65),
(327, TIMESTAMP '2019-03-06 19:55:20.321', TIMESTAMP '2019-03-06 19:55:20.321', NULL, NULL, 'St. Gallen', NULL, 2, 65),
(328, TIMESTAMP '2019-03-06 19:55:20.326', TIMESTAMP '2019-03-06 19:55:20.326', NULL, NULL, 'Schaffhausen', NULL, 1, 66),
(329, TIMESTAMP '2019-03-06 19:55:20.329', TIMESTAMP '2019-03-06 19:55:20.329', NULL, NULL, 'Schaffhausen', NULL, 2, 66),
(330, TIMESTAMP '2019-03-06 19:55:20.333', TIMESTAMP '2019-03-06 19:55:20.333', NULL, NULL, 'Western Australia', NULL, 1, 67),
(331, TIMESTAMP '2019-03-06 19:55:20.335', TIMESTAMP '2019-03-06 19:55:20.335', NULL, NULL, 'Australie-Occidentale', NULL, 2, 67),
(332, TIMESTAMP '2019-03-06 19:55:20.339', TIMESTAMP '2019-03-06 19:55:20.339', NULL, NULL, 'Saskatchewan', NULL, 1, 68),
(333, TIMESTAMP '2019-03-06 19:55:20.343', TIMESTAMP '2019-03-06 19:55:20.343', NULL, NULL, 'Saskatchewan', NULL, 2, 68),
(334, TIMESTAMP '2019-03-06 19:55:20.348', TIMESTAMP '2019-03-06 19:55:20.348', NULL, NULL, 'Niedersachsen', NULL, 1, 69),
(335, TIMESTAMP '2019-03-06 19:55:20.35', TIMESTAMP '2019-03-06 19:55:20.35', NULL, NULL, 'Niedersachsen', NULL, 2, 69),
(336, TIMESTAMP '2019-03-06 19:55:20.354', TIMESTAMP '2019-03-06 19:55:20.354', NULL, NULL, 'Solothurn', NULL, 1, 70);   
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(337, TIMESTAMP '2019-03-06 19:55:20.356', TIMESTAMP '2019-03-06 19:55:20.356', NULL, NULL, 'Solothurn', NULL, 2, 70),
(338, TIMESTAMP '2019-03-06 19:55:20.359', TIMESTAMP '2019-03-06 19:55:20.359', NULL, NULL, 'California', NULL, 1, 71),
(339, TIMESTAMP '2019-03-06 19:55:20.362', TIMESTAMP '2019-03-06 19:55:20.362', NULL, NULL, 'Californie', NULL, 2, 71),
(340, TIMESTAMP '2019-03-06 19:55:20.366', TIMESTAMP '2019-03-06 19:55:20.366', NULL, NULL, 'Northern Territory', NULL, 1, 72),
(341, TIMESTAMP '2019-03-06 19:55:20.368', TIMESTAMP '2019-03-06 19:55:20.368', NULL, NULL, 'Territoire du Nord', NULL, 2, 72),
(342, TIMESTAMP '2019-03-06 19:55:20.371', TIMESTAMP '2019-03-06 19:55:20.371', NULL, NULL, 'Steiermark', NULL, 1, 73),
(343, TIMESTAMP '2019-03-06 19:55:20.373', TIMESTAMP '2019-03-06 19:55:20.373', NULL, NULL, 'Steiermark', NULL, 2, 73),
(344, TIMESTAMP '2019-03-06 19:55:20.377', TIMESTAMP '2019-03-06 19:55:20.377', NULL, NULL, 'Katen', NULL, 1, 74),
(345, TIMESTAMP '2019-03-06 19:55:20.378', TIMESTAMP '2019-03-06 19:55:20.378', NULL, NULL, 'Karten', NULL, 2, 74),
(346, TIMESTAMP '2019-03-06 19:55:20.383', TIMESTAMP '2019-03-06 19:55:20.383', NULL, NULL, 'Jaen', NULL, 1, 75),
(347, TIMESTAMP '2019-03-06 19:55:20.385', TIMESTAMP '2019-03-06 19:55:20.385', NULL, NULL, 'Jaen', NULL, 2, 75),
(348, TIMESTAMP '2019-03-06 19:55:20.39', TIMESTAMP '2019-03-06 19:55:20.39', NULL, NULL, 'Ciudad Real', NULL, 1, 76),
(349, TIMESTAMP '2019-03-06 19:55:20.393', TIMESTAMP '2019-03-06 19:55:20.393', NULL, NULL, 'Ciudad Real', NULL, 2, 76),
(350, TIMESTAMP '2019-03-06 19:55:20.399', TIMESTAMP '2019-03-06 19:55:20.399', NULL, NULL, 'Schwyz', NULL, 1, 77),
(351, TIMESTAMP '2019-03-06 19:55:20.401', TIMESTAMP '2019-03-06 19:55:20.401', NULL, NULL, 'Schwyz', NULL, 2, 77),
(352, TIMESTAMP '2019-03-06 19:55:20.404', TIMESTAMP '2019-03-06 19:55:20.404', NULL, NULL, 'Alava', NULL, 1, 78),
(353, TIMESTAMP '2019-03-06 19:55:20.406', TIMESTAMP '2019-03-06 19:55:20.406', NULL, NULL, 'Alava', NULL, 2, 78),
(354, TIMESTAMP '2019-03-06 19:55:20.409', TIMESTAMP '2019-03-06 19:55:20.409', NULL, NULL, 'Kansas', NULL, 1, 79),
(355, TIMESTAMP '2019-03-06 19:55:20.411', TIMESTAMP '2019-03-06 19:55:20.411', NULL, NULL, 'Kansas', NULL, 2, 79),
(356, TIMESTAMP '2019-03-06 19:55:20.414', TIMESTAMP '2019-03-06 19:55:20.414', NULL, NULL, 'Colorado', NULL, 1, 80),
(357, TIMESTAMP '2019-03-06 19:55:20.415', TIMESTAMP '2019-03-06 19:55:20.415', NULL, NULL, 'Colorado', NULL, 2, 80),
(358, TIMESTAMP '2019-03-06 19:55:20.418', TIMESTAMP '2019-03-06 19:55:20.418', NULL, NULL, 'Kentucky', NULL, 1, 81),
(359, TIMESTAMP '2019-03-06 19:55:20.42', TIMESTAMP '2019-03-06 19:55:20.42', NULL, NULL, 'Kentucky', NULL, 2, 81),
(360, TIMESTAMP '2019-03-06 19:55:20.423', TIMESTAMP '2019-03-06 19:55:20.423', NULL, NULL, 'Berlin', NULL, 1, 82),
(361, TIMESTAMP '2019-03-06 19:55:20.425', TIMESTAMP '2019-03-06 19:55:20.425', NULL, NULL, 'Berlin', NULL, 2, 82),
(362, TIMESTAMP '2019-03-06 19:55:20.428', TIMESTAMP '2019-03-06 19:55:20.428', NULL, NULL, 'Connecticut', NULL, 1, 83),
(363, TIMESTAMP '2019-03-06 19:55:20.43', TIMESTAMP '2019-03-06 19:55:20.43', NULL, NULL, 'Connecticut', NULL, 2, 83),
(364, TIMESTAMP '2019-03-06 19:55:20.433', TIMESTAMP '2019-03-06 19:55:20.433', NULL, NULL, 'Australian Capital Territory', NULL, 1, 84),
(365, TIMESTAMP '2019-03-06 19:55:20.435', TIMESTAMP '2019-03-06 19:55:20.435', NULL, NULL, 'Territoire de la capitale australienne', NULL, 2, 84),
(366, TIMESTAMP '2019-03-06 19:55:20.438', TIMESTAMP '2019-03-06 19:55:20.438', NULL, NULL, 'Thurgau', NULL, 1, 85),
(367, TIMESTAMP '2019-03-06 19:55:20.44', TIMESTAMP '2019-03-06 19:55:20.44', NULL, NULL, 'Thurgau', NULL, 2, 85),
(368, TIMESTAMP '2019-03-06 19:55:20.444', TIMESTAMP '2019-03-06 19:55:20.444', NULL, NULL, 'Louisiana', NULL, 1, 86),
(369, TIMESTAMP '2019-03-06 19:55:20.446', TIMESTAMP '2019-03-06 19:55:20.446', NULL, NULL, 'Louisiane', NULL, 2, 86),
(370, TIMESTAMP '2019-03-06 19:55:20.45', TIMESTAMP '2019-03-06 19:55:20.45', NULL, NULL, 'Hamburg', NULL, 1, 87);              
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(371, TIMESTAMP '2019-03-06 19:55:20.451', TIMESTAMP '2019-03-06 19:55:20.451', NULL, NULL, 'Hamburg', NULL, 2, 87),
(372, TIMESTAMP '2019-03-06 19:55:20.454', TIMESTAMP '2019-03-06 19:55:20.454', NULL, NULL, 'Tessin', NULL, 1, 88),
(373, TIMESTAMP '2019-03-06 19:55:20.456', TIMESTAMP '2019-03-06 19:55:20.456', NULL, NULL, 'Tessin', NULL, 2, 88),
(374, TIMESTAMP '2019-03-06 19:55:20.459', TIMESTAMP '2019-03-06 19:55:20.459', NULL, NULL, 'Lugo', NULL, 1, 89),
(375, TIMESTAMP '2019-03-06 19:55:20.461', TIMESTAMP '2019-03-06 19:55:20.461', NULL, NULL, 'Lugo', NULL, 2, 89),
(376, TIMESTAMP '2019-03-06 19:55:20.464', TIMESTAMP '2019-03-06 19:55:20.464', NULL, NULL, 'Neuenburg', NULL, 1, 90),
(377, TIMESTAMP '2019-03-06 19:55:20.466', TIMESTAMP '2019-03-06 19:55:20.466', NULL, NULL, 'Neuenburg', NULL, 2, 90),
(378, TIMESTAMP '2019-03-06 19:55:20.471', TIMESTAMP '2019-03-06 19:55:20.471', NULL, NULL, 'Tennessee', NULL, 1, 91),
(379, TIMESTAMP '2019-03-06 19:55:20.473', TIMESTAMP '2019-03-06 19:55:20.473', NULL, NULL, 'Tennessee', NULL, 2, 91),
(380, TIMESTAMP '2019-03-06 19:55:20.476', TIMESTAMP '2019-03-06 19:55:20.476', NULL, NULL, 'Toledo', NULL, 1, 92),
(381, TIMESTAMP '2019-03-06 19:55:20.478', TIMESTAMP '2019-03-06 19:55:20.478', NULL, NULL, 'Toledo', NULL, 2, 92),
(382, TIMESTAMP '2019-03-06 19:55:20.482', TIMESTAMP '2019-03-06 19:55:20.482', NULL, NULL, 'District of Columbia', NULL, 1, 93),
(383, TIMESTAMP '2019-03-06 19:55:20.483', TIMESTAMP '2019-03-06 19:55:20.483', NULL, NULL, 'District de Columbia', NULL, 2, 93),
(384, TIMESTAMP '2019-03-06 19:55:20.486', TIMESTAMP '2019-03-06 19:55:20.486', NULL, NULL, 'Palencia', NULL, 1, 94),
(385, TIMESTAMP '2019-03-06 19:55:20.488', TIMESTAMP '2019-03-06 19:55:20.488', NULL, NULL, 'Palencia', NULL, 2, 94),
(386, TIMESTAMP '2019-03-06 19:55:20.49', TIMESTAMP '2019-03-06 19:55:20.49', NULL, NULL, 'Delaware', NULL, 1, 95),
(387, TIMESTAMP '2019-03-06 19:55:20.492', TIMESTAMP '2019-03-06 19:55:20.492', NULL, NULL, 'Delaware', NULL, 2, 95),
(388, TIMESTAMP '2019-03-06 19:55:20.495', TIMESTAMP '2019-03-06 19:55:20.495', NULL, NULL, 'Texas', NULL, 1, 96),
(389, TIMESTAMP '2019-03-06 19:55:20.496', TIMESTAMP '2019-03-06 19:55:20.496', NULL, NULL, 'Texas', NULL, 2, 96),
(390, TIMESTAMP '2019-03-06 19:55:20.499', TIMESTAMP '2019-03-06 19:55:20.499', NULL, NULL, 'Tasmania', NULL, 1, 97),
(391, TIMESTAMP '2019-03-06 19:55:20.501', TIMESTAMP '2019-03-06 19:55:20.501', NULL, NULL, 'Tasmanie', NULL, 2, 97),
(392, TIMESTAMP '2019-03-06 19:55:20.504', TIMESTAMP '2019-03-06 19:55:20.504', NULL, NULL, 'Queensland', NULL, 1, 98),
(393, TIMESTAMP '2019-03-06 19:55:20.505', TIMESTAMP '2019-03-06 19:55:20.505', NULL, NULL, 'Queensland', NULL, 2, 98),
(394, TIMESTAMP '2019-03-06 19:55:20.51', TIMESTAMP '2019-03-06 19:55:20.51', NULL, NULL, 'Luzern', NULL, 1, 99),
(395, TIMESTAMP '2019-03-06 19:55:20.512', TIMESTAMP '2019-03-06 19:55:20.512', NULL, NULL, 'Luzern', NULL, 2, 99),
(396, TIMESTAMP '2019-03-06 19:55:20.516', TIMESTAMP '2019-03-06 19:55:20.516', NULL, NULL, 'Burgos', NULL, 1, 100),
(397, TIMESTAMP '2019-03-06 19:55:20.518', TIMESTAMP '2019-03-06 19:55:20.518', NULL, NULL, 'Burgos', NULL, 2, 100),
(398, TIMESTAMP '2019-03-06 19:55:20.52', TIMESTAMP '2019-03-06 19:55:20.52', NULL, NULL, 'Cadiz', NULL, 1, 101),
(399, TIMESTAMP '2019-03-06 19:55:20.521', TIMESTAMP '2019-03-06 19:55:20.521', NULL, NULL, 'Cadiz', NULL, 2, 101),
(400, TIMESTAMP '2019-03-06 19:55:20.524', TIMESTAMP '2019-03-06 19:55:20.524', NULL, NULL, 'Santa Cruz de Tenerife', NULL, 1, 102),
(401, TIMESTAMP '2019-03-06 19:55:20.526', TIMESTAMP '2019-03-06 19:55:20.526', NULL, NULL, 'Santa Cruz de Tenerife', NULL, 2, 102),
(402, TIMESTAMP '2019-03-06 19:55:20.529', TIMESTAMP '2019-03-06 19:55:20.529', NULL, NULL, 'Massachusetts', NULL, 1, 103),
(403, TIMESTAMP '2019-03-06 19:55:20.531', TIMESTAMP '2019-03-06 19:55:20.531', NULL, NULL, 'Massachusetts', NULL, 2, 103),
(404, TIMESTAMP '2019-03-06 19:55:20.533', TIMESTAMP '2019-03-06 19:55:20.533', NULL, NULL, 'Manitoba', NULL, 1, 104);           
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(405, TIMESTAMP '2019-03-06 19:55:20.535', TIMESTAMP '2019-03-06 19:55:20.535', NULL, NULL, 'Manitoba', NULL, 2, 104),
(406, TIMESTAMP '2019-03-06 19:55:20.537', TIMESTAMP '2019-03-06 19:55:20.537', NULL, NULL, 'Maryland', NULL, 1, 105),
(407, TIMESTAMP '2019-03-06 19:55:20.539', TIMESTAMP '2019-03-06 19:55:20.539', NULL, NULL, 'Maryland', NULL, 2, 105),
(408, TIMESTAMP '2019-03-06 19:55:20.542', TIMESTAMP '2019-03-06 19:55:20.542', NULL, NULL, 'Girona', NULL, 1, 106),
(409, TIMESTAMP '2019-03-06 19:55:20.544', TIMESTAMP '2019-03-06 19:55:20.544', NULL, NULL, 'Girona', NULL, 2, 106),
(410, TIMESTAMP '2019-03-06 19:55:20.546', TIMESTAMP '2019-03-06 19:55:20.546', NULL, NULL, 'Maine', NULL, 1, 107),
(411, TIMESTAMP '2019-03-06 19:55:20.548', TIMESTAMP '2019-03-06 19:55:20.548', NULL, NULL, 'Maine', NULL, 2, 107),
(412, TIMESTAMP '2019-03-06 19:55:20.552', TIMESTAMP '2019-03-06 19:55:20.552', NULL, NULL, 'Alicante', NULL, 1, 108),
(413, TIMESTAMP '2019-03-06 19:55:20.554', TIMESTAMP '2019-03-06 19:55:20.554', NULL, NULL, 'Alicante', NULL, 2, 108),
(414, TIMESTAMP '2019-03-06 19:55:20.556', TIMESTAMP '2019-03-06 19:55:20.556', NULL, NULL, 'Guadalajara', NULL, 1, 109),
(415, TIMESTAMP '2019-03-06 19:55:20.558', TIMESTAMP '2019-03-06 19:55:20.558', NULL, NULL, 'Guadalajara', NULL, 2, 109),
(416, TIMESTAMP '2019-03-06 19:55:20.562', TIMESTAMP '2019-03-06 19:55:20.562', NULL, NULL, 'Cantabria', NULL, 1, 110),
(417, TIMESTAMP '2019-03-06 19:55:20.563', TIMESTAMP '2019-03-06 19:55:20.563', NULL, NULL, 'Cantabria', NULL, 2, 110),
(418, TIMESTAMP '2019-03-06 19:55:20.566', TIMESTAMP '2019-03-06 19:55:20.566', NULL, NULL, 'Marshall Islands', NULL, 1, 111),
(419, TIMESTAMP '2019-03-06 19:55:20.568', TIMESTAMP '2019-03-06 19:55:20.568', NULL, NULL, 'Marshall Islands', NULL, 2, 111),
(420, TIMESTAMP '2019-03-06 19:55:20.571', TIMESTAMP '2019-03-06 19:55:20.571', NULL, NULL, 'Michigan', NULL, 1, 112),
(421, TIMESTAMP '2019-03-06 19:55:20.573', TIMESTAMP '2019-03-06 19:55:20.573', NULL, NULL, 'Michigan', NULL, 2, 112),
(422, TIMESTAMP '2019-03-06 19:55:20.576', TIMESTAMP '2019-03-06 19:55:20.576', NULL, NULL, 'Uri', NULL, 1, 113),
(423, TIMESTAMP '2019-03-06 19:55:20.578', TIMESTAMP '2019-03-06 19:55:20.578', NULL, NULL, 'Uri', NULL, 2, 113),
(424, TIMESTAMP '2019-03-06 19:55:20.581', TIMESTAMP '2019-03-06 19:55:20.581', NULL, NULL, 'Utah', NULL, 1, 114),
(425, TIMESTAMP '2019-03-06 19:55:20.582', TIMESTAMP '2019-03-06 19:55:20.582', NULL, NULL, 'Utah', NULL, 2, 114),
(426, TIMESTAMP '2019-03-06 19:55:20.585', TIMESTAMP '2019-03-06 19:55:20.585', NULL, NULL, 'Minnesota', NULL, 1, 115),
(427, TIMESTAMP '2019-03-06 19:55:20.587', TIMESTAMP '2019-03-06 19:55:20.587', NULL, NULL, 'Minnesota', NULL, 2, 115),
(428, TIMESTAMP '2019-03-06 19:55:20.59', TIMESTAMP '2019-03-06 19:55:20.59', NULL, NULL, 'Missouri', NULL, 1, 116),
(429, TIMESTAMP '2019-03-06 19:55:20.592', TIMESTAMP '2019-03-06 19:55:20.592', NULL, NULL, 'Missouri', NULL, 2, 116),
(430, TIMESTAMP '2019-03-06 19:55:20.596', TIMESTAMP '2019-03-06 19:55:20.596', NULL, NULL, 'Northern Mariana Islands', NULL, 1, 117),
(431, TIMESTAMP '2019-03-06 19:55:20.597', TIMESTAMP '2019-03-06 19:55:20.597', NULL, NULL, 'Northern Mariana Islands', NULL, 2, 117),
(432, TIMESTAMP '2019-03-06 19:55:20.6', TIMESTAMP '2019-03-06 19:55:20.6', NULL, NULL, 'Barcelona', NULL, 1, 118),
(433, TIMESTAMP '2019-03-06 19:55:20.602', TIMESTAMP '2019-03-06 19:55:20.602', NULL, NULL, 'Barcelona', NULL, 2, 118),
(434, TIMESTAMP '2019-03-06 19:55:20.605', TIMESTAMP '2019-03-06 19:55:20.605', NULL, NULL, 'Mississippi', NULL, 1, 119),
(435, TIMESTAMP '2019-03-06 19:55:20.607', TIMESTAMP '2019-03-06 19:55:20.607', NULL, NULL, 'Mississippi', NULL, 2, 119),
(436, TIMESTAMP '2019-03-06 19:55:20.61', TIMESTAMP '2019-03-06 19:55:20.61', NULL, NULL, 'Montana', NULL, 1, 120),
(437, TIMESTAMP '2019-03-06 19:55:20.612', TIMESTAMP '2019-03-06 19:55:20.612', NULL, NULL, 'Montana', NULL, 2, 120),
(438, TIMESTAMP '2019-03-06 19:55:20.616', TIMESTAMP '2019-03-06 19:55:20.616', NULL, NULL, 'Badajoz', NULL, 1, 121);  
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(439, TIMESTAMP '2019-03-06 19:55:20.617', TIMESTAMP '2019-03-06 19:55:20.617', NULL, NULL, 'Badajoz', NULL, 2, 121),
(440, TIMESTAMP '2019-03-06 19:55:20.621', TIMESTAMP '2019-03-06 19:55:20.621', NULL, NULL, 'Mecklenburg-Vorpommern', NULL, 1, 122),
(441, TIMESTAMP '2019-03-06 19:55:20.622', TIMESTAMP '2019-03-06 19:55:20.622', NULL, NULL, 'Mecklenburg-Vorpommern', NULL, 2, 122),
(442, TIMESTAMP '2019-03-06 19:55:20.625', TIMESTAMP '2019-03-06 19:55:20.625', NULL, NULL, 'Virginia', NULL, 1, 123),
(443, TIMESTAMP '2019-03-06 19:55:20.627', TIMESTAMP '2019-03-06 19:55:20.627', NULL, NULL, 'Virginie', NULL, 2, 123),
(444, TIMESTAMP '2019-03-06 19:55:20.632', TIMESTAMP '2019-03-06 19:55:20.632', NULL, NULL, 'Voralberg', NULL, 1, 124),
(445, TIMESTAMP '2019-03-06 19:55:20.634', TIMESTAMP '2019-03-06 19:55:20.634', NULL, NULL, 'Voralberg', NULL, 2, 124),
(446, TIMESTAMP '2019-03-06 19:55:20.637', TIMESTAMP '2019-03-06 19:55:20.637', NULL, NULL, 'Cuenca', NULL, 1, 125),
(447, TIMESTAMP '2019-03-06 19:55:20.639', TIMESTAMP '2019-03-06 19:55:20.639', NULL, NULL, 'Cuenca', NULL, 2, 125),
(448, TIMESTAMP '2019-03-06 19:55:20.641', TIMESTAMP '2019-03-06 19:55:20.641', NULL, NULL, 'Wien', NULL, 1, 126),
(449, TIMESTAMP '2019-03-06 19:55:20.643', TIMESTAMP '2019-03-06 19:55:20.643', NULL, NULL, 'Wien', NULL, 2, 126),
(450, TIMESTAMP '2019-03-06 19:55:20.647', TIMESTAMP '2019-03-06 19:55:20.647', NULL, NULL, 'Waadt', NULL, 1, 127),
(451, TIMESTAMP '2019-03-06 19:55:20.649', TIMESTAMP '2019-03-06 19:55:20.649', NULL, NULL, 'Waadt', NULL, 2, 127),
(452, TIMESTAMP '2019-03-06 19:55:20.652', TIMESTAMP '2019-03-06 19:55:20.652', NULL, NULL, 'Sevilla', NULL, 1, 128),
(453, TIMESTAMP '2019-03-06 19:55:20.654', TIMESTAMP '2019-03-06 19:55:20.654', NULL, NULL, 'Sevilla', NULL, 2, 128),
(454, TIMESTAMP '2019-03-06 19:55:20.657', TIMESTAMP '2019-03-06 19:55:20.657', NULL, NULL, 'Virgin Islands', NULL, 1, 129),
(455, TIMESTAMP '2019-03-06 19:55:20.658', TIMESTAMP '2019-03-06 19:55:20.658', NULL, NULL, 'Virgin Islands', NULL, 2, 129),
(456, TIMESTAMP '2019-03-06 19:55:20.662', TIMESTAMP '2019-03-06 19:55:20.662', NULL, NULL, 'Zaragoza', NULL, 1, 130),
(457, TIMESTAMP '2019-03-06 19:55:20.663', TIMESTAMP '2019-03-06 19:55:20.663', NULL, NULL, 'Zaragoza', NULL, 2, 130),
(458, TIMESTAMP '2019-03-06 19:55:20.666', TIMESTAMP '2019-03-06 19:55:20.666', NULL, NULL, 'New Brunswick', NULL, 1, 131),
(459, TIMESTAMP '2019-03-06 19:55:20.669', TIMESTAMP '2019-03-06 19:55:20.669', NULL, NULL, 'Nouveau Brunswick', NULL, 2, 131),
(460, TIMESTAMP '2019-03-06 19:55:20.673', TIMESTAMP '2019-03-06 19:55:20.673', NULL, NULL, 'Sachsen-Anhalt', NULL, 1, 132),
(461, TIMESTAMP '2019-03-06 19:55:20.675', TIMESTAMP '2019-03-06 19:55:20.675', NULL, NULL, 'Sachsen-Anhalt', NULL, 2, 132),
(462, TIMESTAMP '2019-03-06 19:55:20.678', TIMESTAMP '2019-03-06 19:55:20.678', NULL, NULL, 'North Carolina', NULL, 1, 133),
(463, TIMESTAMP '2019-03-06 19:55:20.679', TIMESTAMP '2019-03-06 19:55:20.679', NULL, NULL, 'Caroline du Nord', NULL, 2, 133),
(464, TIMESTAMP '2019-03-06 19:55:20.682', TIMESTAMP '2019-03-06 19:55:20.682', NULL, NULL, 'North Dakota', NULL, 1, 134),
(465, TIMESTAMP '2019-03-06 19:55:20.683', TIMESTAMP '2019-03-06 19:55:20.683', NULL, NULL, 'Dakota du Nord', NULL, 2, 134),
(466, TIMESTAMP '2019-03-06 19:55:20.685', TIMESTAMP '2019-03-06 19:55:20.685', NULL, NULL, 'Nebraska', NULL, 1, 135),
(467, TIMESTAMP '2019-03-06 19:55:20.687', TIMESTAMP '2019-03-06 19:55:20.687', NULL, NULL, 'Nebraska', NULL, 2, 135),
(468, TIMESTAMP '2019-03-06 19:55:20.689', TIMESTAMP '2019-03-06 19:55:20.689', NULL, NULL, 'Newfoundland - Labrador', NULL, 1, 136),
(469, TIMESTAMP '2019-03-06 19:55:20.691', TIMESTAMP '2019-03-06 19:55:20.691', NULL, NULL, 'Terre-Neuve - Labrador', NULL, 2, 136),
(470, TIMESTAMP '2019-03-06 19:55:20.693', TIMESTAMP '2019-03-06 19:55:20.693', NULL, NULL, 'New Hampshire', NULL, 1, 137),
(471, TIMESTAMP '2019-03-06 19:55:20.696', TIMESTAMP '2019-03-06 19:55:20.696', NULL, NULL, 'Nouveau Hampshire', NULL, 2, 137),
(472, TIMESTAMP '2019-03-06 19:55:20.699', TIMESTAMP '2019-03-06 19:55:20.699', NULL, NULL, 'New Jersey', NULL, 1, 138);         
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(473, TIMESTAMP '2019-03-06 19:55:20.7', TIMESTAMP '2019-03-06 19:55:20.7', NULL, NULL, 'New Jersey', NULL, 2, 138),
(474, TIMESTAMP '2019-03-06 19:55:20.703', TIMESTAMP '2019-03-06 19:55:20.703', NULL, NULL, 'Wallis', NULL, 1, 139),
(475, TIMESTAMP '2019-03-06 19:55:20.704', TIMESTAMP '2019-03-06 19:55:20.704', NULL, NULL, 'Wallis', NULL, 2, 139),
(476, TIMESTAMP '2019-03-06 19:55:20.707', TIMESTAMP '2019-03-06 19:55:20.707', NULL, NULL, 'Vermont', NULL, 1, 140),
(477, TIMESTAMP '2019-03-06 19:55:20.709', TIMESTAMP '2019-03-06 19:55:20.709', NULL, NULL, 'Vermont', NULL, 2, 140),
(478, TIMESTAMP '2019-03-06 19:55:20.712', TIMESTAMP '2019-03-06 19:55:20.712', NULL, NULL, 'New Mexico', NULL, 1, 141),
(479, TIMESTAMP '2019-03-06 19:55:20.714', TIMESTAMP '2019-03-06 19:55:20.714', NULL, NULL, 'Nouveau Mexique', NULL, 2, 141),
(480, TIMESTAMP '2019-03-06 19:55:20.718', TIMESTAMP '2019-03-06 19:55:20.718', NULL, NULL, 'Niederosterreich', NULL, 1, 142),
(481, TIMESTAMP '2019-03-06 19:55:20.719', TIMESTAMP '2019-03-06 19:55:20.719', NULL, NULL, 'Niederosterreich', NULL, 2, 142),
(482, TIMESTAMP '2019-03-06 19:55:20.722', TIMESTAMP '2019-03-06 19:55:20.722', NULL, NULL, 'Sachsen', NULL, 1, 143),
(483, TIMESTAMP '2019-03-06 19:55:20.724', TIMESTAMP '2019-03-06 19:55:20.724', NULL, NULL, 'Sachsen', NULL, 2, 143),
(484, TIMESTAMP '2019-03-06 19:55:20.727', TIMESTAMP '2019-03-06 19:55:20.727', NULL, NULL, 'Nova Scotia', NULL, 1, 144),
(485, TIMESTAMP '2019-03-06 19:55:20.729', TIMESTAMP '2019-03-06 19:55:20.729', NULL, NULL, STRINGDECODE('Nouvelle \u00c9cosse'), NULL, 2, 144),
(486, TIMESTAMP '2019-03-06 19:55:20.732', TIMESTAMP '2019-03-06 19:55:20.732', NULL, NULL, 'Saarland', NULL, 1, 145),
(487, TIMESTAMP '2019-03-06 19:55:20.733', TIMESTAMP '2019-03-06 19:55:20.733', NULL, NULL, 'Saarland', NULL, 2, 145),
(488, TIMESTAMP '2019-03-06 19:55:20.736', TIMESTAMP '2019-03-06 19:55:20.736', NULL, NULL, 'Florida', NULL, 1, 146),
(489, TIMESTAMP '2019-03-06 19:55:20.737', TIMESTAMP '2019-03-06 19:55:20.737', NULL, NULL, 'Floride', NULL, 2, 146),
(490, TIMESTAMP '2019-03-06 19:55:20.74', TIMESTAMP '2019-03-06 19:55:20.74', NULL, NULL, 'Northwest Territories', NULL, 1, 147),
(491, TIMESTAMP '2019-03-06 19:55:20.742', TIMESTAMP '2019-03-06 19:55:20.742', NULL, NULL, 'Territores du Nord-Ouest', NULL, 2, 147),
(492, TIMESTAMP '2019-03-06 19:55:20.744', TIMESTAMP '2019-03-06 19:55:20.744', NULL, NULL, 'Federated States Of Micronesia', NULL, 1, 148),
(493, TIMESTAMP '2019-03-06 19:55:20.746', TIMESTAMP '2019-03-06 19:55:20.746', NULL, NULL, 'Federated States Of Micronesia', NULL, 2, 148),
(494, TIMESTAMP '2019-03-06 19:55:20.751', TIMESTAMP '2019-03-06 19:55:20.751', NULL, NULL, 'Nunavut', NULL, 1, 149),
(495, TIMESTAMP '2019-03-06 19:55:20.752', TIMESTAMP '2019-03-06 19:55:20.752', NULL, NULL, 'Nunavut', NULL, 2, 149),
(496, TIMESTAMP '2019-03-06 19:55:20.756', TIMESTAMP '2019-03-06 19:55:20.756', NULL, NULL, 'Nevada', NULL, 1, 150),
(497, TIMESTAMP '2019-03-06 19:55:20.757', TIMESTAMP '2019-03-06 19:55:20.757', NULL, NULL, 'Nevada', NULL, 2, 150),
(498, TIMESTAMP '2019-03-06 19:55:20.761', TIMESTAMP '2019-03-06 19:55:20.761', NULL, NULL, 'Nidwalden', NULL, 1, 151),
(499, TIMESTAMP '2019-03-06 19:55:20.763', TIMESTAMP '2019-03-06 19:55:20.763', NULL, NULL, 'Nidwalden', NULL, 2, 151),
(500, TIMESTAMP '2019-03-06 19:55:20.766', TIMESTAMP '2019-03-06 19:55:20.766', NULL, NULL, 'Washington', NULL, 1, 152),
(501, TIMESTAMP '2019-03-06 19:55:20.768', TIMESTAMP '2019-03-06 19:55:20.768', NULL, NULL, 'Washington', NULL, 2, 152),
(502, TIMESTAMP '2019-03-06 19:55:20.771', TIMESTAMP '2019-03-06 19:55:20.771', NULL, NULL, 'New York', NULL, 1, 153),
(503, TIMESTAMP '2019-03-06 19:55:20.773', TIMESTAMP '2019-03-06 19:55:20.773', NULL, NULL, 'New York', NULL, 2, 153),
(504, TIMESTAMP '2019-03-06 19:55:20.776', TIMESTAMP '2019-03-06 19:55:20.776', NULL, NULL, 'Granada', NULL, 1, 154),
(505, TIMESTAMP '2019-03-06 19:55:20.778', TIMESTAMP '2019-03-06 19:55:20.778', NULL, NULL, 'Granada', NULL, 2, 154),
(506, TIMESTAMP '2019-03-06 19:55:20.781', TIMESTAMP '2019-03-06 19:55:20.781', NULL, NULL, 'Soria', NULL, 1, 155); 
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(507, TIMESTAMP '2019-03-06 19:55:20.783', TIMESTAMP '2019-03-06 19:55:20.783', NULL, NULL, 'Soria', NULL, 2, 155),
(508, TIMESTAMP '2019-03-06 19:55:20.786', TIMESTAMP '2019-03-06 19:55:20.786', NULL, NULL, 'Freiburg', NULL, 1, 156),
(509, TIMESTAMP '2019-03-06 19:55:20.788', TIMESTAMP '2019-03-06 19:55:20.788', NULL, NULL, 'Freiburg', NULL, 2, 156),
(510, TIMESTAMP '2019-03-06 19:55:20.792', TIMESTAMP '2019-03-06 19:55:20.792', NULL, NULL, 'Rheinland-Pfalz', NULL, 1, 157),
(511, TIMESTAMP '2019-03-06 19:55:20.794', TIMESTAMP '2019-03-06 19:55:20.794', NULL, NULL, 'Rheinland-Pfalz', NULL, 2, 157),
(512, TIMESTAMP '2019-03-06 19:55:20.798', TIMESTAMP '2019-03-06 19:55:20.798', NULL, NULL, 'Ourense', NULL, 1, 158),
(513, TIMESTAMP '2019-03-06 19:55:20.8', TIMESTAMP '2019-03-06 19:55:20.8', NULL, NULL, 'Ourense', NULL, 2, 158),
(514, TIMESTAMP '2019-03-06 19:55:20.803', TIMESTAMP '2019-03-06 19:55:20.803', NULL, NULL, 'Wisconsin', NULL, 1, 159),
(515, TIMESTAMP '2019-03-06 19:55:20.804', TIMESTAMP '2019-03-06 19:55:20.804', NULL, NULL, 'Wisconsin', NULL, 2, 159),
(516, TIMESTAMP '2019-03-06 19:55:20.807', TIMESTAMP '2019-03-06 19:55:20.807', NULL, NULL, 'Ohio', NULL, 1, 160),
(517, TIMESTAMP '2019-03-06 19:55:20.808', TIMESTAMP '2019-03-06 19:55:20.808', NULL, NULL, 'Ohio', NULL, 2, 160),
(518, TIMESTAMP '2019-03-06 19:55:20.812', TIMESTAMP '2019-03-06 19:55:20.812', NULL, NULL, 'Georgia', NULL, 1, 161),
(519, TIMESTAMP '2019-03-06 19:55:20.814', TIMESTAMP '2019-03-06 19:55:20.814', NULL, NULL, 'Georgie', NULL, 2, 161),
(520, TIMESTAMP '2019-03-06 19:55:20.817', TIMESTAMP '2019-03-06 19:55:20.817', NULL, NULL, 'Murcia', NULL, 1, 162),
(521, TIMESTAMP '2019-03-06 19:55:20.82', TIMESTAMP '2019-03-06 19:55:20.82', NULL, NULL, 'Murcia', NULL, 2, 162),
(522, TIMESTAMP '2019-03-06 19:55:20.824', TIMESTAMP '2019-03-06 19:55:20.824', NULL, NULL, 'Oklahoma', NULL, 1, 163),
(523, TIMESTAMP '2019-03-06 19:55:20.826', TIMESTAMP '2019-03-06 19:55:20.826', NULL, NULL, 'Oklahoma', NULL, 2, 163),
(524, TIMESTAMP '2019-03-06 19:55:20.829', TIMESTAMP '2019-03-06 19:55:20.829', NULL, NULL, 'Genf', NULL, 1, 164),
(525, TIMESTAMP '2019-03-06 19:55:20.83', TIMESTAMP '2019-03-06 19:55:20.83', NULL, NULL, 'Genf', NULL, 2, 164),
(526, TIMESTAMP '2019-03-06 19:55:20.833', TIMESTAMP '2019-03-06 19:55:20.833', NULL, NULL, 'West Virginia', NULL, 1, 165),
(527, TIMESTAMP '2019-03-06 19:55:20.834', TIMESTAMP '2019-03-06 19:55:20.834', NULL, NULL, 'West Virginia', NULL, 2, 165),
(528, TIMESTAMP '2019-03-06 19:55:20.837', TIMESTAMP '2019-03-06 19:55:20.837', NULL, NULL, 'Ontario', NULL, 1, 166),
(529, TIMESTAMP '2019-03-06 19:55:20.838', TIMESTAMP '2019-03-06 19:55:20.838', NULL, NULL, 'Ontario', NULL, 2, 166),
(530, TIMESTAMP '2019-03-06 19:55:20.841', TIMESTAMP '2019-03-06 19:55:20.841', NULL, NULL, 'Oberosterreich', NULL, 1, 167),
(531, TIMESTAMP '2019-03-06 19:55:20.843', TIMESTAMP '2019-03-06 19:55:20.843', NULL, NULL, 'Oberosterreich', NULL, 2, 167),
(532, TIMESTAMP '2019-03-06 19:55:20.846', TIMESTAMP '2019-03-06 19:55:20.846', NULL, NULL, 'Wyoming', NULL, 1, 168),
(533, TIMESTAMP '2019-03-06 19:55:20.848', TIMESTAMP '2019-03-06 19:55:20.848', NULL, NULL, 'Wyoming', NULL, 2, 168),
(534, TIMESTAMP '2019-03-06 19:55:20.851', TIMESTAMP '2019-03-06 19:55:20.851', NULL, NULL, 'Burgenland', NULL, 1, 169),
(535, TIMESTAMP '2019-03-06 19:55:20.852', TIMESTAMP '2019-03-06 19:55:20.852', NULL, NULL, 'Burgenland', NULL, 2, 169),
(536, TIMESTAMP '2019-03-06 19:55:20.855', TIMESTAMP '2019-03-06 19:55:20.855', NULL, NULL, 'Avila', NULL, 1, 170),
(537, TIMESTAMP '2019-03-06 19:55:20.857', TIMESTAMP '2019-03-06 19:55:20.857', NULL, NULL, 'Avila', NULL, 2, 170),
(538, TIMESTAMP '2019-03-06 19:55:20.86', TIMESTAMP '2019-03-06 19:55:20.86', NULL, NULL, 'Oregon', NULL, 1, 171),
(539, TIMESTAMP '2019-03-06 19:55:20.862', TIMESTAMP '2019-03-06 19:55:20.862', NULL, NULL, 'Oregon', NULL, 2, 171),
(540, TIMESTAMP '2019-03-06 19:55:20.865', TIMESTAMP '2019-03-06 19:55:20.865', NULL, NULL, 'Salamanca', NULL, 1, 172),
(541, TIMESTAMP '2019-03-06 19:55:20.866', TIMESTAMP '2019-03-06 19:55:20.866', NULL, NULL, 'Salamanca', NULL, 2, 172);             
INSERT INTO SALESMANAGER.ZONE_DESCRIPTION VALUES
(542, TIMESTAMP '2019-03-06 19:55:20.869', TIMESTAMP '2019-03-06 19:55:20.869', NULL, NULL, 'Glarus', NULL, 1, 173),
(543, TIMESTAMP '2019-03-06 19:55:20.871', TIMESTAMP '2019-03-06 19:55:20.871', NULL, NULL, 'Glarus', NULL, 2, 173),
(544, TIMESTAMP '2019-03-06 19:55:20.874', TIMESTAMP '2019-03-06 19:55:20.874', NULL, NULL, 'Baleares', NULL, 1, 174),
(545, TIMESTAMP '2019-03-06 19:55:20.875', TIMESTAMP '2019-03-06 19:55:20.875', NULL, NULL, 'Baleares', NULL, 2, 174),
(546, TIMESTAMP '2019-03-06 19:55:20.879', TIMESTAMP '2019-03-06 19:55:20.879', NULL, NULL, 'Obwalden', NULL, 1, 175),
(547, TIMESTAMP '2019-03-06 19:55:20.881', TIMESTAMP '2019-03-06 19:55:20.881', NULL, NULL, 'Obwalden', NULL, 2, 175),
(548, TIMESTAMP '2019-03-06 19:55:20.884', TIMESTAMP '2019-03-06 19:55:20.884', NULL, NULL, 'Graubnden', NULL, 1, 176),
(549, TIMESTAMP '2019-03-06 19:55:20.885', TIMESTAMP '2019-03-06 19:55:20.885', NULL, NULL, 'Graubnden', NULL, 2, 176),
(550, TIMESTAMP '2019-03-06 19:55:20.888', TIMESTAMP '2019-03-06 19:55:20.888', NULL, NULL, 'Guam', NULL, 1, 177),
(551, TIMESTAMP '2019-03-06 19:55:20.89', TIMESTAMP '2019-03-06 19:55:20.89', NULL, NULL, 'Guam', NULL, 2, 177),
(552, TIMESTAMP '2019-03-06 19:55:20.893', TIMESTAMP '2019-03-06 19:55:20.893', NULL, NULL, 'Pennsylvania', NULL, 1, 178),
(553, TIMESTAMP '2019-03-06 19:55:20.895', TIMESTAMP '2019-03-06 19:55:20.895', NULL, NULL, 'Pennsylvanie', NULL, 2, 178),
(554, TIMESTAMP '2019-03-06 19:55:20.898', TIMESTAMP '2019-03-06 19:55:20.898', NULL, NULL, 'Victoria', NULL, 1, 179),
(555, TIMESTAMP '2019-03-06 19:55:20.899', TIMESTAMP '2019-03-06 19:55:20.899', NULL, NULL, 'Victoria', NULL, 2, 179),
(556, TIMESTAMP '2019-03-06 19:55:20.902', TIMESTAMP '2019-03-06 19:55:20.902', NULL, NULL, 'Bremen', NULL, 1, 180),
(557, TIMESTAMP '2019-03-06 19:55:20.903', TIMESTAMP '2019-03-06 19:55:20.903', NULL, NULL, 'Bremen', NULL, 2, 180),
(558, TIMESTAMP '2019-03-06 19:55:20.906', TIMESTAMP '2019-03-06 19:55:20.906', NULL, NULL, 'Prince Edward Island', NULL, 1, 181),
(559, TIMESTAMP '2019-03-06 19:55:20.908', TIMESTAMP '2019-03-06 19:55:20.908', NULL, NULL, STRINGDECODE('\u00cele-du-Prince-\u00c9douard'), NULL, 2, 181),
(560, TIMESTAMP '2019-03-06 19:55:20.911', TIMESTAMP '2019-03-06 19:55:20.911', NULL, NULL, 'Brandenburg', NULL, 1, 182),
(561, TIMESTAMP '2019-03-06 19:55:20.913', TIMESTAMP '2019-03-06 19:55:20.913', NULL, NULL, 'Brandenburg', NULL, 2, 182),
(562, TIMESTAMP '2019-03-06 19:55:20.916', TIMESTAMP '2019-03-06 19:55:20.916', NULL, NULL, 'Hessen', NULL, 1, 183),
(563, TIMESTAMP '2019-03-06 19:55:20.918', TIMESTAMP '2019-03-06 19:55:20.918', NULL, NULL, 'Hessen', NULL, 2, 183),
(564, TIMESTAMP '2019-03-06 19:55:20.92', TIMESTAMP '2019-03-06 19:55:20.92', NULL, NULL, 'Almeria', NULL, 1, 184),
(565, TIMESTAMP '2019-03-06 19:55:20.922', TIMESTAMP '2019-03-06 19:55:20.922', NULL, NULL, 'Almeria', NULL, 2, 184),
(566, TIMESTAMP '2019-03-06 19:55:20.925', TIMESTAMP '2019-03-06 19:55:20.925', NULL, NULL, 'Baden-Wrttemberg', NULL, 1, 185),
(567, TIMESTAMP '2019-03-06 19:55:20.927', TIMESTAMP '2019-03-06 19:55:20.927', NULL, NULL, 'Baden-Wrttemberg', NULL, 2, 185),
(568, TIMESTAMP '2019-03-06 19:55:20.93', TIMESTAMP '2019-03-06 19:55:20.93', NULL, NULL, 'Bayern', NULL, 1, 186),
(569, TIMESTAMP '2019-03-06 19:55:20.932', TIMESTAMP '2019-03-06 19:55:20.932', NULL, NULL, 'Bayern', NULL, 2, 186),
(570, TIMESTAMP '2019-03-06 19:55:20.935', TIMESTAMP '2019-03-06 19:55:20.935', NULL, NULL, 'Navarra', NULL, 1, 187),
(571, TIMESTAMP '2019-03-06 19:55:20.936', TIMESTAMP '2019-03-06 19:55:20.936', NULL, NULL, 'Navarra', NULL, 2, 187),
(572, TIMESTAMP '2019-03-06 19:55:20.939', TIMESTAMP '2019-03-06 19:55:20.939', NULL, NULL, 'Valencia', NULL, 1, 188),
(573, TIMESTAMP '2019-03-06 19:55:20.941', TIMESTAMP '2019-03-06 19:55:20.941', NULL, NULL, 'Valencia', NULL, 2, 188),
(574, TIMESTAMP '2019-03-06 19:55:20.944', TIMESTAMP '2019-03-06 19:55:20.944', NULL, NULL, 'Schleswig-Holstein', NULL, 1, 189),
(575, TIMESTAMP '2019-03-06 19:55:20.946', TIMESTAMP '2019-03-06 19:55:20.946', NULL, NULL, 'Schleswig-Holstein', NULL, 2, 189);          
CREATE TABLE SALESMANAGER.SHIPPING_QUOTE(
    SHIPPING_QUOTE_ID BIGINT NOT NULL,
    CART_ID BIGINT,
    CUSTOMER_ID BIGINT,
    DELIVERY_STREET_ADDRESS VARCHAR(256),
    DELIVERY_CITY VARCHAR(100),
    DELIVERY_COMPANY VARCHAR(100),
    DELIVERY_FIRST_NAME VARCHAR(64),
    DELIVERY_LAST_NAME VARCHAR(64),
    DELIVERY_POSTCODE VARCHAR(20),
    DELIVERY_STATE VARCHAR(100),
    DELIVERY_TELEPHONE VARCHAR(32),
    SHIPPING_NUMBER_DAYS INTEGER,
    FREE_SHIPPING BOOLEAN,
    QUOTE_HANDLING DECIMAL(19, 2),
    MODULE VARCHAR(255) NOT NULL,
    OPTION_CODE VARCHAR(255),
    OPTION_DELIVERY_DATE TIMESTAMP,
    OPTION_NAME VARCHAR(255),
    OPTION_SHIPPING_DATE TIMESTAMP,
    ORDER_ID BIGINT,
    QUOTE_PRICE DECIMAL(19, 2),
    QUOTE_DATE TIMESTAMP,
    DELIVERY_COUNTRY_ID INTEGER,
    DELIVERY_ZONE_ID BIGINT,
    IP_ADDRESS VARCHAR(255)
);      
ALTER TABLE SALESMANAGER.SHIPPING_QUOTE ADD PRIMARY KEY(SHIPPING_QUOTE_ID);    
-- 47 +/- SELECT COUNT(*) FROM SALESMANAGER.SHIPPING_QUOTE;    
INSERT INTO SALESMANAGER.SHIPPING_QUOTE VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:12:15.991', NULL, 0.00, TIMESTAMP '2019-03-06 22:12:15.991', 13, 8, NULL),
(2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:10.225', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:10.225', 13, 8, NULL),
(3, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, '', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:17.797', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:17.797', 13, 166, NULL),
(4, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2019-03-06 22:20:17.797', NULL, 14.00, TIMESTAMP '2019-03-06 22:20:17.798', 13, 166, NULL),
(5, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2019-03-06 22:20:17.798', NULL, 14.00, TIMESTAMP '2019-03-06 22:20:17.798', 13, 166, NULL),
(6, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:17.798', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:17.798', 13, 166, NULL),
(7, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:17.799', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:17.799', 13, 166, NULL),
(8, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2019-03-06 22:20:18.378', NULL, 14.00, TIMESTAMP '2019-03-06 22:20:18.378', 13, 166, NULL),
(9, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:18.379', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:18.379', 13, 166, NULL),
(10, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'H2B 3H2', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2019-03-06 22:20:44.233', NULL, 14.00, TIMESTAMP '2019-03-06 22:20:44.233', 13, 166, NULL),
(11, 1, NULL, '123 E Street', 'Toronto', '', NULL, NULL, 'H2B 3H2', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:44.234', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:44.234', 13, 166, NULL),
(12, 1, NULL, '123 E Street', 'Toronto', '2018-12-12', NULL, NULL, 'H2H-2H2', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2019-03-06 22:20:56.373', NULL, 14.00, TIMESTAMP '2019-03-06 22:20:56.373', 13, 166, NULL),
(13, 1, NULL, '123 E Street', 'Toronto', '2018-12-12', NULL, NULL, 'H2H-2H2', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:56.373', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:56.374', 13, 166, NULL),
(14, 1, NULL, '123 E Street', 'Toronto', '2018-12-12', NULL, NULL, 'H2H-2H2', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2019-03-06 22:20:56.375', NULL, 14.00, TIMESTAMP '2019-03-06 22:20:56.375', 13, 166, NULL),
(15, 1, NULL, '123 E Street', 'Toronto', '2018-12-12', NULL, NULL, 'H2H-2H2', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:20:56.376', NULL, 0.00, TIMESTAMP '2019-03-06 22:20:56.376', 13, 166, NULL),
(16, 1, NULL, '123 E Street', 'Toronto', '2018-12-12', NULL, NULL, 'H2H 2H2', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2019-03-06 22:21:14.707', NULL, 14.00, TIMESTAMP '2019-03-06 22:21:14.707', 13, 166, NULL),
(17, 1, NULL, '123 E Street', 'Toronto', '2018-12-12', NULL, NULL, 'H2H 2H2', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-03-06 22:21:14.708', NULL, 0.00, TIMESTAMP '2019-03-06 22:21:14.708', 13, 166, NULL);       
INSERT INTO SALESMANAGER.SHIPPING_QUOTE VALUES
(50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2019-12-23 13:57:27.032', NULL, 0.00, TIMESTAMP '2019-12-23 13:57:27.032', 13, 8, NULL),
(100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-03-13 10:43:43.38', NULL, 0.00, TIMESTAMP '2020-03-13 10:43:43.38', 13, 8, NULL),
(150, 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:24:16.234', NULL, 0.00, TIMESTAMP '2020-09-01 08:24:16.234', 13, 8, '0:0:0:0:0:0:0:1'),
(151, 150, NULL, '358 Rue du Languedoc, Boucherville, QC, Canada, 358 Rue du Languedoc', 'Boucherville', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:24:40.093', NULL, 14.00, TIMESTAMP '2020-09-01 08:24:40.093', 13, 8, '0:0:0:0:0:0:0:1'),
(152, 150, NULL, '358 Rue du Languedoc, Boucherville, QC, Canada, 358 Rue du Languedoc', 'Boucherville', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:24:40.093', NULL, 14.00, TIMESTAMP '2020-09-01 08:24:40.093', 13, 8, '0:0:0:0:0:0:0:1'),
(153, 150, NULL, '358 Rue du Languedoc, Boucherville, QC, Canada, 358 Rue du Languedoc', 'Boucherville', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:24:40.105', NULL, 0.00, TIMESTAMP '2020-09-01 08:24:40.105', 13, 8, '0:0:0:0:0:0:0:1'),
(154, 150, NULL, '358 Rue du Languedoc, Boucherville, QC, Canada, 358 Rue du Languedoc', 'Boucherville', '', NULL, NULL, 'J4B 8J9', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:24:40.109', NULL, 0.00, TIMESTAMP '2020-09-01 08:24:40.109', 13, 8, '0:0:0:0:0:0:0:1'),
(155, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:25:07.034', NULL, 14.00, TIMESTAMP '2020-09-01 08:25:07.034', 13, 8, '0:0:0:0:0:0:0:1'),
(156, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:25:07.04', NULL, 0.00, TIMESTAMP '2020-09-01 08:25:07.04', 13, 8, '0:0:0:0:0:0:0:1'),
(157, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:25:07.578', NULL, 14.00, TIMESTAMP '2020-09-01 08:25:07.578', 13, 8, '0:0:0:0:0:0:0:1'),
(158, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:25:07.583', NULL, 0.00, TIMESTAMP '2020-09-01 08:25:07.583', 13, 8, '0:0:0:0:0:0:0:1'),
(159, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:25:11.287', NULL, 14.00, TIMESTAMP '2020-09-01 08:25:11.287', 13, 8, '0:0:0:0:0:0:0:1'),
(160, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:25:11.289', NULL, 0.00, TIMESTAMP '2020-09-01 08:25:11.289', 13, 8, '0:0:0:0:0:0:0:1'),
(161, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:25:13.542', NULL, 14.00, TIMESTAMP '2020-09-01 08:25:13.542', 13, 8, '0:0:0:0:0:0:0:1'),
(162, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:25:13.547', NULL, 0.00, TIMESTAMP '2020-09-01 08:25:13.547', 13, 8, '0:0:0:0:0:0:0:1');              
INSERT INTO SALESMANAGER.SHIPPING_QUOTE VALUES
(163, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:25:26.003', NULL, 14.00, TIMESTAMP '2020-09-01 08:25:26.003', 13, 8, '0:0:0:0:0:0:0:1'),
(164, 150, NULL, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', NULL, NULL, 'J4B 8J7', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:25:26.008', NULL, 0.00, TIMESTAMP '2020-09-01 08:25:26.008', 13, 8, '0:0:0:0:0:0:0:1'),
(165, 151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:26:29.021', NULL, 0.00, TIMESTAMP '2020-09-01 08:26:29.021', 13, 8, '0:0:0:0:0:0:0:1'),
(166, 151, NULL, '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', NULL, NULL, 'H3K 2C7', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:26:39.229', NULL, 14.00, TIMESTAMP '2020-09-01 08:26:39.229', 13, 8, '0:0:0:0:0:0:0:1'),
(167, 151, NULL, '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', NULL, NULL, 'H3K 2C7', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:26:39.23', NULL, 14.00, TIMESTAMP '2020-09-01 08:26:39.23', 13, 8, '0:0:0:0:0:0:0:1'),
(168, 151, NULL, '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', NULL, NULL, 'H3K 2C7', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:26:39.231', NULL, 0.00, TIMESTAMP '2020-09-01 08:26:39.231', 13, 8, '0:0:0:0:0:0:0:1'),
(169, 151, NULL, '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', NULL, NULL, 'H3K 2C7', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:26:39.232', NULL, 0.00, TIMESTAMP '2020-09-01 08:26:39.232', 13, 8, '0:0:0:0:0:0:0:1'),
(170, 151, NULL, '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', NULL, NULL, 'H3K 2C7', '', NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2020-09-01 08:26:50.28', NULL, 14.00, TIMESTAMP '2020-09-01 08:26:50.28', 13, 8, '0:0:0:0:0:0:0:1'),
(171, 151, NULL, '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', NULL, NULL, 'H3K 2C7', '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-01 08:26:50.282', NULL, 0.00, TIMESTAMP '2020-09-01 08:26:50.282', 13, 8, '0:0:0:0:0:0:0:1'),
(200, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-09-29 19:18:48.559', NULL, 0.00, TIMESTAMP '2020-09-29 19:18:48.559', 13, 8, '0:0:0:0:0:0:0:1'),
(250, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2020-12-01 13:44:56.534', NULL, 0.00, TIMESTAMP '2020-12-01 13:44:56.534', 13, 8, '0:0:0:0:0:0:0:1'),
(300, 350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2021-02-06 21:13:45.188', NULL, 0.00, TIMESTAMP '2021-02-06 21:13:45.188', 13, 8, '0:0:0:0:0:0:0:1'),
(350, 400, NULL, NULL, NULL, NULL, NULL, NULL, 'J4B8J9', NULL, NULL, NULL, FALSE, NULL, 'weightBased', 'CUSTOM_WEIGHT', NULL, 'Canada', TIMESTAMP '2021-02-06 21:22:42.957', NULL, 14.00, TIMESTAMP '2021-02-06 21:22:42.957', 13, NULL, '0:0:0:0:0:0:0:1'),
(351, 400, NULL, NULL, NULL, NULL, NULL, NULL, 'J4B8J9', NULL, NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2021-02-06 21:22:42.972', NULL, 0.00, TIMESTAMP '2021-02-06 21:22:42.972', 13, NULL, '0:0:0:0:0:0:0:1'),
(352, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, FALSE, NULL, 'storePickUp', 'storePickUp', NULL, NULL, TIMESTAMP '2021-02-06 21:23:04.652', NULL, 0.00, TIMESTAMP '2021-02-06 21:23:04.652', 13, NULL, '0:0:0:0:0:0:0:1');
CREATE TABLE SALESMANAGER.PRODUCT_PRICE_DESCRIPTION(
    DESCRIPTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    DESCRIPTION TEXT,
    NAME VARCHAR(120) NOT NULL,
    TITLE VARCHAR(100),
    LANGUAGE_ID INTEGER NOT NULL,
    PRODUCT_PRICE_ID BIGINT NOT NULL,
    PRICE_APPENDER VARCHAR(255)
);              
ALTER TABLE SALESMANAGER.PRODUCT_PRICE_DESCRIPTION ADD PRIMARY KEY(DESCRIPTION_ID);            
-- 20 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_PRICE_DESCRIPTION;         
INSERT INTO SALESMANAGER.PRODUCT_PRICE_DESCRIPTION VALUES
(800, TIMESTAMP '2019-03-06 22:03:30.266', TIMESTAMP '2019-03-06 22:03:30.266', NULL, NULL, 'DEFAULT', NULL, 2, 1, NULL),
(801, TIMESTAMP '2019-03-06 22:17:48.572', TIMESTAMP '2019-03-06 22:17:48.572', NULL, NULL, 'DEFAULT', NULL, 1, 1, NULL),
(802, TIMESTAMP '2019-03-06 22:03:30.62', TIMESTAMP '2019-03-06 22:03:30.62', NULL, NULL, 'DEFAULT', NULL, 2, 2, NULL),
(803, TIMESTAMP '2019-03-06 22:15:23.59', TIMESTAMP '2019-03-06 22:15:23.59', NULL, NULL, 'DEFAULT', NULL, 1, 2, NULL),
(804, TIMESTAMP '2019-03-06 22:16:14.17', TIMESTAMP '2019-03-06 22:16:14.17', NULL, NULL, 'DEFAULT', NULL, 1, 3, NULL),
(805, TIMESTAMP '2019-03-06 22:03:30.741', TIMESTAMP '2019-03-06 22:03:30.741', NULL, NULL, 'DEFAULT', NULL, 2, 3, NULL),
(806, TIMESTAMP '2019-03-06 22:15:02.093', TIMESTAMP '2019-03-06 22:15:02.093', NULL, NULL, 'DEFAULT', NULL, 1, 4, NULL),
(807, TIMESTAMP '2019-03-06 22:03:30.843', TIMESTAMP '2019-03-06 22:03:30.843', NULL, NULL, 'DEFAULT', NULL, 2, 4, NULL),
(808, TIMESTAMP '2019-03-06 22:15:51.502', TIMESTAMP '2019-03-06 22:15:51.502', NULL, NULL, 'DEFAULT', NULL, 1, 5, NULL),
(809, TIMESTAMP '2019-03-06 22:03:30.953', TIMESTAMP '2019-03-06 22:03:30.953', NULL, NULL, 'DEFAULT', NULL, 2, 5, NULL),
(810, TIMESTAMP '2019-03-06 22:17:29.239', TIMESTAMP '2019-03-06 22:17:29.239', NULL, NULL, 'DEFAULT', NULL, 1, 6, NULL),
(811, TIMESTAMP '2019-03-06 22:03:31.061', TIMESTAMP '2019-03-06 22:03:31.061', NULL, NULL, 'DEFAULT', NULL, 2, 6, NULL),
(812, TIMESTAMP '2019-03-06 22:03:31.169', TIMESTAMP '2019-03-06 22:03:31.169', NULL, NULL, 'DEFAULT', NULL, 2, 7, NULL),
(813, TIMESTAMP '2019-03-06 22:17:12.556', TIMESTAMP '2019-03-06 22:17:12.556', NULL, NULL, 'DEFAULT', NULL, 1, 7, NULL),
(814, TIMESTAMP '2019-03-06 22:03:31.282', TIMESTAMP '2019-03-06 22:03:31.282', NULL, NULL, 'DEFAULT', NULL, 2, 8, NULL),
(815, TIMESTAMP '2019-03-06 22:16:36.43', TIMESTAMP '2019-03-06 22:16:36.43', NULL, NULL, 'DEFAULT', NULL, 1, 8, NULL),
(816, TIMESTAMP '2019-03-06 22:16:56.986', TIMESTAMP '2019-03-06 22:16:56.986', NULL, NULL, 'DEFAULT', NULL, 1, 9, NULL),
(817, TIMESTAMP '2019-03-06 22:03:31.378', TIMESTAMP '2019-03-06 22:03:31.378', NULL, NULL, 'DEFAULT', NULL, 2, 9, NULL),
(818, TIMESTAMP '2019-03-06 22:03:31.477', TIMESTAMP '2019-03-06 22:03:31.477', NULL, NULL, 'DEFAULT', NULL, 2, 10, NULL),
(819, TIMESTAMP '2019-03-06 22:14:39.309', TIMESTAMP '2019-03-06 22:14:39.309', NULL, NULL, 'DEFAULT', NULL, 1, 10, NULL);
CREATE TABLE SALESMANAGER.ORDERS(
    ORDER_ID BIGINT NOT NULL,
    BILLING_STREET_ADDRESS VARCHAR(256),
    BILLING_CITY VARCHAR(100),
    BILLING_COMPANY VARCHAR(100),
    BILLING_FIRST_NAME VARCHAR(64) NOT NULL,
    BILLING_LAST_NAME VARCHAR(64) NOT NULL,
    LATITUDE VARCHAR(100),
    LONGITUDE VARCHAR(100),
    BILLING_POSTCODE VARCHAR(20),
    BILLING_STATE VARCHAR(100),
    BILLING_TELEPHONE VARCHAR(32),
    CHANNEL VARCHAR(255),
    CONFIRMED_ADDRESS BOOLEAN,
    CARD_TYPE VARCHAR(255),
    CC_CVV VARCHAR(255),
    CC_EXPIRES VARCHAR(255),
    CC_NUMBER VARCHAR(255),
    CC_OWNER VARCHAR(255),
    CURRENCY_VALUE DECIMAL(19, 2),
    CUSTOMER_AGREED BOOLEAN,
    CUSTOMER_EMAIL_ADDRESS VARCHAR(50) NOT NULL,
    CUSTOMER_ID BIGINT,
    DATE_PURCHASED DATE,
    DELIVERY_STREET_ADDRESS VARCHAR(256),
    DELIVERY_CITY VARCHAR(100),
    DELIVERY_COMPANY VARCHAR(100),
    DELIVERY_FIRST_NAME VARCHAR(64),
    DELIVERY_LAST_NAME VARCHAR(64),
    DELIVERY_POSTCODE VARCHAR(20),
    DELIVERY_STATE VARCHAR(100),
    DELIVERY_TELEPHONE VARCHAR(32),
    IP_ADDRESS VARCHAR(255),
    LAST_MODIFIED TIMESTAMP,
    LOCALE VARCHAR(255),
    ORDER_DATE_FINISHED TIMESTAMP,
    ORDER_TYPE VARCHAR(255),
    PAYMENT_MODULE_CODE VARCHAR(255),
    PAYMENT_TYPE VARCHAR(255),
    SHIPPING_MODULE_CODE VARCHAR(255),
    ORDER_STATUS VARCHAR(255),
    ORDER_TOTAL DECIMAL(19, 2),
    BILLING_COUNTRY_ID INTEGER NOT NULL,
    BILLING_ZONE_ID BIGINT,
    CURRENCY_ID BIGINT,
    DELIVERY_COUNTRY_ID INTEGER,
    DELIVERY_ZONE_ID BIGINT,
    MERCHANTID INTEGER,
    CART_CODE VARCHAR(255)
);     
ALTER TABLE SALESMANAGER.ORDERS ADD PRIMARY KEY(ORDER_ID);     
-- 3 +/- SELECT COUNT(*) FROM SALESMANAGER.ORDERS;             
INSERT INTO SALESMANAGER.ORDERS VALUES
(1, '123 E Street', 'Toronto', NULL, 'John', 'Doe', NULL, NULL, 'H2H 2H2', '', '8888888888', NULL, FALSE, NULL, NULL, NULL, NULL, NULL, 1.00, FALSE, 'test@gmail.com', 1, DATE '2019-03-06', '123 E Street', 'Toronto', NULL, 'John', 'Doe', 'H2H 2H2', '', NULL, NULL, TIMESTAMP '2020-12-23 22:29:45.052', 'en_US', NULL, 'ORDER', 'moneyorder', 'MONEYORDER', 'weightBased', 'ORDERED', 63.00, 13, 166, 61, 13, 166, 1, NULL),
(50, '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', 'Carl', 'X', NULL, NULL, 'J4B 8J7', '', '5148047865', NULL, FALSE, NULL, NULL, NULL, NULL, NULL, 1.00, FALSE, 'csamson777@yahoo.com', 50, DATE '2020-08-31', '134 Rue du Languedoc, Boucherville, QC, Canada', 'Boucherville', '', 'Carl', 'X', 'J4B 8J7', '', '5148047865', '0:0:0:0:0:0:0:1', NULL, 'en_US', NULL, 'ORDER', 'moneyorder', 'MONEYORDER', 'weightBased', 'ORDERED', 74.00, 13, 8, 61, 13, 8, 1, '5fdf4a8203b541ccbbdb73f66a182666'),
(51, '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', 'Johny', 'Utah', NULL, NULL, 'H3K 2C7', '', '4445556666', NULL, FALSE, NULL, NULL, NULL, NULL, NULL, 1.00, FALSE, 'test@test.com', 51, DATE '2020-08-31', '325 Rue Bridge', 'Montr&eacute;al', 'CSTI Consulting', 'Johny', 'Utah', 'H3K 2C7', '', '4445556666', '0:0:0:0:0:0:0:1', NULL, 'en_US', NULL, 'ORDER', 'moneyorder', 'MONEYORDER', 'weightBased', 'ORDERED', 92.00, 13, 8, 61, 13, 8, 1, '72a17875d1544dfc93e0c87d9590c93c');              
CREATE TABLE SALESMANAGER.CATALOG_ENTRY(
    ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    VISIBLE BOOLEAN,
    CATALOG_ID BIGINT NOT NULL,
    CATEGORY_ID BIGINT NOT NULL,
    PRODUCT_ID BIGINT NOT NULL
);          
ALTER TABLE SALESMANAGER.CATALOG_ENTRY ADD PRIMARY KEY(ID);    
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CATALOG_ENTRY;      
CREATE TABLE SALESMANAGER.PRODUCT_VAR_IMAGE(
    PRODUCT_VAR_IMAGE_ID BIGINT NOT NULL,
    DEFAULT_IMAGE BOOLEAN,
    PRODUCT_IMAGE VARCHAR(255),
    PRODUCT_AVAIL_ID BIGINT NOT NULL
);   
ALTER TABLE SALESMANAGER.PRODUCT_VAR_IMAGE ADD PRIMARY KEY(PRODUCT_VAR_IMAGE_ID);             
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_VAR_IMAGE;  
CREATE TABLE SALESMANAGER.PRODUCT_VARIATION(
    PRODUCT_VARIANTION_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(60),
    CODE VARCHAR(100) NOT NULL,
    MERCHANT_ID INTEGER NOT NULL,
    PRODUCT_OPTION_ID BIGINT NOT NULL,
    OPTION_VALUE_ID BIGINT NOT NULL
);           
ALTER TABLE SALESMANAGER.PRODUCT_VARIATION ADD PRIMARY KEY(PRODUCT_VARIANTION_ID);            
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_VARIATION;  
CREATE TABLE SALESMANAGER.CATALOG(
    ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    CODE VARCHAR(100) NOT NULL,
    DEFAULT_CATALOG BOOLEAN,
    VISIBLE BOOLEAN,
    MERCHANT_ID INTEGER NOT NULL,
    SORT_ORDER INTEGER
);        
ALTER TABLE SALESMANAGER.CATALOG ADD PRIMARY KEY(ID);          
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.CATALOG;            
CREATE TABLE SALESMANAGER.PRODUCT_OPT_SET_PRD_TYPE(
    PRODUCTOPTIONSET_PRODUCT_OPTION_SET_ID BIGINT NOT NULL,
    PRODUCTTYPES_PRODUCT_TYPE_ID BIGINT NOT NULL
);             
ALTER TABLE SALESMANAGER.PRODUCT_OPT_SET_PRD_TYPE ADD PRIMARY KEY(PRODUCTOPTIONSET_PRODUCT_OPTION_SET_ID, PRODUCTTYPES_PRODUCT_TYPE_ID);     
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_OPT_SET_PRD_TYPE;           
CREATE TABLE SALESMANAGER.AVAILABILITY_VARIATION(
    PRODUCT_AVAIL_ID BIGINT NOT NULL,
    PRODUCT_VARIANTION_ID BIGINT NOT NULL
);            
ALTER TABLE SALESMANAGER.AVAILABILITY_VARIATION ADD PRIMARY KEY(PRODUCT_AVAIL_ID, PRODUCT_VARIANTION_ID);    
-- 0 +/- SELECT COUNT(*) FROM SALESMANAGER.AVAILABILITY_VARIATION;             
CREATE TABLE SALESMANAGER.PRODUCT_AVAILABILITY(
    PRODUCT_AVAIL_ID BIGINT NOT NULL,
    DATE_AVAILABLE DATE,
    FREE_SHIPPING BOOLEAN,
    QUANTITY INTEGER,
    QUANTITY_ORD_MAX INTEGER,
    QUANTITY_ORD_MIN INTEGER,
    STATUS BOOLEAN,
    REGION VARCHAR(255),
    REGION_VARIANT VARCHAR(255),
    PRODUCT_ID BIGINT NOT NULL,
    DATE_CREATED TIMESTAMP,
    DATE_MODIFIED TIMESTAMP,
    UPDT_ID VARCHAR(20),
    AVAILABLE BOOLEAN,
    OWNER VARCHAR(255),
    MERCHANT_ID INTEGER,
    HEIGHT DECIMAL(19, 2),
    LENGTH DECIMAL(19, 2),
    WEIGHT DECIMAL(19, 2),
    WIDTH DECIMAL(19, 2),
    SKU VARCHAR(255)
);    
ALTER TABLE SALESMANAGER.PRODUCT_AVAILABILITY ADD PRIMARY KEY(PRODUCT_AVAIL_ID);              
-- 10 +/- SELECT COUNT(*) FROM SALESMANAGER.PRODUCT_AVAILABILITY;              
INSERT INTO SALESMANAGER.PRODUCT_AVAILABILITY VALUES
(1, NULL, FALSE, 20, 1, 1, TRUE, '*', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, FALSE, 12, 1, 1, TRUE, '*', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, FALSE, 18, 1, 1, TRUE, '*', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, FALSE, 13, 1, 1, TRUE, '*', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, FALSE, 9, 1, 1, TRUE, '*', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, FALSE, 9, 1, 1, TRUE, '*', NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, FALSE, 15, 1, 1, TRUE, '*', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, FALSE, 23, 1, 1, TRUE, '*', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, FALSE, 15, 1, 1, TRUE, '*', NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, FALSE, 25, 1, 1, TRUE, '*', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);   
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT UK6V48AV32RLI7QU9M3KSB32ART UNIQUE(MERCHANT_ID, CUSTOMER_NICK);      
ALTER TABLE SALESMANAGER.MANUFACTURER ADD CONSTRAINT UK6BRQFDKGA7JC78N8DH3V595Y3 UNIQUE(MERCHANT_ID, CODE);           
ALTER TABLE SALESMANAGER.CATALOG ADD CONSTRAINT UK32MUBPUBTAQU30N34BWL7XIIS UNIQUE(MERCHANT_ID, CODE);
ALTER TABLE SALESMANAGER.PRODUCT ADD CONSTRAINT UKS8OFSN9PEHDRSTJG52J5QABXH UNIQUE(MERCHANT_ID, SKU); 
ALTER TABLE SALESMANAGER.CURRENCY ADD CONSTRAINT UK_M7KU15EKUD52VP67RY73A36TE UNIQUE(CURRENCY_CURRENCY_CODE);           
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_VALUE ADD CONSTRAINT UKIXBPI4HXRHLJH935C3XFVNVSH UNIQUE(MERCHANT_ID, PRODUCT_OPTION_VAL_CODE);
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW ADD CONSTRAINT UK9EW5IDGDBK8A77534HBNHD4YB UNIQUE(CUSTOMERS_ID, PRODUCT_ID);  
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_SET ADD CONSTRAINT UKK1QQ8J685UJ17BYLGNKRA1N5F UNIQUE(MERCHANT_ID, PRODUCT_OPTION_SET_CODE);  
ALTER TABLE SALESMANAGER.PRODUCT_PRICE_DESCRIPTION ADD CONSTRAINT UKFRSW8D41SXXOGVXXOYD8NWAXU UNIQUE(PRODUCT_PRICE_ID, LANGUAGE_ID);  
ALTER TABLE SALESMANAGER.CONTENT ADD CONSTRAINT UKT1V2LD0MRWVIQUQOURQL4UUB0 UNIQUE(MERCHANT_ID, CODE);
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW ADD CONSTRAINT UK2MOMTHBFRTGICO2YYOD8W18PK UNIQUE(CUSTOMERS_ID, REVIEWED_CUSTOMER_ID);       
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_DESC ADD CONSTRAINT UK6OVL4T1CIAG1WUBTCEBAOO7VI UNIQUE(CUSTOMER_OPTION_ID, LANGUAGE_ID);     
ALTER TABLE SALESMANAGER.CURRENCY ADD CONSTRAINT UK_1UBR7N96HJAJAMTGGQP090A4X UNIQUE(CURRENCY_CODE);    
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW_DESCRIPTION ADD CONSTRAINT UK1VA9Q0NHOE3WLI25KTPMOUVYH UNIQUE(CUSTOMER_REVIEW_ID, LANGUAGE_ID);              
ALTER TABLE SALESMANAGER.PRODUCT_TYPE_DESCRIPTION ADD CONSTRAINT UKBNRA4LWQJKJU4YH04824SW6BE UNIQUE(PRODUCT_TYPE_ID, LANGUAGE_ID);    
ALTER TABLE SALESMANAGER.SM_GROUP ADD CONSTRAINT UK_T83RJSOML3O785OJ37LPQPYKO UNIQUE(GROUP_NAME);       
ALTER TABLE SALESMANAGER.TAX_RATE ADD CONSTRAINT UK8GH6L9N0XQ03B91SGLP62OELU UNIQUE(TAX_CODE, MERCHANT_ID);           
ALTER TABLE SALESMANAGER.TAX_CLASS ADD CONSTRAINT UKA4Q5Q57A8OEH2OJEO8DHR935K UNIQUE(MERCHANT_ID, TAX_CLASS_CODE);    
ALTER TABLE SALESMANAGER.MERCHANT_STORE ADD CONSTRAINT UK_4PVTSNQV4NLAO8725N9LDPGUF UNIQUE(STORE_CODE); 
ALTER TABLE SALESMANAGER.GEOZONE_DESCRIPTION ADD CONSTRAINT UKSOQ8O99W3C8YS3NTAMT5I4MAT UNIQUE(GEOZONE_ID, LANGUAGE_ID);              
ALTER TABLE SALESMANAGER.USERS ADD CONSTRAINT UKT2HV34K7G4PO0PVMMVT5C7VGO UNIQUE(MERCHANT_ID, ADMIN_NAME);            
ALTER TABLE SALESMANAGER.PRODUCT_IMAGE_DESCRIPTION ADD CONSTRAINT UKN7YHDJ6CCYDGF201GIBB882CD UNIQUE(PRODUCT_IMAGE_ID, LANGUAGE_ID);  
ALTER TABLE SALESMANAGER.USERS ADD CONSTRAINT UK_7RBCJ0GSTOLIJ2MP5G3XC7XFU UNIQUE(ADMIN_NAME);          
ALTER TABLE SALESMANAGER.ZONE_DESCRIPTION ADD CONSTRAINT UKM64LAXGRV9FXM6IO232AP4SU9 UNIQUE(ZONE_ID, LANGUAGE_ID);    
ALTER TABLE SALESMANAGER.CUSTOMER_ATTRIBUTE ADD CONSTRAINT UK46KBPRE88YH963GEWM3KMDNI1 UNIQUE(OPTION_ID, CUSTOMER_ID);
ALTER TABLE SALESMANAGER.SYSTEM_NOTIFICATION ADD CONSTRAINT UKNPDNLC390VGR2MHEPIB1MTRMR UNIQUE(MERCHANT_ID, CONFIG_KEY);              
ALTER TABLE SALESMANAGER.PRODUCT_OPTION ADD CONSTRAINT UKHFCW5OI9ULLJLOG1B7NS1R9TU UNIQUE(MERCHANT_ID, PRODUCT_OPTION_CODE);          
ALTER TABLE SALESMANAGER.CATALOG_ENTRY ADD CONSTRAINT UK5Q8159I414R299KIA2W9RE90K UNIQUE(CATEGORY_ID, CATALOG_ID);    
ALTER TABLE SALESMANAGER.MANUFACTURER_DESCRIPTION ADD CONSTRAINT UKLPV09P83SC887CLXE04NROUP6 UNIQUE(MANUFACTURER_ID, LANGUAGE_ID);    
ALTER TABLE SALESMANAGER.USERS ADD CONSTRAINT UK7CWROWCNJLFXPXPDD1OP9YMAB UNIQUE(MERCHANT_ID, ADMIN_NAME);            
ALTER TABLE SALESMANAGER.PRODUCT_DIGITAL ADD CONSTRAINT UKJUK1QGKH9V5W7GHVB18KRWO8V UNIQUE(PRODUCT_ID, FILE_NAME);    
ALTER TABLE SALESMANAGER.CURRENCY ADD CONSTRAINT UK_7R1K69CBK5GIEWQR5C9R4V6F UNIQUE(CURRENCY_NAME);     
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT UKAPR0M3G0LQGDJGTC2M8DMK267 UNIQUE(MERCHANT_ID, CUSTOMER_EMAIL_ADDRESS);             
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_VALUE_DESCRIPTION ADD CONSTRAINT UKASGC60OT1WY0UHO96N0J8429P UNIQUE(PRODUCT_OPTION_VALUE_ID, LANGUAGE_ID);    
ALTER TABLE SALESMANAGER.COUNTRY ADD CONSTRAINT UK_DQB99V22PT27V0TGEQO958E6X UNIQUE(COUNTRY_ISOCODE);   
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_VALUE ADD CONSTRAINT UKCB1FMV71NRX7M1RLX1FF5QVDT UNIQUE(MERCHANT_ID, CUSTOMER_OPT_VAL_CODE); 
ALTER TABLE SALESMANAGER.PRODUCT_ATTRIBUTE ADD CONSTRAINT UKO0C6CFXCFEJWFA2877GFGPUCO UNIQUE(OPTION_ID, OPTION_VALUE_ID, PRODUCT_ID);               
ALTER TABLE SALESMANAGER.FILE_HISTORY ADD CONSTRAINT UKAV35SB3V4NXQ8V1N1RKXUFIR UNIQUE(MERCHANT_ID, FILE_ID);         
ALTER TABLE SALESMANAGER.ZONE ADD CONSTRAINT UK_4TQ3P5W8K4H4EASYF5T3N1JDR UNIQUE(ZONE_CODE);            
ALTER TABLE SALESMANAGER.SHOPPING_CART ADD CONSTRAINT UK_8LD8P40FWRJOBI7T3N95PNA35 UNIQUE(SHP_CART_CODE);               
ALTER TABLE SALESMANAGER.CATEGORY_DESCRIPTION ADD CONSTRAINT UKBUESQQ6CYX7E5HY3MF30CFIEQ UNIQUE(CATEGORY_ID, LANGUAGE_ID);            
ALTER TABLE SALESMANAGER.MERCHANT_CONFIGURATION ADD CONSTRAINT UKJ0C3H8ONW3M6HJCR3YYLST9FB UNIQUE(MERCHANT_ID, CONFIG_KEY);           
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_SET ADD CONSTRAINT UK4PELI2RITNNQ2XQPYQ188SRM6 UNIQUE(CUSTOMER_OPTION_ID, CUSTOMER_OPTION_VALUE_ID);         
ALTER TABLE SALESMANAGER.PRODUCT_DESCRIPTION ADD CONSTRAINT UKQ4DNKX5B776AYQAS2H4RR2D8Q UNIQUE(PRODUCT_ID, LANGUAGE_ID);              
ALTER TABLE SALESMANAGER.PERMISSION ADD CONSTRAINT UK_SS26HGWETKJ8MS5Y5JN2CO4J3 UNIQUE(PERMISSION_NAME);
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_DESC ADD CONSTRAINT UKMKCM8ISYYYQBJD1YYB8MRPKUW UNIQUE(PRODUCT_OPTION_ID, LANGUAGE_ID);       
ALTER TABLE SALESMANAGER.PRODUCT_VARIATION ADD CONSTRAINT UKI8SA74FV4IO0SIGMGVQXYPP0D UNIQUE(MERCHANT_ID, PRODUCT_OPTION_ID, OPTION_VALUE_ID);      
ALTER TABLE SALESMANAGER.CATEGORY ADD CONSTRAINT UK3MQ9I6QMGQUVOIESLX39PEJ6X UNIQUE(MERCHANT_ID, CODE);               
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW_DESCRIPTION ADD CONSTRAINT UKQNO5WJDTCJ8PM3YKKKH7T4RXJ UNIQUE(PRODUCT_REVIEW_ID, LANGUAGE_ID);
ALTER TABLE SALESMANAGER.CUSTOMER_OPT_VAL_DESCRIPTION ADD CONSTRAINT UKGE7F2T1D31R87WNK09H9U1TNV UNIQUE(CUSTOMER_OPT_VAL_ID, LANGUAGE_ID);            
ALTER TABLE SALESMANAGER.OPTIN ADD CONSTRAINT UKMANLX6SIQ6DDF14CUD40K8GW6 UNIQUE(MERCHANT_ID, CODE);  
ALTER TABLE SALESMANAGER.CATALOG_ENTRY ADD CONSTRAINT UKENVPF5BRCG399WEJ8E2OQ1QD2 UNIQUE(PRODUCT_ID, CATEGORY_ID, CATALOG_ID);      
ALTER TABLE SALESMANAGER.CONTENT_DESCRIPTION ADD CONSTRAINT UKN0W5R7CTBP88R4RVK7AYKLOFM UNIQUE(CONTENT_ID, LANGUAGE_ID);              
ALTER TABLE SALESMANAGER.COUNTRY_DESCRIPTION ADD CONSTRAINT UKT7NSHKI1RBP6157ED0V6CX4Y4 UNIQUE(COUNTRY_ID, LANGUAGE_ID);              
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION ADD CONSTRAINT UKROV34A6G4DHHIQUKVHP1GGM0U UNIQUE(MERCHANT_ID, CUSTOMER_OPT_CODE);           
ALTER TABLE SALESMANAGER.TAX_RATE_DESCRIPTION ADD CONSTRAINT UKT3XG8PL88YACDXG49NB46EFFG UNIQUE(TAX_RATE_ID, LANGUAGE_ID);            
ALTER TABLE SALESMANAGER.CUSTOMER_OPTIN ADD CONSTRAINT UKC4FNYU0PVXXTRBKO10RM1JQYW UNIQUE(EMAIL, OPTIN_ID);
SET FOREIGN_KEY_CHECKS=0;           
ALTER TABLE SALESMANAGER.CUSTOMER_OPT_VAL_DESCRIPTION ADD CONSTRAINT FK6RFSSI3QFX4PSWICXRFB18C1 FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;   
ALTER TABLE SALESMANAGER.PRODUCT_TYPE_DESCRIPTION ADD CONSTRAINT FK81Q74WHCO5Y9FD51AA330HLC0 FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;      
ALTER TABLE SALESMANAGER.ZONE_DESCRIPTION ADD CONSTRAINT FKPV4ELIN6W3B03756OBQVK447F FOREIGN KEY(ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_OPTION ADD CONSTRAINT FKP8CSKI5T5F5M4ET4FW0UILCGU FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_IMAGE_DESCRIPTION ADD CONSTRAINT FKLHDNPKI4SF98WEV0PCJ2BVNIH FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;     
ALTER TABLE SALESMANAGER.PRODUCT_VAR_IMAGE ADD CONSTRAINT FKGGBBYS5MEWFLR88RSOS56YC2K FOREIGN KEY(PRODUCT_AVAIL_ID) REFERENCES SALESMANAGER.PRODUCT_AVAILABILITY(PRODUCT_AVAIL_ID) ;       
ALTER TABLE SALESMANAGER.PRODUCT ADD CONSTRAINT FKEIIRVJ8EU40H103FTH8ES1MT0 FOREIGN KEY(PRODUCT_TYPE_ID) REFERENCES SALESMANAGER.PRODUCT_TYPE(PRODUCT_TYPE_ID) ;           
ALTER TABLE SALESMANAGER.CUSTOMER_ATTRIBUTE ADD CONSTRAINT FK9FL7IEXVDEEEOCH9FH35O5VW4 FOREIGN KEY(OPTION_VALUE_ID) REFERENCES SALESMANAGER.CUSTOMER_OPTION_VALUE(CUSTOMER_OPTION_VALUE_ID) ;              
ALTER TABLE SALESMANAGER.CUSTOMER_ATTRIBUTE ADD CONSTRAINT FK4XUGS9YD9W4O3SW11FISB8TJ5 FOREIGN KEY(OPTION_ID) REFERENCES SALESMANAGER.CUSTOMER_OPTION(CUSTOMER_OPTION_ID) ;
ALTER TABLE SALESMANAGER.TAX_CLASS ADD CONSTRAINT FK82I8PUUJGHCV7FC82QWSGJG8W FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;               
ALTER TABLE SALESMANAGER.PRODUCT_AVAILABILITY ADD CONSTRAINT FK5SBH4DX25PMJCQX958HR9YS8H FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;             
ALTER TABLE SALESMANAGER.ZONE ADD CONSTRAINT FKHN2C1W3E1TWHJG7TIWV7VUK67 FOREIGN KEY(COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;             
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT FK3K21JW28BBX043C2MNHEVG9W4 FOREIGN KEY(DELIVERY_ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;         
ALTER TABLE SALESMANAGER.CONTENT_DESCRIPTION ADD CONSTRAINT FK47YXF681U0RFW2KVARHQB0R3V FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;           
ALTER TABLE SALESMANAGER.MANUFACTURER ADD CONSTRAINT FKHSWPH4NTHRQWFFJEKCCUDSRT2 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;            
ALTER TABLE SALESMANAGER.CUSTOMER_ATTRIBUTE ADD CONSTRAINT FKC3318O13I2BPXKCI1BH52WE5A FOREIGN KEY(CUSTOMER_ID) REFERENCES SALESMANAGER.CUSTOMER(CUSTOMER_ID) ;            
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW_DESCRIPTION ADD CONSTRAINT FK7BYC5JSF5BM4LK674AC44E50M FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;    
ALTER TABLE SALESMANAGER.CONTENT_DESCRIPTION ADD CONSTRAINT FKK7FABFXN2FLVCOFWWPYG5SYS FOREIGN KEY(CONTENT_ID) REFERENCES SALESMANAGER.CONTENT(CONTENT_ID) ;               
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_VALUE_DESCRIPTION ADD CONSTRAINT FK19MNBY7ATLT85EXLYPXDXHACX FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;              
ALTER TABLE SALESMANAGER.CATEGORY ADD CONSTRAINT FK8A09ASQ5FCX0A88I4M8NSIXY FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ; 
ALTER TABLE SALESMANAGER.ORDER_PRODUCT ADD CONSTRAINT FKF0SGHMN59S14CXRJTRVKVI5YK FOREIGN KEY(ORDER_ID) REFERENCES SALESMANAGER.ORDERS(ORDER_ID) ;         
ALTER TABLE SALESMANAGER.PERMISSION_GROUP ADD CONSTRAINT FKR7YLUTDGQP1NRLBHJWIT6Y17G FOREIGN KEY(GROUP_ID) REFERENCES SALESMANAGER.SM_GROUP(GROUP_ID) ;    
ALTER TABLE SALESMANAGER.SHIPPING_QUOTE ADD CONSTRAINT FK9VB7TBJL8IVYGDIQW883FEWX7 FOREIGN KEY(DELIVERY_COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;          
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_DESC ADD CONSTRAINT FKM4IU7V9DB17WK2A03XQBQDLFA FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;          
ALTER TABLE SALESMANAGER.ORDER_TOTAL ADD CONSTRAINT FK1TFVGK5SMM80EFDCC8UOP4HE3 FOREIGN KEY(ORDER_ID) REFERENCES SALESMANAGER.ORDERS(ORDER_ID) ;           
ALTER TABLE SALESMANAGER.PRODUCT ADD CONSTRAINT FKRA5MMRDXN3CI86HOD7Q1U3VU9 FOREIGN KEY(MANUFACTURER_ID) REFERENCES SALESMANAGER.MANUFACTURER(MANUFACTURER_ID) ;           
ALTER TABLE SALESMANAGER.CATEGORY_DESCRIPTION ADD CONSTRAINT FKA58U7D0YDFGREF1IAUX5EFYOV FOREIGN KEY(CATEGORY_ID) REFERENCES SALESMANAGER.CATEGORY(CATEGORY_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_VARIATION ADD CONSTRAINT FKQLM3C2178NEUE84L5KX51OVOQ FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;       
ALTER TABLE SALESMANAGER.MERCHANT_STORE ADD CONSTRAINT FK2GN7VPKD9X832URW7C6JLAWNN FOREIGN KEY(COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;   
ALTER TABLE SALESMANAGER.GEOZONE_DESCRIPTION ADD CONSTRAINT FKN82TE2YB2ST4HK2QLHL8ILEB9 FOREIGN KEY(GEOZONE_ID) REFERENCES SALESMANAGER.GEOZONE(GEOZONE_ID) ;              
ALTER TABLE SALESMANAGER.TAX_RATE ADD CONSTRAINT FKFWP6YKA2QPS9JNA473E6C6YC1 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;
ALTER TABLE SALESMANAGER.ORDER_ATTRIBUTE ADD CONSTRAINT FK4NW5YRTGB4IN6LEVE76BMDNUA FOREIGN KEY(ORDER_ID) REFERENCES SALESMANAGER.ORDERS(ORDER_ID) ;       
ALTER TABLE SALESMANAGER.MERCHANT_LANGUAGE ADD CONSTRAINT FKJWY0PJIJH1QMCOIVQ50O2JGEC FOREIGN KEY(LANGUAGES_LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;   
ALTER TABLE SALESMANAGER.PRODUCT_PRICE_DESCRIPTION ADD CONSTRAINT FKBWXW861IPJSCT606J3DAGDJSF FOREIGN KEY(PRODUCT_PRICE_ID) REFERENCES SALESMANAGER.PRODUCT_PRICE(PRODUCT_PRICE_ID) ;      
ALTER TABLE SALESMANAGER.PRODUCT_DESCRIPTION ADD CONSTRAINT FK6ESJDAA6VU2T5VJIN788A8OG6 FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;           
ALTER TABLE SALESMANAGER.PRODUCT_TYPE ADD CONSTRAINT FKSWKVTAQ4OM2DI6X8CD4M22OFN FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;            
ALTER TABLE SALESMANAGER.COUNTRY_DESCRIPTION ADD CONSTRAINT FKERSRBJOT9P9NFUKXFD2L27C7T FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;           
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_SET ADD CONSTRAINT FKJ9VNVYH6HHHFTJBCSYMGIODM9 FOREIGN KEY(CUSTOMER_OPTION_VALUE_ID) REFERENCES SALESMANAGER.CUSTOMER_OPTION_VALUE(CUSTOMER_OPTION_VALUE_ID) ;    
ALTER TABLE SALESMANAGER.FILE_HISTORY ADD CONSTRAINT FK2K8H4PENKJLBTC23VAMWYEK2G FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;            
ALTER TABLE SALESMANAGER.PRODUCT_OPT_SET_PRD_TYPE ADD CONSTRAINT FKIEM30U1ENM0P25I7T53JGANF4 FOREIGN KEY(PRODUCTTYPES_PRODUCT_TYPE_ID) REFERENCES SALESMANAGER.PRODUCT_TYPE(PRODUCT_TYPE_ID) ;             
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_DESC ADD CONSTRAINT FKC2YIUCJBW0WJHA8WW7A01QFEO FOREIGN KEY(CUSTOMER_OPTION_ID) REFERENCES SALESMANAGER.CUSTOMER_OPTION(CUSTOMER_OPTION_ID) ;     
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_SET ADD CONSTRAINT FK4NJY17416FN86MUOJMTBAV1D0 FOREIGN KEY(PRODUCT_OPTION_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION(PRODUCT_OPTION_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_SET ADD CONSTRAINT FK8D5VYLMHVMCKMFRAMDEHGWQAU FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;      
ALTER TABLE SALESMANAGER.PRODUCT_DESCRIPTION ADD CONSTRAINT FKM46YJCU59Q79QROKGGLWQ2OVE FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;              
ALTER TABLE SALESMANAGER.PRODUCT_OPT_SET_OPT_VALUE ADD CONSTRAINT FK9DWATBLXWC64A5LA3BB7QNWD8 FOREIGN KEY(VALUES_PRODUCT_OPTION_VALUE_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION_VALUE(PRODUCT_OPTION_VALUE_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW_DESCRIPTION ADD CONSTRAINT FKMJIVHIGDCXMYTNDLPJUHF4O25 FOREIGN KEY(PRODUCT_REVIEW_ID) REFERENCES SALESMANAGER.PRODUCT_REVIEW(PRODUCT_REVIEW_ID) ;  
ALTER TABLE SALESMANAGER.SYSTEM_NOTIFICATION ADD CONSTRAINT FKS6QK7L06E0S6M9N04MOMEDGT7 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;     
ALTER TABLE SALESMANAGER.PRODUCT_ATTRIBUTE ADD CONSTRAINT FKML3NVEMDJYA159A7669QT1GJD FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;
ALTER TABLE SALESMANAGER.PERMISSION_GROUP ADD CONSTRAINT FK77LY3KHYUU40ODLY02D351S84 FOREIGN KEY(PERMISSION_ID) REFERENCES SALESMANAGER.PERMISSION(PERMISSION_ID) ;        
ALTER TABLE SALESMANAGER.USERS ADD CONSTRAINT FKTPIO656E5T0CJA7KX7P79RKH6 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;   
ALTER TABLE SALESMANAGER.ORDERS ADD CONSTRAINT FKNLX97VJYORUNXGLHY5BIRD06C FOREIGN KEY(DELIVERY_COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;  
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT FK5PAS8T9MKNK4KKIN55T4V300L FOREIGN KEY(BILLING_COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ; 
ALTER TABLE SALESMANAGER.CUSTOMER_OPT_VAL_DESCRIPTION ADD CONSTRAINT FKHWRS6FYQK6VH11YVCFLU42YEF FOREIGN KEY(CUSTOMER_OPT_VAL_ID) REFERENCES SALESMANAGER.CUSTOMER_OPTION_VALUE(CUSTOMER_OPTION_VALUE_ID) ;
ALTER TABLE SALESMANAGER.ORDER_PRODUCT_ATTRIBUTE ADD CONSTRAINT FK7J86RVWAYSBOK1NUOFRNMHMKX FOREIGN KEY(ORDER_PRODUCT_ID) REFERENCES SALESMANAGER.ORDER_PRODUCT(ORDER_PRODUCT_ID) ;        
ALTER TABLE SALESMANAGER.ORDER_ACCOUNT_PRODUCT ADD CONSTRAINT FK7OXC8YGOV7VD2AJT185JHIWTS FOREIGN KEY(ORDER_ACCOUNT_ID) REFERENCES SALESMANAGER.ORDER_ACCOUNT(ORDER_ACCOUNT_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_CATEGORY ADD CONSTRAINT FKA7245LY271MB0CRLHXWHHPPSQ FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ; 
ALTER TABLE SALESMANAGER.CATEGORY_DESCRIPTION ADD CONSTRAINT FKL4J5BOTEUTPU1P8F67KYDPNMD FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;          
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT FKBXYOOICELI2KO29BUPDYE6JGN FOREIGN KEY(DELIVERY_COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;
ALTER TABLE SALESMANAGER.TAX_RATE ADD CONSTRAINT FKM9SNPF6O1NB4J1T80NAS8D1IX FOREIGN KEY(ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;  
ALTER TABLE SALESMANAGER.PRODUCT_IMAGE_DESCRIPTION ADD CONSTRAINT FK1DHLDO18NJ9L2Y6QYMPGUCYNQ FOREIGN KEY(PRODUCT_IMAGE_ID) REFERENCES SALESMANAGER.PRODUCT_IMAGE(PRODUCT_IMAGE_ID) ;      
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW ADD CONSTRAINT FKAYT6TBXP7D4G1QYG8CRW2N73P FOREIGN KEY(CUSTOMERS_ID) REFERENCES SALESMANAGER.CUSTOMER(CUSTOMER_ID) ;              
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT FKP0XCPA3I2MGDR0KQ43XIIBX40 FOREIGN KEY(BILLING_ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_DIGITAL ADD CONSTRAINT FK47FMB5CG68PWS7K26TXYL1IL6 FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;  
ALTER TABLE SALESMANAGER.PRODUCT_RELATIONSHIP ADD CONSTRAINT FKSO3CVINYKAC5WDWU1TJGFOTOR FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;             
ALTER TABLE SALESMANAGER.SHOPPING_CART_ITEM ADD CONSTRAINT FK2GBIMDWE9UYSD5XADNFL0XQ83 FOREIGN KEY(SHP_CART_ID) REFERENCES SALESMANAGER.SHOPPING_CART(SHP_CART_ID) ;       
ALTER TABLE SALESMANAGER.SHIPING_ORIGIN ADD CONSTRAINT FKP0DBWSV3SDSP57EX7J5K9B0OQ FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;          
ALTER TABLE SALESMANAGER.CONTENT ADD CONSTRAINT FKFMOI0FKJBTFTY3O8FS94T11R1 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ; 
ALTER TABLE SALESMANAGER.PRODUCT_TYPE_DESCRIPTION ADD CONSTRAINT FKREFXR8Q2QWRASLQGUQL31VU34 FOREIGN KEY(PRODUCT_TYPE_ID) REFERENCES SALESMANAGER.PRODUCT_TYPE(PRODUCT_TYPE_ID) ;
ALTER TABLE SALESMANAGER.PRODUCT_AVAILABILITY ADD CONSTRAINT FKMJS1XQDSGJI88J5UDUJ83BNTL FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;    
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW ADD CONSTRAINT FK7PMQDK9OD2AF7CL6ALX82FKEK FOREIGN KEY(REVIEWED_CUSTOMER_ID) REFERENCES SALESMANAGER.CUSTOMER(CUSTOMER_ID) ;      
ALTER TABLE SALESMANAGER.ORDER_STATUS_HISTORY ADD CONSTRAINT FKMHGHGF1XY3O0NPSP8XKJ6WYVQ FOREIGN KEY(ORDER_ID) REFERENCES SALESMANAGER.ORDERS(ORDER_ID) ;  
ALTER TABLE SALESMANAGER.ORDER_PRODUCT_DOWNLOAD ADD CONSTRAINT FKSTRDA0EWEHARLD63J8PXA2O2R FOREIGN KEY(ORDER_PRODUCT_ID) REFERENCES SALESMANAGER.ORDER_PRODUCT(ORDER_PRODUCT_ID) ;         
ALTER TABLE SALESMANAGER.USER_GROUP ADD CONSTRAINT FK9OP4WV63NONSBY8Y9MYJHTHO FOREIGN KEY(USER_ID) REFERENCES SALESMANAGER.USERS(USER_ID) ;
ALTER TABLE SALESMANAGER.USERS ADD CONSTRAINT FK2YN065L2N7NW9ROFJS4HWPIJ2 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;   
ALTER TABLE SALESMANAGER.AVAILABILITY_VARIATION ADD CONSTRAINT FK2KHSH7GVB4PF291J0OOSNV7FS FOREIGN KEY(PRODUCT_AVAIL_ID) REFERENCES SALESMANAGER.PRODUCT_AVAILABILITY(PRODUCT_AVAIL_ID) ;  
ALTER TABLE SALESMANAGER.MERCHANT_LANGUAGE ADD CONSTRAINT FKIISJ0TMOUJV6N3IQMYTVO39KN FOREIGN KEY(STORES_MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_DESC ADD CONSTRAINT FK8FIWK5O1GBN2R2U8529YAF9XT FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;           
ALTER TABLE SALESMANAGER.SHOPPING_CART_ATTR_ITEM ADD CONSTRAINT FKP42TPA623HYO9WW69V0OHB3ER FOREIGN KEY(SHP_CART_ITEM_ID) REFERENCES SALESMANAGER.SHOPPING_CART_ITEM(SHP_CART_ITEM_ID) ;   
ALTER TABLE SALESMANAGER.USER_GROUP ADD CONSTRAINT FKDONP1M2N25UA1465RHICE3QNA FOREIGN KEY(USER_ID) REFERENCES SALESMANAGER.USERS(USER_ID) ;               
ALTER TABLE SALESMANAGER.ORDERS ADD CONSTRAINT FKIT6TI99MV5UVUXQSKHURV3Y59 FOREIGN KEY(BILLING_ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;            
ALTER TABLE SALESMANAGER.PRODUCT_OPT_SET_OPT_VALUE ADD CONSTRAINT FK3U6IYAG8X8W9TKT7SQCOIBJQ6 FOREIGN KEY(PRODUCTOPTIONSET_PRODUCT_OPTION_SET_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION_SET(PRODUCT_OPTION_SET_ID) ;      
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION ADD CONSTRAINT FKCMQNH0RN2HUKDFOWEAN5TDY8K FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;         
ALTER TABLE SALESMANAGER.ORDERS ADD CONSTRAINT FKAODV5FFAYQ8X50Q311O2Y8M1 FOREIGN KEY(MERCHANTID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;    
ALTER TABLE SALESMANAGER.PRODUCT ADD CONSTRAINT FKQTT5F0AHT5H7OUGH5RBKKCB33 FOREIGN KEY(CUSTOMER_ID) REFERENCES SALESMANAGER.CUSTOMER(CUSTOMER_ID) ;       
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_VALUE_DESCRIPTION ADD CONSTRAINT FKQTTC6B79YP2S1HYRHG4THAG6S FOREIGN KEY(PRODUCT_OPTION_VALUE_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION_VALUE(PRODUCT_OPTION_VALUE_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW ADD CONSTRAINT FKBFI8DE7KXULTG1VEVQ6JC1HN7 FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;   
ALTER TABLE SALESMANAGER.MERCHANT_STORE ADD CONSTRAINT FK63HLW9WP1K1X3F5TKE7T2US7S FOREIGN KEY(CURRENCY_ID) REFERENCES SALESMANAGER.CURRENCY(CURRENCY_ID) ;
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_SET ADD CONSTRAINT FK1Y5QTSUABHPWFT3DYHQRGMTB4 FOREIGN KEY(CUSTOMER_OPTION_ID) REFERENCES SALESMANAGER.CUSTOMER_OPTION(CUSTOMER_OPTION_ID) ;      
ALTER TABLE SALESMANAGER.TAX_RATE ADD CONSTRAINT FK6WM34JCWOEMBE1QSMLE2WTWNV FOREIGN KEY(COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;         
ALTER TABLE SALESMANAGER.SHIPING_ORIGIN ADD CONSTRAINT FKPQIG59USQVS9H0DW4LM8RV7YY FOREIGN KEY(COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;   
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT FKDGJQMJ04QT89GMFLOO4OFOJCW FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;      
ALTER TABLE SALESMANAGER.USERS ADD CONSTRAINT FK3SH6QXGT118M71TTVKUBGD9Y8 FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;         
ALTER TABLE SALESMANAGER.COUNTRY_DESCRIPTION ADD CONSTRAINT FKKD2SY7Q97WR2AHVYIIQC4TXJI FOREIGN KEY(COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;              
ALTER TABLE SALESMANAGER.MERCHANT_CONFIGURATION ADD CONSTRAINT FKF9BKGF0YSBP5FO9J69SHM0PRI FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;  
ALTER TABLE SALESMANAGER.SHIPING_ORIGIN ADD CONSTRAINT FK6K73F1N18KR7MQP708AIWQ047 FOREIGN KEY(ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;            
ALTER TABLE SALESMANAGER.TAX_RATE_DESCRIPTION ADD CONSTRAINT FKSICB2YDX42O04PVLNXW2MLX0W FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_ATTRIBUTE ADD CONSTRAINT FK3RLEULTG9FN2DXRUEFBB18D5T FOREIGN KEY(OPTION_VALUE_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION_VALUE(PRODUCT_OPTION_VALUE_ID) ; 
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW_DESCRIPTION ADD CONSTRAINT FKHF88OAGF6T62K28AFN8UAIJC7 FOREIGN KEY(CUSTOMER_REVIEW_ID) REFERENCES SALESMANAGER.CUSTOMER_REVIEW(CUSTOMER_REVIEW_ID) ;              
ALTER TABLE SALESMANAGER.PRODUCT_VARIATION ADD CONSTRAINT FKY6GAMYVRPDS502PDCQQ4VOYG FOREIGN KEY(OPTION_VALUE_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION_VALUE(PRODUCT_OPTION_VALUE_ID) ;  
ALTER TABLE SALESMANAGER.ORDER_PRODUCT_PRICE ADD CONSTRAINT FKNKUKIQXRIEONYULERCGNH857S FOREIGN KEY(ORDER_PRODUCT_ID) REFERENCES SALESMANAGER.ORDER_PRODUCT(ORDER_PRODUCT_ID) ;            
ALTER TABLE SALESMANAGER.SHIPPING_QUOTE ADD CONSTRAINT FKIIOESP0VL6X4OM1JEAJJ4UY1T FOREIGN KEY(DELIVERY_ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;   
ALTER TABLE SALESMANAGER.SYSTEM_NOTIFICATION ADD CONSTRAINT FKA54891EMCL0FO27A1QK54SLVK FOREIGN KEY(USER_ID) REFERENCES SALESMANAGER.USERS(USER_ID) ;      
ALTER TABLE SALESMANAGER.PRODUCT_PRICE_DESCRIPTION ADD CONSTRAINT FK7BMBRJR8AR5ICWDPT8MYJ6GEI FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;     
ALTER TABLE SALESMANAGER.MERCHANT_STORE ADD CONSTRAINT FK5O24AKY9161JYOFYXMG0G53VV FOREIGN KEY(ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;            
ALTER TABLE SALESMANAGER.PRODUCT_ATTRIBUTE ADD CONSTRAINT FK2ST60U9TWMVVAOWWN88MT3LRX FOREIGN KEY(OPTION_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION(PRODUCT_OPTION_ID) ;   
ALTER TABLE SALESMANAGER.PRODUCT_VARIATION ADD CONSTRAINT FK5JR2RC6T2P27NWDO5EQWA7658 FOREIGN KEY(PRODUCT_OPTION_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION(PRODUCT_OPTION_ID) ;           
ALTER TABLE SALESMANAGER.TAX_RATE_DESCRIPTION ADD CONSTRAINT FK65C2LQSLK5KX25DPKEM2R0VXQ FOREIGN KEY(TAX_RATE_ID) REFERENCES SALESMANAGER.TAX_RATE(TAX_RATE_ID) ;          
ALTER TABLE SALESMANAGER.CATALOG_ENTRY ADD CONSTRAINT FK374WKS7EM54D0OGHJU0EARTTL FOREIGN KEY(CATEGORY_ID) REFERENCES SALESMANAGER.CATEGORY(CATEGORY_ID) ; 
ALTER TABLE SALESMANAGER.MERCHANT_LOG ADD CONSTRAINT FKTO727B9R68QRTN2VVDQDVD4IC FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;            
ALTER TABLE SALESMANAGER.CUSTOMER_OPTIN ADD CONSTRAINT FK7QYM878M07CWVS4FOE68LVQJT FOREIGN KEY(OPTIN_ID) REFERENCES SALESMANAGER.OPTIN(OPTIN_ID) ;         
ALTER TABLE SALESMANAGER.CATALOG_ENTRY ADD CONSTRAINT FKQP2J48HB3VODOVB8GN2O4GOX FOREIGN KEY(CATALOG_ID) REFERENCES SALESMANAGER.CATALOG(ID) ;             
ALTER TABLE SALESMANAGER.MANUFACTURER_DESCRIPTION ADD CONSTRAINT FKRE4IYS57N5CFBGPG3QQGEWTRH FOREIGN KEY(MANUFACTURER_ID) REFERENCES SALESMANAGER.MANUFACTURER(MANUFACTURER_ID) ;          
ALTER TABLE SALESMANAGER.MERCHANT_STORE ADD CONSTRAINT FKDNEMO9TL8TJHKXKO83PSVKV19 FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;
ALTER TABLE SALESMANAGER.CUSTOMER_OPTION_VALUE ADD CONSTRAINT FKHO87SSG5RNVWAUJ3Y690A96G6 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;   
ALTER TABLE SALESMANAGER.AVAILABILITY_VARIATION ADD CONSTRAINT FK1GXEL47P32K4XSNP72OOXD0NE FOREIGN KEY(PRODUCT_VARIANTION_ID) REFERENCES SALESMANAGER.PRODUCT_VARIATION(PRODUCT_VARIANTION_ID) ;           
ALTER TABLE SALESMANAGER.PRODUCT_RELATIONSHIP ADD CONSTRAINT FKNPRVSWTBGRM6BJFQ3CBDL3QSM FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;    
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_DESC ADD CONSTRAINT FKGJQMFOFILE4HWV867IRSNVUC0 FOREIGN KEY(PRODUCT_OPTION_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION(PRODUCT_OPTION_ID) ;         
ALTER TABLE SALESMANAGER.PRODUCT_TYPE_DESCRIPTION ADD CONSTRAINT FKPWC89ULK7C9ASBP2NFY2T4X2J FOREIGN KEY(PRODUCT_TYPE_ID) REFERENCES SALESMANAGER.PRODUCT_TYPE(PRODUCT_TYPE_ID) ;          
ALTER TABLE SALESMANAGER.COUNTRY ADD CONSTRAINT FKD2Q9E14KH1J6TM1GPBCT2XWWS FOREIGN KEY(GEOZONE_ID) REFERENCES SALESMANAGER.GEOZONE(GEOZONE_ID) ;          
ALTER TABLE SALESMANAGER.CATALOG ADD CONSTRAINT FKRANQ0RWEB0R6J31J565AK51G8 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ; 
ALTER TABLE SALESMANAGER.PRODUCT_IMAGE ADD CONSTRAINT FKGAB836D8RXQG8VV55NM02R65I FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;    
ALTER TABLE SALESMANAGER.USERS ADD CONSTRAINT FK4YB3HO4YXVCJNIQG09OPBM7JA FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;         
ALTER TABLE SALESMANAGER.SM_TRANSACTION ADD CONSTRAINT FK7J0S1GQH2TUE1FYH5NYJ5KWKP FOREIGN KEY(ORDER_ID) REFERENCES SALESMANAGER.ORDERS(ORDER_ID) ;        
ALTER TABLE SALESMANAGER.USER_GROUP ADD CONSTRAINT FK75KAINRHN4KH8J3SW2XBE7V61 FOREIGN KEY(GROUP_ID) REFERENCES SALESMANAGER.SM_GROUP(GROUP_ID) ;          
ALTER TABLE SALESMANAGER.PRODUCT_OPT_SET_PRD_TYPE ADD CONSTRAINT FK4655H91S0EIINONAKO9N4H9HA FOREIGN KEY(PRODUCTOPTIONSET_PRODUCT_OPTION_SET_ID) REFERENCES SALESMANAGER.PRODUCT_OPTION_SET(PRODUCT_OPTION_SET_ID) ;       
ALTER TABLE SALESMANAGER.CUSTOMER_OPTIN ADD CONSTRAINT FKK5V94DVHSGIBAW89HV4M8O5YW FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;          
ALTER TABLE SALESMANAGER.TAX_RATE ADD CONSTRAINT FK7BPA9PBL1GNJ5Y3XBGS3WC0EG FOREIGN KEY(TAX_CLASS_ID) REFERENCES SALESMANAGER.TAX_CLASS(TAX_CLASS_ID) ;   
ALTER TABLE SALESMANAGER.MANUFACTURER_DESCRIPTION ADD CONSTRAINT FK20T33WR4TP1KT1UYW7S8A3AFL FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;      
ALTER TABLE SALESMANAGER.CUSTOMER_GROUP ADD CONSTRAINT FKGRR5V89L1M9SL2QOL62BBCTQ4 FOREIGN KEY(GROUP_ID) REFERENCES SALESMANAGER.SM_GROUP(GROUP_ID) ;      
ALTER TABLE SALESMANAGER.ZONE_DESCRIPTION ADD CONSTRAINT FK69YBU7R3BGPCQ65C77JI1UDH3 FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;              
ALTER TABLE SALESMANAGER.ORDERS ADD CONSTRAINT FKN9UVJL8105FSLY4DOO8RQNV5B FOREIGN KEY(DELIVERY_ZONE_ID) REFERENCES SALESMANAGER.ZONE(ZONE_ID) ;           
ALTER TABLE SALESMANAGER.CATEGORY ADD CONSTRAINT FKN3KEKNTR7PM8G9V8ASK698ATO FOREIGN KEY(PARENT_ID) REFERENCES SALESMANAGER.CATEGORY(CATEGORY_ID) ;        
ALTER TABLE SALESMANAGER.GEOZONE_DESCRIPTION ADD CONSTRAINT FK1T2HP628EDEBE5D6CO2WHBLA9 FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;           
ALTER TABLE SALESMANAGER.PRODUCT_CATEGORY ADD CONSTRAINT FK3XW1SBAA29R534JVEDIMDD7MD FOREIGN KEY(CATEGORY_ID) REFERENCES SALESMANAGER.CATEGORY(CATEGORY_ID) ;              
ALTER TABLE SALESMANAGER.ORDERS ADD CONSTRAINT FKFUSIVMW6Q3GJXNMP47N9S74QI FOREIGN KEY(CURRENCY_ID) REFERENCES SALESMANAGER.CURRENCY(CURRENCY_ID) ;        
ALTER TABLE SALESMANAGER.PRODUCT_VARIANT ADD CONSTRAINT FKNAA1T3G2D6LT3F13YY0GG9T4O FOREIGN KEY(PRODUCT_AVAIL_ID) REFERENCES SALESMANAGER.PRODUCT_AVAILABILITY(PRODUCT_AVAIL_ID) ;         
ALTER TABLE SALESMANAGER.PRODUCT_VARIANT ADD CONSTRAINT FKB1P1MGAA76XDQMX029CABGC1S FOREIGN KEY(PRODUCT_ATTRIBUTE_ID) REFERENCES SALESMANAGER.PRODUCT_ATTRIBUTE(PRODUCT_ATTRIBUTE_ID) ;    
ALTER TABLE SALESMANAGER.ORDER_ACCOUNT_PRODUCT ADD CONSTRAINT FK5KIYYB8EKQI9BFOWYTWW8ATCX FOREIGN KEY(ORDER_PRODUCT_ID) REFERENCES SALESMANAGER.ORDER_PRODUCT(ORDER_PRODUCT_ID) ;          
ALTER TABLE SALESMANAGER.CUSTOMER ADD CONSTRAINT FK8122NRPAKXU3UMK1OD4V0XXOA FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;
ALTER TABLE SALESMANAGER.CUSTOMER_GROUP ADD CONSTRAINT FK257H3E27F4UJW08DOQTQ46HHO FOREIGN KEY(CUSTOMER_ID) REFERENCES SALESMANAGER.CUSTOMER(CUSTOMER_ID) ;
ALTER TABLE SALESMANAGER.PRODUCT_RELATIONSHIP ADD CONSTRAINT FKFSKWTAWYT85G9H6761FA69YA5 FOREIGN KEY(RELATED_PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;     
ALTER TABLE SALESMANAGER.SYSTEM_NOTIFICATION ADD CONSTRAINT FK3DYKR9PM9LN1UEKTUW18BLB6M FOREIGN KEY(USER_ID) REFERENCES SALESMANAGER.USERS(USER_ID) ;      
ALTER TABLE SALESMANAGER.PRODUCT ADD CONSTRAINT FKHHOQ1ND9E0I4M7RT8GKH7D67H FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ; 
ALTER TABLE SALESMANAGER.SHOPPING_CART ADD CONSTRAINT FKQVGHR5RMJEFE3LW9MCOLK30A0 FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;           
ALTER TABLE SALESMANAGER.OPTIN ADD CONSTRAINT FK37XVFO4THE20AVV7F1E1771FH FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;   
ALTER TABLE SALESMANAGER.PRODUCT_OPTION_VALUE ADD CONSTRAINT FKND3NW0MAMLK8BKXO8AD5M85PQ FOREIGN KEY(MERCHANT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;    
ALTER TABLE SALESMANAGER.PRODUCT_REVIEW ADD CONSTRAINT FK7TM0JRT0HIUGO3EP49T3SUBOU FOREIGN KEY(CUSTOMERS_ID) REFERENCES SALESMANAGER.CUSTOMER(CUSTOMER_ID) ;               
ALTER TABLE SALESMANAGER.CUSTOMER_REVIEW_DESCRIPTION ADD CONSTRAINT FK5PKGRLK32UQAXKRBVE5MWS1HJ FOREIGN KEY(LANGUAGE_ID) REFERENCES SALESMANAGER.LANGUAGE(LANGUAGE_ID) ;   
ALTER TABLE SALESMANAGER.ORDER_ACCOUNT ADD CONSTRAINT FKI6L5ISODH81M5HY8UA06HX73N FOREIGN KEY(ORDER_ID) REFERENCES SALESMANAGER.ORDERS(ORDER_ID) ;         
ALTER TABLE SALESMANAGER.ORDERS ADD CONSTRAINT FKIPESU5TUPNRIAHUTGLE6XU9ED FOREIGN KEY(BILLING_COUNTRY_ID) REFERENCES SALESMANAGER.COUNTRY(COUNTRY_ID) ;   
ALTER TABLE SALESMANAGER.CATALOG_ENTRY ADD CONSTRAINT FK4E5UGD4JLC0N6I4OHRVA71ANV FOREIGN KEY(PRODUCT_ID) REFERENCES SALESMANAGER.PRODUCT(PRODUCT_ID) ;    
ALTER TABLE SALESMANAGER.PRODUCT_PRICE ADD CONSTRAINT FK1DIC7JNNK1QIKGVWCRF4DW12R FOREIGN KEY(PRODUCT_AVAIL_ID) REFERENCES SALESMANAGER.PRODUCT_AVAILABILITY(PRODUCT_AVAIL_ID) ;           
ALTER TABLE SALESMANAGER.PRODUCT ADD CONSTRAINT FKB8OQTC3J8SQO0T8XDRNE7PG69 FOREIGN KEY(TAX_CLASS_ID) REFERENCES SALESMANAGER.TAX_CLASS(TAX_CLASS_ID) ;    
ALTER TABLE SALESMANAGER.MERCHANT_STORE ADD CONSTRAINT FKGKOELE515H76U39B9DEFIBKM9 FOREIGN KEY(PARENT_ID) REFERENCES SALESMANAGER.MERCHANT_STORE(MERCHANT_ID) ;            
ALTER TABLE SALESMANAGER.TAX_RATE ADD CONSTRAINT FKT8ISEN27I3IOA0TW3BL8QLVDH FOREIGN KEY(PARENT_ID) REFERENCES SALESMANAGER.TAX_RATE(TAX_RATE_ID) ;
SET FOREIGN_KEY_CHECKS=1;        
