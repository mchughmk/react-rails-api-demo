require 'rails_helper'

RSpec.describe 'States API', type: :request do
    let!(:country1) { create(:country) }
    let!(:country2) { create(:country) }
    let!(:states1) { create_list(:state, 10, country_id: country1.id) }
    let!(:states2) { create_list(:state, 10, country_id: country2.id) }
    let(:country1_code) { country1.code }

    before { get "/api/countries/#{country1_code}/states" }

    context 'when country exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all state items for the country' do
        expect(json.size).to eq(10)
      end
    end

    context 'when country does not exist' do
      let(:country1_code) { 'ZZ' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Country/)
      end
    end
end