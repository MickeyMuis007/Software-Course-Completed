To run this demo:
- Ensure your client secrets are correct, and updated in the application.yml file.
- An instance of a keycloak server runnning, with a user created.
- You need to start keycloak before any of the other services as they use the issuer URI to bootstap security.
- All service pricing, portfolio and support need to be running.
- Your access token created by keycloak, needs to have the "portfolio-service" and "support-service" "aud" - audience
claim in the token, if it does not the "com.pluralsight.security.validatorsCryptoJwtTokenValidator" will deny the request. See the module demo on how to set this up.
- The token created by the portfolio service via the client credentials grant needs to "pricing" 
scope in the user info claims, otherwise the pricing service will not start.

***********************
Trouble shooting
***********************
If you have any issues try the following:
- Remove your localhost browser cookie and try to re-authenticate.
- Your access token created by keycloak
- Ensure your client id and secrets are correct in the services: application.yml file.
- Enable debug logging in the application.yml file of your properties file to check the logs.
