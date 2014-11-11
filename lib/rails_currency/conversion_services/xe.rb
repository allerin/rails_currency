module RailsCurrency
  class Convertor
    class Xe

      CURRENCIES = {
        'AFN' => 'Afghanistan Afghanis',
        'ALL' => 'Albania Leke',
        'DZD' => 'Algeria Dinars',
        'ARS' => 'Argentina Pesos',
        'AUS' => 'Australia Dollars',
        'BSD' => 'Bahamas Dollars',
        'BHD' => 'Bahrain Dinars',
        'BDT' => 'Bangladesh Taka',
        'BBD' => 'Barbados Dollars',
        'BMD' => 'Bermuda Dollars',
        'BRL' => 'Brazil Reais',
        'BGN' => 'Bulgaria Leva',
        'XOF' => 'CFA BCEAO Francs',
        'XAF' => 'CFA BEAC Francs',
        'CAD' => 'Canada Dollars',
        'CLP' => 'Chile Pesos',
        'CNY' => 'China Yuan Renminbi',
        'COP' => 'Colombia Pesos',
        'XPF' => 'Comptoirs Français du Pacifique Francs',
        'CRC' => 'Costa Rica Colones',
        'HRK' => 'Croatia Kuna',
        'CZK' => 'Czech Republic Koruny',
        'DKK' => 'Denmark Kroner',
        'DOP' => 'Dominican Republic Pesos',
        'XCD' => 'East Caribbean Dollars',
        'EGP' => 'Egypt Pounds',
        'EEK' => 'Estonia Krooni',
        'EUR' => 'Euro',
        'FJD' => 'Fiji Dollars',
        'XAU' => 'Gold Ounces',
        'HKD' => 'Hong Kong Dollars',
        'HUF' => 'Hungary Forint',
        'XDR' => 'IMF Special Drawing Rights',
        'ISK' => 'Iceland Kronur',
        'INR' => 'India Rupees',
        'IDR' => 'Indonesia Rupiahs',
        'IRR' => 'Iran Rials',
        'IQD' => 'Iraq Dinars',
        'ILS' => 'Israel New Shekels',
        'JMD' => 'Jamaica Dollars',
        'JPY' => 'Japan Yen',
        'JOD' => 'Jordan Dinars',
        'KES' => 'Kenya Shillings',
        'KWD' => 'Kuwait Dinars',
        'LBP' => 'Lebanon Pounds',
        'MYR' => 'Malaysia Ringgits',
        'MUR' => 'Mauritius Rupees',
        'MXN' => 'Mexico Pesos',
        'MAD' => 'Morocco Dirhams',
        'NZD' => 'New Zealand Dollars',
        'NOK' => 'Norway Kroner',
        'OMR' => 'Oman Rials',
        'PKR' => 'Pakistan Rupees',
        'XPD' => 'Palladium Ounces',
        'PEN' => 'Peru Nuevos Soles',
        'PHP' => 'Philippines Pesos',
        'XPT' => 'Platinum Ounces',
        'PLN' => 'Poland Zlotych',
        'QAR' => 'Qatar Riyals',
        'RON' => 'Romania New Lei',
        'RUB' => 'Russia Rubles',
        'SAR' => 'Saudi Arabia Riyals',
        'XAG' => 'Silver Ounces',
        'SGD' => 'Singapore Dollars',
        'SKK' => 'Slovakia Koruny',
        'ZAR' => 'South Africa Rand',
        'KRW' => 'South Korea Won',
        'LKR' => 'Sri Lanka Rupees',
        'SDG' => 'Sudan Pounds',
        'SEK' => 'Sweden Kronor',
        'CHF' => 'Switzerland Francs',
        'TWD' => 'Taiwan New Dollars',
        'THB' => 'Thailand Baht',
        'TTD' => 'Trinidad and Tobago Dollars',
        'TND' => 'Tunisia Dinars',
        'TRY' => 'Turkey New Lira',
        'AED' => 'United Arab Emirates Dirhams',
        'GBP' => 'United Kingdom Pounds',
        'USD' => 'United States Dollars',
        'VEF' => 'Venezuela Bolivares Fuertes',
        'VND' => 'Vietnam Dong',
        'ZMK' => 'Zambia Kwacha'
      }
      class << self

        def service_url
          'http://www.xe.com/currencyconverter/convert'
        end

        def convert(amount, from, to)
          Convertor.convert(amount, from, to, 'xe')
        end

        def process_request(amount, from, to)
          url = "#{service_url}?Amount=#{amount}&From=#{from}&To=#{to}"
          doc = open(url, Convertor::PARAMS) { |f| Hpricot(f) }
          result = doc.search("//table[@class='ucc-result-table']//tr[@class='uccResUnit']/td[@class='leftCol']")
          result[0].inner_text.split('=')[1].gsub(/\s/, '').to_f
        end

        def get_rate(from, to)
          convert(1, from, to)
        end

      end

    end
  end
end
