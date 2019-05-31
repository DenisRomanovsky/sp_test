# frozen_string_literal: true

class FileParser
  attr_accessor :file_path, :data_storages, :pathname

  SPLIT_SYMBOL = ' '

  def initialize(file_path, data_storages)
    @file_path = file_path
    @data_storages = data_storages
  end

  def self.run(file_path, data_storages)
    new(file_path, data_storages).run
  end

  def run
    check_file_existence
    parse_file
  end

  private

  def check_file_existence
    raise 'Incorrect path: provide filepath' unless file_path

    @pathname = Pathname.new(file_path)

    raise 'Incorrect path: target is a folder' if pathname.directory?
    raise 'Incorrect path: no file found' unless pathname.exist?
  end

  def parse_file
    File.foreach(pathname) do |line|
      url, ip = line.split(SPLIT_SYMBOL)
      raise 'File contains invalid data' unless url && ip

      data_storages.each do |data_storage|
        data_storage.add(url, ip)
      end
    end
  end
end
