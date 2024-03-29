require 'dry-types'
require 'dry-struct'
require 'zendesk_search/types'
require 'zendesk_search/models/base_model'
require 'zendesk_search/models/user'
require 'zendesk_search/models/organization'
require 'zendesk_search/models/ticket'
require 'zendesk_search/models/data_set'
require 'zendesk_search/utils/data_importer'
require 'zendesk_search/application'

module ZendeskSearch
  MODEL_CLASSES = {
    users: User,
    organizations: Organization,
    tickets: Ticket,
  }.freeze
end
