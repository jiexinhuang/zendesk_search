RSpec.describe ZendeskSearch::Organization do
  subject(:organization) { ZendeskSearch::Organization.new(data) }
  let(:data) do
    {
      "_id": 101,
      "url": "http://initech.zendesk.com/api/v2/organizations/101.json",
      "external_id": "9270ed79-35eb-4a38-a46f-35725197ea8d",
      "name": "Enthaze",
      "domain_names": [
        "kage.com",
        "ecratic.com",
        "endipin.com",
        "zentix.com"
      ],
      "created_at": "2016-05-21T11:10:28 -10:00",
      "details": "MegaCorp",
      "shared_tickets": false,
      "tags": [
        "Fulton",
        "West",
        "Rodriguez",
        "Farley"
      ]
    }
  end

  describe 'given initialized Organization object' do
    its(:_id) { is_expected.to eq 101 }
    its(:url) { is_expected.to eq "http://initech.zendesk.com/api/v2/organizations/101.json" }
    its(:external_id) { is_expected.to eq "9270ed79-35eb-4a38-a46f-35725197ea8d" }
    its(:name) { is_expected.to eq "Enthaze" }
    its(:domain_names) { is_expected.to eq ["kage.com", "ecratic.com", "endipin.com", "zentix.com"] }
    its(:created_at) { is_expected.to eq Time.parse("2016-05-21T11:10:28 -10:00") }
    its(:details) { is_expected.to eq "MegaCorp" }
    its(:shared_tickets) { is_expected.to eq false }
    its(:tags) { is_expected.to eq ["Fulton", "West", "Rodriguez", "Farley"] }
  end
end
