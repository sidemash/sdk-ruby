
module Sidemash::Sdk
  class HttpCallError < StandardError
    attr_reader :status_code
    attr_reader :body

    def initialize(status_code, body)
      super(JSON.pretty_generate(body))
      @status_code = status_code
      @body = body
    end
  end
end