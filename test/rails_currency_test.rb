$:.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'rails_currency'

class RailsCurrencyTest < Minitest::Test
  # Tests for Convertor
  def test_convert
    assert_kind_of Numeric, RailsCurrency::Convertor.convert(100, 'CNY', 'USD')
    assert_kind_of Numeric, RailsCurrency::Convertor.convert(100, 'CNY', 'USD', 'google')
    assert_kind_of Numeric, RailsCurrency::Convertor.convert(100, 'CNY', 'USD', 'xe')
  end

  def test_invalid_convert
    assert_raises RailsCurrency::InvalidAmountError do
      RailsCurrency::Convertor.convert('100', 'CNY', 'USD')
    end
    assert_raises RailsCurrency::InvalidAmountError do
      RailsCurrency::Convertor.convert('100', 'CNY', 'USD', 'google')
    end
    assert_raises RailsCurrency::InvalidAmountError do
      RailsCurrency::Convertor.convert('100', 'CNY', 'USD', 'xe')
    end

    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor.convert(100, 'CNY', 'ABC')
    end
    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor.convert(100, 'CNY', 'ABC', 'google')
    end
    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor.convert(100, 'CNY', 'ABC', 'xe')
    end
  end

  def test_get_rate
    assert_kind_of Numeric, RailsCurrency::Convertor.get_rate('CNY', 'USD')
    assert_kind_of Numeric, RailsCurrency::Convertor.get_rate('CNY', 'USD', 'google')
    assert_kind_of Numeric, RailsCurrency::Convertor.get_rate('CNY', 'USD', 'xe')
  end

  def test_invalid_get_rate
    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor.get_rate('CNY', 'ABC')
    end
    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor.get_rate('CNY', 'ABC', 'google')
    end
    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor.get_rate('CNY', 'ABC', 'xe')
    end
  end

  # Tests for Convertor::Google
  def test_convert_with_google
    assert_kind_of Numeric, RailsCurrency::Convertor::Google.convert(100, 'CNY', 'USD')
  end

  def test_invalid_convert_with_google
    assert_raises RailsCurrency::InvalidAmountError do
      RailsCurrency::Convertor::Google.convert('100', 'CNY', 'USD')
    end

    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor::Google.convert(100, 'CNY', 'ABC')
    end
  end

  def test_invalid_get_rate_with_google
    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor::Google.get_rate('CNY', 'ABC')
    end
  end

  # Test for Convertor::Xe
  def test_convert_with_xe
    assert_kind_of Numeric, RailsCurrency::Convertor::Xe.convert(100, 'CNY', 'USD')
  end

  def test_invalid_convert_with_xe
    assert_raises RailsCurrency::InvalidAmountError do
      RailsCurrency::Convertor::Xe.convert("100", 'CNY', 'USD')
    end

    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor::Xe.convert(100, 'CNY', 'ABC')
    end
  end

  def test_invalid_get_rate_with_xe
    assert_raises RailsCurrency::UnknownCurrencyError do
      RailsCurrency::Convertor::Xe.get_rate('CNY', 'ABC')
    end
  end

end
