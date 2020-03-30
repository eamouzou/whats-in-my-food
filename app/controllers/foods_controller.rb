class FoodsController < ApplicationController

  def index
    ingredient = params[:q]
    ingredient_for_url = ingredient.split(' ').join('%20')

    conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["FOOD-API-KEY"] = ENV["FOOD_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/fdc/v1/search?api_key=#{ENV["FOOD_API_KEY"]}&ingredients=#{ingredient_for_url}")
    json = JSON.parse(response.body, symbolize_names: true)
    
    @full_response = json
    @foods = json[:foods].take(10)
  end

end
