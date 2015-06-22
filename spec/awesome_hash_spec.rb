require 'spec_helper'
require 'awesome_hash'
require 'byebug'

RSpec.describe Hash do
  let(:hash) { AwesomeHash.new }

  describe '#[]' do
    context 'when a value is stored against a key' do
      before { hash['key'] = 'value' }

      it 'returns the value for the given key' do
        expect(hash['key']).to eq('value')
      end
    end

    context 'when multiple values have different hashes' do
      before do
        hash['first_key'] = 'first_value'
        hash['other_key'] = 'other_value'
      end

      it 'returns the first value for the first key' do
        expect(hash['first_key']).to eq('first_value')
      end

      it 'returns the second value for the second key' do
        expect(hash['other_key']).to eq('other_value')
      end
    end

    context 'when multiple values have the same hash' do
      before do
        hash['first_key'] = 'first_value'
        hash['key_first'] = 'second_value'
      end

      it 'returns the first value for the first key' do
        expect(hash['first_key']).to eq('first_value')
      end

      it 'returns the second value for the second key' do
        expect(hash['key_first']).to eq('second_value')
      end
    end
  end
end
