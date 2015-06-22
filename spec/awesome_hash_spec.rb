require 'spec_helper'
require 'awesome_hash'
require 'byebug'
require 'faker'

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

    context 'when the entries / buckets is > 0.75' do
      before do
        12.times do
          key_str = Faker::Lorem.characters(10)
          value_str = Faker::Lorem.characters(10)

          hash[key_str] = value_str
        end
      end

      it 'doubles the number of buckets' do
        expect(hash.buckets.size).to eq(16)

        hash['13th key'] = '13th value'

        expect(hash.buckets.size).to eq(32)
      end
    end
  end
end
