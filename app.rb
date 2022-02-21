# frozen_string_literal: true

require "roda"

class App < Roda
  plugin :render, layout: "./layout"
  plugin :assets
  plugin :view_options
  plugin :hash_routes
  plugin :header_matchers
  plugin :json

  Dir["routes/*.rb"].each { |f| require_relative f }

  route do |r|
    r.hash_routes("")
  end
end
