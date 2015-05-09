# Well I need a bit of rails (for convenience) here!
require 'active_support'
require 'active_support/time_with_zone'
require 'active_support/core_ext/time/zones'

module TwentyOneDayChallenge
  class Countdown
    attr_reader :time_left
    attr_reader :current_day

    def initialize
      Time.zone = 'UTC'
      start = ActiveSupport::TimeZone.new('Mountain Time (US & Canada)')
        .parse('04/05/2015 12:00').to_datetime
      now = Time.zone.now.to_datetime
      elapsed = (now - start)
      @current_day = (elapsed).ceil
      next_deadline = start + @current_day
      left_today = next_deadline.to_time - now.to_time
      @time_left = Time.zone.at(left_today)
      # left_string = @time_left.strftime("%H:%M:%S")
    end

    def deadline
      "Today is day #{current_day}. You have #{time_left.strftime('%H:%M:%S')
                                             } left to send your pull request."
    end
  end
end
