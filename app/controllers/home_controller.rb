class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=46217&distance=25&API_KEY=B6E22567-7838-48DE-BED3-36028925B7A9'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response) 

# Checks for empty return results.
    if @output.empty?
      @final_output = "error"
    elsif !@output
      @final_output = "error"
      else
        @final_output = @output[0]['AQI']
        end


  end
end
