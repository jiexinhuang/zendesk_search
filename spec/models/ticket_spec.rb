RSpec.describe ZendeskSearch::Ticket do
  subject(:ticket) { ZendeskSearch::Ticket.new(data) }
  let(:data) do
    {
      "_id": "436bf9b0-1147-4c0a-8439-6f79833bff5b",
      "url": "http://initech.zendesk.com/api/v2/tickets/436bf9b0-1147-4c0a-8439-6f79833bff5b.json",
      "external_id": "9210cdc9-4bee-485f-a078-35396cd74063",
      "created_at": "2016-04-28T11:19:34 -10:00",
      "type": "incident",
      "subject": "A Catastrophe in Korea (North)",
      "description": "Nostrud ad sit velit cupidatat laboris ipsum nisi amet laboris ex exercitation amet et proident. Ipsum fugiat aute dolore tempor nostrud velit ipsum.",
      "priority": "high",
      "status": "pending",
      "submitter_id": 38,
      "assignee_id": 24,
      "organization_id": 116,
      "tags": [
        "Ohio",
        "Pennsylvania",
        "American Samoa",
        "Northern Mariana Islands"
      ],
      "has_incidents": false,
      "due_at": "2016-07-31T02:37:50 -10:00",
      "via": "web"
    }
  end

  describe 'given initialized Ticket object' do
    its(:_id) { is_expected.to eq '436bf9b0-1147-4c0a-8439-6f79833bff5b' }
    its(:url) { is_expected.to eq "http://initech.zendesk.com/api/v2/tickets/436bf9b0-1147-4c0a-8439-6f79833bff5b.json" }
    its(:external_id) { is_expected.to eq "9210cdc9-4bee-485f-a078-35396cd74063" }
    its(:created_at) { is_expected.to eq Time.parse("2016-04-28T11:19:34 -10:00") }
    its(:type) { is_expected.to eq "incident" }
    its(:subject) { is_expected.to eq "A Catastrophe in Korea (North)" }
    its(:description) { is_expected.to eq "Nostrud ad sit velit cupidatat laboris ipsum nisi amet laboris ex exercitation amet et proident. Ipsum fugiat aute dolore tempor nostrud velit ipsum." }
    its(:priority) { is_expected.to eq "high" }
    its(:status) { is_expected.to eq "pending" }
    its(:submitter_id) { is_expected.to eq 38 }
    its(:assignee_id) { is_expected.to eq 24 }
    its(:organization_id) { is_expected.to eq 116 }
    its(:tags) { is_expected.to eq ["Ohio", "Pennsylvania", "American Samoa", "Northern Mariana Islands"] }
    its(:has_incidents) { is_expected.to eq false }
    its(:due_at) { is_expected.to eq Time.parse("2016-07-31T02:37:50 -10:00") }
    its(:via) { is_expected.to eq "web" }
  end
end
