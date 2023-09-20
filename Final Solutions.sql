USE airlines;

#1
SELECT customerID, Gender, RegularPrice, Class, Distance, Origin
FROM (routes LEFT JOIN reservations USING(RouteID))
		JOIN customers USING(CustomerID)
WHERE Origin = 'STL'
ORDER BY RegularPrice
LIMIT 10;

#2
SELECT CustomerID, MembershipLevel, COUNT(DISTINCT AircraftID) AS NumDiffAC
FROM ((customers LEFT JOIN reservations USING(CustomerID)) 
		LEFT JOIN routes USING(RouteID))
			LEFT JOIN aircrafts USING(AircraftID)
GROUP BY CustomerID
ORDER BY CustomerID;

#3
(SELECT CustomerID, CONCAT(FirstName,' ', LastName) AS FullName
FROM customers
WHERE TotalPoints > 
	(SELECT AVG(TotalPoints)
     FROM customers
	 WHERE MembershipLevel = 'Platinum')
ORDER BY CustomerID)
UNION
(SELECT OntimeFlight.CustomerID, CONCAT(FirstName,' ', LastName) AS FullName
FROM customers JOIN
	(SELECT CustomerID,RouteID, OntimeRate
	 FROM Reservations JOIN routes USING(RouteID)
	 WHERE OntimeRate > 98) AS OntimeFlight
     USING (CustomerID)
ORDER BY CustomerID);

#4
SELECT RouteID, NumSeats, 
	(CASE 
		WHEN NumResv > NumSeats THEN 'Overbooked'
        WHEN NumResv < NumSeats THEN 'Underbooked'
        WHEN NumResv IS NULL OR NumSeats IS NULL THEN 'Unknown'
	 END) AS 'Booking_Status'
FROM 
	(SELECT RouteID, SUM(Seats) AS NumSeats, COUNT(PurchaseDate) AS NumResv
	 FROM (routes LEFT JOIN aircrafts USING(AircraftID))
					LEFT JOIN reservations USING(RouteID)
	 GROUP BY RouteID
	 ORDER BY RouteID) AS NewRelation;

#5
#First solution
SELECT customerID, CONCAT(FirstName, ' ', LastName) AS FullName,
	COUNT(PurchaseDate) AS NumResv, AVG(Years)
FROM ((customers LEFT JOIN reservations USING(CustomerID)) 
		LEFT JOIN routes USING(RouteID))
			LEFT JOIN aircrafts USING(AircraftID)
WHERE FirstName LIKE '%a%'
GROUP BY customerID
ORDER BY Numresv DESC;

#Second solution
SELECT CustomerID, FullName, COUNT(PurchaseDate) AS NumResv, AVG(Years)
FROM 
	((SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName
     FROM customers
     WHERE FirstName LIKE '%a%'
	) AS NewCus LEFT JOIN reservations USING(CustomerID))
				LEFT JOIN routes USING(RouteID)
                LEFT JOIN aircrafts USING(AircraftID)
GROUP BY CustomerID
ORDER BY NumResv DESC;

#6
SELECT CONCAT(c1.FirstName,' ', C1.LastName) AS c1_FullName, c1.Gender, c1.MembershipLevel, 
	CONCAT(c2.FirstName, c2.LastName) AS c2_FullName, c2.Gender
FROM customers AS c1 JOIN customers AS c2 USING(MembershipLevel)
WHERE c1.Gender < c2.Gender;

#7
SELECT routeID, Origin, Destination, COUNT(PurchaseDate) AS NumResv
FROM routes LEFT JOIN reservations USING(RouteID)
GROUP BY routeID
HAVING COUNT(PurchaseDate) < 5
ORDER BY RouteID DESC;

#8
SELECT CustomerID, FirstName, LastName, YEAR(DOB)
FROM customers JOIN 
	(SELECT CustomerID
     FROM reservations JOIN routes USING(RouteID)
     WHERE Distance > 
		(SELECT AVG(Distance)
         FROM routes)) AS DisRt USING(CustomerID)
WHERE YEAR(DOB)>1994
ORDER BY CustomerID;

#9
SELECT CustomerID, MIN(DiffPurchaseDates) AS MinDiff
FROM 
	(SELECT CustomerID, Datediff(PurchaseDate,LatestPurchase) AS DiffPurchaseDates
	 FROM customers JOIN reservations USING(CustomerID)) AS DFC
GROUP BY CustomerID
ORDER BY MinDiff
LIMIT 5;

#10
SELECT RouteID, MAX(Duration) AS MaxDuration, MIN(Duration) AS MinDuration, Origin, Destination
FROM 
	(SELECT RouteID, TIMEDIFF(ArrivalTime, DepartureTime) AS Duration
	 FROM reservations) AS RTD
     JOIN routes USING(RouteID)
GROUP BY RouteID
ORDER BY RouteID;

#11
SELECT CustomerID, CONCAT(FirstName,' ', LastName) AS FullName, 
	COUNT(PurchaseDate) AS NumResv, SUM(RegularPrice) AS TotPaid
FROM customers JOIN reservations USING(CustomerID)
WHERE FirstName LIKE '%c%' 
	OR LastName LIKE '%c%'
GROUP BY CustomerID
ORDER BY CustomerID;

#12
SELECT CustomerID, RouteID, PurchaseDate
FROM reservations JOIN
	(SELECT *
    FROM customers
    ORDER BY CustomerID DESC
    LIMIT 5) AS T5C USING(CustomerID)
ORDER BY CustomerID DESC, PurchaseDate ASC;

#13
SELECT CustomerID, COUNT(PurchaseDate) AS NumResv
FROM reservations
GROUP BY CustomerID
HAVING COUNT(PurchaseDate) >
		(SELECT AVG(NumResv)
         FROM 
			(SELECT CustomerID, COUNT(PurchaseDate) AS NumResv
			 FROM reservations
			 GROUP BY CustomerID) AS NewCs)
ORDER BY NumResv;
