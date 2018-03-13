# 1
SELECT sum(basketgoods.numberGoods), sum(goods.price*basketgoods.numberGoods), goods.typeGoods
FROM goods, basketgoods, OrderGoods
WHERE goods.id = basketgoods.refGoods  and OrderGoods.email = basketgoods.refCost and OrderGoods.basketNum = basketgoods.basketNum
GROUP BY goods.typeGoods


#2
select costumer.firstName, costumer.lastName, costumer.timeOfReg
from costumer

#3
select costumer.userName, costumer.firstName, costumer.lastName 
FROM costumer,Employee
WHERE employee.refCost = costumer.email and employee.isValid is TRUE and employee.refComp = $companyNumber
GROUP BY costumer.email

#4
SELECT ordergoods.trackingCode, costumer.userName, ordergoods.dateofsubmit, shipping.dateOfShipping, ordergoods.address
FROM costumer, ordergoods, shipping
WHERE costumer.email = ordergoods.email and costumer.email = shipping.refCost and ordergoods.basketNum = shipping.refBasketNum and ordergoods.shippingStatus ='Recieved'  and MONTH(shipping.dateOfShipping) = MONTH(CURRENT_DATE) and shipping.refDriver = '1234'
GROUP BY shipping.refDriver  

#5
SELECT *
FROM costumer,costumerHistory
WHERE costumer.email = costumerHistory.email and costumerHistory.actionType = 'delete'

#6
SELECT goods.id, goods.avgPoint
FROM goods natural join sport
WHERE typeGoods = 'Sports'

#7
SELECT *
FROM Agent
WHERE Agent.durationOfActivation > CURRENT_DATE

#8
SELECT ordergoods.trackingCode, ordergoods.dateOfSubmit, costumer.firstName, costumer.lastName, costumer.userName
FROM ordergoods, costumer
WHERE ordergoods.email = costumer.email and OrderGoods.paymentType = 'Credit'

#9
select *
from suggestion

#10
SELECT name ,id ,discount ,(price - (price*discount)),typeGoods
FROM Goods
WHERE discount > 0.0

#12
SELECT sum(finalPrice)
FROM OrderGoods
WHERE OrderGoods.dateOfSubmit >= (DATE_SUB(CURRENT_DATE, INTERVAL 2 MONTH)) and OrderGoods.paymentStatus = TRUE

#13
SELECT sum(finalPrice * (9 / 109))
FROM OrderGoods
WHERE OrderGoods.paymentStatus = TRUE and MONTH(OrderGoods.dateOfSubmit) =  MONTH(CURRENT_DATE)

#15
SELECT email ,typeCost
FROM (allCostumer natural LEFT OUTER JOIN Costumer) natural join OrderGoods natural join basketgoods
WHERE BasketGoods.refGoods = '31'

#16
SELECT id ,name ,stock
FROM Goods
WHERE Goods.typeGoods = 'Home_appliances'

#17
SELECT sum(finalPrice)
FROM OrderGoods natural join allCostumer natural join Costumer natural join Employee
WHERE Employee.isValid = TRUE and OrderGoods.dateOfSubmit >= (DATE_SUB(CURRENT_DATE, INTERVAL 2 MONTH))
