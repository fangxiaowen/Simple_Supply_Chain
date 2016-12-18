drop table items cascade constraints;

create table items(
	item char(30),
	unitWeight number(4),
	primary key (item)
);

--prodItem
insert into items values ('table', 50);
insert into items values ('desk', 60);

--matItem
insert into items values ('leg', 5);
insert into items values ('table_top', 20);
insert into items values ('desk_top', 30);

 drop table busEntities cascade constraints;

create table busEntities(
	entity char(30),
	shipLoc char(30),
	address varchar(30),
	phone number(20),
	web varchar(30),
	contact char(30),
	primary key (entity)
);

--customer

insert into BUSENTITIES values ( 'customer1' , 'NYC', 'add1', 5654823651, 'web1','con1');

insert into BUSENTITIES values ( 'customer2' , 'NYC', 'add2', 5654823652, 'web2','con2');

--manufacturer

insert into BUSENTITIES values ( 'manufacturer1' , 'Boston', 'add3',6234211231, 'web3','con3');

insert into BUSENTITIES values ( 'manufacturer2' , 'DC', 'add4', 6234211232,'web4','con4');

--supplier

insert into BUSENTITIES values ( 'supplier1' , 'Boston', 'add5', 8734211231,'web5','con5');

insert into BUSENTITIES values ( 'supplier2' , 'DC', 'add6', 8734211232,'web6','con6');

insert into BUSENTITIES values ( 'supplier3' , 'NYC', 'add7', 8734982743,'web7','con7');

insert into BUSENTITIES values ( 'supplier4' , 'Boston', 'add8', 3824938748,'web8','con8');

--shipper

insert into BUSENTITIES values ( 'Fedex' , 'Chicago', 'add9', 1382938432,'web9','con9');

insert into BUSENTITIES values ( 'UPS' , 'Boston', 'add10', 8373921234,'web10','con10');


drop table billOfMaterials cascade constraints;

create table billOfMaterials(
	prodItem char(30),
	matItem char(30),
	QtyMatPerItem number(3),
	primary key (prodItem, matItem),
	foreign key (prodItem) references items(item),
	foreign key (matItem) references items(item)
);

insert into BILLOFMATERIALS values('table' , 'leg', 4);
insert into BILLOFMATERIALS values('table' , 'table_top', 1);

insert into BILLOFMATERIALS values('desk' , 'leg', 3);
insert into BILLOFMATERIALS values('desk' , 'desk_top', 1);

drop table supplierDiscounts cascade constraints;

create table supplierDiscounts(
	supplier char(30),
	amt1	number(5),
	disc1	decimal(7,2),
	amt2	number(5),
	disc2	decimal(7,2),	
	primary	key (supplier)
);

insert into supplierDiscounts values('supplier1' , 300, 0.03, 800, 0.10);
insert into supplierDiscounts values('supplier2' , 500, 0.07, 1000, 0.15);
insert into supplierDiscounts values('supplier3' , 500, 0.10, 1500, 0.20);
insert into supplierDiscounts values('supplier4' , 1000, 0.15, 2000, 0.25);

drop table supplyUnitPricing;

create table supplyUnitPricing(
	supplier	char(30),
	item	char(30),
	ppu	number(4),
	primary	key (supplier, item),
	foreign key (item) references items(item)
);

insert into supplyUnitPricing values( 'supplier1','table' , 25);
insert into supplyUnitPricing values( 'supplier1','desk' , 40);
insert into supplyUnitPricing values( 'supplier1','leg' , 2);
insert into supplyUnitPricing values( 'supplier1','table_top' , 7);
insert into supplyUnitPricing values( 'supplier1','desk_top' , 11);

insert into supplyUnitPricing values( 'supplier2','table' , 23);
insert into supplyUnitPricing values( 'supplier2','desk' , 38);
insert into supplyUnitPricing values( 'supplier2','leg' , 2);
insert into supplyUnitPricing values( 'supplier2','table_top' , 6);
insert into supplyUnitPricing values( 'supplier2','desk_top' , 10);

