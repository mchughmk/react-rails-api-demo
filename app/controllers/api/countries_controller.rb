class Api::CountriesController < ApplicationController
    before_action :set_country, only: [:show]

    def index
        @countries = Country.all
        json_response(@countries)
    end
end
