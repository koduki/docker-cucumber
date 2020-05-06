When /^I add "(.*)" to the search box$/ do |text|
  fill_in "q", with: text
end

And /^click the Search Button$/ do
  click_button "btnK"
end

Then /^"(.*)" should be mentioned in the results$/ do |item|
  expect(page).to have_title(item)
end

