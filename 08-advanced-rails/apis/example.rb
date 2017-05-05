require 'net/http'
require 'json'

# set url to read
url = "http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1"

# encode URI using the URI constant
uri = URI(url)

# tell Net::HTTP to GET the URI
response = Net::HTTP.get(uri) # => String

puts JSON.parse(response)["cnt"]
