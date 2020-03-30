class FoodsController < ApplicationController

  def index
    ingredient = params[:q]
    ingredient_for_url = ingredient.split(' ').join('%20')

    api_key = 'KFcwzS9t1s2t0vaLj4LJOctunLr03wXaAKEgmnbL'

    conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["FOOD-API-KEY"] = api_key
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/fdc/v1/search?api_key=#{api_key}&ingredients=#{ingredient_for_url}")
    json = JSON.parse(response.body, symbolize_names: true)
    @foods = json[:foods]
  end

end
