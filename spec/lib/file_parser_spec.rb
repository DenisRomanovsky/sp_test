# frozen_string_literal: true

require 'spec_helper'
require_relative('../../lib/file_parser')

RSpec.describe FileParser do
  let(:file_path) { 'spec/fixtures/weblog_test.txt' }
  let(:invalid_data_file_path) { 'spec/fixtures/weblog_invalid_test.txt' }
  let(:incorrect_file_path) { 'spec/fixtures/weblog_test_absent.txt' }
  let(:data_storage_mock) { double('ds', add: true) }

  it 'checks file existence' do
    expect { described_class.run(incorrect_file_path, [data_storage_mock]) }.to raise_error(RuntimeError, 'Incorrect path: no file found')
  end

  it 'checks file path presence' do
    expect { described_class.run('', [data_storage_mock]) }.to raise_error(RuntimeError, 'Incorrect path: no file found')
  end

  it 'validates data presence' do
    expect { described_class.run(invalid_data_file_path, [data_storage_mock]) }.to raise_error(RuntimeError, 'File contains invalid data')
  end

  it 'populates data storage' do
    expect(data_storage_mock).to receive(:add).with('/help_page/1', '126.318.035.038')
    described_class.run(file_path, [data_storage_mock])
  end
end
