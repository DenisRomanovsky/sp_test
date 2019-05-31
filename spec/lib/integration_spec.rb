# frozen_string_literal: true

require 'spec_helper'
require_relative('../../parser')

RSpec.describe Parser do
  let(:file_path) { 'spec/fixtures/weblog_test.txt' }

  before do
    ARGV.replace [file_path]
  end

  it 'parses file with output' do
    expect(STDOUT).to receive(:puts).exactly(8).times
    described_class.run
  end
end
