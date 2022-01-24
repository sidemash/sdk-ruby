=begin
   Copyright © 2020 Sidemash Cloud Services

   Licensed under the Apache  License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless  required  by  applicable  law  or  agreed to in writing,
   software  distributed  under  the  License  is distributed on an
   "AS IS"  BASIS, WITHOUT  WARRANTIES  OR CONDITIONS OF  ANY KIND,
   either  express  or  implied.  See the License for the  specific
   language governing permissions and limitations under the License.
=end




module Sidemash::Sdk
  class Auth
    attr_reader :token
    attr_reader :secret_key

    def initialize(token, secret_key)
      @_type = 'Auth'
      @token = token
      @secret_key = secret_key
    end

    def self._type
      'Auth'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      Auth.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:token] = @token
      result[:secretKey] = @secret_key
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:token] = @token
      result[:secret_key] = @secret_key
      result
    end

    def self.from_remote(h)
      Auth.new(h['token'],
               h['secretKey'])
    end

    def self.from_hash(h)
      Auth.new(h['token'],
               h['secret_key'])
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('Auth(token=' + @token +
            ', secret_key=******' +  ')')
    end
  end
end
