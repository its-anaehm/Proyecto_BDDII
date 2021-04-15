/*
    BASE DE DATOS PARA UNA INMOBILIARIA (Proyecto -BDDII)
    @author: its_anaehm
    @date: 25/02/2021
    @version: 2.2
*/

-- TABLA CON LOS DATOS BÁSICOS DE LA EMPRESA
CREATE TABLE COMPANY (
    NIF_COMPANY INT PRIMARY KEY,
    NAME VARCHAR(20),
    ADDRESS VARCHAR(50),
    START_DATE DATE,
    EMAIL VARCHAR(30)
);

-- DATOS DE LAS SUCURSALES DE LA EMPRESA
CREATE TABLE BRANCH_OFFICE (
    ID_BOFFICE INT PRIMARY KEY,
    ADDRESS_BO VARCHAR(50),
    START_BO_DATE DATE,
    PHONE_NUM VARCHAR(15)
);

-- DATOS DE LOS DEPARTAMENTOS DE LA EMPRESA
CREATE TABLE DEPTO(
    ID_DEPTO INT PRIMARY KEY,
    NAME_DEPTO VARCHAR(30)
);

-- DATOS SOBRE LOS PUESTOS DE TRABAJO
CREATE TABLE JOB(
    ID_JOB INT PRIMARY KEY,
    NAME_JOB VARCHAR(40),
    ID_DEPTO INT
);

-- DATOS DE LOS EMPLEADOS DE LA EMPRESA
CREATE TABLE EMPLOYEES(
    ID_EMPLOYEE INT PRIMARY KEY,
    FIRST_NAME VARCHAR(10),
    LAST_NAME VARCHAR(10),
    NIF_EMP VARCHAR(20),
    ADDRESS_EMP VARCHAR(50),
    BIRTH_DATE DATE,
    SDATE DATE,
    PHONE VARCHAR(15),
    EMAIL VARCHAR(30),
    ID_JOB INT,
    ID_DEPTO INT,
    ID_BOFFICE INT,
    SALARY DECIMAL,
    WORKING_DAY VARCHAR(30)
);

-- DATOS DE LOS CLIENTES DE LA EMPRESA
CREATE TABLE CUSTOMER(
    ID_CUST INT PRIMARY KEY,
    NAME_CUST VARCHAR(20),
    NIF_CUST VARCHAR(20),
    ADDRESS_CUST VARCHAR(30),
    PHONE_CUST VARCHAR(15),
    EMAIL_CUST VARCHAR(30)
);

-- DATOS DE LOS PROVEEDORES DE LA EMPRESA
CREATE TABLE SUPPLIERS(
    ID_SUP INT PRIMARY KEY,
    NAME_SUP VARCHAR(20),
    NIF_SUP VARCHAR(20),
    ADDRESS_SUP VARCHAR(50),
    PHONE_SUP VARCHAR(20),
    EMAIL_SUP VARCHAR(30)
);

-- DATOS DE LOS INMUEBLES O PROPIEDADES DE LOS CUALES DISPONE LA INMOBILIARIA PARA VENDER
CREATE TABLE PROPERTYS (
    ID_PROPERTY INT PRIMARY KEY,
    NIF_PROPERTY VARCHAR(20),
    ADDRESS_PROP VARCHAR(50),
    GEOGRAPHICAL_COORDS VARCHAR(30),
    BUILDING_DATE DATE,
    PUBLICATION_DATE_SALE DATE,
    PROPERTY_TYPE VARCHAR(20),
    ID_SUP INT,
    PRICE INT
);

-- DATOS SOBRE LOS POSIBLES ESTADOS DE LA EMPRESA
CREATE TABLE STATUS_PROPERTY (
    ID_STATUS INT PRIMARY KEY,
    STATUS VARCHAR(30)
);

-- DATOS PARA EL CONTROL DE LA INFORMACIÓN SOBRE CADA INMUEBLE
CREATE TABLE FACT_PROPERTY (
    ID_FACTPROP INT PRIMARY KEY,
    ID_PROPERTY INT,
    ID_CUST INT,
    ID_SUP INT,
    ID_EMPLOYEE INT,
    ID_STATUS INT,
    FACT_DATE DATE
);


/*
    DECLARACIONES DE LLAVES FORANEAS PARA LAS TABLAS
*/

ALTER TABLE JOB
ADD FOREIGN KEY (ID_DEPTO)
REFERENCES DEPTO(ID_DEPTO);

ALTER TABLE EMPLOYEES
ADD FOREIGN KEY (ID_JOB)
REFERENCES JOB(ID_JOB);

ALTER TABLE EMPLOYEES
ADD FOREIGN KEY (ID_DEPTO)
REFERENCES DEPTO(ID_DEPTO);

ALTER TABLE EMPLOYEES
ADD FOREIGN KEY (ID_BOFFICE)
REFERENCES BRANCH_OFFICE(ID_BOFFICE);

ALTER TABLE PROPERTYS
ADD FOREIGN KEY (ID_SUP)
REFERENCES SUPPLIERS(ID_SUP);

