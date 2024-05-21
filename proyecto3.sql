create table Employee(
	"EmployeeID" int primary KEY, 
	"EmpLastName" VARCHAR(255),
	"MngLastName" VARCHAR(255)
)

  create table Product(
	"ProductID" int primary KEY, 
	"ProductName" VARCHAR(255),
	"ProductCategory" VARCHAR(255)
  )
  
    create table Customer(
	"CustomerID" VARCHAR(255) primary KEY, 
	"CompanyName" VARCHAR(255),
	"City" VARCHAR(255),
	"Country" VARCHAR(255)
  	)
  	
  	create table Supplier(
	"SupplierID" INT primary KEY, 
	"CompanyName" VARCHAR(255),
	"Country" VARCHAR(255)
  	)

	create table Time (
		"TimeID" VARCHAR(200) primary key, 
		"Date" Date,
		"Year" INT,
		"Quarter" INT,
		"Month" INT,
		"Day" INT
	) 
	
	CREATE TABLE Orders_facts (
    	"CustomerID" VARCHAR(255),
    	"ProductID" INTEGER,
    	"EmployeeID" INTEGER,
    	"TimeID" INTEGER,
    	"SupplierID" INTEGER,
    	"Price" FLOAT,
    	"Quantity" INT,
    	FOREIGN KEY ("CustomerID") REFERENCES Customer("CustomerID"),
    	FOREIGN KEY ("ProductID") REFERENCES Product("ProductID"),
    	FOREIGN KEY ("EmployeeID") REFERENCES Employee("EmployeeID"),
    	FOREIGN KEY ("TimeID") REFERENCES Time("TimeID"),
    	FOREIGN KEY ("SupplierID") REFERENCES Supplier("SupplierID")
	)



  
  
  select * from product p 

 
select * from employee 

select * from product p 

select * from customer 

select * from supplier 

select * from time


select * from orders_facts 

	create table Time (
		"TimeID" VARCHAR(200) primary key, 
		"Date" Date,
		"Year" INT,
		"Quarter" INT,
		"Month" INT,
		"Day" INT
	)
	
CREATE OR REPLACE PROCEDURE rellenado_fecha(p_fecha_inicia DATE, p_fecha_final DATE) AS $$
BEGIN
    WHILE p_fecha_inicia <= p_fecha_final LOOP
        INSERT INTO time (
            "TimeID", "Date", "Year", "Quarter", "Month", "Day"
        ) VALUES (
            TO_CHAR(p_fecha_inicia, 'YYYYMMDD'),
            p_fecha_inicia,
            EXTRACT(YEAR FROM p_fecha_inicia)::INT,
            DATE_PART('QUARTER', p_fecha_inicia)::INT,
            EXTRACT(MONTH FROM p_fecha_inicia)::INT,
            EXTRACT(DAY FROM p_fecha_inicia)::INT
        );
        
        p_fecha_inicia := p_fecha_inicia + INTERVAL '1 day';
    END LOOP;
END;
$$ 
LANGUAGE plpgsql;

CALL rellenado_fecha('1950-01-01', '2050-12-31');

select  * from time

select * from orders_facts of2