# frozen_string_literal: true

require 'spec_helper'
require_relative '../person_data_store'

RSpec.describe PersonDataStore do
  subject { described_class.new }
  let(:test_url) { 'some_site_url' }
  let(:test_ip) { '127.0.0.1' }
  let(:printable_data) {
    [
      {
        caption: 'Persons by number of total visits:',
        data: [[test_ip, 1]]
      },
      {caption: 'Persons by number of unique visits:',
       data:[[test_ip, 1]]}]
  }

  it 'can add new items' do
    subject.add(test_url, test_ip)
    struct = subject.data[test_ip]
    expect(struct.ip).to eq(test_ip)
    expect(struct.hits).to eq(1)
    expect(struct.urls).to eq([test_url])
  end

  it 'calculates unique visits properly' do
    3.times do
      subject.add(test_url, test_ip)
    end
    subject.add('some site', test_ip)
    struct = subject.data[test_ip]
    expect(struct.hits).to eq(4)
    expect(struct.unique_hits).to eq(2)
  end

  it 'returns printable data' do
    subject.add(test_url, test_ip)
    expect(subject.printable_data).to eq(printable_data)
  end
end
