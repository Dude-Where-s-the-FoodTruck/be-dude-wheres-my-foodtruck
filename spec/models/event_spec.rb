require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "associations" do
    it { should belong_to(:food_truck) }
  end

  describe "validations" do
    it { should validate_presence_of :food_truck_id }
    it { should validate_presence_of :event_date }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    it { should validate_presence_of :description }
  end

  it 'has a class method to delete old records' do
    Event.delete_all
    truck = create(:food_truck)
    create(:event, event_date: Date.today.days_ago(2), food_truck_id: truck.id)
    create_list(:event, 3, food_truck_id: truck.id)
    create(:event, event_date: Date.today.days_ago(24), food_truck_id: truck.id)

    expect(Event.count).to eq(5)
    Event.delete_old
    expect(Event.count).to eq(3)
    expect(Event.where("event_date < ?", Date.yesterday)).to eq([])
  end
end
