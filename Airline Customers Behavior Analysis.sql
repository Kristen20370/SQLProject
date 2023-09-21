USE airlines;

# Looking at the customerID, gender,regular price, flight class and flights departed from Las Vegas (LAS)
# Sort the results by price. List only 10 rows.
SELECT customerID, Gender, RegularPrice, Class, Distance, Origin
FROM (routes LEFT JOIN reservations USING(RouteID))
		JOIN customers USING(CustomerID)
WHERE Origin = 'LAS'
ORDER BY RegularPrice
LIMIT 10;

# Looking at how many different aircrafts each customer have flown in
# Sort the results by customerID in acsending order.
SELECT CustomerID, MembershipLevel, COUNT(DISTINCT AircraftID) AS NumDiffAC
FROM ((customers LEFT JOIN reservations USING(CustomerID)) 
		LEFT JOIN routes USING(RouteID))
			LEFT JOIN aircrafts USING(AircraftID)
GROUP BY CustomerID
ORDER BY CustomerID;

# Looking at customers whose total points are more than the average points of Platinum Level customer
# List their full name in (First name, Last name) format
# Also looking at the customers who had at least one flight to a route with more than 98 percent on-time rate
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

# Looking at the number of available seats and number of reservations for each route in this dataset
# Adding a new column "Booking_Status" to show if the route is 
# "Overbooked", "Underbooked", or "Unknown" by comparing the seats available and the reservations was made
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

# For each customers with letter "a" in their first name,
# looking at their customerID, full name, reservations made, and the average number of years for the aircrafts that they have flown in
# Sort the results to find the most active flying customer first.

#First solution
SELECT customerID, CONCAT(FirstName, ' ', LastName) AS FullName,
	COUNT(PurchaseDate) AS NumResv, ROUND(AVG(Years),0) AS NumYears
FROM ((customers LEFT JOIN reservations USING(CustomerID)) 
		LEFT JOIN routes USING(RouteID))
			LEFT JOIN aircrafts USING(AircraftID)
WHERE FirstName LIKE '%a%'
GROUP BY customerID
ORDER BY Numresv DESC;

#Second solution
SELECT CustomerID, FullName, COUNT(PurchaseDate) AS NumResv, ROUND(AVG(Years),0) AS NumYears
FROM 
	((SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName
     FROM customers
     WHERE FirstName LIKE '%a%'
	) AS NewCus LEFT JOIN reservations USING(CustomerID))
				LEFT JOIN routes USING(RouteID)
                LEFT JOIN aircrafts USING(AircraftID)
GROUP BY CustomerID
ORDER BY NumResv DESC;

# Looking at all pairs of customers from the same membership level and have different gender
# Sort the result by membership levels in alphabetical order
SELECT CONCAT(c1.FirstName,' ', C1.LastName) AS c1_FullName, c1.Gender, c1.MembershipLevel, 
	CONCAT(c2.FirstName, c2.LastName) AS c2_FullName, c2.Gender
FROM customers AS c1 JOIN customers AS c2 USING(MembershipLevel)
WHERE c1.Gender < c2.Gender
ORDER BY c1.MembershipLevel;

# Looking at the origins and destinations of routes with more than 5 reservations
# Sort the results by routeID in descending order
SELECT routeID, Origin, Destination, COUNT(PurchaseDate) AS NumResv
FROM routes LEFT JOIN reservations USING(RouteID)
GROUP BY routeID
HAVING COUNT(PurchaseDate) > 5
ORDER BY RouteID DESC;

# Looking for customers born after 1998 (not indlucing 1998) 
# Only including the customers have been in flights along routes that are longer than the global average of all routes
SELECT CustomerID, FirstName, LastName, YEAR(DOB)
FROM customers JOIN 
	(SELECT CustomerID
     FROM reservations JOIN routes USING(RouteID)
     WHERE Distance > 
		(SELECT AVG(Distance)
         FROM routes)) AS DisRt USING(CustomerID)
WHERE YEAR(DOB)>1998
ORDER BY CustomerID;

# Looking for the minimum difference in dates between the latest current purchase date and latest purchase date
# Only for customers with at least one currrent flight reservation
# Sort the results by the minimum difference in purchase in acsending order
SELECT CustomerID, MIN(DiffPurchaseDates) AS MinDiff
FROM 
	(SELECT CustomerID, Datediff(PurchaseDate,LatestPurchase) AS DiffPurchaseDates
	 FROM customers JOIN reservations USING(CustomerID)) AS DFC
GROUP BY CustomerID
ORDER BY MinDiff;

# If the arrival time and departure time of flights are in the same time zone
# Looking for the maximum and minimum duration of each route
SELECT RouteID, MAX(Duration) AS MaxDuration, MIN(Duration) AS MinDuration, Origin, Destination
FROM 
	(SELECT RouteID, TIMEDIFF(ArrivalTime, DepartureTime) AS Duration
	 FROM reservations) AS RTD
     JOIN routes USING(RouteID)
GROUP BY RouteID
ORDER BY RouteID;

# Looking at customers with the letter "c" in either their first or last name
# Calculate their total number of reservations and total price paid for all reservations
SELECT CustomerID, CONCAT(FirstName,' ', LastName) AS FullName, 
	COUNT(PurchaseDate) AS NumResv, SUM(RegularPrice) AS TotPaid
FROM customers JOIN reservations USING(CustomerID)
WHERE FirstName LIKE '%c%' 
	OR LastName LIKE '%c%'
GROUP BY CustomerID
ORDER BY CustomerID;

# Looking at customers with more than average number of reservations among all customers
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
