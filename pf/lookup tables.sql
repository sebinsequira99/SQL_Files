

use pfcomm_api;

INSERT INTO pfcomm_api.religions()

use information_schema;
select * from COLUMNS where table_schema='pfcomm_api'

select * from pfcomm_api.profiles_new

describe ethnicity_pref

ALTER TABLE pfcomm_api.profiles_new ADD StatusId int  

update pfcomm_api.profiles_new as p
inner join pfcomm_api.status as s
on p.status=s.status_text
set p.StatusId=s.status_id

ALTER TABLE pfcomm_api.profiles_new
DROP COLUMN status

ALTER TABLE pfcomm_api.profiles_new Change StatusId Status int  

Create Table pfcomm_api.status(status_id int NOT NULL AUTO_INCREMENT,status_text varchar(255) ,primary key(status_id));
Create Table pfcomm_api.gender(gender_id int NOT NULL AUTO_INCREMENT,gender_text varchar(255) ,primary key(gender_id));
Create Table pfcomm_api.education(education_id int NOT NULL AUTO_INCREMENT,education_text varchar(255) ,primary key(education_id));
Create Table pfcomm_api.Pet(Pet_id int NOT NULL AUTO_INCREMENT,Pet_text varchar(255) ,primary key(Pet_id));
Create Table pfcomm_api.Neighborhood(Neighborhood_id int NOT NULL AUTO_INCREMENT,Neighborhood_text varchar(255) ,primary key(Neighborhood_id));
Create Table pfcomm_api.Residency(Residency_id int NOT NULL AUTO_INCREMENT,Residency_text varchar(255) ,primary key(Residency_id));
Create Table pfcomm_api.ChildDesired(   ChildDesired_id int NOT NULL AUTO_INCREMENT,   ChildDesired_text varchar(255) ,primary key(   ChildDesired_id));
Create Table pfcomm_api.ChildCount(   ChildCount_id int NOT NULL AUTO_INCREMENT,   ChildCount_text varchar(255) ,primary key(   ChildCount_id));
Create Table pfcomm_api.ChildType(   ChildType_id int NOT NULL AUTO_INCREMENT,   ChildType_text varchar(255) ,primary key(   ChildType_id));
Create Table pfcomm_api.waiting(   waiting_id int NOT NULL AUTO_INCREMENT,   waiting_text varchar(255) ,primary key(   waiting_id));


ALTER TABLE pfcomm_api.religions MODIFY ReligionId int not null auto_increment primary key
ALTER TABLE pfcomm_api.Ethnicity MODIFY ethnicity_id int not null auto_increment;
ALTER TABLE pfcomm_api.regions MODIFY RegionId int not null auto_increment primary key;
ALTER TABLE pfcomm_api.Age_group MODIFY Age_group_id int not null auto_increment;
ALTER TABLE    pfcomm_api.family_structure MODIFY family_structure_id int not null auto_increment primary key;
ALTER TABLE pfcomm_api.States MODIFY state_id int not null auto_increment;
ALTER TABLE    pfcomm_api.special_need MODIFY special_need_id int not null auto_increment primary key;
ALTER TABLE    pfcomm_api.adoption_type MODIFY adoption_type_id int not null auto_increment primary key;


TRUNCATE TABLE pfcomm_api.religions;
TRUNCATE TABLE pfcomm_api.Ethnicity;
TRUNCATE TABLE pfcomm_api.regions;
TRUNCATE TABLE pfcomm_api.Age_group;
TRUNCATE TABLE pfcomm_api.family_structure;
TRUNCATE TABLE pfcomm_api.States;
TRUNCATE TABLE pfcomm_api.special_need;
TRUNCATE TABLE pfcomm_api.adoption_type;


