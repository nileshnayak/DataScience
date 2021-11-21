################################## Creating databases ##################################

CREATE SCHEMA `nayak21200475` ;

CREATE TABLE `nayak21200475`.`hospital` (
  `hospital_id` VARCHAR(45) NOT NULL,
  `hospital_name` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hospital_id`));

CREATE TABLE `nayak21200475`.`candidate` (
  `candidate_id` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `skills` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`candidate_id`, `skills`, `telephone`));

CREATE TABLE `nayak21200475`.`position` (
  `position_id` VARCHAR(45) NOT NULL,
  `position_type` VARCHAR(45) NOT NULL,
  `hosp_id_advertising_position` VARCHAR(45) NOT NULL,
  `skills_required` VARCHAR(45) NOT NULL,
  `no_of_positions` INT NOT NULL,
  PRIMARY KEY (`position_id`, `skills_required`, `position_type`, `hosp_id_advertising_position`));

CREATE TABLE `nayak21200475`.`interview` (
  `interview_id` VARCHAR(45) NOT NULL,
  `interview_role` VARCHAR(45) NOT NULL,
  `interview_date` DATE NOT NULL,
  `interview_candidate_id` VARCHAR(45) NOT NULL,
  `interview_hospital_id` VARCHAR(45) NOT NULL,
  `offered` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`interview_id`));

CREATE TABLE `nayak21200475`.`skills_mapping` (
  `skill_id` INT NOT NULL,
  `skill_name` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`));

CREATE TABLE `nayak21200475`.`offers` (
  `candidate_id` INT NOT NULL,
  `interview_id` INT NOT NULL,
  `position_id` INT NOT NULL,
  `offered` VARCHAR(45) NULL,
  PRIMARY KEY (`candidate_id`, `interview_id`,`position_id`));

############################ Populating the databases #################################33

# hospital table
INSERT INTO `nayak21200475`.`hospital` (`hospital_id`, `hospital_name`, `address`, `telephone`) 
VALUES ('H001','Apollo', 'Donegal', '888801'), 
('H002','Nutrival', 'Sandycove', '888802'), 
('H003','Childcare', 'Dublin', '888803'), 
('H004','Motherhood','Wicklow', '888804'), 
('H005','Opto', 'Phibsborough', '888805'), 
('H006','AsterLabs', 'Howth', '888806'), 
('H007','SunPharma', 'Bray', '888807'), 
('H008','HealthPlus', 'Abbey', '888808'), 
('H009','Nationcare', 'Cork', '888809'), 
('H0010','Rainbow', 'Galway', '888810'), 
('H0011','Indiana', 'Limmerick', '888811');

# candidate table
# Each candidate can have many skills.
INSERT INTO `nayak21200475`.`candidate`(`candidate_id`,`firstname`,`surname`,`address`,`telephone`,`skills`) 
VALUES ('C001','David', 'Boyle', 'Donegal', '9999901', 'diagnosis'), 
('C001','David', 'Boyle', 'Donegal', '9999901', 'communication'), 
('C002','Marta', 'Grosso', 'Wicklow', '9999902', 'counselling'),
('C003','Jon', 'Doe', 'Sandyford', '9999903', 'investigation'),
('C003','Jon', 'Doe', 'Sandyford', '9999903', 'critical thinking'),
('C004','Nilesh', 'Nayak', 'Sandyford', '9999904', 'training'),
('C005','Mikael', 'Souza', 'Dublin', '9999905', 'active listening'),
('C006','Sankesh', 'Jain', 'Bray', '9999906' , 'leadership'),
('C007','Saurabh', 'Ban', 'Howth', '9999907', 'leadership'),
('C008','Cian', 'Kinally', 'Baltimore', '9999908', 'counselling'),
('C009','Busra', 'Cebecii', 'Phibsborough', '9999909', 'managing resources'),
('C009','Busra', 'Cebecii', 'Phibsborough', '9999909', 'training'),
('C1010','Jeanette', 'Costa', 'Sandycove', '9999910','communication');

# position table
# Each position can require many skills
INSERT INTO `nayak21200475`.`position` 
(`position_id`, `position_type`, `hosp_id_advertising_position`, `skills_required`, `no_of_positions`) 
VALUES ('10001','Virologist', 'H001', 'investigation', '1'),
('10002','Nurse', 'H003', 'critical thinking', '4'),
('10002','Nurse', 'H003', 'investigation', '4'),
('10004','Lab Technician', 'H008', 'communication', '1'),
('10005','Assistant', 'H006', 'managing resources', '2'),
('10006','Client Manager', 'H007', 'managing resources', '2'),
('10006','Client Manager', 'H007', 'training', '2'),
('10008','Receptionist', 'H0011', 'managing resources', '5'),
('10009','Support Staff', 'H007', 'communication', '1'),
('10010','Doctor', 'H005', 'investigation', '3'),
('10010','Doctor', 'H005', 'diagnosis', '3'),
('10010','Doctor', 'H005', 'leadership', '3');

