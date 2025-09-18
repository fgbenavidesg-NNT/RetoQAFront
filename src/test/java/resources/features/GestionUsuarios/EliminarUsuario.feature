Feature: eliminar usuario
    Background:
        * configure ssl = true
        * url urlBase
        * header Content-Type = 'application/json'
        * def schemaResponse = read('classpath:resources/response/eliminarUsuario.schema.json')
        * def crear = callonce read('classpath:resources/features/GestionUsuarios/ListarUsuarios.feature@listarUsuarios')
        
    @eliminarUsuarioPorId200 @happyPath
    Scenario: Registro eliminado correctamente
        * def usuarioId = crear.usuarios[0]._id
        Given path 'usuarios/' + usuarioId
        When method delete
        Then status 200
        And match response == schemaResponse['200']
        * def email = response.email
        * print 'El email del usuario es : ', email
    
    @eliminarUsuarioPorId400 @unhappyPath
    Scenario Outline: usuario con carrito registrado
        Given path 'usuarios/' + '<userId>'
        When method delete
        Then status 400
        And match response == schemaResponse['400']

        Examples:
        | userId            |
        | 0uxuPY0cbmQhpEz1  |

    