ALTER TABLE FACT_PROPERTY
ADD FOREIGN KEY (ID_PROPERTY)
REFERENCES PROPERTYS(ID_PROPERTY);

ALTER TABLE FACT_PROPERTY
ADD FOREIGN KEY (ID_CUST)
REFERENCES CUSTOMER(ID_CUST);

ALTER TABLE FACT_PROPERTY
ADD FOREIGN KEY (ID_SUP)
REFERENCES SUPPLIERS(ID_SUP);

ALTER TABLE FACT_PROPERTY
ADD FOREIGN KEY (ID_EMPLOYEE)
REFERENCES EMPLOYEES(ID_EMPLOYEE);

ALTER TABLE FACT_PROPERTY
ADD FOREIGN KEY (ID_STATUS)
REFERENCES STATUS_PROPERTY(ID_STATUS);

/*
    INSERCIÓN DE DATOS
*/

-- INSERT DE LA TABLA COMPANY
INSERT INTO COMPANY VALUES (1, 'InmoHer', '6 Sauthoff Road', '09-08-1999', 'inmoher99@inmoher.com');

-- INSERT'S DE LA TABLA DEPTO
INSERT INTO DEPTO VALUES (1, 'Presidency');
INSERT INTO DEPTO VALUES (2, 'Management');
INSERT INTO DEPTO VALUES (3, 'Dept. Human Resources');
INSERT INTO DEPTO VALUES (4, 'Dept. Marketing');
INSERT INTO DEPTO VALUES (5, 'Dept. Sales');
INSERT INTO DEPTO VALUES (6, 'Dept. Customer service');
INSERT INTO DEPTO VALUES (7, 'Security');

-- INSERT'S DE LA TABLA JOB
INSERT INTO JOB VALUES (1,'President',1);
INSERT INTO JOB VALUES (2,'Vice-President',1);
INSERT INTO JOB VALUES (3,'General Manager',2);
INSERT INTO JOB VALUES (4,'Sales Manager',5);
INSERT INTO JOB VALUES (5,'Marketing Director',4);
INSERT INTO JOB VALUES (6,'Human Resources Manager',3);
INSERT INTO JOB VALUES (7,'Seller',5);
INSERT INTO JOB VALUES (8,'Designer',4);
INSERT INTO JOB VALUES (9,'Counter',2);
INSERT INTO JOB VALUES (10,'Personnel Selection Technician',3);
INSERT INTO JOB VALUES (11,'Internal Communication Technician',3);
INSERT INTO JOB VALUES (12,'Manager of Social Networks',4);
INSERT INTO JOB VALUES (13,'Sales Supervisor',5);
INSERT INTO JOB VALUES (14,'Secretary',2);
INSERT INTO JOB VALUES (15,'Guard',7);
INSERT INTO JOB VALUES (16,'Chief Financial Officer',2);
INSERT INTO JOB VALUES (17,'Receptionist',6);
INSERT INTO JOB VALUES (18,'Customer Service Director',6);
INSERT INTO JOB VALUES (19,'Chief of Security',7);

-- INSERT'S DE LA TABLA BRANCH_OFFICE
INSERT INTO BRANCH_OFFICE VALUES (1, 'Sauthoff Road', '09-08-1999', '486-957');
INSERT INTO BRANCH_OFFICE VALUES (2,'881 Farmco Alley', '15-02-2000', '434-536');
INSERT INTO BRANCH_OFFICE VALUES (3,'21 Hermina Trail', '27-11-2000', '487-690');
INSERT INTO BRANCH_OFFICE VALUES (4,'185 Briar Crest Road', '12-12-2007', '899-371');
INSERT INTO BRANCH_OFFICE VALUES (5,'661 Manley Alley', '10-09-2010', '806-669');

