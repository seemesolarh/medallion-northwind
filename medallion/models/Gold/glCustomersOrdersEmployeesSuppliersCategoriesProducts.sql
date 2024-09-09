{{ config(materialized='table') }}
SELECT 
    c."customerId" AS customersId,
    o."employeeId" AS employeesId,
    emp."fullname" AS employee_full_name,
    c."contactTitle",
    c."phone" AS customer_phone,
    c."companyName" AS customer_company_name,
    c."contactName",
    o."orderId",
    AVG(o."freight") AS avg_freight,
    o."orderDate",
    o."requiredDate",
    o."shippedDate",
    o."dayToShip",
    o."shipCountry",
    o."shipPostalCode",
    o."shipName",
    o."shipCity",
    o."shipAddress",
    o."transaction_no",
    o."firsttransactiondate",
    emp."title",
    emp."birthDate",
    emp."hireDate",
    emp."address",
    emp."city",
    emp."postalCode",
    emp."country" AS employee_country,
    emp."homePhone" AS employee_home_phone,
    emp."extension" AS employee_extension,
    sp."supplierId",
    sp."companyName" AS supplier_company_name,
    sp."contactName" AS supplier_contact_name,
    sp."address" AS supplier_address,
    sp."city" AS supplier_city,
    sp."postalCode" AS supplier_postal_code,
    sp."country" AS supplier_country,
    sp."phone" AS supplier_phone,
    p."productId",
    p."productName",
    p."categoryId",
    p."quantityPerUnit",
    SUM(p."unitPrice") AS total_unit_price,
    MAX(p."unitsInStock") AS min_units_in_stock,
    AVG(p."unitsOnOrder") AS avg_units_on_order,
    p."reorderLevel",
    p."discontinued",
    cat."categoryName"
    
FROM 
    slcustomers AS c
JOIN 
    slorders AS o ON c."customerId" = o."customerId"
JOIN 
    slemployees AS emp ON o."employeeId" = emp."employeeId"
JOIN 
    slsuppliers AS sp ON c."contactTitle" = sp."contactTitle"
JOIN 
    slproducts AS p ON sp."supplierId" = p."supplierId"
JOIN 
    slcategories AS cat ON p."categoryId" = cat."categoryId"
WHERE 
    p."unitsOnOrder" > 0 
GROUP BY 
    c."customerId",
    o."employeeId",
    c."contactTitle",
    c."phone",
    c."companyName",
    c."contactName",
    o."orderId",
    o."orderDate",
    o."requiredDate",
    o."shippedDate",
    o."dayToShip",
    o."shipCountry",
    o."shipPostalCode",
    o."shipName",
    o."shipCity",
    o."shipAddress",
    o."transaction_no",
    o."firsttransactiondate", 
    emp."fullname",
    emp."title",
    emp."birthDate",
    emp."hireDate",
    emp."address",
    emp."city",
    emp."postalCode",
    emp."country",
    emp."homePhone",
    emp."extension",
    sp."supplierId",
    sp."companyName",
    sp."contactName",
    sp."address",
    sp."city",
    sp."postalCode",
    sp."country",
    sp."phone",
    p."productId",
    p."productName",
    p."categoryId",
	p."quantityPerUnit",
    p."unitsInStock",
    p."unitsOnOrder",
    p."reorderLevel",
    p."discontinued",
    cat."categoryName"
  
    
LIMIT 60