require 'bigdecimal/util'

RSpec.describe IndependentReserve do
  it "has a version number" do
    expect(IndependentReserve::VERSION).not_to be nil
  end

  describe '.market_summary' do
    subject(:market_summary) do
      described_class.market_summary(
        primary_currency_code:   primary_currency_code,
        secondary_currency_code: secondary_currency_code,
      )
    end

    context 'with valid currency codes', vcr: { cassette_name: 'market_summary/valid' } do
      let(:primary_currency_code)   { 'Xbt' }
      let(:secondary_currency_code) { 'Aud' }

      it 'returns market summary' do
        expect(market_summary).to eq(
          {
            day_highest_price:                     '9545.00'.to_d,
            day_lowest_price:                      '8750.00'.to_d,
            day_avg_price:                         '9215.18'.to_d,
            day_volume_xbt:                        '481.67961367'.to_d,
            day_volume_xbt_in_secondary_currrency: '476.32153486'.to_d,
            current_lowest_offer_price:            '9409.94'.to_d,
            current_highest_bid_price:             '9350.00'.to_d,
            last_price:                            '9449.19'.to_d,
            primary_currency_code:                 'Xbt',
            secondary_currency_code:               'Aud',
            created_timestamp_utc:                 '2017-11-02T13:29:59.8126139Z',
          }
        )
      end
    end

    context 'with invalid currency codes', vcr: { cassette_name: 'market_summary/invalid' } do
      let(:primary_currency_code)   { 'invalid_primary' }
      let(:secondary_currency_code) { 'invalid_secondary' }

      it 'returns an error message' do
        expect(market_summary).to eq(
          {
            message: "Invalid Primary Currency Code",
          }
        )
      end
    end
  end
end
