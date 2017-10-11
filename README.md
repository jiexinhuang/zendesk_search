### Zendesk Search
Search for matching records from in-memory data models loaded from JSON files

### Features
* Search for records with matching value of given attributes
* Search for records with empty value of given attributes
* Search for records that contains one of specified tags
* Define indexes on frequently queried attributes to improve performance

### Usage
First run `bundle install` to setup app dependencies
Run `bin/zendesk_search` to start the app, then follow CLI prompts.

### Add more data models
* Define a class inherit from `ZendeskSearch::BaseModel`
* Define expected attributes from JSON data file
* Define attributes to index
* Add model class to `MODEL_CLASSES` constant in `lib/zendesk_search.rb`, so the app knows it should load JSON
data file into the model
* Then you can start searching for your new model

```
class Client < ZendeskSearch::BaseModel
  attribute :_id, Types::Coercible::Int.optional
  attribute :name, Types::Coercible::String
  index :_id, :name
end
```

### Run specs
```
bundle exec rspec spec
```
