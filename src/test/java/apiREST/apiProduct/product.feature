Feature: Plan de pruebas de la api Product

  Background: obtener token
    Given url 'http://localhost:8080/login'
    And request {"usuario":"Junior", "contrasena":"admin"}
    When method POST
    Then def token = responseHeaders['Authorization'][0]

  Scenario: Validar lista de productos
    Given url 'http://localhost:8080/api/producto/listarProducto'
    And header Authorization = token
    When method GET
    Then status 200
    And match response.totalRecord == 32