-- INSERT'S DE LA TABLA EMPLOYEES
INSERT INTO EMPLOYEES VALUES (1, 'Melamie', 'Douglass', '307-55-1165', '1 Pawling Center', '18-12-1975', '10-11-2006', '865-471-6058', 'mdouglass0@360.cn', 1, 1, 1, 39824.88, 'Morning');
INSERT INTO EMPLOYEES VALUES (2, 'Ashla', 'Turville', '478-56-4535', '1 Oneill Terrace', '08-03-1980','07-05-2012', '637-363-5577', 'aturville1@auda.org.au', 15, 7, 1, 8605.01, 'Afternoon');
INSERT INTO EMPLOYEES VALUES (3, 'Rollins', 'Tipping', '384-84-7826', '7 Bayside Drive', '20-05-2000','18-02-2004', '765-867-0670', 'rtipping2@privacy.gov.au', 4, 5, 1, 37602.52, 'Afternoon');
INSERT INTO EMPLOYEES VALUES (4, 'Kelly', 'Hounsom', '758-86-8380', '2812 Kedzie Drive', '30-05-1997','11-06-2001', '607-262-9732', 'khounsom3@marriott.com', 8, 4, 1, 19729.04, 'Night');
INSERT INTO EMPLOYEES VALUES (5, 'Gerladina', 'Hyder', '648-42-6531', '52 Onsgard Drive', '25-12-2002','15-09-2008', '944-366-5364', 'ghyder4@dion.ne.jp', 7, 5, 1, 10422.20, 'Afternoon');
INSERT INTO EMPLOYEES VALUES (6, 'Jocko', 'Aingell','353-50-0422', '135 Melody Street', '29-08-1993','12-04-2000', '106-298-9278', 'jaingell5@g.co', 5, 4, 1, 29102.08, 'Night');
INSERT INTO EMPLOYEES VALUES (7, 'Dell', 'Barthrup', '166-45-7041', '07190 Fulton Court', '17-10-1982','05-07-2001', '499-800-9539', 'dbarthrup6@pcworld.com', 16, 2, 1, 30275.54, 'Morning');
INSERT INTO EMPLOYEES VALUES (8, 'Randolf', 'Gaynsford', '712-29-8848', '858 Roth Road', '14-09-1984','21-01-2003', '998-852-5265', 'rgaynsford7@phpbb.com', 12, 4, 2, 31095.46, 'Afternoon');
INSERT INTO EMPLOYEES VALUES (9, 'Nonnah', 'Giorgio', '278-70-1900', '34 Reinke Drive', '31-07-2001','27-04-2005', '286-498-1673', 'ngiorgio8@psu.edu', 19, 7, 2, 23731.09, 'Night');
INSERT INTO EMPLOYEES VALUES (10, 'Frances', 'Garraway', '860-75-6704', '40914 Jana Crossing', '14-12-1992','19-08-2000', '135-206-8268', 'fgarraway9@oracle.com', 8, 4, 2, 20973.49, 'Morning');
INSERT INTO EMPLOYEES VALUES (11, 'Cozmo', 'MacSharry', '571-85-6842', '86965 Center Hill', '14-01-1983','04-07-2001', '146-521-3679', 'cmacsharrya@drupal.org', 3, 2, 1, 35481.56, 'Afternoon');
INSERT INTO EMPLOYEES VALUES (12, 'Rochette', 'Sinnie', '658-10-4517', '7 Northview Hill', '22-04-2004','01-11-2009', '227-945-5236', 'rsinnieb@1und1.de', 6, 3, 1, 25972.54, 'Night');
INSERT INTO EMPLOYEES VALUES (13, 'Yancy', 'Teulier','710-10-4561','76917 Vernon Circle','05-06-1993','08-04-2012','866-939-1459','yteulierc@sciencedaily.com',18,6,1,38699.53,'Morning');
INSERT INTO EMPLOYEES VALUES (14, 'Berne', 'Downie', '787-62-5415', '27696 Jenna Pass', '12-10-1999','10-09-2002', '914-447-5691', 'bdownied@wikispaces.com', 7, 5, 2, 12364.16, 'Night');
INSERT INTO EMPLOYEES VALUES (15, 'Raine', 'Shirland', '895-24-6624', '2 Bobwhite Trail', '04-09-1985','03-05-2000', '510-316-5848', 'rshirlande@soundcloud.com', 7, 5, 3, 11281.39, 'Afternoon');
INSERT INTO EMPLOYEES VALUES (16, 'Jena', 'Guillem', '751-77-9312', '4976 Mosinee Parkway', '29-07-1982','13-07-2006', '718-277-1648', 'jguillemf@blogtalkradio.com', 8, 4, 3, 15573.16, 'Morning');
INSERT INTO EMPLOYEES VALUES (17, 'Valentia', 'Iacovone', '707-56-0821', '2265 Commercial Crossing', '16-12-1986','25-07-2000', '805-382-6530', 'viacovoneg@usa.gov', 8, 4, 4, 18485.67, 'Morning');
INSERT INTO EMPLOYEES VALUES (18, 'Serge', 'Ottey', '160-44-5707', '65036 Ronald Regan Street', '11-05-1999','17-07-2007', '566-106-8828', 'sotteyh@chicagotribune.com', 8, 4, 5, 14183.25, 'Morning');
INSERT INTO EMPLOYEES VALUES (19, 'Theodore', 'Hudd', '160-60-7371', '28 Golden Leaf Drive', '25-02-1995','28-09-2002', '576-332-7296', 'thuddi@instagram.com', 2, 1, 1, 39607.34, 'Morning');
INSERT INTO EMPLOYEES VALUES (20, 'Milton', 'Blincoe', '146-62-0777', '293 Armistice Road', '30-01-1994','02-11-2002', '224-505-6689', 'mblincoej@github.io', 14, 2, 3, 19184.75, 'Morning');
INSERT INTO EMPLOYEES VALUES (21, 'Carmella','Lawday','633-60-3836','6988 Dakota Circle','07-11-2005','19-11-2012','904-743-9853','clawdayk@yahoo.co.jp',7,5,1,38217.99,'Afternoon');
INSERT INTO EMPLOYEES VALUES (22,'Tobie', 'Kinloch','400-24-4479','6049 Dakota Road','21-10-1988','05-12-2000','301-215-3263','tkinlochl@gnu.org',14,2,1,16656.87,'Night');
INSERT INTO EMPLOYEES VALUES (23,'Lacy', 'Fredi','123-19-2298','75529 Longview Hill','07-10-2003','17-09-2006','253-669-6664','lfredim@sun.com',14,2,2,14982.82,'Afternoon');
INSERT INTO EMPLOYEES VALUES (24,'Robinet', 'Chatelot','479-16-8686','09 Ludington Avenue','14-12-1990','01-04-2009','687-264-6978','rchatelot@sccamerican.com',9,2,1,16983.38,'Morning');
INSERT INTO EMPLOYEES VALUES (25,'Alric', 'Laws','676-65-4359','9118 Dahle Point','28-01-1981','22-01-2010','692-437-2145','alawso@marriott.com',10,3,3,31007.09,'Afternoon');
INSERT INTO EMPLOYEES VALUES (26,'Luciana', 'Hurleston','572-33-1825','09699 Blue Bill Park Park','17-02-1996','09-06-2009','764-512-6494','lhurlestonp@unblog.fr',7,5,4,11528.48,'Morning');
INSERT INTO EMPLOYEES VALUES (27,'Karlotta', 'Hellmore','500-31-4671','190 Manitowish Circle','28-09-1987','29-07-2001','368-137-3204','khellmoreq@dot.gov',15,7,2,9951.50,'Afternoon');
INSERT INTO EMPLOYEES VALUES (28,'Cordey', 'Troyes','537-29-6554','8405 Monica Road','25-02-1989','07-05-2006','213-657-1881','ctroyesr@theglobeandmail.com',9,2,2,13559.28,'Morning');
INSERT INTO EMPLOYEES VALUES (29,'Jasen', 'Durn','402-72-7878','783 Buena Vista Place','01-12-1988','25-10-2009','967-213-2235','jdurns@quantcast.com',9,2,3,16235.74,'Night');
INSERT INTO EMPLOYEES VALUES (30,'Sondra', 'Watton','397-78-2562','6050 Bashford Road','26-12-2005','15-04-2004','725-180-8361','swattont@vk.com',11,3,4,32844.68,'Afternoon');
INSERT INTO EMPLOYEES VALUES (31,'Alphonse', 'Brockie','440-16-2244','44 Victoria Plaza','01-01-2001','27-08-2005','718-838-8880','abrockieu@acquirethisname.com',7,5,5,11871.29,'Morning');
INSERT INTO EMPLOYEES VALUES (32,'Lita', 'Wallington','502-52-2739','585 Stephen Junction','25-02-1990','27-10-2007','974-241-8829','lwallingtonv@google.es',15,7,3,8467.03,'Night');
INSERT INTO EMPLOYEES VALUES (33,'Wenonah' ,'Capron','817-09-9171','710 Florence Crossing','12-02-2005','21-05-2006','638-987-1494','wcapronw@blogs.com',17,6,5,27509.38,'Night');
INSERT INTO EMPLOYEES VALUES (34,'Tabbi', 'Havock','314-60-5395','19 Little Fleur Hill','20-05-1998','10-11-2002','295-594-0083','thavockx@amazon.co.jp',9,2,4,18045.51,'Afternoon');
INSERT INTO EMPLOYEES VALUES (35,'Winifred', 'Chalder','610-37-7203','327 Oriole Court','20-04-1982','31-05-2002','239-863-9921','wchaldery@ustream.tv',15,7,4,8393.39,'Night');
INSERT INTO EMPLOYEES VALUES (36,'Brit','Treadger','217-45-4694','6 Spaight Hill','17-11-1982','12-10-2000','259-585-5192','btreadgerz@freewebs.com',13,5,5,27538.31,'Afternoon');
INSERT INTO EMPLOYEES VALUES (37,'Alleyn','Sans','866-70-0560','9576 Rigney Drive','10-12-1980','17-03-2010','243-351-4062','asans10@adobe.com',14,2,4,15019.29,'Afternoon');
INSERT INTO EMPLOYEES VALUES (38,'Shell','Haldin','645-47-1901','7697 Eastwood Crossing','28-12-2005','01-08-2011','955-213-0567','shaldin11@ihg.com',15,7,5,7775.68,'Night');
INSERT INTO EMPLOYEES VALUES (39,'Westley','Hovert','266-87-5061','98 Bartillon Circle','04-01-1981','05-11-2008','693-384-0392','whovert12@vk.com',9,2,5,15587.82,'Afternoon');
INSERT INTO EMPLOYEES VALUES (40,'Merlina','D Angelo','155-48-2939','3194 Summer Ridge Circle','13-10-1980','17-12-2002','499-148-3326','mdangelo13@lulu.com',8,4,5,28737.97,'Morning');