# interview table 
# One hospital can request many interviews for a position.
# One candidate can be invited to many interviews in relation to a position
# One hospital can hire many candidates in relation to a position
INSERT INTO `nayak21200475`.`interview` 
(`interview_id`,`interview_role`,`interview_date`,`interview_candidate_id`,`interview_hospital_id`,`offered`) 
VALUES
('I101','Virologist', '2021-01-01', 'C003', 'H001', 'yes'),
('I102','Virologist', '2021-01-01', 'C004', 'H001', 'no'),
('I103','Assistant', '2021-01-01', 'C004', 'H006', 'yes'),
('I104','Client Manager', '2021-01-02', 'C005', 'H007', 'yes'),
('I105','Client Manager', '2021-01-03', 'C006', 'H007', 'yes'),
('I106','Lab Technician', '2021-01-07', 'C005', 'H008', 'yes'),
('I107','Doctor', '2021-01-08', 'C007', 'H005', 'yes'),
('I108','Doctor', '2021-01-09', 'C008', 'H005', 'no'),
('I109','Receptionist', '2021-01-21', 'C009', 'H0011', 'yes'),
('I111','Nurse', '2021-01-22', 'C003', 'H002', 'yes'),
('I112','Nurse', '2021-01-25', 'C004', 'H002', 'no'),
('I113','Nurse', '2021-01-26', 'C005', 'H002', 'no'),
('I114','Nurse', '2021-01-27', 'C006', 'H002', 'yes');

############################ STORED PROCS to populate tables #########################################################################################################

CREATE PROCEDURE `enter_position_table_details`(IN position_id VARCHAR(45), IN position_type VARCHAR(45), IN hosp_id_advertising_position VARCHAR(45), IN skills_required VARCHAR(45), IN no_of_positions INT)
BEGIN
INSERT INTO `nayak21200475`.`position` (`position_id`, `position_type`, `hosp_id_advertising_position`, `skills_required`, `no_of_positions`) 
VALUES ( position_id, position_type, hosp_id_advertising_position, skills_required, no_of_positions);
END

CREATE PROCEDURE `enter_interview_table_details` (IN interview_id VARCHAR(45), IN interview_role VARCHAR(45), IN interview_date DATE, IN interview_candidate_id VARCHAR(45), 
IN interview_hospital_id VARCHAR(45), IN offered VARCHAR(45))
BEGIN
INSERT INTO `nayak21200475`.`interview` (`interview_id`,`interview_role`,`interview_date`,`interview_candidate_id`,`interview_hospital_id`,`offered`) 
VALUES (interview_id,interview_role,interview_date,interview_candidate_id,interview_hospital_id,offered); 
END


CREATE PROCEDURE `enter_candidate_table_details`(IN candidate_id VARCHAR(45), IN firstname VARCHAR(45), IN surname DATE, IN address VARCHAR(45), IN telephone INT, IN skills VARCHAR(45))
BEGIN
INSERT INTO `nayak21200475`.`candidate` (`candidate_id`,`firstname`,`surname`,`address`,`telephone`,`skills`) 
VALUES (candidate_id , firstname , surname,  address, telephone, skills);
END


CREATE PROCEDURE `enter_hospital_table_details`(IN hospital_id VARCHAR(45), IN hospital_name VARCHAR(45), IN address VARCHAR(45), IN telephone INT)
BEGIN
INSERT INTO `nayak21200475`.`hospital` (`hospital_id`, `hospital_name`, `address`, `telephone`) 
VALUES (hospital_id, hospital_name, address, telephone);
END


###########################  CHECKING STORED PROC DATA ENTRY ##################################

# stored proc - new entry test
call nayak21200475.enter_candidate_table_details
('C0012','Miley', 'Jones', 'Wicklow', '9999916', 'active listening');
call nayak21200475.enter_hospital_table_details
('H025','Kidneycare', 'Donegal', '888825');
call nayak21200475.enter_interview_table_details
('I113','Virologist', '2021-01-01', 'C1010', 'H007', 'no');
call nayak21200475.enter_position_table_details
('10011','Virologist', 'H001', 'investigation', '1');
call nayak21200475.enter_position_table_details
('10011','Virologist', 'H001', 'critical thinking', '1');

