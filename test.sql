  SELECT city, cost_per_night, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  WHERE city LIKE '%Vancouver%' 
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT 5;

   [ '%Vancouver%', '200', '500', 20 ]
-----QUERY STRING-----
 
  SELECT city, cost_per_night, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  WHERE city LIKE '%Vancouver%'  AND cost_per_night >= 20000
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $3;
  
