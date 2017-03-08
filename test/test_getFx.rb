require 'minitest/autorun'
require 'getFx'

class GetFxTest < Minitest::Test
  def test_run_defaults
    assert_equal 1.0597,
      GetFx.run([])
  end

  def test_run_currency
    assert_equal 0.85305,
      GetFx.run(['GBP'])
  end

  def test_run_currency_date
    assert_equal 0.8555,
      GetFx.run(['GBP', '2017-03-01'])
  end

  def test_run_currency_date_amt
    assert_equal 1.711,
      GetFx.run(['GBP', '2017-03-01', 2])
  end
end
