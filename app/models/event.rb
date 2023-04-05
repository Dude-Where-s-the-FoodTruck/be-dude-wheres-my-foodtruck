class Event < ApplicationRecord
  validates_presence_of :food_truck_id,
                        :event_date,
                        :latitude,
                        :longitude,
                        :start_time,
                        :end_time,
                        :description
                        
  belongs_to :food_truck

  def self.create_with_data(truck_id, input, location)
    place = FoodtruckFacade.get_place_search_details("#{location}," + "#{input[:city]}")
    new_event = FoodTruck.find(truck_id).events.new(input)
    new_event.latitude = place.latitude
    new_event.longitude = place.longitude
    new_event.save
    new_event
  end

  def self.update_with_data(event_id, update_params, location)
    event = Event.find(event_id)
    if location.nil?
      event.update(update_params)
    elsif FoodtruckFacade.get_place_search_details("#{location}, " + "#{update_params[:city]}") == "No Results Found"
      event.errors.add(:location, "Invalid Location")
      raise ActiveRecord::RecordInvalid.new(event)
    elsif location != nil
      event.update(update_params)
      place = FoodtruckFacade.get_place_search_details("#{location}, " + "#{update_params[:city]}")
      event.update(latitude: place.latitude)
      event.update(longitude: place.longitude)
    else
      event.update(update_params)
    end
  end

  def self.delete_old
    self.where("event_date < ?", Date.yesterday).delete_all
  end
end
