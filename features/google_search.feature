Feature:
	'When I go to the Google search page, and search for an item,
	I expect to see some reference to that item in the result summary.'

Scenario:
	Given I open "https://google.com"
	When I add "cat" to the search box
	And click the Search Button
	Then "cat" should be mentioned in the results
