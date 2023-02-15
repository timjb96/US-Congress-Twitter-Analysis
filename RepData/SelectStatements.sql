-- Select statement which creates table "js_dataset"
SELECT hm.uniqueid,
	hm.fullname,
	hm.gender, 
	hm.dob, 
	hm.party, 
	hm.stateabr, 
	hm.district, 
	hm.statedistid,
	hm.congress109,
	hm.congress110,
	hm.congress111,
	hm.congress112,
	hm.congress113,
	hm.congress114,
	hm.congress115,
	hm.congress116,
	hm.congress117,
	hm.congress118,
	th.twitterhandle, 
	th.joinedon,
	th.yearjoined, 
	(th.joinedon - hm.dob) / 365 AS "AgeWhenTwitterJoined"
INTO js_dataset
FROM housemembers AS hm
LEFT JOIN twitterhandles AS th
	ON th.uniqueid = hm.uniqueid

-- Revised Statement which will feed into 1 master statement
SELECT 
	hm.uniqueid, 
	hm.fullname, 
	hm.gender,
	hm.dob,
	hm.party,
	hm.stateabr,
	hm.district, 
	hm.congress109 AS "CongressSession",
	(cs.sessionstartedon - hm.dob)/365 AS "AgeWhenSessionStarted",
	cs.sessionstartedon, 
	cs.sessionendedon,
	th.twitterhandle, 
	th.joinedon, 
	(th.joinedon - hm.dob)/365 AS "AgeWhenTwitterJoined",
	th.yearjoined AS YearJoinedOnTwitter
INTO housesessions109_118
FROM housemembers AS hm
LEFT JOIN twitterhandles AS th
	ON th.uniqueid = hm.uniqueid
LEFT JOIN congressionalsessions AS cs
	ON hm.congress109 = cs.sessionnumber
WHERE hm.congress109 > 0
ORDER BY "AgeWhenSessionStarted"; 

-- Insert into statements to feed all of the sessions into 1 "master" dataset
INSERT INTO housesessions109_118 (
SELECT 
	hm.uniqueid, 
	hm.fullname, 
	hm.gender,
	hm.dob,
	hm.party,
	hm.stateabr,
	hm.district, 
	hm.congress110 AS "CongressSession",
	(cs.sessionstartedon - hm.dob)/365 AS "AgeWhenSessionStarted",
	cs.sessionstartedon, 
	cs.sessionendedon,
	th.twitterhandle, 
	th.joinedon, 
	(th.joinedon - hm.dob)/365 AS "AgeWhenTwitterJoined",
	th.yearjoined AS YearJoinedOnTwitter
FROM housemembers AS hm
LEFT JOIN twitterhandles AS th
	ON th.uniqueid = hm.uniqueid
LEFT JOIN congressionalsessions AS cs
	ON hm.congress110 = cs.sessionnumber
WHERE hm.congress110 > 0
ORDER BY "AgeWhenSessionStarted")