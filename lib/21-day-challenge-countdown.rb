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
      format_string = "Today is day %s. You have %s hours, %s minutes "\
                      "and %s seconds left to send your pull request."
      format_string % [current_day, time_left.strftime('%H'),
                       time_left.strftime('%M'), time_left.strftime('%S')]
    end
  end
end
