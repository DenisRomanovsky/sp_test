# frozen_string_literal: true

require_relative 'person_data_store'
require_relative 'url_data_store'
require_relative 'file_parser'
require_relative 'printer'

class LogParser
  DATA_STORAGES = [UrlDataStore, PersonDataStore].freeze

  def self.run
    data_storages = DATA_STORAGES.map(&:new)
    FileParser.run(ARGV.first, data_storages)
    Printer.run(data_storages)
  end
end

#LogParser.run
