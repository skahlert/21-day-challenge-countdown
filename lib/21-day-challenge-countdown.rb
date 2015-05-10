require 'time'

module TwentyOneDayChallenge
  class Countdown
    attr_reader :time_left
    attr_reader :current_day

    def initialize
      start_time = Time.parse('2015-05-04 12:00:00 -0600')
      now = Time.now

      elapsed = (now - start_time)
      @current_day = (elapsed / 60/ 60 / 24).ceil
      current_day_in_seconds = @current_day * 60 * 60 * 24

      next_deadline = start_time + current_day_in_seconds - 1
      left_today = next_deadline - now
      @time_left = Time.at(left_today).gmtime
      # left_string = @time_left.strftime("%H:%M:%S")
    end

    def deadline
      "Today is day #{current_day}. " +
        "You have #{time_left.strftime('%H')} hours, " +
        "#{time_left.strftime('%M')} minutes " +
        "and #{time_left.strftime('%S')} seconds " +
        "left to send your pull request."
    end
  end
end
