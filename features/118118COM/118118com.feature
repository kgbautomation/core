Feature: 118 118 Demo
  Make sure I can go to 118118.com and search for stuff
  
  Background: 
    Given I visit the default site
  
  Scenario: Search for a Mechanic
    When I enter "mechanic" into the "What?" field
	When I enter "macclesfield" into the "Where?" field
	Then I click the "search" button
	Then I should see the "Prestige Car Servicing" message

  Scenario: Search for Pizza
    When I enter "pizza" into the "What?" field
    When I enter "Liverpool" into the "Where?" field
    Then I click the "search" button
    Then I should see the "Pizza Hut" text
  
  Scenario: Test Location Field Auto Complete
    When I enter "leic" into the "Where?" field
    Then I should see the following text: 
	| Leicester                              |
	| Leicester Forest East (Near Leicester) |
	| Leicester Square (London)              |
    | Leicester Square Tube                  |
    | Leicestershire County                  |
	
  Scenario: Search for a good time
    When I enter "escorts" into the "What?" field
    When I enter "Warrington" into the "Where?" field
    Then I click the "search" button
    Then I should see the following text: 
    | La Femme In Call Penthouse |
    | Aaaron Elite Escorts       |
    | G S Escorts                |
    | Escorts 4 U                |
    | Male Escorts               |
    Then I click the first "http://www.lafemme.co.uk" link
 	
	