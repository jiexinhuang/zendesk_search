require 'tty-prompt'

module ZendeskSearch
  class Application
    def initialize(data_file_dir: 'data/', model_classes: ZendeskSearch::MODEL_CLASSES)
      @data_sets = {}
      @model_classes = model_classes
      @model_classes.each do |name, klass|
        json_string = File.read("#{data_file_dir}#{name}.json")
        data_set = Utils::DataImporter.import(
          json_string: json_string,
          model_name: name,
          model_class: klass,
        )
        @data_sets[name] = data_set
      end
    end

    def run
      while(true) do
        # Select model to query
        model_name = prompt.select("Choose the model to query", @data_sets.keys)
        model_class = @model_classes[model_name]
        attribute_names = model_class.attribute_names

        # Now allow user to multi select attributes to search for
        selected_attributes = prompt.multi_select("Select attributes to search on #{model_name}", attribute_names, per_page: attribute_names.size)

        # Capture values to search for selected attributes
        query_hash = {}
        selected_attributes.each do |attr|
          search_value = prompt.ask("Please enter search value for #{attr}")
          query_hash[attr] = search_value
        end

        # Now use search params to get result
        results = search(model_name, query_hash)
        if results.empty?
          puts 'not result found'
        else
          results.each do |row|
            puts row.to_h
          end
        end
      end
    end

    def search(model_name, query_hash)
      data_set = get_data_set(model_name)
      result = data_set.search(query_hash)
    end

    private

    def get_data_set(model_name)
      @data_sets[model_name]
    end

    def prompt
      @prompt ||= TTY::Prompt.new
    end
  end
end