insert into supplyUnitPricing values( 'supplier3','table' , 30);
insert into supplyUnitPricing values( 'supplier3','desk' , 39);
insert into supplyUnitPricing values( 'supplier3','leg' , 2);
insert into supplyUnitPricing values( 'supplier3','table_top' , 8);
insert into supplyUnitPricing values( 'supplier3','desk_top' , 10);

insert into supplyUnitPricing values( 'supplier4','table' , 21);
insert into supplyUnitPricing values( 'supplier4','desk' , 45);
insert into supplyUnitPricing values( 'supplier4','leg' , 3);
insert into supplyUnitPricing values( 'supplier4','table_top' , 4);
insert into supplyUnitPricing values( 'supplier4','desk_top' , 15);

drop table manufDiscounts; 
--cascade constraints ;

create table manufDiscounts(
	manuf	char(30),
	amt1	number(4),
	disc1	decimal(7,2),
	primary	key(manuf)
);

insert into manufDiscounts values('manufacturer1' , 500, 0.05);
insert into manufDiscounts values('manufacturer2' , 1000, 0.10);

drop table manufUnitPricing;

create table manufUnitPricing(
	manuf	char(30),
	prodItem	char(30),
	setUpCost	number(5),
	prodCostPerUnit	number(5),
	primary	key (manuf, prodItem),	
	foreign key(prodItem) references items(item)
);

insert into MANUFUNITPRICING values( 'manufacturer1','table' , 10,20);
insert into MANUFUNITPRICING values( 'manufacturer1','desk' , 8,32);

insert into MANUFUNITPRICING values( 'manufacturer2','table' , 15,19);
insert into MANUFUNITPRICING values( 'manufacturer2','desk' , 12,30);

drop table shippingPricing;

create table shippingPricing(
	shipper	char(30),
	fromLoc	char(30),
	toLoc	char(30),
	minPackagePrice	number(5),
	pricePerLb	number(9),
	amt1	number(9),
	disc1	decimal(7,2),
	amt2	number(9),
	disc2	decimal(7,2),
	primary	key (shipper, fromLoc, toLoc)
);

 insert into SHIPPINGPRICING values ( 'Fedex' , 'NYC', 'NYC',120, 1, 500,0.05,2500,0.15);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'NYC', 'Boston',200, 2, 600,0.02,3000,0.1);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'NYC', 'DC', 180, 2,500,0.10,2500,0.20);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'Boston', 'NYC', 190, 1.5, 800,0.05,3000,0.10);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'Boston', 'Boston',120, 1,700,0.05,2000,0.15);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'Boston', 'DC',160, 1.2, 600,0.15,2000,0.20);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'DC', 'NYC',170, 1.2, 800,0.15,2000,0.20);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'DC', 'Boston',210, 2,600,0.10,2400,0.18);
 insert into SHIPPINGPRICING values ( 'Fedex' , 'DC', 'DC',110, 0.8,700,0.10,3000,0.20);

 insert into SHIPPINGPRICING values ( 'UPS' , 'NYC', 'NYC',120, 1, 600,0.1,2500,0.2);
 insert into SHIPPINGPRICING values ( 'UPS' , 'NYC', 'Boston',200, 2, 700,0.02,3000,0.15);
 insert into SHIPPINGPRICING values ( 'UPS' , 'NYC', 'DC', 180, 2,800,0.05,2500,0.25);
 insert into SHIPPINGPRICING values ( 'UPS' , 'Boston', 'NYC', 190, 1.5, 800,0.02,3500,0.15);
 insert into SHIPPINGPRICING values ( 'UPS' , 'Boston', 'Boston',120, 1,750,0.02,2000,0.20);
 insert into SHIPPINGPRICING values ( 'UPS' , 'Boston', 'DC',160, 1.2, 1000,0.10,3500,0.25);
 insert into SHIPPINGPRICING values ( 'UPS' , 'DC', 'NYC',170, 1.2, 1000,0.10,2500,0.25);
 insert into SHIPPINGPRICING values ( 'UPS' , 'DC', 'Boston',300, 1,600,0.05,2500,0.25);
 insert into SHIPPINGPRICING values ( 'UPS' , 'DC', 'DC',110, 0.8,900,0.05,3000,0.25);

