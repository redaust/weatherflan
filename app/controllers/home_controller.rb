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

    if @final_output == "error"
      @api_color = "gray"
    elsif @final_output <= 50
      @api_color = "green"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
    end
    

  end
end
