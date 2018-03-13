DELIMITER $$
CREATE TRIGGER afterGoodsDelete
BEFORE DELETE ON Goods
FOR EACH ROW
BEGIN
		INSERT INTO `goodsHistory` (`id` ,`name` ,`companyName` ,`price` ,`discount` ,`stock` ,`typeGoods`,`avgPoint` ,`actionType` ,`actionDate`) VALUES
		(OLD.id,OLD.name,OLD.companyName, OLD.price, OLD.discount, OLD.stock ,OLD.typeGoods,OLD.avgPoint ,'delete',CURRENT_TIMESTAMP);
END;$$
DELIMITER;



DELIMITER $$
CREATE TRIGGER afterGoodsUpdate
BEFORE UPDATE ON Goods
FOR EACH ROW
BEGIN
		INSERT INTO `goodsHistory` (`id` ,`name` ,`companyName` ,`price` ,`discount` ,`stock` ,`typeGoods`,`avgPoint` ,`actionType` ,`actionDate`) VALUES
		(OLD.id,OLD.name,OLD.companyName, OLD.price, OLD.discount, OLD.stock ,OLD.typeGoods,OLD.avgPoint ,'update',CURRENT_TIMESTAMP);
END;$$
DELIMITER;


DELIMITER $$
CREATE TRIGGER afterCostumerDelete
BEFORE DELETE ON Costumer
FOR EACH ROW
BEGIN
		INSERT INTO `CostumerHistory` (`email` ,`timeofReg` ,`userName` ,`firstName` ,`lastName` ,`password` ,`actionType`,`actionDate`) VALUES
		(OLD.email, OLD.timeofReg, OLD.userName, OLD.firstName ,OLD.lastName,OLD.password ,'delete',CURRENT_TIMESTAMP);
END;$$
DELIMITER;

DELIMITER $$
CREATE TRIGGER afterCostumerUpdate
BEFORE UPDATE ON Costumer
FOR EACH ROW
BEGIN
		INSERT INTO `CostumerHistory` (`email` ,`timeofReg` ,`userName` ,`firstName` ,`lastName` ,`password` ,`actionType`,`actionDate`) VALUES
		(OLD.email, OLD.timeofReg, OLD.userName, OLD.firstName ,OLD.lastName,OLD.password ,'update',CURRENT_TIMESTAMP);
END;$$
DELIMITER;