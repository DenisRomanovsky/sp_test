# frozen_string_literal: true

class Printer
  attr_accessor :data_storages

  def initialize(data_storages)
    @data_storages = data_storages
  end

  def self.run(data_storages)
    new(data_storages).run
  end

  def run
    data_storages.each do |data_storage|
      render_data_storage(data_storage)
    end
  end

  private

  def render_data_storage(data_storage)
    data_storage.printable_data.each do |data_batch|
      puts data_batch[:caption]
      render_data_rows(data_batch)
    end
  end

  def render_data_rows(data_batch)
    data_batch[:data].each do |data_row|
      puts "#{data_row.first} - #{data_row.last} visits"
    end
  end
end
