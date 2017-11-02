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
            'DayHighestPrice'                  => 9545.0,
            'DayLowestPrice'                   => 8750.0,
            'DayAvgPrice'                      => 9215.18,
            'DayVolumeXbt'                     => 481.67961367,
            'DayVolumeXbtInSecondaryCurrrency' => 476.32153486,
            'CurrentLowestOfferPrice'          => 9409.94,
            'CurrentHighestBidPrice'           => 9350.0,
            'LastPrice'                        => 9449.19,
            'PrimaryCurrencyCode'              => 'Xbt',
            'SecondaryCurrencyCode'            => 'Aud',
            'CreatedTimestampUtc'              => '2017-11-02T13:29:59.8126139Z',
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
            "Message" => "Invalid Primary Currency Code",
          }
        )
      end
    end
  end
end