# stored proc - duplicate entries test
call nayak21200475.enter_candidate_table_details
('C005','Mikael', 'Souza', 'Dublin', '9999905', 'active listening');
call nayak21200475.enter_hospital_table_details
('H001','Apollo', 'Donegal', '888801');
call nayak21200475.enter_interview_table_details
('I113','Virologist', '2021-01-01', 'C1010', 'H007', 'yes');
call nayak21200475.enter_position_table_details
('10001','Virologist', 'H001', 'investigation', '1');

################################  Make table constraints and links  ###########################

## Make table constraints and links
# check foreign key constraints
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'hospital';
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'candidate';
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'interview';
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'position';


################################  Constraints added ################################################################ 

#constraints added

ALTER TABLE `nayak21200475`.`position` 
ADD INDEX `hosp_id_idx` (`hosp_id_advertising_position` ASC) VISIBLE;
;
ALTER TABLE `nayak21200475`.`position` 
ADD CONSTRAINT `hosp_id`
  FOREIGN KEY (`hosp_id_advertising_position`)
  REFERENCES `nayak21200475`.`hospital` (`hospital_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `nayak21200475`.`interview` 
ADD CONSTRAINT `interview_candidate`
  FOREIGN KEY (`interview_candidate_id`)
  REFERENCES `nayak21200475`.`candidate` (`candidate_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `nayak21200475`.`interview` 
ADD CONSTRAINT `interview_hospital`
  FOREIGN KEY (`interview_hospital_id`)
  REFERENCES `nayak21200475`.`hospital` (`hospital_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `nayak21200475`.`position` 
ADD INDEX `pos_role` (`position_type` ASC) VISIBLE;
ALTER TABLE `nayak21200475`.`position` ALTER INDEX `hosp_id_idx` INVISIBLE;

ALTER TABLE `nayak21200475`.`interview` 
ADD CONSTRAINT `interview_position`
  FOREIGN KEY (`interview_role`)
  REFERENCES `nayak21200475`.`position` (`position_type`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


#adding cascades

ALTER TABLE `nayak21200475`.`interview` 
DROP FOREIGN KEY `interview_candidate`,
DROP FOREIGN KEY `interview_hospital`,
DROP FOREIGN KEY `interview_position`;
ALTER TABLE `nayak21200475`.`interview` 
ADD CONSTRAINT `interview_candidate`
  FOREIGN KEY (`interview_candidate_id`)
  REFERENCES `nayak21200475`.`candidate` (`candidate_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `interview_hospital`
  FOREIGN KEY (`interview_hospital_id`)
  REFERENCES `nayak21200475`.`hospital` (`hospital_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `interview_position`
  FOREIGN KEY (`interview_role`)
  REFERENCES `nayak21200475`.`position` (`position_type`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


ALTER TABLE `nayak21200475`.`position` 
DROP FOREIGN KEY `hosp_id`;
ALTER TABLE `nayak21200475`.`position` 
ADD CONSTRAINT `hosp_id`
  FOREIGN KEY (`hosp_id_advertising_position`)
  REFERENCES `nayak21200475`.`hospital` (`hospital_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


ALTER TABLE `nayak21200475`.`interview` 
DROP FOREIGN KEY `interview_candidate`;
ALTER TABLE `nayak21200475`.`interview` 
ADD CONSTRAINT `interview_candidate`
  FOREIGN KEY (`interview_candidate_id`)
  REFERENCES `nayak21200475`.`candidate` (`candidate_id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;



ALTER TABLE `nayak21200475`.`interview` 
ADD CONSTRAINT `interview_candidate`
  FOREIGN KEY (`interview_candidate_id`)
  REFERENCES `nayak21200475`.`candidate` (`candidate_id`)
  ON DELETE NO ACTION;


ALTER TABLE `nayak21200475`.`interview` 
DROP FOREIGN KEY `interview_candidate`,
DROP FOREIGN KEY `interview_hospital`,
DROP FOREIGN KEY `interview_position`;
ALTER TABLE `nayak21200475`.`interview` 
ADD CONSTRAINT `interview_candidate`
  FOREIGN KEY (`interview_candidate_id`)
  REFERENCES `nayak21200475`.`candidate` (`candidate_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `interview_hospital`
  FOREIGN KEY (`interview_hospital_id`)
  REFERENCES `nayak21200475`.`hospital` (`hospital_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `interview_position`
  FOREIGN KEY (`interview_role`)
  REFERENCES `nayak21200475`.`position` (`position_type`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `nayak21200475`.`position` 
DROP FOREIGN KEY `hosp_id`;
ALTER TABLE `nayak21200475`.`position` 
ADD CONSTRAINT `hosp_id`
  FOREIGN KEY (`hosp_id_advertising_position`)
  REFERENCES `nayak21200475`.`hospital` (`hospital_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



##################################### Checking data below ###########################################

##checking all tables and data
select * from `nayak21200475`.`candidate`;
select * from `nayak21200475`.`hospital`;
select * from `nayak21200475`.`position`;
select * from `nayak21200475`.`interview`;


########################## Parametric queries with stored procs ##############################


CREATE PROCEDURE `query1` (IN hosp_id varchar(45))
BEGIN
select hospital_name from `nayak21200475`.`hospital` where hospital_id = hosp_id;
END

CREATE PROCEDURE `query2` (IN hosp_name varchar(45))
BEGIN
select * from `nayak21200475`.`hospital` where hospital_name = hosp_name;
END

CREATE PROCEDURE `query3` (in sur_name varchar(45))
BEGIN
select * from `nayak21200475`.`candidate` where surname = sur_name;
END

CREATE PROCEDURE `query4`(in pos_id varchar(45))
BEGIN
select distinct candidate_id, firstname, surname from candidate where skills in (select skills_required from `nayak21200475`.`position` where position_id = pos_id);
END

CREATE PROCEDURE `query5`()
BEGIN
select count(distinct interview_candidate_id) from interview where offered = 'yes';
END

CREATE PROCEDURE `query6` (in skills_reqd varchar(45))
BEGIN
select position_type from position where skills_required = skills_reqd;
END

CREATE PROCEDURE `query7`()
BEGIN
select sum(b.no_of_positions) as no_of_positions from (select distinct position_id, no_of_positions from position where position_type = "nurse") b;
END

CREATE PROCEDURE `query8`()
BEGIN
select h.hospital_name, p.position_type from position p , hospital h where p.hosp_id_advertising_position = h.hospital_id group by 1 order by 1 asc, 2 asc;
END

CREATE PROCEDURE `query9` (in intview_dt date)
BEGIN
select * from interview where `nayak21200475`.interview_date = intview_dt;
END

CREATE PROCEDURE `query10` (in intview_dt date)
BEGIN
select distinct interview_candidate_id from interview where `nayak21200475`.interview_date = intview_dt;
END


CREATE PROCEDURE `query11` ()
BEGIN
select distinct b.interview_candidate_id , c.firstname, c.surname 
from candidate c join 
(select interview_candidate_id, count(*) from interview  
group by interview_candidate_id 
having count(*) >= 2) b
on b.interview_candidate_id = c.candidate_id;
END

##################################### Queries below ###########################################

#1. Find the hospitals with a given hospital identifier.
select hospital_name from `nayak21200475`.`hospital` where hospital_id = 'H003';

#2. Find the hospitals with a given name.
select * from `nayak21200475`.`hospital` where hospital_name = 'Apollo';

#3. Find the candidates with a given surname.
select * from `nayak21200475`.`candidate` where surname = 'Cebecii';

#4. Find the candidates who have at least one skill required by a given position identifier.
select distinct candidate_id, firstname, surname from candidate where skills in (select skills_required from `nayak21200475`.`position` where position_id = '10002');

#5. Find the number of candidates that have been offered a position.
select count(distinct interview_candidate_id) from interview where offered = 'yes';

#6. Find the positions requiring a given skill.
select position_type from position where skills_required = "investigation";

#7. Find the number of positions that require nursing skills.
select sum(b.no_of_positions) as no_of_positions from (
select distinct position_id, no_of_positions from position where position_type = "nurse") b;

#8. Find the positions sorted according to the hospitals who are advertising them.
select h.hospital_name, p.position_type from position p , hospital h
where p.hosp_id_advertising_position = h.hospital_id
group by 1
order by 1 asc, 2 asc;

#9. Find the interviews that occurred on a given date.
select * from interview where interview_date = '2021-01-01';

#10. Find the identifier of candidates that were interviewed only on a specific date.
select distinct interview_candidate_id from interview where interview_date = '2021-01-01';

#11. Find the name and identifier of candidates that were interviewed at least twice.
select distinct b.interview_candidate_id , c.firstname, c.surname from candidate c join 
(select interview_candidate_id, count(*) from interview  
group by interview_candidate_id 
having count(*) >= 2) b
on b.interview_candidate_id = c.candidate_id;

######################### CALLING STORED PROCEDURES FOR TESTING THE WORKING #####################

#Stored proc to test 11 queries
call nayak21200475.query1('H001');
call nayak21200475.query2('Apollo');
call nayak21200475.query3('Nayak');
call nayak21200475.query4('10004');
call nayak21200475.query5();
call nayak21200475.query6('communication');
call nayak21200475.query7();
call nayak21200475.query8();
call nayak21200475.query9('2021-01-01');
call nayak21200475.query10('2021-01-01');
call nayak21200475.query11();

###############################################################################################
