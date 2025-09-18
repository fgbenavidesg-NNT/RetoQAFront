Feature: actualizar usuario
    Background:
        * configure ssl = true
        * url urlBase
        * header Content-Type = 'application/json'
        * def schemaResponse = read('classpath:resources/response/actualizarUsuario.schema.json')
        * def crear = callonce read('classpath:resources/features/GestionUsuarios/ListarUsuarios.feature@listarUsuarios')
        * def usuario = crear.usuarios[0]

    @actualizarUsuario200 @happyPath
    Scenario: cambiado exitosamente
        * def email = emailGenerado
        Given path 'usuarios/' + usuario._id
        And request { "nome": #(usuario.nome), "email": #(email), "password": #(usuario.password), "administrador": #(usuario.administrador) }
        When method put
        Then status 200
        And match response == schemaResponse['200']

    @actualizarUsuario201 @happyPath
    Scenario: registro exitoso
        * def email = emailGenerado
        Given path 'usuarios/' + '0000000000000000'
        And request { "nome": "holamundo", "email": #(email), "password": "1234", "administrador": "true" }
        When method put
        Then status 201
        And match response == schemaResponse['201']
    
    @actualizarUsuario400 @unhappyPath
    Scenario: correo electrónico ya registrado
        * def usuarioDosEmail = crear.usuarios[1].email
        Given path 'usuarios/' + usuario._id
        And request { "nome": "Fulano da Silva", "email": #(usuarioDosEmail), "password": "teste", "administrador": "false" }
        When method put
        Then status 400
        And match response == schemaResponse['400']

    
