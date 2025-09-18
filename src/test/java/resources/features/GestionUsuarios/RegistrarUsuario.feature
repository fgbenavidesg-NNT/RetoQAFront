Feature: registrar usuario administrador
    Background:
        * configure ssl = true
        * url urlBase
        * path 'usuarios'
        * header Content-Type = 'application/json'
        * def schemaResponse = read('classpath:resources/response/usuarioRegistrado.schema.json')
        * def crear = callonce read('classpath:resources/features/GestionUsuarios/ListarUsuarios.feature@listarUsuarios')
        
    @registrarUsuario201 @happyPath
    Scenario: registro exitoso
        * def email = emailGenerado
        Given request { "nome": "Fulano da Silva", "email": #(email), "password": "teste", "administrador": "true" }
        When method post
        Then status 201
        And match response == schemaResponse['201']
        * def id = response._id
        * def result = { id: id }
        * print 'El id del usuario es : ', id
    
    @registrarUsuario400 @unhappyPath 
    Scenario: email ya esta registrado
        * def primerEmailUsuario = crear.usuarios[0].email
        Given request { "nome": "Fulano da Silva", "email": #(primerEmailUsuario), "password": "teste", "administrador": "true" }
        When method post
        Then status 400
        And match response == schemaResponse['400']
    