-- INSERT'S DE LA TABLA CUSTOMER
INSERT INTO CUSTOMER VALUES (1,'Tarrah August','234-04-7095','2474 Loomis Trail','699-722-4189','taugust0@accuweather.com');
INSERT INTO CUSTOMER VALUES (2,'Reyna Kelsell','618-77-3007','59784 Morrow Terrace','926-916-5165','rkelsell1@wired.com');
INSERT INTO CUSTOMER VALUES (3,'Arly Piddle','734-99-5913','294 Hallows Crossing','415-611-0743','apiddle2@wikimedia.org');
INSERT INTO CUSTOMER VALUES (4,'Armin Folkard','461-01-2871','33 Acker Way','378-793-7143','afolkard3@amazon.co.jp');
INSERT INTO CUSTOMER VALUES (5,'Rodge Esmead','214-53-8686','072 Ruskin Plaza','199-234-3777','resmead4@netscape.com');
INSERT INTO CUSTOMER VALUES (6,'Fredrika Redfield','462-51-3861','7158 Myrtle Crossing','488-634-5684','fredfield5@wsj.com');
INSERT INTO CUSTOMER VALUES (7,'Andy Edgcombe','845-93-2242','1 Randy Way','726-198-5611','aedgcombe6@zimbio.com');
INSERT INTO CUSTOMER VALUES (8,'Fredi Coolahan','674-20-0355','7 Meadow Vale Point','154-911-6630','fcoolahan7@umich.edu');
INSERT INTO CUSTOMER VALUES (9,'Eugene Beazley','536-96-2403','8 Linden Lane','894-640-2862','ebeazley8@fda.gov');
INSERT INTO CUSTOMER VALUES (10,'Bill Sergent','344-37-8962','6 Dunning Hill','507-614-8811','bsergent9@addthis.com');
INSERT INTO CUSTOMER VALUES (11,'Tam Cankett','368-16-1288','5445 Karstens Road','856-227-0543','tcanketta@ifeng.com');
INSERT INTO CUSTOMER VALUES (12,'Emmeline Jeffs','719-13-4746','41 Jenna Lane','466-412-4710','ejeffsb@ucsd.edu');
INSERT INTO CUSTOMER VALUES (13,'Allen Bing','460-85-2487','24792 Clove Center','297-585-5282','abingc@unblog.fr');
INSERT INTO CUSTOMER VALUES (14,'Elfreda Hiddsley','108-82-2856','2832 Bartelt Avenue','622-347-4879','ehiddsleyd@opera.com');
INSERT INTO CUSTOMER VALUES (15,'Angil Clemmens','689-41-6407','5225 Hollow Ridge Terrace','840-183-1508','aclemmense@t.co');
INSERT INTO CUSTOMER VALUES (16,'Kerwinn Padginton','116-97-0681','223 North Hill','646-852-4888','kpadgintonf@paginegialle.it');
INSERT INTO CUSTOMER VALUES (17,'Earvin Benham','102-03-5149','499 Lillian Street','105-236-8056','ebenhamg@businessweek.com');
INSERT INTO CUSTOMER VALUES (18,'Melania Weafer','156-17-9782','540 Sullivan Trail','374-838-6613','mweaferh@technorati.com');
INSERT INTO CUSTOMER VALUES (19,'Mary Mewis','716-30-3664','695 Carpenter Circle','447-387-4846','mmewisi@un.org');
INSERT INTO CUSTOMER VALUES (20,'Hildegaard De Bruyne','755-94-0767','12 Jay Terrace','604-989-8240','hdej@chronoengine.com');

