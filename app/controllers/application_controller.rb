require 'net/http'

class ApplicationController < ActionController::Base
    def show
        uri = URI.parse('https://connpass.com/api/v1/event/')
        # uri.query = URI.encode_www_form({event_id:params[:event_id]})
        query_params = {}
        query_params[:event_id] = params[:event_id] if params[:event_id].present?
        query_params[:keyword] = params[:keyword] if params[:keyword].present?
        uri.query = URI.encode_www_form(query_params)
        json = Net::HTTP.get(uri)
        @events = JSON.parse(json)

        render plain: @events.to_s
    end
end