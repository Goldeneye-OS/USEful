# Useful

A simple email-authentication based user accounts system built in rails.

Here's how it works:

* Clients sends a POST request to /sessions/start with an 'email' parameter.

* The server sends an email to the user with a link containing JWT token.

* When the email link is clicked, the email is verified and a user account is made on the users table if one doesn't exist, user accounts are made AFTER email verification, ensuring all emails in your db are real.

* The server re-directs the user to a configurable route and passes a session JWT token as a parameter.

This boiler-plate is designed to be as simple as possible.
