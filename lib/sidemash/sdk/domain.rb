module Sidemash::Sdk
  class Domain

    attr_reader :_type
    attr_reader :id
    attr_reader :url
    attr_reader :created_time
    attr_reader :foreign_data
    attr_reader :description
    attr_reader :name
    attr_reader :status

    def initialize(obj)
      @_type = obj['_type']
      @id = obj['id']
      @url = obj['url']
      @created_time = obj['createdTime']
      @foreign_data = obj['foreignData']
      @description = obj['description']
      @name = obj['name']
      @status = obj['status']
    end
  end
end