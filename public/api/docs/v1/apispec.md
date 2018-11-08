# JSON API Doc

This api is implemented according to the JSON API spec.

# Group Registration
Registration group

## Registration [/registration]


### Register new user [POST /api/v1/user/registration]


+ Request renders created user
**POST**&nbsp;&nbsp;`/api/v1/user/registration`

    + Headers

            Accept: application/vnd.api+json
            Content-Type: application/vnd.api+json

    + Body

            {
              "email": "stephine_rippin@roobmills.ca",
              "password": "!1password",
              "password_confirmation": "!1password"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "data": {
                "id": "36",
                "type": "users",
                "attributes": {
                  "email": "stephine_rippin@roobmills.ca"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request renders errors
**POST**&nbsp;&nbsp;`/api/v1/user/registration`

    + Headers

            Accept: application/vnd.api+json
            Content-Type: application/vnd.api+json

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "Invalid email",
                  "detail": "Email can't be blank",
                  "source": {
                    "pointer": "/data/attributes/email"
                  }
                },
                {
                  "title": "Invalid password",
                  "detail": "Password can't be blank",
                  "source": {
                    "pointer": "/data/attributes/password"
                  }
                },
                {
                  "title": "Invalid password",
                  "detail": "Password is too short (minimum is 6 characters)",
                  "source": {
                    "pointer": "/data/attributes/password"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }
