# arcadia-app

> API for utility data

## About

This project uses [Feathers](http://feathersjs.com). An open source web framework for building modern real-time applications.

## Getting Started

Getting up and running is as easy as 1, 2, 3.

1. Make sure you have [NodeJS](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed.

2. Install your dependencies

    ```
    cd path/to/arcadia-app; npm install
    ```
3. Update the .env file with your PostgreSQL information.

4. Start your app

    ```
    npm start
    ```
    
5. Register a new user for the app by calling the /user endpoint.  The message body should contain the following: 
    ```
    {     
          first_name:Bob
          last_name:Example
          email:bob@bob.com
          password:Password
    }
     ```   
6. Use this user information to call the /authentication endpoint:
    ```
    {
          email:bob@bob.com
          password:Password
          strategy:local
    }
      ```
  You will receive a returned JWT token:
   ```
    {
          "accessToken":"tokenvaluehere"
    }
   ```  
7. Then use the token in the header of requests to the other endpoints (/bill, /client, /account):
     ```
    {
          Authorization: Bearer tokenvaluehere
    }
     ```
