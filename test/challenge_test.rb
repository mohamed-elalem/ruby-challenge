require "test_helper"

class ChallengeTest < Minitest::Test
  def setup
    @challenge = Challenge.new("data/timestamps.txt")
    @challenge.parse
  end

  def test_earliest_time
    assert_equal Time.parse("1999-12-31T19:28:03-05:00"), @challenge.earliest_time
  end

  def test_latest_time
    assert_equal Time.parse("2019-12-31T18:34:45-05:00"), @challenge.latest_time
  end

  def test_peak_year
    assert_equal 2010, @challenge.peak_year
  end
end
