class Api::StatesController < ApplicationController
    before_action :set_country

    def index
        json_response(@country.states)
    end

    private

    def set_country
        @country = Country.find_by! code: params[:country_id]
    end
end