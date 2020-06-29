class Meeting < ApplicationRecord
    belongs_to :journey
     
    validates :postcode, presence: true
    validates_numericality_of :duration, allow_blank: true
    validates :name, presence: true
    before_save :calculate_travel_time

  def next
    self.journey.meetings.where("id > ?", self.id).first  
  end

  def previous
    self.journey.meetings.where("id > ?", self.id).first  
  end

  private

    def calculate_travel_time
      if Meeting.count != 0
        id = id || Meeting.last.id + 1
        else
        id = 1
      end

      @start_coords = '51.5199586,-0.0984249' # Rentify coordinates
      @departure_time = self.journey.start_time
      @start_time = self.journey.start_time
      @end_coords = get_coord(self.postcode)

      if self.previous
        @start_coords = get_coord(self.previous.postcode)
        @departure_time = self.previous.departure_time
        @start_time = self.previous.departure_time
      end


      @travel_time = 10
      self.arrival_time = @departure_time + @travel_time.minutes
      self.departure_time = self.duration ? self.arrival_time + self.duration.minutes : self.arrival_time
    end

    def get_coord(code)
      url = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=#{code}&sensor=false")
      req = Net::HTTP.get(url)
      lat = JSON.parse(req)["results"][0]["geometry"]["location"]["lat"]
      lng = JSON.parse(req)["results"][0]["geometry"]["location"]["lng"]
      coord = "#{lat},#{lng}"
    end
end 
