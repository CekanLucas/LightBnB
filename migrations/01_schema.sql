-- DROP TABLE users;
-- DROP TABLE property_reviews;
-- DROP TABLE guest_reviews;
-- -- DROP TABLE reservations;
-- -- DROP TABLE properties;
-- DROP TABLE rates;

/* CREATE TABLE property_reviews (
 id SERIAL PRIMARY KEY,
 guest_id INTEGER,
 property_id INTEGER,
 reservation_id INTEGER,
 rating SMALLINT,
 message TEXT
); */

CREATE TABLE guest_reviews (
 id SERIAL PRIMARY KEY,
 guest_id INTEGER,
 owner_id INTEGER,
 reservation_id INTEGER,
 rating SMALLINT,
 message TEXT
);

/* CREATE TABLE users (
 id SERIAL PRIMARY KEY,
 name varchar(255),
 email varchar(255),
 password varchar(255)
);

CREATE TABLE reservations (
 id SERIAL PRIMARY KEY,
 start_date DATE,
 end_date DATE,
 property_id INTEGER,
 guest_id INTEGER
);

CREATE TABLE properties (
 id SERIAL PRIMARY KEY,
 owner_id INTEGER, 
 title VARCHAR(255),
 description TEXT,
 thumbnail_photo_url VARCHAR(255),
 cover_photo_url VARCHAR(255),
 cost_per_night INTEGER,
 parking_spaces INTEGER,
 number_of_bathrooms INTEGER, 
 number_of_bedrooms INTEGER, 
 country VARCHAR(255),
 street VARCHAR(255),
 city VARCHAR(255),
 province VARCHAR(255),
 post_code VARCHAR(255),
 active BOOLEAN
);
 */
CREATE TABLE rates (
  property_id Integer,
  cost_per_night INTEGER,
  start_date DATE,
  end_date DATE
);