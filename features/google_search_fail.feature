Feature:
	'This is an example for test failure'

Scenario:
	Given I open "https://google.com"
	When I add "cat" to the search box
	And click the Search Button
	Then "dog" should be mentioned in the results
