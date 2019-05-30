# frozen_string_literal: true

require 'spec_helper'
require_relative '../url_data_store'

RSpec.describe UrlDataStore do
  subject { described_class.new }
  let(:test_url) { 'some_site_url' }
  let(:test_ip) { '127.0.0.1' }
  let(:printable_data) do
    [
      {
        caption: 'URLs by number of total visits:',
        data: [['some_site_url', 1]]
      },
      { caption: 'URLs by number of unique visits:',
        data: [['some_site_url', 1]] }
    ]
  end

  it 'can add new items' do
    subject.add(test_url, test_ip)
    struct = subject.data[test_url]
    expect(struct.url).to eq(test_url)
    expect(struct.hits).to eq(1)
    expect(struct.ips).to eq([test_ip])
  end

  it 'calculates unique visits properly' do
    3.times do
      subject.add(test_url, test_ip)
    end
    subject.add(test_url, '11.22.33.44')
    struct = subject.data[test_url]
    expect(struct.hits).to eq(4)
    expect(struct.unique_hits).to eq(2)
  end

  it 'returns printable data' do
    subject.add(test_url, test_ip)
    expect(subject.printable_data).to eq(printable_data)
  end
end
