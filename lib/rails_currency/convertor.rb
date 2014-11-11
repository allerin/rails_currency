require 'uri'
require 'open-uri'
require 'timeout'
require 'hpricot'
require 'rails_currency/conversion_services/google'
require 'rails_currency/conversion_services/xe'

module RailsCurrency

  class RailsCurrencyError < StandardError
  end

  class InvalidAmountError < RailsCurrencyError
  end

  class UnknownCurrencyError < RailsCurrencyError
  end

  class ServerTimeoutError < RailsCurrencyError
  end

  class Convertor

    PARAMS = {
      'Connection' => 'Keep-Alive',
      'Keep-Alive' => '30'
    }

    class << self

      def convert(amount, from, to, service = 'google')
        raise InvalidAmountError, 'Only numeric value allowed' unless amount.is_a?(Numeric)
        unless conversion_service(service)::CURRENCIES.key?(from) && conversion_service(service)::CURRENCIES.key?(to)
          raise UnknownCurrencyError, 'Unknown Currency'
        end
        begin
          timeout(30) do
            conversion_service(service).process_request(amount, from, to)
          end
        rescue TimeoutError
          raise ServerTimeoutError, "Can't connect to server #{service_url(service)}"
        end
      end

      def service_url(service)
        conversion_service(service).service_url
      end

      def get_rate(from, to, service = 'google')
        conversion_service(service).get_rate(from, to)
      end

      def conversion_service(service_name)
        service_name.downcase == 'xe' ? Convertor::Xe : Convertor::Google
      end

    end
  end
end