drop table customerDemand;

create table customerDemand(
	customer	char(30),
	item	char(30),
	qty	number(5),
	primary	key (customer, item),
	foreign key(item) references items(item)
);

 insert into CUSTOMERDEMAND values ( 'customer1' , 'table', 50);
 insert into CUSTOMERDEMAND values ( 'customer1' , 'desk', 100);

 insert into CUSTOMERDEMAND values ( 'customer2' , 'table', 30);
 insert into CUSTOMERDEMAND values ( 'customer2' , 'desk', 30);

drop table supplyOrders;

create table supplyOrders(
	item	char(30),
	supplier	char(30),
	qty	number(5),
	primary key (item, supplier),
	foreign key (item)  references items(item),
	foreign key (supplier) references BUSENTITIES(entity)
);

 insert into supplyOrders values('table' , 'supplier1', 10);
 insert into supplyOrders values('desk' , 'supplier1', 50);
 insert into supplyOrders values('desk' , 'supplier2', 20);
 insert into supplyOrders values('leg' , 'supplier1', 100);
 insert into supplyOrders values('leg' , 'supplier2', 280);
 insert into supplyOrders values('leg' , 'supplier3', 100);
 insert into supplyOrders values('table_top' , 'supplier1', 20);
 insert into supplyOrders values('table_top' , 'supplier4', 40);
 insert into supplyOrders values('desk_top' , 'supplier2', 50);
 insert into supplyOrders values('desk_top' , 'supplier4', 30); 

drop table manufOrders;

create table manufOrders(
	item	char(30),
	manuf	char(30),
	qty	number(6),
	primary	key (item, manuf),
	foreign key(item) references items(item),	
	foreign key(manuf) references BUSENTITIES(entity)
);

 insert into manufOrders values('table' , 'manufacturer1', 40);
 insert into manufOrders values('table' , 'manufacturer2', 20);
 insert into manufOrders values('desk' , 'manufacturer1', 30);
 insert into manufOrders values('desk' , 'manufacturer2', 50);

drop table shipOrders;

create table shipOrders(
	item	char(30),
	shipper	char(30),
	sender	char(30),
	recipient	char(30),
	qty	number(6),
	primary	key(item, shipper,sender,recipient),
	foreign key(item) references items(item),
	foreign key(sender) references busEntities(entity),
	foreign key(recipient) references busEntities(entity)
);

  --for matItems(send to manufacturer)

  insert into SHIPORDERS values('leg','Fedex' , 'supplier1', 'manufacturer1',100);
  insert into SHIPORDERS values('leg','Fedex' , 'supplier3', 'manufacturer1',100);
  insert into SHIPORDERS values('leg','UPS' , 'supplier2', 'manufacturer1',50);
  insert into SHIPORDERS values('table_top','UPS' , 'supplier4', 'manufacturer1',40);
  insert into SHIPORDERS values('desk_top','Fedex' , 'supplier4', 'manufacturer1',20);

  insert into SHIPORDERS values('leg','UPS' , 'supplier2', 'manufacturer2',230);
  insert into SHIPORDERS values('table_top','Fedex' , 'supplier1', 'manufacturer2',20);
  insert into SHIPORDERS values('desk_top','UPS' , 'supplier2', 'manufacturer2',50);

  --for prodItems(send to customer)
  insert into SHIPORDERS values('table','Fedex' , 'manufacturer1', 'customer1',40);
  insert into SHIPORDERS values('table','Fedex' , 'supplier1', 'customer1',10);
  insert into SHIPORDERS values('desk','UPS' , 'manufacturer2', 'customer1',30);
  insert into SHIPORDERS values('desk','UPS' , 'supplier1', 'customer1',50);
  insert into SHIPORDERS values('table','Fedex' , 'manufacturer2', 'customer2',20);
  insert into SHIPORDERS values('desk','Fedex' , 'supplier2', 'customer2',10);
  insert into SHIPORDERS values('desk','Fedex' , 'manufacturer1', 'customer2',20);


