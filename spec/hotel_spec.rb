require 'spec_helper'

describe EbiMayo::Hotel do
  let(:hotel){EbiMayo::Hotel.new(32)}

  describe '#new' do
    it 'should be able to create a hotel with rooms' do
      expect(hotel.rooms).to eq(32)
    end
  end

  describe '#availability_between' do
    it 'should return a list of available rooms' do
      expect(hotel.availability_between(Date.new(2016,9,12),Date.new(2016,9,18))).to eq(32) #number of rooms
    end

    it 'rooms should be available outside of reservation dates' do
      hotel.make_reservation(Date.new(2016,12,21))
      expect(hotel.availability_between(Date.new(2016,12,22), Date.new(2016,12,23))).to eq(32)
    end

    it 'bookings should be unavailable between dates' do
      hotel.make_reservation(Date.new(2016,12,21))
      expect(hotel.availability_between(Date.new(2016,12,20), Date.new(2016,12,22))).to eq(31)
    end
  end

  describe '#availability_on' do
    it 'should take a reservation' do
      expect(hotel.availability_on(Date.new(2016,12,21))).to eq(32)
      #do we need availability btwn or avail on??
    end

    it 'rooms should be available outside of reserved date' do
      hotel.make_reservation(Date.new(2016,12,21))
      expect(hotel.availability_on(Date.new(2016,12,22))).to eq(32)
    end
  end

  describe '#make_reservation' do
    it 'should reduce number of rooms on a specific day' do
      hotel.make_reservation(Date.new(2016,12,21))
      expect(hotel.availability_on(Date.new(2016,12,21))).to eq(31)
    end
  end
end
