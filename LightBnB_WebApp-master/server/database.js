const properties = require('./json/properties.json');
const users = require('./json/users.json');
const {Pool} = require('pg');
const pool = new Pool({
  username: 'vagrant',
  database: 'lightbnb',
  password: '123'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return pool.query(`
  SELECT * FROM users
  WHERE email = $1
  LIMIT 1
  `, [email])
  .then(
    res => {
      if(res.rows[0]){
        return res.rows[0]; // return user
      } else {
        return null;
      }
    }
  )
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool.query(`
  SELECT * FROM users
  WHERE id = $1
  LIMIT 1
  `, [id])
  .then(
    res => {
      if(res.rows[0]){
        return res.rows[0]; // return user
      } else {
        return null;
      }
    }
  )
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  return pool.query(`
	  INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3)
    RETURNING *;
  `, [user.name, user.email, user.password])
  .then(
    res => {
    return res.rows[0]; //return new user
    }
  )

}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  console.log('---reservations--', guest_id, limit)
  return pool.query( //4
    ` 
    SELECT *
    FROM reservations
    WHERE guest_id = $1
    LIMIT $2;
    `, [guest_id, limit]
  )
  .then(
    (res) => {
      console.log(res.rows)
      return res.rows[0];
    }
  )
  // return getAllProperties(null, 2);
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

 /* 
 {
  city,
  owner_id,
  minimum_price_per_night,
  maximum_price_per_night,
  minimum_rating
}

 */
const getAllProperties = function(options, limit = 10) {
  console.log('----OPTIONS----\n',options)
  const queryParams = [];
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;
  
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length} `;
  }

  if(options.minimum_price_per_night) {
    queryParams.push(options.minimum_price_per_night * 100);
    queryString += ` AND cost_per_night >= $${queryParams.length} `;
  }

  if(options.maximum_price_per_night) {
    queryParams.push(options.maximum_price_per_night * 100);
    queryString += ` AND cost_per_night <= $${queryParams.length} `;
  }

/*   if(options.minimum_rating) {
    queryParams.push(options.maximum_price_per_night);
    queryString += ` AND average_rating >= $${queryParams.length}`;
  } */
  
  queryParams.push(limit);
  queryString += `
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;
  console.log('-----QUERY PARAMS-----\n', queryParams)
  console.log('-----QUERY STRING-----\n', queryString)
  
  return pool.query(queryString, queryParams)
  .then(
    res => {
     return res.rows
    });
}


exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
