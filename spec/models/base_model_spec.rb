class TestModel < ZendeskSearch::BaseModel
  attribute :_id,       ZendeskSearch::Types::Coercible::Int.optional
  attribute :name,      ZendeskSearch::Types::Coercible::String
  attribute :disabled,  ZendeskSearch::Types::Form::Bool
  attribute :tags,      ZendeskSearch::Types::Coercible::Array
end

RSpec.describe ZendeskSearch::BaseModel do
  subject(:test_model) { TestModel.new(data) }
  let(:data) do
    {
      _id: id,
      name: name,
      disabled: disabled,
      tags: tags,
    }
  end
  let(:id) { 10 }
  let(:name) { 'Ronaldo' }
  let(:disabled) { false }
  let(:tags) { ['portuguese', 'footballer', 'forward', 'Real Marid'] }

  describe '#match?' do
    subject(:match) { test_model.match?(query_hash) }

    context 'when query for id' do
      context 'and provides the right id(integer attribute)' do
        let(:query_hash) { { _id: id } }
        it { is_expected.to eq true }
      end

      context 'and provides a wrong id' do
        let(:query_hash) { { _id: 11 } }
        it { is_expected.to eq false }
      end
      
      context 'and id from data is nil' do
        let(:id) { nil }

        context 'and provides nil value' do
          let(:query_hash) { { _id: nil } }
          it { is_expected.to eq true }
        end
      end
    end

    context 'when query for name' do
      context 'when provides the right name(string attribute)' do
        let(:query_hash) { { name: name } }
        it { is_expected.to eq true }
      end

      context 'when name from data is empty string' do
        let(:name) { '' }

        context 'and provides nil value' do
          let(:query_hash) { { name: nil } }
          it { is_expected.to eq true }
        end

        context 'and provides empty string' do
          let(:query_hash) { { name: '' } }
          it { is_expected.to eq true }
        end
      end

      context 'when name from data is nil' do
        let(:name) { nil }

        context 'and provides nil value' do
          let(:query_hash) { { name: nil } }
          it { is_expected.to eq true }
        end

        context 'and provides empty string' do
          let(:query_hash) { { name: '' } }
          it { is_expected.to eq true }
        end
      end
    end

    context 'when query for tags' do
      context 'and one right tag is provided' do
        let(:query_hash) { { tags: 'portuguese' } }
        it { is_expected.to eq true }
      end

      context 'and one right tag is provided in array' do
        let(:query_hash) { { tags: ['forward'] } }
        it { is_expected.to eq true }
      end

      context 'and one right tag and a wrong tag are provided in array' do
        let(:query_hash) { { tags: ['portuguese', 'Barcelona'] } }
        it { is_expected.to eq true }
      end

      context 'and a wrong tag is provided' do
        let(:query_hash) { { tags: ['spanish'] } }
        it { is_expected.to eq false }
      end
    end

    context 'when query for disabled state' do
      context 'and provides the right boolean state' do
        let(:query_hash) { { disabled: disabled} }
        it { is_expected.to eq true }
      end

      context 'and provides the wrong boolean state' do
        let(:query_hash) { { disabled: true } }
        it { is_expected.to eq false }
      end
    end

    context 'when query for both id and name' do
      context 'and provides the right values' do
        let(:query_hash) { { _id: id, name: name } }
        it { is_expected.to eq true }
      end

      context 'and provides the wrong id' do
        let(:query_hash) { { _id: 11, name: name } }
        it { is_expected.to eq false }
      end

      context 'and provides the wrong name' do
        let(:query_hash) { { _id: id, name: 'Messi' } }
        it { is_expected.to eq false }
      end
    end
  end
end
