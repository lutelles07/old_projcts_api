Then(/^Response code should be equal "([^"]*)"$/) do |code|
  expect(@response.code).to eq code.to_i
  #@response.code.to_s.should == code
end

Then(/^I should see the message "([^"]*)"$/) do |msg|
  expect(@response['message'].include?msg).to eq true
end
