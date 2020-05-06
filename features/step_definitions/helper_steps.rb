When("I open {string}") do |url|
  visit url
end

Then("I take screenshot {string}") do |file_path|
  page.save_screenshot "screenshots/#{file_path}"
end
