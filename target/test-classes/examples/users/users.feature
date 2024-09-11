Feature: Users

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def create_user_request =
  """
  {
    "id":"100",
    "username": "userCarlos",
    "firstName": "Carlos",
    "lastName": "Diaz",
    "email": "email@gmail.com",
    "password": "123456789",
    "phone": "0999999999",
    "userStatus": 1
  }
  """

  Scenario: Create User
    Given path '/user'
    And request create_user_request
    When method post
    Then status 200


    Scenario: Search User
      * def userName = create_user_request.username
      Given path '/user/'+userName
      When method get
      Then status 200

    Scenario: Update User
      * def userName = create_user_request.username
      * def create_user_request =
      """
      {
        "id":"99",
        "username": "userCarlos",
        "firstName": "Joel",
        "lastName": "Rosero",
        "email": "correoElectronico@gmail.com",
        "password": "987654321",
        "phone": "08888888888",
        "userStatus": 1
      }
      """
      Given path '/user/'+userName
      And request create_user_request
      When method put
      Then status 200

  Scenario: Search User Update
    * def userName = create_user_request.username
    Given path '/user/'+userName
    When method get
    Then status 200

  Scenario: Delete User
    * def userName = create_user_request.username
    Given path '/user/'+userName
    When method delete
    Then status 200
