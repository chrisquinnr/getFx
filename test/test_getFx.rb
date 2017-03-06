require 'minitest/autorun'
require 'getFx'

class GetFxTest < Minitest::Test
  def test_english_hello
    assert_equal "hello world",
      GetFx.hi("english")
  end

  def test_any_hello
    assert_equal "hello world",
      GetFx.hi("ruby")
  end

  def test_spanish_hello
    assert_equal "hola mundo",
      GetFx.hi("spanish")
  end
end
