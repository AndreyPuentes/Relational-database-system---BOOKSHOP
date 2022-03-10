/*1)	Which	book	is	being	sell	more	right	now?*/
SELECT TOP(1) SHB.Book_ISBN, sum(SHB.count) AS Quantity_Sold, B.Title
FROM ShoppingBaskets_have_books AS SHB
INNER JOIN Book AS B
ON B.ISBN=SHB.Book_ISBN
GROUP BY SHB.Book_ISBN, B.Title
ORDER BY Quantity_Sold DESC

/*2)	Which	customer	is	buying	more books?*/

SELECT TOP(1) C.CustomerName, C.CustomerEmail, sum(SHB.count) as Purchase_books
FROM Customer AS C
INNER JOIN ShoppingBasket AS SB
ON C.CustomerEmail=SB.CustomerEmail
INNER JOIN ShoppingBaskets_have_books AS SHB
ON SB.ShoppingBasketID=SHB.ShoppingBasketID
GROUP BY C.CustomerName, C.CustomerEmail
ORDER BY Purchase_books DESC

/*3)	Which	warehouse	has	Texas	Glory	in	stock?*/
SELECT B.Title, WHB.Warehouse_code, W.WarehouseAddress, WHB.count
FROM Book AS B
INNER JOIN Warehouses_have_books AS WHB
ON B.ISBN=WHB.Book_ISBN
INNER JOIN Warehouse AS W
ON W.code=WHB.Warehouse_code
WHERE B.Price=94.5

/*4)	Which	author	has	more	books	on	sell?*/
SELECT top(2)A.Authorname, count(B.Title) as N_Books
FROM Author AS A
INNER JOIN Book AS B
ON A.AuthorID=B.AuthorID
GROUP BY A.Authorname
ORDER BY N_Books DESC

/*5)	Which	publisher	offers	less	books?*/

SELECT TOP(1)P.Publishername, COUNT(B.TITLE) AS Books_offered
FROM Book AS B
INNER JOIN Publisher AS P
ON B.PublisherID=P.PublisherID
GROUP BY Publishername
ORDER BY Books_offered ASC



