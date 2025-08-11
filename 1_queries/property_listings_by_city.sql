/* Property Listings By City

When the users come to our home page, they are going to see a list of properties. They will be able to view the properties and filter them by location. They will be able to see all data about the property, including the average rating.

Show all details about properties located in Vancouver including their average rating.

    Select all columns from the properties table for properties located in Vancouver, and the average rating for each property.
    Order the results from lowest cost_per_night to highest cost_per_night.
    Limit the number of results to 10.
    Only show listings that have a rating >= 4 stars.
    To build this incrementally, you can start by getting all properties without the average rating first.

Expected Result:

We're only showing the id, title, start_date, and cost_per_night to save space on the screen

 id  |       title        | cost_per_night |   average_rating   
-----+--------------------+----------------+--------------------
 224 | Nature bite        |          10526 | 4.1000000000000000
 197 | Build they         |          34822 | 4.1000000000000000
  47 | Aside age          |          35421 | 4.2500000000000000
 149 | Present television |          53062 | 4.2222222222222222
(4 rows) */

SELECT properties.id, title, cost_per_night, avg(rating) AS average_rating
FROM property_reviews
JOIN properties ON property_id = properties.id
WHERE city LIKE '%ancouver%' 
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night
LIMIT 10;

