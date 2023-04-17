class ForexController < ApplicationController

  def main_page


    forex_api_endpoint = "https://api.exchangerate.host/symbols"

    raw_response = URI.open(forex_api_endpoint).read

    require "json"

    @parsed_response = JSON.parse(raw_response)
  
    @currency_symbols = @parsed_response.fetch("symbols")

   


    render({:template => "/main_page.html.erb"})

  end


end
