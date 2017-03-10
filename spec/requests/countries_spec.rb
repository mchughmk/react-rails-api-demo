require 'rails_helper'

RSpec.describe 'Countries API', type: :request do
    let!(:countries) { create_list(:country, 10) }

    describe 'GET /api/countries' do
        before { get '/api/countries' }

        it 'returns countries' do
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end
end