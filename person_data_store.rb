# frozen_string_literal: true

require_relative 'data_store'

class PersonDataStore < DataStore
  PersonData = Struct.new(:ip, :hits, :unique_hits, :urls)

  def add(url, ip)
    entry = data[ip] || PersonData.new(ip, 0, 0, [])
    entry.hits += 1

    unless entry.urls.include?(url)
      entry.unique_hits += 1
      entry.urls << url
    end

    data[ip] = entry
  end

  def printable_data
    [
      {
        caption: 'Persons by number of total visits:',
        data: person_by_hits
      },
      {
        caption: 'Persons by number of unique visits:',
        data: person_by_unique_hits
      }
    ]
  end

  private

  def person_by_hits
    result = []
    data.each_value { |item| result << [item.ip, item.hits] }
    result.sort { |x, y| y.last <=> x.last }
  end

  def person_by_unique_hits
    result = []
    data.each_value { |item| result << [item.ip, item.unique_hits] }
    result.sort { |x, y| y.last <=> x.last }
  end
end
