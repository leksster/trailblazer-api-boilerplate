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
              "create": true
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "email": "email@stubbed.com",
              "token": "token"
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
              "error": {
                "message": [
                  "error"
                ]
              }
            }
