RSpec.describe ZendeskSearch::User do
  subject(:user) { ZendeskSearch::User.new(data) }
  let(:data) do
    {
      "_id": 1,
      "url": "http://initech.zendesk.com/api/v2/users/1.json",
      "external_id": "74341f74-9c79-49d5-9611-87ef9b6eb75f",
      "name": "Francisca Rasmussen",
      "alias": "Miss Coffey",
      "created_at": "2016-04-15T05:19:46 -10:00",
      "active": true,
      "verified": true,
      "shared": false,
      "locale": "en-AU",
      "timezone": "Sri Lanka",
      "last_login_at": "2013-08-04T01:03:27 -10:00",
      "email": "coffeyrasmussen@flotonic.com",
      "phone": "8335-422-718",
      "signature": "Don't Worry Be Happy!",
      "organization_id": 119,
      "tags": [
        "Springville",
        "Sutton",
        "Hartsville/Hartley",
        "Diaperville"
      ],
      "suspended": true,
      "role": "admin",
    }
  end

  describe 'given initialized User object' do
    its(:_id) { is_expected.to eq 1 }
    its(:url) { is_expected.to eq "http://initech.zendesk.com/api/v2/users/1.json" }
    its(:external_id) { is_expected.to eq "74341f74-9c79-49d5-9611-87ef9b6eb75f" }
    its(:name) { is_expected.to eq "Francisca Rasmussen" }
    its(:alias) { is_expected.to eq "Miss Coffey" }
    its(:created_at) { is_expected.to eq Time.parse("2016-04-15T05:19:46 -10:00") }
    its(:active) { is_expected.to eq true }
    its(:verified) { is_expected.to eq true }
    its(:shared) { is_expected.to eq false }
    its(:locale) { is_expected.to eq "en-AU" }
    its(:timezone) { is_expected.to eq "Sri Lanka" }
    its(:last_login_at) { is_expected.to eq Time.parse("2013-08-04T01:03:27 -10:00") }
    its(:email) { is_expected.to eq "coffeyrasmussen@flotonic.com" }
    its(:phone) { is_expected.to eq "8335-422-718" }
    its(:signature) { is_expected.to eq "Don't Worry Be Happy!" }
    its(:organization_id) { is_expected.to eq 119 }
    its(:tags) { is_expected.to eq ["Springville", "Sutton", "Hartsville/Hartley", "Diaperville"] }
    its(:suspended) { is_expected.to eq true }
    its(:role) { is_expected.to eq "admin" }
  end
end
