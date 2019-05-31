# frozen_string_literal: true

require 'spec_helper'
require_relative('../printer')

RSpec.describe Printer do
  let(:data_storage) { double('ds') }
  let(:printable_caption) { [{ caption: 'Custom caption', data: [%w[a b]] }] }

  it 'prints caption and data' do
    allow(data_storage).to receive(:printable_data).and_return(printable_caption)
    expect(STDOUT).to receive(:puts).twice.with(/Custom caption|a - b visits/)
    described_class.run([data_storage])
  end
end
