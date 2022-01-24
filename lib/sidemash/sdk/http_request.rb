
module Sidemash::Sdk
  class HttpRequest
    attr_reader :nonce
    attr_reader :signed_headers
    attr_reader :method
    attr_reader :path
    attr_reader :query_string
    attr_reader :body_hash

    def initialize(signed_headers, method, path, query_string, body_hash)
      now = Time.now
      @nonce = now.to_i + now.usec / 1000
      @signed_headers = signed_headers
      @method = method
      @path = path
      @query_string = query_string
      @body_hash = body_hash
    end

    def to_message
      result = ''
      result += @nonce.to_s
      result += @signed_headers.map { |header_name, header_value| header_name + ':' + header_value }.join('')
      result += @method
      result += @path
      result += !@query_string.nil? ? @query_string : ''
      result += !@body_hash.nil?    ? @body_hash : ''
      result
    end
  end
end