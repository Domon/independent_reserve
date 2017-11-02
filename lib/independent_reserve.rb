# frozen_string_literal: true

require 'http'
require "independent_reserve/version"

module IndependentReserve
  def self.market_summary(primary_currency_code:, secondary_currency_code:)
    url = "https://api.independentreserve.com/Public/GetMarketSummary"\
      "?PrimaryCurrencyCode=#{primary_currency_code}"\
      "&SecondaryCurrencyCode=#{secondary_currency_code}"

    response_body = HTTP.get(url).to_s
    JSON.parse(response_body)
  end
end
