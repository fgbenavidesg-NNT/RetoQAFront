Feature: iniciar sesion
    Background:
        * configure ssl = true
        * url urlBase
        * path 'login'
        * header Content-Type = 'application/json'
        * def schemaResponse = read('classpath:resources/response/iniciarSesion.schema.json')

    @iniciarSesion200 @happyPath
    Scenario: login exitoso
        Given request { "email" : "fulano@qa.com", "password" : "teste" }
        When method post
        Then status 200
        And match response == schemaResponse['200']
        * def authorization = response.authorization
        * def result = { authorization: authorization }
        * print 'El codigo de authorization es: ', authorization
    
    @iniciarSesion400 @unhappyPath 
    Scenario: email con formato incorrecto
        Given request { "email": "dadasdas.com", "password": "tester" }
        When method post
        Then status 400
        And match response == schemaResponse['400']
    
