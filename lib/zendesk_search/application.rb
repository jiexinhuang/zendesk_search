module ZendeskSearch
  class Application
    def initialize(data_file_dir: 'data/', model_classes: ZendeskSearch::MODEL_CLASSES)
      @data_sets = {}
      model_classes.each do |name, klass|
        json_string = File.read("#{data_file_dir}#{name}.json")
        data_set = Utils::DataImporter.import(
          json_string: json_string,
          model_name: name,
          model_class: klass,
        )
        @data_sets[name] = data_set
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
  end
end