-- INSERT'S DE LA TABLA SUPPLIERS
INSERT INTO SUPPLIERS VALUES (1,'Odelinda Millott','767-44-9561','5582 Dryden Court','990-432-5806','omillott0@rambler.ru');
INSERT INTO SUPPLIERS VALUES (2,'Rowen McGillecole','475-12-7450','3040 Graceland Way','478-776-8759','rmcgillecole1@epa.gov');
INSERT INTO SUPPLIERS VALUES (3,'Levey Ferson','814-04-6811','2 Loomis Junction','367-623-4561','lferson2@boston.com');
INSERT INTO SUPPLIERS VALUES (4,'Katharine Gresch','895-31-3867','7 Talisman Street','885-440-6336','kgresch3@fda.gov');
INSERT INTO SUPPLIERS VALUES (5,'Leland Liverseege','889-21-0148','569 Bunker Hill Street','836-914-3622','lliverseege4@eventbrite.com');
INSERT INTO SUPPLIERS VALUES (6,'Flint Wilsdon','493-39-0301','8 Coleman Center','143-482-0264','fwilsdon5@ucoz.ru');
INSERT INTO SUPPLIERS VALUES (7,'Fidela Milburn','189-85-7831','0 Londonderry Trail','317-261-6992','fmilburn6@illinois.edu');
INSERT INTO SUPPLIERS VALUES (8,'Rowan Jaynes','283-78-0751','749 Grasskamp Avenue','712-180-3134','rjaynes7@bloglines.com');
INSERT INTO SUPPLIERS VALUES (9,'Trenna Davydychev','810-21-1267','0927 Dorton Lane','503-199-5476','tdavydychev8@gnu.org');
INSERT INTO SUPPLIERS VALUES (10,'Casie Smithyman','627-27-5773','81 Bunker Hill Terrace','914-690-5398','csmithyman9@macromedia.com');
INSERT INTO SUPPLIERS VALUES (11,'Stephan Ashfold','396-64-5002','97 Arrowood Avenue','227-920-1776','sashfolda@livejournal.com');
INSERT INTO SUPPLIERS VALUES (12,'Sue Lindenstrauss','878-30-3681','46 Marcy Plaza','185-755-6276','slindenstraussb@myspace.com');
INSERT INTO SUPPLIERS VALUES (13,'Berky Gloster','576-35-5107','2651 Corscot Trail','107-987-2852','bglosterc@china.com.cn');
INSERT INTO SUPPLIERS VALUES (14,'Ingaborg Wellard','469-89-7548','20027 Thierer Pass','753-635-0118','iwellardd@meetup.com');
INSERT INTO SUPPLIERS VALUES (15,'Angie McOwan','605-75-3259','806 8th Pass','984-851-3037','amcowane@51.la');
INSERT INTO SUPPLIERS VALUES (16,'Taddeusz Abella','278-20-2789','580 Redwing Hill','648-983-8154','tabellaf@plala.or.jp');
INSERT INTO SUPPLIERS VALUES (17,'Myrlene Gusticke','438-69-3736','41844 Lakewood Gardens Pass','194-627-7881','mgustickeg@123-reg.co.uk');
INSERT INTO SUPPLIERS VALUES (18,'Felicdad Jaques','189-65-3733','9361 Mcbride Park','385-804-7178','fjaquesh@sciencedirect.com');
INSERT INTO SUPPLIERS VALUES (19,'Sheila Arber','742-06-7474','0 Truax Terrace','759-164-3822','sarberi@apple.com');
INSERT INTO SUPPLIERS VALUES (20,'Gard Haston','102-88-8347','8536 Arrowood Pass','140-670-0440','ghastonj@nba.com');
INSERT INTO SUPPLIERS VALUES (21,'Florette Nozzolinii','483-87-7098','5855 Mcguire Pass','290-903-3894','fnozzoliniik@reverbnation.com');
INSERT INTO SUPPLIERS VALUES (22,'Tera Eringey','515-33-7821','110 Nevada Way','268-481-7904','teringeyl@eventbrite.com');
INSERT INTO SUPPLIERS VALUES (23,'Gaye Pelos','623-30-3344','32 Corben Court','789-664-8819','gpelosm@wordpress.org');
INSERT INTO SUPPLIERS VALUES (24,'Leif Rookwell','689-73-2743','16037 Bellgrove Place','952-948-8397','lrookwelln@over-blog.com');
INSERT INTO SUPPLIERS VALUES (25,'Pandora Gracewood','360-83-9688','83596 Meadow Vale Park','905-460-3058','pgracewoodo@simplemachines.org');
INSERT INTO SUPPLIERS VALUES (26,'Garrett Note','231-96-0191','28 Melvin Pass','127-694-9820','gnotep@scientificamerican.com');
INSERT INTO SUPPLIERS VALUES (27,'Lelia Bartunek','195-36-8415','475 Valley Edge Place','561-742-1272','lbartunekq@amazon.co.jp');
INSERT INTO SUPPLIERS VALUES (28,'Stillmann Ivasechko','300-24-8366','8 Namekagon Plaza','961-999-8748','sivasechkor@mtv.com');
INSERT INTO SUPPLIERS VALUES (29,'Teodor Brixey','334-98-4173','304 Oak Center','236-952-2427','tbrixeys@youtube.com');
INSERT INTO SUPPLIERS VALUES (30,'Llywellyn Tatterton','723-75-5271','478 Corben Drive','492-695-5201','ltattertont@uol.com.br');

