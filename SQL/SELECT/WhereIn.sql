SELECT
    *
FROM
    dbo.Orders
WHERE
    ShipCity
IN
    ('London', 'Paris')