INSERT INTO pfcomm_api.status(status_text)	select 'Unconfirmed' union select 'Approval' union select 'Active' union select 'Rejected' union select 'Suspended' union select 'Inactive';
INSERT INTO pfcomm_api.religions(Religion)	select 'Not Specified' union select 'Anglican' union select 'Bahai' union select 'Baptist' union select 'Buddhist' union select 'Catholic' union select 'Christian' union select 'Church of Christ' union select 'Episcopal' union select 'Hindu' union select 'Jewish' union select 'Mormon' union select 'Lutheran' union select 'Methodist' union select 'Non-denominational' union select 'None' union select 'Other' union select 'Presbyterian' union select 'Protestant' union select 'Unitarian';
INSERT INTO pfcomm_api.education(education_text)	select 'Not Specified' union select 'High School' union select 'Some College' union select 'College Degree' union select 'Advanced Degree';
INSERT INTO pfcomm_api.Ethnicity(ethnicity)	select 'Not Specified' union select 'Middle Eastern' union select 'Asian' union select 'African American' union select 'African American/Asian' union select 'Asian/Hispanic' union select 'Caucasian' union select 'Caucasian/Asian' union select 'Caucasian/African American' union select 'European' union select 'Caucasian/Hispanic' union select 'Caucasian/Native American' union select 'Eastern European/Slavic/Russian' union select 'Hispanic' union select 'Hispanic/African American' union select 'Hispanic or South/Central American' union select 'Jewish' union select 'Mediterranean' union select 'Multi-Racial' union select 'Native American American Indian';
INSERT INTO pfcomm_api.regions(Region)	select 'Southwest' union select 'Southeast' union select 'Northwest' union select 'Northeast' union select 'South-central' union select 'North-central' union select 'Non US';
INSERT INTO pfcomm_api.Age_group(Age_group)	select 'Newborn - 3 months' union select 'Newborn - 6 months' union select 'Newborn - 9 months' union select 'Newborn - 1 year' union select 'Newborn - 2 years' union select 'Newborn - 3 years' union select 'Newborn - 4 years' union select 'Newborn - 5+ years' union select 'Newborn' union select '1-2 months' union select '3-4 months' union select '5-6 months' union select '7-8 months' union select '9-11 months' union select '1 year old' union select '2 years old' union select '3 years old' union select '4 years old' union select '5 years old' union select '6 years old' union select '7 years old' union select '8 years old' union select 'Over 8 years old';
INSERT INTO    pfcomm_api.family_structure(family_structure)	select 'Not Specified' union select 'Married with biological and adopted children' union select 'Married with only adopted children' union select 'Married with only biological children' union select 'Married with no children' union select 'Single with biological and adopted children' union select 'Single with only adopted children' union select 'Single with only biological children' union select 'Single with no children' union select 'Life partner' union select 'Living with life partner' union select 'Living with life partner with no children' union select 'Living with life partner with biological and adoptive children';
INSERT INTO pfcomm_api.gender(gender_text)	select 'Female' union select 'Male' union select 'Either';
INSERT INTO pfcomm_api.Pet(Pet_text)	select 'Cat' union select 'Dog' union select 'Other' union select 'No Pet';
INSERT INTO pfcomm_api.Neighborhood(Neighborhood_text)	select 'Urban' union select 'Suburban' union select 'Rural';
INSERT INTO pfcomm_api.Residency(Residency_text)	select 'Not Specified' union select 'Apartment' union select 'Condominium' union select 'Townhouse' union select 'Single Family Home';
INSERT INTO    pfcomm_api.special_need(special_need)	select 'ADD/ADHD' union select 'Alcohol exposed(occasional)' union select 'Autism/ Autism Spectrum Disorder' union select 'Blindness' union select 'Club Foot' union select 'Cleft Pallet or lip' union select 'Conceived through rape' union select 'Conceived through incest' union select 'Deafness' union select 'Diabeties in Child' union select 'Diabeties in Family' union select 'Down Syndrome' union select 'Drug Exposed (occasional)' union select 'Emotional/mental disorders  in family' union select 'Epilepsy in Family' union select 'Fetal Alcohol Effects' union select 'Family mental retardation' union select 'HIV/AIDS' union select 'limited life expectancy' union select 'Mental Retardation' union select 'Mild or medically correctable' union select 'Multiple Birth' union select 'Nothing known about father' union select 'Nothing known about mother' union select 'Smoking Exposed' union select 'Premature Birth' union select 'Requires specialized care' union select 'Requires life long medical treatment' union select 'Sibling group' union select 'Sickle Cell Anemia or Trait' union select 'Terminally ill' union select 'Seizures';
INSERT INTO    pfcomm_api.ChildDesired(ChildDesired_text)	select 'One child' union select 'Twins' union select 'Triplets' union select 'Siblings';
INSERT INTO pfcomm_api.Age_group(Age_group)	select 'Open' union select '21-25' union select '26-30' union select '31-35' union select '36-40' union select '41-45' union select '46-50' union select 'Above 50';
INSERT INTO    pfcomm_api.adoption_type(adoption_type)	select 'Open Adoption' union select 'Closed' union select 'Semi-Open'


INSERT INTO pfcomm_api.States(state)	select 'Alabama' union select 'Alaska' union select 'American Samoa' union select 'Arizona' union select 'Arkansas' union select 'California' union select 'Colorado' union select 'Connecticut' union select 'Delaware' union select 'District of Columbia' union select 'Florida' union select 'Georgia' union select 'Guam' union select 'Hawaii' union select 'Idaho' union select 'Illinois' union select 'Indiana' union select 'Iowa' union select 'Kansas' union select 'Kentucky' union select 'Louisiana' union select 'Maine' union select 'Maryland' union select 'Massachusetts' union select 'Michigan' union select 'Minnesota' union select 'Mississippi' union select 'Missouri' union select 'Montana' union select 'Nebraska' union select 'Nevada' union select 'New Hampshire' union select 'New Jersey' union select 'New Mexico' union select 'New York' union select 'North Carolina' union select 'North Dakota' union select 'Northern Marianas Islands' union select 'Ohio' union select 'Oklahoma' union select 'Oregon' union select 'Pennsylvania' union select 'Puerto Rico' union select 'Rhode Island' union select 'South Carolina' union select 'South Dakota' union select 'Tennessee' union select 'Texas' union select 'Utah' union select 'Vermont' union select 'Virginia' union select 'Virgin Islands' union select 'Washington' union select 'West Virginia' union select 'Wisconsin' union select 'Wyoming' union select 'Non US Italy';
INSERT INTO pfcomm_api.countries(Country)


Create Table pfcomm_api_mig.waiting(   waiting_id int NOT NULL AUTO_INCREMENT,   waiting_text varchar(255) ,primary key(   waiting_id));
INSERT INTO pfcomm_api_mig.waiting(waiting_text)
select distinct waitingtext from pfcomm_api_mig.waiting_new where waitingtext<>'';

update pfcomm_api_mig.profiles p
inner join pfcomm_api_mig.waiting_new w
on p.nickname=w.username
inner join pfcomm_api_mig.waiting ww
on w.waitingtext=ww.waiting_text
set p.waiting_id=ww.waiting_id;



