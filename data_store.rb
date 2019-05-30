# frozen_string_literal: true

class DataStore
  attr_reader :data

  def initialize
    @data = {}
  end
end
