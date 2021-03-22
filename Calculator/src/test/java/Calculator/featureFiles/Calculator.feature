#Author: marioantodenver@gmail.com
@Calculator
Feature: Make sure Calculator works as per functionality
  I am using this feature file to test  the Arithmetic operations of the calculator.

  Background: Go to URL
    Given I am on the "https://testsheepnz.github.io/BasicCalculator.html#main-body" home page

 ##############  SMOKE SCENARIOS  ###############
  @smoke @all
  Scenario Outline: SMOKE_"<Operation>"_"<TC>"__Check "<Operation>" of two numbers or strings "<Number1>" and "<Number2>"
    When I select build "2" from dropdown
    And I enter "<Number1>" and "<Number2>" in field
    And I select "<Operation>" from dropdown and check "<Integer>"
    Then I validate the "<Expected_Result>" Answer field
    When I click on clear Button
    Then All fields are erased

    Examples: 
      | TC | Number1 | Number2 | Operation   | Integer | Expected_Result |
      |  1 |     370 |     370 | Add         | Yes     | Success         |
      |  2 | 123.456 | 123.456 | Add         | No      | Success         |
      |  3 | -123.44 |      33 | Add         | Yes     | Success         |
      |  4 | 3d      |      22 | Add         | No      | Error           |
      |  5 |      11 |   22.43 | Subtract    | No      | Success         |
      |  6 |  -33.22 |      22 | Subtract    | Yes     | Success         |
      |  7 |     -33 | 44.d3   | Subtract    | No      | Error           |
      |  8 |      11 |    0.43 | Multiply    | yes     | Success         |
      |  9 |     -33 |   44.25 | Multiply    | No      | Success         |
      | 10 |     -10 |     -12 | Multiply    | No      | Success         |
      | 11 |     -33 | 3d      | Multiply    | yes     | Error           |
      | 12 |      11 |    0.43 | Divide      | no      | Success         |
      | 13 |      33 |       0 | Divide      | Yes     | Error           |
      | 14 |  -10.12 |     -12 | Divide      | no      | Success         |
      | 15 | 33@     |      31 | Divide      | Yes     | Error           |
      | 16 |  -10.12 |     -12 | Concatenate | Yes     | Success         |
      | 17 | 33d     |      31 | Concatenate | Yes     | Success         |

