Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
	Movie.create(movie) unless Movie.find_by_title(movie[:title])
  end
end 

Then /^the director of "([^\"]*)" should be "([^\"]*)"$/ do |arg1, arg2|
	#puts arg1, arg2
	#puts page.body
	assert page.body.match(/#{arg1}.*#{arg2}/m) 
end	