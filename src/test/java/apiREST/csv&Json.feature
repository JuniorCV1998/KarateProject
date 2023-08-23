@cvs&json
Feature: csv and json

  ##instalar Rainbow CSV - plugins (visualización formato csv)
  @pruebasConCsv
  Scenario Outline: Crear usuarios csv - <nombreCaso>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": "<Vname>","<job>": "<Vjob>" }
    And method POST
    Then status 201
    Examples:
      | read('files/txt.csv') |

  @pruebasConJson
  Scenario Outline: Crear usuarios json - <nombreCaso>
    Given url 'https://reqres.in/api/users'
    ## Declaramos la variable
    When def body = read('files/request.json')
    ## utilizamos la variable creada
    And request body
    And method POST
    Then status 201
    Examples:
      #| read('files/txt.csv') |
      | nombreCaso     | name | Vname | job | Vjob |
      | name vacio     | name |       | job | QA   |
      | name nulo      | name | null  | job | QA   |
      | name 3 letras  | name | sol   | job | QA   |
      | sin campo name |      |       | job | QA   |
      | job vacio      | name | jose  | job |      |
      | job nulo       | name | jose  | job | null |
      | job 3 letras   | name | jose  | job | QA   |
      | sin campo job  | name | jose  |     |      |
