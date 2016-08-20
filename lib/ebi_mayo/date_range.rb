module EbiMayo
  class DateRange
    attr_reader :start_date, :end_date
    def initialize(start_date, end_date)
      @start_date = start_date
      @current_date = start_date
      @end_date = end_date
    end

    def next
      if @current_date < @end_date
        Date.jd(@start_date.jd + 1)
      end
    end

    def days
      (0...range-1)
    end

    def range
      end_date.jd - start_date.jd
    end
  end
end