##################  GOOD TO HAVE SCENARIOS  ###############
  @Add @goodToHave @all
  Scenario Outline: ADD__"<TC>"__Check Addtion of two numbers "<Number1>" and "<Number2>"
    When I select build "2" from dropdown
    And I enter "<Number1>" and "<Number2>" in field
    And I select "<Operation>" from dropdown and check "<Integer>"
    Then I validate the "<Expected_Result>" Answer field
    When I click on clear Button
    Then All fields are erased

    Examples: 
      | TC | Number1 | Number2 | Operation | Integer | Expected_Result |
      |  1 |       9 |   -7.20 | Add       | No      | Success         |
      |  2 | 2a.02   |       7 | Add       | No      | Error           |
      |  3 |     2.0 | 7d      | Add       | No      | Error           |
      |  4 | 2@      |       7 | Add       | No      | Error           |
      |  5 |       2 | 7%      | Add       | No      | Error           |
      |  6 |     192 |   -7.53 | Add       | Yes     | Success         |
      |  7 |    -192 |   -7.20 | Add       | Yes     | Success         |
      |  8 | 2a.02   |       7 | Add       | Yes     | Error           |
      |  9 |     2.0 | 7d      | Add       | Yes     | Error           |
      | 10 | 2@      |       7 | Add       | Yes     | Error           |
      | 11 |       2 | 7%      | Add       | Yes     | Error           |
      | 12 |       2 | 7. 09   | Add       | No      | Error           |
      | 13 | 1 2     |    7.09 | Add       | No      | Error           |

  @Subtract @goodToHave @all
  Scenario Outline: SUB__"<TC>"__Check Subtraction of two numbers "<Number1>" and "<Number2>"
    When I select build "2" from dropdown
    And I enter "<Number1>" and "<Number2>" in field
    And I select "<Operation>" from dropdown and check "<Integer>"
    Then I validate the "<Expected_Result>" Answer field
    When I click on clear Button
    Then All fields are erased

    Examples: 
      | TC | Number1 | Number2 | Operation | Integer | Expected_Result |
      |  1 |     192 |   -7.53 | Subtract  | No      | Success         |
      |  2 |    -192 |   -7.20 | Subtract  | No      | Success         |
      |  3 |    -192 |   -7.20 | Subtract  | No      | Success         |
      |  4 |    -192 |       0 | Subtract  | No      | Success         |
      |  5 | 2a.02   |       7 | Subtract  | No      | Error           |
      |  6 |     2.0 | 7d      | Subtract  | No      | Error           |
      |  7 | 2@      |       7 | Subtract  | No      | Error           |
      |  8 |       2 | 7%      | Subtract  | No      | Error           |
      |  9 |     192 |   -7.53 | Subtract  | Yes     | Success         |
      | 10 |    -192 |   -7.20 | Subtract  | Yes     | Success         |
      | 11 | 2a.02   |       7 | Subtract  | Yes     | Error           |
      | 12 |     2.0 | 7d      | Subtract  | Yes     | Error           |
      | 13 | 2@      |       7 | Subtract  | Yes     | Error           |

  @Multiplication @goodToHave @all
  Scenario Outline: Multiply__"<TC>"__Check Multiplication of two numbers "<Number1>" and "<Number2>"
    When I select build "2" from dropdown
    And I enter "<Number1>" and "<Number2>" in field
    And I select "<Operation>" from dropdown and check "<Integer>"
    Then I validate the "<Expected_Result>" Answer field
    When I click on clear Button
    Then All fields are erased

    Examples: 
      | TC | Number1 | Number2 | Operation | Integer | Expected_Result |
      |  1 |     192 |   -7.53 | Multiply  | No      | Success         |
      |  2 |    -192 |   -7.20 | Multiply  | No      | Success         |
      |  3 | 2a.02   |       7 | Multiply  | No      | Error           |
      |  4 | 2@      |       7 | Multiply  | No      | Error           |
      |  5 |       2 | 7%      | Multiply  | No      | Error           |
      |  6 |       0 |   -7.53 | Multiply  | Yes     | Success         |
      |  7 |    -192 |   -7.20 | Multiply  | Yes     | Success         |
      |  8 | 2a.02   |       7 | Multiply  | Yes     | Error           |
      |  9 |     2.0 | 7d      | Multiply  | Yes     | Error           |
      | 10 | 2@      |       7 | Multiply  | Yes     | Error           |
      | 11 |       2 | 7%      | Multiply  | Yes     | Error           |

  @Division @goodToHave @all
  Scenario Outline: DIV__"<TC>"__Check Division of two numbers "<Number1>" and "<Number2>"
    When I select build "2" from dropdown
    And I enter "<Number1>" and "<Number2>" in field
    And I select "<Operation>" from dropdown and check "<Integer>"
    Then I validate the "<Expected_Result>" Answer field
    When I click on clear Button
    Then All fields are erased

    Examples: 
      | TC | Number1 | Number2 | Operation | Integer | Expected_Result |
      |  1 |    -192 |   -7.20 | Divide    | No      | Success         |
      |  2 | 2a.02   |       7 | Divide    | No      | Error           |
      |  3 |     2.0 | 7d      | Divide    | No      | Error           |
      |  4 | 2@      |       7 | Divide    | No      | Error           |
      |  5 |       2 | 7%      | Divide    | No      | Error           |
      |  6 |       0 |       7 | Divide    | No      | Error           |
      |  7 |       2 |       0 | Divide    | No      | Error           |
      |  8 |     192 |   -7.53 | Divide    | Yes     | Success         |
      |  9 |    -192 |   -7.20 | Divide    | Yes     | Success         |
      | 10 | 2a.02   |       7 | Divide    | Yes     | Error           |
      | 11 |     2.0 | 7d      | Divide    | Yes     | Error           |
      | 12 | 2@      |       7 | Divide    | Yes     | Error           |
      | 13 |       2 | 7%      | Divide    | Yes     | Error           |
      | 14 |       0 |       7 | Divide    | No      | Error           |

  @Concatenate @goodToHave @all
  Scenario Outline: CONCAT__"<TC>"__Check Concatenate of two numbers or strings "<Number1>" and "<Number2>"
    When I select build "2" from dropdown
    And I enter "<Number1>" and "<Number2>" in field
    And I select "<Operation>" from dropdown and check "<Integer>"
    Then I validate the "<Expected_Result>" Answer field
    When I click on clear Button
    Then All fields are erased

    Examples: 
      | TC | Number1 | Number2 | Operation   | Integer | Expected_Result |
      |  1 |   323.3 |       5 | Concatenate | No      | Success         |
      |  2 |    -192 |       7 | Concatenate | No      | Success         |
      |  3 |     192 |   -7.53 | Concatenate | No      | Success         |
      |  4 | 2a.02   |       7 | Concatenate | No      | Success         |
      |  5 |     2.0 | 7d      | Concatenate | No      | Success         |
      |  6 |       2 | 7%      | Concatenate | No      | Success         |

 