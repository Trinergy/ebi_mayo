
module EbiMayo
  class Hotel
    attr_reader :rooms, :bookings

    def initialize(rooms)
      @rooms = rooms
      @bookings = Hash.new(0)
      # @bookings = Bookings.new
    end

    def availability_between(start_date, end_date)
      # @booking.availability_between(start_date, end_dates)
      rooms - total_bookings_until(DateRange.new(start_date, end_date))
    end

    def make_reservation(date)
      @bookings[date] += 1
    end

    def availability_on(date)
      @rooms - @bookings[date]
    end

    private

    def total_bookings_until(dates)
      dates.days.inject(0) do |acc, value|
         acc + @bookings[dates.next]        
      end
    end

  end
end