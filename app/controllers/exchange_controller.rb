class ExchangeController < ApplicationController


  def convert

    @ticker = params.fetch(:ticker)

    exchange_api_endpoint = "https://api.exchangerate.host/symbols"

    raw_response = URI.open(exchange_api_endpoint).read

    require "json"

    @parsed_response = JSON.parse(raw_response)

    @currency_symbols = @parsed_response.fetch("symbols")


    render({:template => "currency_page.html.erb"})

  end

  def calculate

    render(:template => "calculation_page.html.erb")
  end



end
