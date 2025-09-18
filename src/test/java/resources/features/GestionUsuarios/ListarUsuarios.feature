Feature: listar usuarios
    Background:
        * configure ssl = true
        * url urlBase
        * path 'usuarios'
        * header Content-Type = 'application/json'
        * def usuarioSchema = read('classpath:resources/response/usuario.schema.json')
        * def schemaResponse = read('classpath:resources/response/listarUsuarios.schema.json')

    @listarUsuarios @happyPath
    Scenario: Obtener listado de usuarios
        When method get
        Then status 200
        And match response == schemaResponse['200']
        * def cantidad = response.quantidade
        * def usuarios = $response.usuarios[*]
        * def result = { usuarios: usuarios }
        * print 'La cantidad de usuarios es: ', cantidad
        * print 'El email del primer usuario es: ', usuarios[0].email
    
