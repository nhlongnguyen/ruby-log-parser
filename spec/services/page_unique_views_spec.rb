require 'spec_helper'
require './app/services/page_unique_views'

RSpec.describe PageUniqueViews do
  let(:filepath) { './spec/fixtures/test.log' }
  subject { described_class.new(filepath) }

  describe '#call' do
    it 'returns sorted unique page views per page' do
      expect(subject.call).to eq(
        '/b/a' => 2,
        '/a/b' => 1
      )
    end
  end
end
