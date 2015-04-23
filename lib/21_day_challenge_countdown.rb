# Well I need a bit of rails (for convenience) here!
require 'active_support'
require 'active_support/time_with_zone'
require 'active_support/core_ext/time/zones'

module TwentyOneDayChallenge
  class Countdown
    attr_accessor :anchor
    def next_deadline
      @anchor + current_day
    end

    def now
      Time.zone.now.to_datetime
    end

    def current_day
      elapsed = (now - @anchor)
      (elapsed).ceil
    end

    def left_today
      next_deadline.to_time - now.to_time
    end

    def time_left
      Time.zone.at(left_today)
    end

    def initialize(*_args)
      Time.zone = 'UTC'
      @anchor = ActiveSupport::TimeZone.new('Mountain Time (US & Canada)')
                .parse('13/04/2015 12:00').to_datetime
    end

    def deadline
      "Today is day #{current_day}. You have #{time_left.strftime('%H:%M:%S')
                                             } left to send your pull request."
    end
  end
end
