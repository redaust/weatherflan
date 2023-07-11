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
      @api_description = " Safe (0-50): Air quality is satisfactory. Air pollution is little to none."
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "Moderate (51-100): Air quality is acceptable; for some pollutants there may be a moderate health concern for those sensitive to air pollution."
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Warning (101-150): General public is not likely to be affected. People with lung disease, older adults, and children are at greater risk to ozone exposure."
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Unhealthy (151-200): Everyone may experience health effects. Members of sensitive groups may experience more severe health effects. "
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Very Unhealthy (201-300): Everyone may experience more serious health effects."
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = "Hazardous (301-500): Emergency conditions. The entire population is likely to be affected."
    end
  end

  def zipcode
    @zip_query = params[:zipcode]
    if @zip_query = params[:zipcode] == ""
      @zip_query = "Hey, you forgot to enter a zipcode."
    elsif @zip_query = params[:zipcode]
     
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
      @api_description = " Safe (0-50): Air quality is satisfactory. Air pollution is little to none."
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "Moderate (51-100): Air quality is acceptable; for some pollutants there may be a moderate health concern for those sensitive to air pollution."
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Warning (101-150): General public is not likely to be affected. People with lung disease, older adults, and children are at greater risk to ozone exposure."
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Unhealthy (151-200): Everyone may experience health effects. Members of sensitive groups may experience more severe health effects. "
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Very Unhealthy (201-300): Everyone may experience more serious health effects."
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = "Hazardous (301-500): Emergency conditions. The entire population is likely to be affected."
    end







    end
   end   
  end