-- INSERT'S DE LA TABLA PROPERTYS
INSERT INTO PROPERTYS VALUES (1,'282-82-9823','34 Pennsylvania Junction','-63.8950786','07-05-2004','17-10-2008','Apartment',1,7487306.49);
INSERT INTO PROPERTYS VALUES (2,'653-55-2525','57 American Ash Trail','119.944048','30-06-1973','15-02-2012','Apartment',2,5294668.21);
INSERT INTO PROPERTYS VALUES (3,'242-39-0737','23666 Del Sol Drive','16.5096453','19-04-1986', '24-11-2008', 'Condominium',3,19136998.30);
INSERT INTO PROPERTYS VALUES (4,'550-07-7411','72937 Crest Line Avenue','12.9380053','02-09-2004', '12-07-2012', 'Home',4,10722437.22);
INSERT INTO PROPERTYS VALUES (5,'227-84-7012','56974 Menomonie Avenue','17.3786013','04-05-1983', '23-01-2009', 'Home',5,2663645.42);
INSERT INTO PROPERTYS VALUES (6,'448-45-9290','05 Sycamore Terrace','126.008096','14-09-1993','18-10-2009', 'Condominium',6,5080231.85);
INSERT INTO PROPERTYS VALUES (7,'451-41-3542','54077 Northport Terrace','-80.0964415','20-05-2006', '25-01-2010', 'Residential',7,8000663.09);
INSERT INTO PROPERTYS VALUES (8,'359-28-6924','7 Hudson Avenue','65.1254488','02-12-1995', '30-12-2009','Apartment',8,3374300.08);
INSERT INTO PROPERTYS VALUES (9,'736-95-3829','84 Sullivan Terrace','120.8576801','15-09-1972', '29-08-2011', 'Condominium',9,1139938.31);
INSERT INTO PROPERTYS VALUES (10,'860-24-5116','8 Clemons Point','27.4110397','09-01-2007', '30-10-2012', 'Home',10,14908503.72);
INSERT INTO PROPERTYS VALUES (11,'490-41-6176','390 Hoard Terrace','12.9355428','30-11-1977', '21-07-2012', 'Commercial',11,24832368.32);
INSERT INTO PROPERTYS VALUES (12,'791-09-8541','3 Weeping Birch Terrace','168.3457088','19-09-1970', '15-02-2010','Apartment',12,15805218.38);
INSERT INTO PROPERTYS VALUES (13,'253-36-9394','4690 Mayfield Way','21.6226189','30-05-2009', '06-07-2010', 'Parking',13,8268860.99);
INSERT INTO PROPERTYS VALUES (14,'528-18-1243','763 Westridge Crossing','139.5476397','26-06-1987','16-03-2011', 'Commercial',14,12911847.55);
INSERT INTO PROPERTYS VALUES (15,'744-75-2664','1932 Linden Road','114.128354','21-09-1986', '17-10-2008', 'Home',15,24002179.59);
INSERT INTO PROPERTYS VALUES (16,'639-90-2858','41 Bellgrove Center','46.6632999','07-03-1987', '06-09-2010', 'Residential',16,11912267.40);
INSERT INTO PROPERTYS VALUES (17,'606-53-9720','93 Farwell Avenue','121.9833298','29-04-2001', '11-03-2012', 'Apartment',17,23052101.07);
INSERT INTO PROPERTYS VALUES (18,'699-46-5207','3781 Carioca Lane','122.086156','19-03-1986', '07-09-2011', 'Home',18,24069561.30);
INSERT INTO PROPERTYS VALUES (19,'688-65-6181','1494 Golf View Plaza','124.5514906','01-11-1972','17-02-2010', 'Condominium',19,15137538.13);
INSERT INTO PROPERTYS VALUES (20,'698-07-6108','45454 Duke Pass','15.909036','25-07-1979', '15-04-2009', 'Residential',20,10925941.93);
INSERT INTO PROPERTYS VALUES (21,'568-17-2893','163 Dovetail Junction','-104.016667','22-01-1998', '29-12-2009', 'Apartment',21,12718407.15);
INSERT INTO PROPERTYS VALUES (22,'558-93-8817','36 Jackson Hill','120.997332','07-04-1993', '28-06-2009', 'Parking',22,5038063.08);
INSERT INTO PROPERTYS VALUES (23,'677-59-7772','3991 Bashford Street','106.1713267','02-11-1993', '22-07-2010', 'Condominium',23,602016.18);
INSERT INTO PROPERTYS VALUES (24,'121-37-8288','02265 Grasskamp Terrace','80.682308','26-09-1983', '11-02-2009','Residential',24,2656554.07);
INSERT INTO PROPERTYS VALUES (25,'573-62-9603','4 Ryan Circle','121.001601','21-08-1980', '04-06-2011', 'Apartment',25,24907345.60);
INSERT INTO PROPERTYS VALUES (26,'800-42-7999','86721 Vera Place','7.6832998','01-01-2005', '06-07-2010', 'Commercial',26,17042547.98);
INSERT INTO PROPERTYS VALUES (27,'129-37-4524','52702 Vermont Lane','21.5226322','12-11-1970', '27-12-2008', 'Home',27,19831672.15);
INSERT INTO PROPERTYS VALUES (28,'496-68-1181','91605 Bultman Plaza','120.401159','16-05-2009', '04-01-2010', 'Commercial',28,24441689.41);
INSERT INTO PROPERTYS VALUES (29,'233-32-1803','77030 Kedzie Court','3.5276642', '22-09-1976', '02-10-2011', 'Residential',29,10526288.70);
INSERT INTO PROPERTYS VALUES (30,'662-14-4721','5 Hoard Alley','123.9674831', '01-05-1997', '03-03-2011', 'Condominium',30,17039493.58);
INSERT INTO PROPERTYS VALUES (31,'788-36-1246','84546 Homewood Point','-71.20892','30-06-2005', '08-03-2012', 'Parking',1,5360384.29);
INSERT INTO PROPERTYS VALUES (32,'316-71-8968','1964 Moulton Plaza','48.6388661','31-07-1998', '10-07-2011', 'Commercial',2,21170048.57);
INSERT INTO PROPERTYS VALUES (33,'768-34-8439','00 Corscot Avenue','-111.76844','10-06-1977', '27-05-2010','Residential',3,10563015.94);
INSERT INTO PROPERTYS VALUES (34,'391-19-3179','13478 Saint Paul Road','-75.5975296','06-11-1985', '04-10-2010', 'Parking',4,9620409.36);
INSERT INTO PROPERTYS VALUES (35,'327-27-2072','85769 Vermont Alley','108.366543','01-05-1985', '01-02-2012', 'Commercial',5,23842478.72);

