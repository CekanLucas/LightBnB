/* Most Visited Cities

Our product managers want a query to see a list of the most visited cities.

Get a list of the most visited cities.

    Select the name of the city and the number of reservations for that city.
    Order the results from highest number of reservations to lowest number of reservations.

Expected Result:

       city        | total_reservations 
-------------------+--------------------
 Carcross          |                405
 Town of Hay River |                379
 Whitehorse        |                376
 Town of Inuvik    |                298
 Yellowknife       |                257
 (251 rows) */

SELECT city, count(property_id) AS total_reservations
FROM properties 
JOIN reservations ON properties.id = property_id
GROUP BY city
ORDER BY total_reservations DESC