require 'rails_helper'

RSpec.describe GoogleMapsPlacesService do
  describe "#find_place" do
    it "returns a places with its coordinates from a text query", vcr: { match_requests_on: [:method] } do
      query = "Denver"
      response = GoogleMapsPlacesService.find_place(query)

      expect(response).to be_a(Hash)
      expect(response[:candidates]).to be_a(Array)
      expect(response[:status]).to eq("OK")
      response[:candidates].each do |result|
        expect(result).to have_key(:formatted_address)
        expect(result[:formatted_address]).to be_a String
        expect(result).to have_key(:geometry)
        expect(result[:geometry]).to be_a Hash
        expect(result).to have_key(:name)
        expect(result[:name]).to be_a String
        expect(result[:geometry]).to have_key(:location)
        expect(result[:geometry][:location]).to be_a Hash
        expect(result[:geometry][:location]).to have_key(:lat)
        expect(result[:geometry][:location][:lat]).to be_a Float
        expect(result[:geometry][:location]).to have_key(:lng)
        expect(result[:geometry][:location][:lng]).to be_a Float
      end
    end
  end
end