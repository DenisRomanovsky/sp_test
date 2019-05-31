# frozen_string_literal: true

require_relative 'lib/file_parser'
require_relative 'lib/printer'
require_relative 'lib/data_stores/url_data_store'
require_relative 'lib/data_stores/person_data_store'

class Parser
  DATA_STORAGES = [UrlDataStore, PersonDataStore].freeze

  def self.run
    data_storages = DATA_STORAGES.map(&:new)
    FileParser.run(ARGV.first, data_storages)
    Printer.run(data_storages)
  end
end

Parser.run if ARGV.first
