require 'spec_helper'
require './app/services/page_views'

RSpec.describe PageViews do
  let(:filepath) { './spec/fixtures/test.log' }
  subject { described_class.new(filepath) }

  describe '#call' do
    it 'returns sorted page views per page' do
      expect(subject.call).to eq(
        '/a/b' => 3,
        '/b/a' => 2
      )
    end
  end
end
