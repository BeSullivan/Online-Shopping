INSERT INTO `Goods` (`id`, `name`, `companyName`, `price` ,`typeGoods` ,`avgPoint` ,`discount` ,`stock`) VALUES
('11', 'iphone', 'apple',700 ,'digital' ,4.8 ,0 ,5),
('21', 'oven', 'LG',3000 ,'HomeAppliances',3.5 ,20 ,4),
('31', 'ball', 'star',10000 ,'Sports',4.6 ,15 ,3),
('32', 'shoe', 'nike', 100 ,'Sports',4.4 ,0 ,2);


INSERT INTO `Sport` (`id`, `color`) VALUES
('31', 'blue'),
('32', 'red');


INSERT INTO `HomeAppliances` (`id`, `dateProduct`) VALUES
('21', CURRENT_TIMESTAMP);


INSERT INTO `Backup` (`firstname`, `lastName`, `userName`, `password`) VALUES
('jack', 'ghazafi', 'jack-ghaz' , 'ahfaeuhrjf'),
('reza', 'shiri', 'rezsh' , 'sjgsueig');

INSERT INTO `Driver` (`firstname`, `lastName`, `carType`, `carTag`, `personalID`) VALUES
('john', 'morphy', 'mazda' , '12G353',1234),
('mahmood', 'ahmadi', 'peykan' , '466q46',4321);


INSERT INTO `driverPhone` (`phoneNum`, `refDrive`) VALUES
('436352', 1234),
('799454', 4321);


INSERT INTO `driverAddress` (`addressText`, `refDrive`) VALUES
('7fhsghsjrgwhefi', 1234),
('rgmwgjfisgjniyor', 4321);


INSERT INTO `BasketSetNum` (`refCost`, `basketNum`) VALUES
('123ali@gmail.com' , 321);



INSERT INTO `BasketGoods` (`refGoods`, `numberGoods` , `refCost` , `basketNum`) VALUES
('11', 1, '123ali@gmail.com', 321),
('31' , 2, '123ali@gmail.com' , 321);



INSERT INTO `allCostumer` (`email`) VALUES
('ali123@yahoo.com'),
('123ali@gmail.com'),
('armin_12@gmail.com'),
('saeed.alip@yahoo.com');

INSERT INTO `Costumer` (`timeofReg` ,`userName` ,`firstName` ,`lastName` ,`email` ,`password`) VALUES
(CURRENT_TIMESTAMP,'123ALI','ALI','ALIII','123ali@gmail.com','1234'),
(CURRENT_TIMESTAMP,'ARMIN12','ARMIN','fff','armin_12@gmail.com','4321');

INSERT INTO `costumerPhone` (`phoneNum` , `refCost`) VALUES
('77774444','123ali@gmail.com'),
('44447777','armin_12@gmail.com');

INSERT INTO `costumerAddress` (`addressText` , `refCost`) VALUES
('st. valiasr tag 22','123ali@gmail.com'),
('st. enghelab tag 231','armin_12@gmail.com');

INSERT INTO `Company` (`cName` ,`regCode` ,`address`) VALUES
('snapp','123-431','st. beheshti tag 44'),
('bazzar' ,'443-998' ,'st. jordan tag 31');

INSERT INTO `companyPhone` (`refComp` ,`phoneNum`) VALUES
('123-431','77887788'),
('123-431','88778877'),
('443-998','99876667');


INSERT INTO `Agent` (`refComp` ,`personalNum` ,`firstName` ,`lastName` ,`durationOfActivation`) VALUES
('123-431' ,'1166' ,'kousha' ,'khoushi' ,CURRENT_TIMESTAMP),
('443-998' ,'5454' ,'maryam' ,'sarfaraz' ,CURRENT_TIMESTAMP);

INSERT INTO `agentPhone` (`refComp` ,`refAgent` ,`phoneNumber`) VALUES
('123-431' ,'1166' ,'11456789'),
('443-998' ,'5454' ,'22345345');

INSERT INTO `Suggestion` (`suggestText`,`refCost`,`refBackUp` ,`suggestDate` ,`title`) VALUES
('mersi babate hamechi!' ,'armin_12@gmail.com' ,'jack-ghaz' ,CURRENT_TIMESTAMP, 'tashakor'),
('servis dehie mashin ha khoob nist !','123ali@gmail.com','rezsh',CURRENT_TIMESTAMP,'enteghad');


INSERT INTO `OrderGoods` (`trackingCode` ,`basketNum` ,`email` ,`typeCost` ,`paymentStatus` ,`paymentType` ,`shippingStatus` ,`finalPrice` ,`dateOfSubmit` ,`address`) VALUES
('OS123' ,'321' ,'123ali@gmail.com' ,FALSE , TRUE ,'Online' ,'Recieved' ,(20700 * 1.09) ,CURRENT_TIMESTAMP ,'st.enghlab');


INSERT INTO `shipping` (`refCost`,`refDriver`,`refBasketNum`,`dateOfShipping`) VALUES
('123ali@gmail.com','1234','321',CURRENT_DATE);





delete from Costumer
where email = '123ali@gmail.com'

UPDATE Costumer SET userName='newUserName', credit = credit + 99 WHERE email= '123ali@gmail.com';



