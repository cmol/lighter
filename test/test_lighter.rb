require 'minitest_helper'
require 'socket'

class TestLighter < MiniTest::Unit::TestCase

  def test_that_it_has_a_version_number
    refute_nil ::Lighter::VERSION
  end

  def test_set
    mock = MiniTest::Mock.new
    mock.expect(:puts, nil, [[128,128,128,129].pack("C*")])
    mock.expect(:puts, nil, [[64,17,17,17].pack("C*")])
    lc = ::Lighter::LampControl.new(socket: mock)
    lc.set(4, [128,128,129])
    lc.set(2, [17,17,17])
    assert mock.verify
  end

  def test_fade
    mock = MiniTest::Mock.new
    mock.expect(:puts, nil, [[129,128,128,129,17].pack("C*")])
    mock.expect(:puts, nil, [[65,17,17,17,77].pack("C*")])
    lc = ::Lighter::LampControl.new(socket: mock)
    lc.fade(4, 17, [128,128,129])
    lc.fade(2, 77, [17,17,17])
    assert mock.verify
  end

  def test_fade_long
    mock = MiniTest::Mock.new
    mock.expect(:puts, nil, [[130,128,128,129,17].pack("C*")])
    mock.expect(:puts, nil, [[66,17,17,17,77].pack("C*")])
    lc = ::Lighter::LampControl.new(socket: mock)
    lc.fade_long(4, 17, [128,128,129])
    lc.fade_long(2, 77, [17,17,17])
    assert mock.verify
  end
end
