# frozen_string_literal: true

require 'time'

# This class is responsible is responsible for reading timestamps
# stored on file system and extract certain information from these timestamps
class Challenge
  attr_reader :earliest_time, :latest_time, :peak_year

  def initialize(file_path)
    @file_path = File.expand_path(file_path)
    @earliest_time = nil
    @latest_time = nil
    @peak_year = nil
    @timestamps_count_per_year = {}
  end

  def parse
    # Parse the file located at @file_path and set three attributes:
    #
    # earliest_time: the earliest time contained within the data set
    # latest_time: the latest time contained within the data set
    # peak_year: the year with the most number of timestamps contained within the data set

    File.open(@file_path).each do |timestamp|
      parsed_timestamp = Time.parse timestamp
      @earliest_time = parsed_timestamp if earliest? parsed_timestamp
      @latest_time = parsed_timestamp if latest? parsed_timestamp
      record_year_of_timestamp parsed_timestamp
    end

    @peak_year = find_peak_year
  end

  def earliest?(timestamp)
    return timestamp if @earliest_time.nil?

    timestamp < @earliest_time
  end

  def latest?(timestamp)
    return timestamp if @latest_time.nil?

    timestamp > @latest_time
  end

  def record_year_of_timestamp(timestamp)
    @timestamps_count_per_year[timestamp.year] ||= 0
    @timestamps_count_per_year[timestamp.year] += 1
  end

  def find_peak_year
    @timestamps_count_per_year.max_by { |_, v| v }.first
  end

  private :earliest?, :latest?, :record_year_of_timestamp, :find_peak_year
end
