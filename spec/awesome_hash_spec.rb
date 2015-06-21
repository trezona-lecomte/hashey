require 'spec_helper'
require 'awesome_hash'

RSpec.describe Hash do
  let(:hash) { AwesomeHash.new }

  describe '#[]' do
    context 'when a value is stored behind a key' do
      before { hash['my_key'] = 'my_value' }

      it 'returns the value for the given key' do
        expect(hash['my_key']).to eq('my_value')
      end
    end

    context 'when multiple values are stored behind different keys' do
      before do
        hash['my_first_key'] = 'my_first_value'
        hash['my_second_key'] = 'my_second_value'
      end

      it 'returns the first value for the first key' do
        expect(hash['my_first_key']).to eq('my_first_value')
      end

      it 'returns the second value for the second key' do
        expect(hash['my_second_key']).to eq('my_second_value')
      end
    end
  end
end