/* User Login

When a user logs in, we will need to get all of their details to compare their email and password, and to show them a customized home page.

Get details about a single user.

    Select their id, name, email, and password.
    Select a single user using their email address. Use tristanjacobs@gmail.com for now.

Expected Result:

 id |     name      |          email          | password
----+---------------+-------------------------+---------
  1 | Devin Sanders | tristanjacobs@gmail.com | $2a...
(1 row) */

SELECT *
FROM users
WHERE email = 'tristanwells@google.com';