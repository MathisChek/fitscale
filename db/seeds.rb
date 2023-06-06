# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'net/http'
require 'json'

# Set the API endpoint URL
url = URI('https://api.api-ninjas.com/v1/exercises?muscle=biceps')

# Create a new HTTP request
request = Net::HTTP::Get.new(url)

# Optionally, set headers or add authentication
request['API-Key'] = vEqmPDsSQJqKTpaOjrbwVg==88FJhtYQjvhNTufV

# Send the request and get the response
response = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') do |http|
  http.request(request)
end

# Parse the response body as JSON
data = JSON.parse(response.body)

# Process the response data as needed
puts data
