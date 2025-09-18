Feature: buscar usuario por ID
    Background:
        * configure ssl = true
        * url urlBase
        * header Content-Type = 'application/json'
        * def schemaResponse = read('classpath:resources/response/usuarioId.schema.json')
        * def crear = callonce read('classpath:resources/features/GestionUsuarios/ListarUsuarios.feature@listarUsuarios')
        
    @buscarUsuarioPorId200 @happyPath
    Scenario: usuario encontrado
        * def usuarioId = crear.usuarios[0]._id
        Given path 'usuarios/' + usuarioId
        When method get
        Then status 200
        And match response == schemaResponse['200']
        * def email = response.email
        * print 'El email del usuario es : ', email[0]
    
    @buscarUsuarioPorId400 @unhappyPath
    Scenario Outline: usuario no encontrado
        Given path 'usuarios/' + '<userId>'
        When method get
        Then status 400
        And match response == schemaResponse['400']

        Examples:
        | userId            |
        | 0000000000000000  |
        | 9999999999999999  |
        | abcdefghijklmnop  |
    
