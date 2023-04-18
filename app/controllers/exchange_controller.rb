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

    @ticker1 = params.fetch("ticker1")
    @ticker2 = params.fetch("ticker2")

    @currency_api_endpoint = "https://api.exchangerate.host/convert?from=#{@ticker1}&to=#{@ticker2}"

    @raw_response = URI.open(@currency_api_endpoint).read

    require "json"

    @parsed_response = JSON.parse(@raw_response)

    @query = @parsed_response.fetch("query")
    @amount = @query.fetch("amount")

    @info = @parsed_response.fetch("info")
    @rate = @info.fetch("rate")


    render(:template => "calculation_page.html.erb")
  end



end
