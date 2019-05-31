# frozen_string_literal: true

class UrlDataStore
  attr_reader :data

  UrlData = Struct.new(:url, :hits, :unique_hits, :ips)

  def initialize
    @data = {}
  end

  def add(url, ip)
    entry = data[url] || UrlData.new(url, 0, 0, [])
    entry.hits += 1

    unless entry.ips.include?(ip)
      entry.unique_hits += 1
      entry.ips << ip
    end

    data[url] = entry
  end

  def printable_data
    [
      {
        caption: 'URLs by number of total visits:',
        data: urls_by_hits
      },
      {
        caption: 'URLs by number of unique visits:',
        data: urls_by_unique_hits
      }
    ]
  end

  private

  def urls_by_hits
    result = []
    data.each_value { |item| result << [item.url, item.hits] }
    result.sort { |x, y| y.last <=> x.last }
  end

  def urls_by_unique_hits
    result = []
    data.each_value { |item| result << [item.url, item.unique_hits] }
    result.sort { |x, y| y.last <=> x.last }
  end
end