--Part B. Create View.

drop view shippedVsCutsDemand;

create view shippedVsCutsDemand as 
	select	C.customer, C.item, sum(S.qty) suppliedQty, C.qty as demandQty
	from	customerDemand C, shipOrders S
	where	C.customer = S.recipient (+) and 
		C.item = S.item (+)
	group by	C.customer, C.item, C.qty ;
	 

drop view totalManufItems;

create view totalManufItems as 
	select	M.item, sum(M.qty) totalManufQty 
	from	manufOrders M
	group by	M.item ;	


drop view matsUsedVsShipped;

create view matsUsedVsShipped as 
	select	R.*, S.shippedQty
	from	(select M.manuf, B.matItem, sum(B.QtyMatPerItem * M.qty) requiredQty
		from manufOrders M, billOfMaterials B
		where	M.item = B.prodItem
		group by	M.manuf, B.matItem) R, 
		(select M1.manuf, S1.item, sum(S1.qty) shippedQty 
		 from (select distinct Man.manuf
		       from manufOrders Man) M1, shipOrders S1
		 where M1.manuf = S1.recipient
		 group by	M1.manuf, S1.item) S
	where R.manuf = S.manuf and R.matItem = S.item;	

 


drop view producedVsShipped;
	 	
create view producedVsShipped as
	select	M.item, M.manuf, sum(S.qty) shippedOutQty, M.qty as orderedQty 
	from	manufOrders M, shipOrders S
	where	M.item = S.item and 
		M.manuf = S.sender
	group by	M.item, M.manuf, M.qty;


drop view suppliedVsShipped;

create view suppliedVsShipped as 
	select	S.item, S.supplier, S.qty suppliedQty, sum(S1.qty) shippedQty
	from	supplyOrders S, shipOrders S1
	where 	S.item = S1.item and 
		S.supplier = S1.sender
	group by	S.item, S.supplier, S.qty;

drop view perSupplierCost;

create view perSupplierCost as
	select	Temp.supplier, 
		case when Temp.CostBeforeDis <= Temp.amt1 then Temp.CostBeforeDis
		     when Temp.CostBeforeDis > Temp.amt1 and Temp.CostBeforeDis <= Temp.amt2 then (Temp.CostBeforeDis - Temp.amt1) * (1 - Temp.disc1) + Temp.amt1
		     when Temp.CostBeforeDis > Temp.amt2 then (Temp.CostBeforeDis - Temp.amt2) * (1 - Temp.disc2) + (Temp.amt2 - Temp.amt1) * (1 - Temp.disc1) + Temp.amt1 end as cost 
	from  	(select	S1.supplier, sum(S2.ppu * S1.qty) CostBeforeDis, S.amt1, S.disc1, S.amt2, S.disc2
		 from	supplierDiscounts S, supplyOrders S1, supplyUnitPricing S2
		 where	S1.supplier = S2.supplier and
			S1.item = S2.item and
			S.supplier = S1.supplier
		 group by	S1.supplier, S.amt1, S.disc1, S.amt2, S.disc2) Temp
	group by Temp.supplier, Temp.CostBeforeDis, Temp.amt1, Temp.disc1, Temp.amt2, Temp.disc2;
	

drop view perManufCost;

