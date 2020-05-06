After do |scenario| 
    if scenario.failed? 
        path = "report/#{scenario.__id__}.html"
        page.driver.browser.save_screenshot(path)
        embed(path, "image/png")
    end 
end