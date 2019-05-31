# frozen_string_literal: true

require 'spec_helper'
require_relative('../log_parser')

RSpec.describe LogParser do
  let(:file_name) { 'some.file' }

  before do
    ARGV.replace [file_name]
  end

  it 'runs file parser' do
    expect(FileParser).to receive(:run).with(file_name, any_args)
    described_class.run
  end

  it 'runs printer' do
    allow(FileParser).to receive(:run)
    expect(Printer).to receive(:run)
    described_class.run
  end
end