create view perManufCost as 
	select	Temp.manuf,
		case when Temp.CostBeforeDis <= Temp.amt1 then Temp.CostBeforeDis
		     when Temp.CostBeforeDis > Temp.amt1 then (Temp.CostBeforeDis - Temp.amt1) * (1 - Temp.disc1) + Temp.amt1 end as Cost
	from 	(select	M1.manuf, sum(M2.prodCostPerUnit * M1.qty + M2.setUpCost) CostBeforeDis, M.amt1, M.disc1
		from	manufDiscounts M, manufOrders M1, manufUnitPricing M2
		where	M1.manuf = M2.manuf and 
			M1.item = M2.prodItem and
			M.manuf = M1.manuf
		group by M1.manuf, M.amt1, M.disc1) Temp
	group by	Temp.manuf, Temp.CostBeforeDis, Temp.amt1, Temp.disc1;


drop view perShipperCost;
-- add a table items to get the uniWeight
create view perShipperCost as 
	select	Temp3.shipper, sum(Temp3.Cost) Cost 
	from (select	Temp2.shipper, Temp2.fromLoc, Temp2.toLoc,     
		case when Temp2.CostAfterDis > Temp2.minPackagePrice then Temp2.CostAfterDis
	 	     else Temp2.minPackagePrice end as Cost
	from (select	Temp.shipper, Temp.fromLoc, Temp.toLoc,	Temp.minPackagePrice,
			case when Temp.CostBeforeDis <= Temp.amt1 then Temp.CostBeforeDis
		     	     when Temp.CostBeforeDis > Temp.amt1 and Temp.CostBeforeDis <= amt2 then (Temp.CostBeforeDis - Temp.amt1) * (1 - Temp.disc1) + Temp.amt1
		     	     when Temp.CostBeforeDis > Temp.amt2 then (Temp.CostBeforeDis - Temp.amt2) * (1 - Temp.disc2) + (Temp.amt2 - Temp.amt1) * (1 - Temp.disc1) + Temp.amt1 end as CostAfterDis
		from (select	S1.shipper, S.fromLoc, S.toLoc, sum(S.pricePerLb * S1.qty * I.unitWeight) CostBeforeDis, S.minPackagePrice, S.amt1, S.disc1, S.amt2, S.disc2
			from	shippingPricing S, shipOrders S1, busEntities B1, busEntities B2, items I 
			where	S1.shipper = S.shipper and
				S1.sender = B1.entity and
				S.fromLoc = B1.shipLoc and
				S1.recipient = B2.entity and 
				S.toLoc = B2.shipLoc and 
				S1.item = I.item 
			group by	S1.shipper, S.fromLoc, S.toLoc, S.minPackagePrice, S.amt1, S.disc1, S.amt2, S.disc2) Temp 
		group by Temp.shipper, Temp.CostBeforeDis, Temp.fromLoc, Temp.toLoc, Temp.minPackagePrice, Temp.amt1, Temp.disc1, Temp.amt2, Temp.disc2) Temp2) Temp3
	group by Temp3.shipper;
	

drop view totalCostBreakDown;

create view totalCostBreakDown as
	select supplyCost, manufCost, shippingCost,  (supplyCost + manufCost + shippingCost) as totalCost
	from (select	sum(S.cost) supplyCost	
	      from	perSupplierCost S) Supplier,
	     (select 	sum(M.Cost) manufCost
	      from	perManufCost M) Manuf,
	     (select 	sum(S1.Cost) shippingCost
	      from 	perShipperCost S1) Shipper;
	

-- Part C. Query Part

--find customers not satisfied
select	distinct S.customer
from	shippedVsCutsDemand S
where	S.suppliedQty < S.demandQty;

--find suppliers not shipping all the orders yet
select	distinct S.supplier
from	suppliedVsShipped S
where	S.suppliedQty > S.shippedQty;

--find manuf not having enough materials 
select	distinct M.manuf
from 	matsUsedVsShipped M	
where	M.requiredQty > M.shippedQty;

--find manuf not shipping all the orders yet
select	distinct P.manuf
from 	producedVsShipped P
where	P.shippedOutQty < P.orderedQty;
