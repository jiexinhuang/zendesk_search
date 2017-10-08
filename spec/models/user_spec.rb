RSpec.describe ZendeskSearch::User do
  subject(:user) { ZendeskSearch::User.new(data) }
  let(:data) do
    {
      name: 'John Doe',
    }
  end

  its(:name) { is_expected.to eq 'John Doe' }
end
