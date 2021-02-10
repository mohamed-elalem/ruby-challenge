require "time"

class Challenge
  attr_reader :earliest_time
  attr_reader :latest_time
  attr_reader :peak_year

  def initialize(file_path)
    @file_path = File.expand_path(file_path)
  end

  def parse
    # Parse the file located at @file_path and set three attributes:
    #
    # earliest_time: the earliest time contained within the data set
    # latest_time: the latest time contained within the data set
    # peak_year: the year with the most number of timestamps contained within the data set
  end
end
