require 'net/http'

class ApplicationController < ActionController::Base
    def show
        uri = URI.parse('https://connpass.com/api/v1/event/')
        # uri.query = URI.encode_www_form({event_id:params[:event_id]})
        # query_paramsの中にif文で入ってきたやつをが入ってる?
        query_params = {}
        query_params[:event_id] = params[:event_id] if params[:event_id].present?
        query_params[:keyword] = params[:keyword] if params[:keyword].present?
        query_params[:ymd] = params[:ymd] if params[:ymd].present?
        #ここでJSON方式にエンコードしてるっぽい
        uri.query = URI.encode_www_form(query_params)
        json = Net::HTTP.get(uri)
        #JSONの文字列を解析してruby用の配列とかに置きなおしている
        @events = JSON.parse(json)
        #プレーンテキストで表示(htmlを作ってないから)
        render plain: @events.to_s
    end
end