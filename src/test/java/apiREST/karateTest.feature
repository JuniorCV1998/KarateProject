#noinspection CucumberUndefinedStep,Json5StandardCompliance
Feature: plan de pruebas


#  Scenario: caso de prueba tipo GET
#    Given url 'https://reqres.in/api/users/2'
#    When method GET
#    And match response.data.id == 2
##    And match response.data.id == "#number" ó "#string"
#    And match response.data.last_name == "Weaver"
#    Then status 200

#  Scenario: Crear usuario - POST 1
#    Given url 'https://reqres.in/api/users'
#    When request {"name": "jose", "job": "ingeniero"}
#    And method POST
#    Then status 201
#    And match response.name == "jose"
#    And response.job == "ingeniero"

#  Scenario: Crear usuario - POST 2
#    Given url 'https://reqres.in/api/users'
#    When request
#    """
#    {
#    "name": "jose",
#    "job": "ingeniero"
#    }
#    """
#    And method POST
#    Then status 201
#    And match response.name == "jose"
#    And response.job == "ingeniero"


#  Scenario: eliminar usuario - DELETE
#    Given url 'https://reqres.in/api/users/2'
#    When method DELETE
#    Then status 204


  Scenario: caso de prueba parametrización de headers - usuario unico
    Given url 'https://reqres.in/api/users/2'
    ## cabeceras
    When header 'Content-Type' = 'Application/json'
    ## tiempo de espera, segundos | 120 segundos
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    And match response.data.id == 2
    Then status 200

#    Scenario Outline: Crear usuarios - usuario: <name>
#    Given url 'https://reqres.in/api/users'
#    When request
#    """
#    {
#    "name": "<name>",
#    "job": "<job>"
#    }
#    """
#    And method POST
#    Then status 201
#    And match response.name == "<name>"
#    And response.job == "<job>"
#    Examples:
#        | name      | job       |
#        | jose      | ingeniero |
#        | alfredo   | contador  |
#        | katherine | doctor    |

  @pruebasUnitarias
  Scenario Outline: Crear usuarios - <nombreCaso>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": "<Vname>","<job>": "<Vjob>" ,}
    And method POST
    Then status 201
        #And match response.name == "<name>"
        #And response.job == "<job>"
    Examples:
      | nombreCaso     | name | Vname | job | Vjob |
      | name vacio     | name |       | job | QA   |
      | name nulo      | name | null  | job | QA   |
      | name 3 letras  | name | sol   | job | QA   |
      | sin campo name |      |       | job | QA   |
      | job vacio      | name | jose  | job |      |
      | job nulo       | name | jose  | job | null |
      | job 3 letras   | name | jose  | job | QA   |
      | sin campo job  | name | jose  |     |      |