-- INSERT'S PARA LA TABLA STATUS_PROPERTY
INSERT INTO STATUS_PROPERTY VALUES (1, 'On sale');
INSERT INTO STATUS_PROPERTY VALUES (2, 'For rent');
INSERT INTO STATUS_PROPERTY VALUES (3, 'Sold out');
INSERT INTO STATUS_PROPERTY VALUES (4, 'Rented');
INSERT INTO STATUS_PROPERTY VALUES (5, 'Financing');

-- INSERT'S DE LA TABLA FACT_PROPERTY
INSERT INTO FACT_PROPERTY VALUES (1,1,1,1,5,1,'17-10-2008');
INSERT INTO FACT_PROPERTY VALUES (2,2,2,2,5,2,'15-02-2012');
INSERT INTO FACT_PROPERTY VALUES (3,3,3,3,5,3,'24-11-2008');
INSERT INTO FACT_PROPERTY VALUES (4,4,4,4,5,4,'12-07-2012');
INSERT INTO FACT_PROPERTY VALUES (5,5,5,5,5,5,'23-06-2009');
INSERT INTO FACT_PROPERTY VALUES (6,6,6,6,5,1,'18-10-2009');
INSERT INTO FACT_PROPERTY VALUES (7,7,7,7,5,2,'25-01-2010');
INSERT INTO FACT_PROPERTY VALUES (8,8,8,8,14,3,'30-12-2009');
INSERT INTO FACT_PROPERTY VALUES (9,9,9,9,14,4,'29-08-2011');
INSERT INTO FACT_PROPERTY VALUES (10,10,10,10,14,5,'30-10-2012');
INSERT INTO FACT_PROPERTY VALUES (11,11,11,11,14,1,'21-07-2012');
INSERT INTO FACT_PROPERTY VALUES (12,12,12,12,14,2,'15-02-2010');
INSERT INTO FACT_PROPERTY VALUES (13,13,13,13,14,3,'06-07-2010');
INSERT INTO FACT_PROPERTY VALUES (14,14,14,14,14,4,'16-03-2011');
INSERT INTO FACT_PROPERTY VALUES (15,15,15,15,21,5,'17-10-2008');
INSERT INTO FACT_PROPERTY VALUES (16,16,16,16,21,1,'06-09-2010');
INSERT INTO FACT_PROPERTY VALUES (17,17,17,17,21,2,'11-03-2012');
INSERT INTO FACT_PROPERTY VALUES (18,18,18,18,21,3,'07-09-2011');
INSERT INTO FACT_PROPERTY VALUES (19,19,19,19,21,4,'17-02-2010');
INSERT INTO FACT_PROPERTY VALUES (20,20,20,20,21,4,'15-04-2009');
INSERT INTO FACT_PROPERTY VALUES (21,21,NULL,21,26,1,'29-12-2009');
INSERT INTO FACT_PROPERTY VALUES (22,22,1,22,26,2,'28-01-2009');
INSERT INTO FACT_PROPERTY VALUES (23,23,NULL,23,26,3,'22-07-2010');
INSERT INTO FACT_PROPERTY VALUES (24,24,5,24,26,4,'11-02-2009');
INSERT INTO FACT_PROPERTY VALUES (25,25,9,25,26,1,'04-06-2011');
INSERT INTO FACT_PROPERTY VALUES (26,26,2,26,26,1,'06-07-2010');
INSERT INTO FACT_PROPERTY VALUES (27,27,NULL,27,26,2,'27-12-2008');
INSERT INTO FACT_PROPERTY VALUES (28,28,14,28,31,3,'04-01-2010');
INSERT INTO FACT_PROPERTY VALUES (29,29,15,29,31,4,'02-10-2011');
INSERT INTO FACT_PROPERTY VALUES (30,30,NULL,30,31,1,'03-03-2011');
INSERT INTO FACT_PROPERTY VALUES (31,31,13,1,31,1,'08-03-2012');
INSERT INTO FACT_PROPERTY VALUES (32,32,18,2,31,1,'10-07-2011');
INSERT INTO FACT_PROPERTY VALUES (33,33,NULL,3,31,2,'27-05-2010');
INSERT INTO FACT_PROPERTY VALUES (34,34,17,4,31,2,'04-10-2010');
INSERT INTO FACT_PROPERTY VALUES (35,35,6,5,31,3,'01-02-2012');