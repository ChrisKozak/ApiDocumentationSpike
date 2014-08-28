require 'grape'
require 'grape-swagger'
require 'json'
require 'yaml'

module GrapeLand
  class Api < Grape::API
    rescue_from :all
    prefix 'api'
    version 'v1'
    format :json

    resources :hello do

      params do
        requires :world_name, type: String, desc: 'Which world we are saying hello to.'
      end

      get '/', http_codes: [[200, 'Ok', ''], [404, 'Not found!']] do
        {:hello => params[:world_name]}
      end
    end

    add_swagger_documentation api_version: 'v1'
  end
end
