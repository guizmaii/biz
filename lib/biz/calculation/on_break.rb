module Biz
  module Calculation
    class OnBreak

      def initialize(schedule, time)
        @schedule = schedule
        @time     = time
      end

      def result
        schedule.breaks.any? { |break_| break_.contains?(time) }
      end

      protected

      attr_reader :schedule,
                  :time

    end
  end
end
