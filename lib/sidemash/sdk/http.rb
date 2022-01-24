require 'openssl'
require 'base64'
require 'httparty'

module Sidemash::SDK
  class Http

    def self.post(path:, body:, query_string:, headers:, auth:)
      Http._call(path, 'POST', body, auth, query_string, headers)
    end

    def self.list(path:, query_string:, headers:, auth:)
      Http._call(path,  'GET', nil, auth, query_string, headers)
    end

    def self.get(path:, query_string:, headers:, auth:)
      Http._call(path,  'GET', nil, auth, query_string, headers)
    end

    def self.put(path: , body:, query_string:, headers:, auth:)
      Http._call(path, 'PUT', body, auth, query_string, headers)
    end

    def self.patch(path:, body:, query_string:, headers:, auth:)
      Http._call(path, 'PATCH', body, auth, query_string, headers)
    end

    def self.delete(path:, body:, query_string:, headers:, auth:)
      Http._call(path, 'DELETE', body, auth, query_string, headers)
    end


    private_class_method
    def self.version
      "V1.0"
    end

    private_class_method
    def self._host
      'http://dev-api.sidemash.io'
    end

    private_class_method
    def self._sign(message, private_key)
      signature = OpenSSL::HMAC.digest('sha512', private_key, message)
      Base64.strict_encode64(signature)
    end

    private_class_method
    def self._sha256(message)
      hash = OpenSSL::Digest.digest('sha256', message)
      Base64.strict_encode64(hash)
    end

    private_class_method
    def self._compute_signed_headers(body, headers, auth)
      signed_headers =
          {'Accept' =>  'application/json', 'User-Agent' => 'Sdk Ruby v1.0', 'Authorization': 'Bearer ' + auth.token},
          merge(headers).
              merge(body.nil? ? {} : {'Content-Type' => 'application/json'})
      signed_headers
    end

    private_class_method
    def self._make_request(method, url, body, headers)
      response = nil
      case method
      when 'POST'
        response = HTTParty.post(url, body: body, headers: headers)
      when 'GET'
        response = HTTParty.get(url, body: body, headers: headers)
      when 'PATCH'
        response = HTTParty.patch(url, body: body, headers: headers)
      when 'PUT'
        response = HTTParty.put(url, body: body, headers: headers)
      when 'DELETE'
        response = HTTParty.delete(url, headers: headers)
      else
        raise 'Unsupported HTTP Method: ' + method
      end
      return response
    end


    private_class_method
    def self._call(path, method, body, auth,  query_string, headers)
      body_str = body.nil? ? nil : body.to_json
      url = Http._host + path + query_string
      signed_headers = Http._compute_signed_headers(body, headers.nil? ? {} : headers, auth)
      sdm_request = Sidemash::Sdk::HttpRequest.new(signed_headers,
                                                   method,
                                                   path,
                                                   query_string,
                                                   body_str.nil? ? nil : Http._sha256(body_str))
      h = signed_headers
      h['X-Sdm-SignedHeaders'] = signed_headers.keys.select { |key| key }.join(', ')
      h['X-Sdm-Nonce'] = sdm_request.nonce.to_s
      h['X-Sdm-Signature'] = 'SHA512 ' + Http._sign(sdm_request.to_message, auth.private_key)
      response = Http._make_request(method, url, body_str, h)
      if response.code == 204
        nil
      else
        response_json = JSON.parse(response.body)
        if response.code < 300
          response_json
        else
          raise Sidemash::Sdk::HttpCallError.new(response.code, response_json)
        end
      end
    end
  end
end
