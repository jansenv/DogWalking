--3

SELECT o.[Name], n.[Name]
FROM [Owner] o
LEFT JOIN Neighborhood n ON o.NeighborhoodId = n.Id;

--4

SELECT o.[Name], n.[Name]
FROM [Owner] o
LEFT JOIN Neighborhood n ON o.NeighborhoodId = n.Id
WHERE o.Id = 4;

--5

SELECT [Name]
FROM Walker
ORDER BY [Name];

--6

SELECT DISTINCT Breed
FROM Dog;

--7

SELECT d.[Name] AS 'Dog Name', o.[Name] AS 'Owner Name', n.[Name] AS 'Neighborhood Name'
FROM Dog d
LEFT JOIN [Owner] o ON d.OwnerId = o.Id
LEFT JOIN Neighborhood n ON o.NeighborhoodId = n.Id;

--8

SELECT COUNT(OwnerId) AS 'Dog Count', o.[Name]
FROM Dog d
LEFT JOIN [Owner] o ON d.OwnerId = o.Id
GROUP BY OwnerId, o.[Name]

--9

SELECT COUNT(WalkerId) AS 'Times Walked', w.[Name]
FROM Walks wa
LEFT JOIN Walker w on wa.WalkerId = w.Id
GROUP BY WalkerId, w.[Name]

--10

SELECT COUNT(NeighborhoodId) AS 'Neighborhood Walkers Count', n.[Name] AS 'Neighborhood Name'
FROM Walker w
LEFT JOIN Neighborhood n on w.NeighborhoodId = n.Id
GROUP BY NeighborhoodId, n.[Name]

--11

SELECT d.[Name]
FROM Dog d
LEFT JOIN Walks w ON d.Id = w.DogId
WHERE w.[date]<'03/19/2020' AND w.[date] >'03/12/2020'

--12

SELECT d.[Name] AS 'Dogs who havent been walked'
FROM Dog d
LEFT JOIN Walks w ON d.Id = w.DogId
GROUP BY d.[Name]
HAVING COUNT(w.Id) = 0;