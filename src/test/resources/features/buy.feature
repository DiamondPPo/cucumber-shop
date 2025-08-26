Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Nutella" with price 100.00 and stock of 20 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario: Buy multiple products
    When I buy "Jam" with quantity 1
    And I buy "Bread" with quantity 1
    And I buy "Nutella" with quantity 5
    Then total should be 600.50

Scenario: Customer buys more product than stock
    Given the store is ready to service customers
    And a product "Nutella" with price 100.00 and stock of 20 exists
    When I buy "Nutella" with quantity 25
    Then I should get a message saying "Insufficient stock for product Nutella"