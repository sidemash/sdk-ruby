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
  class HttpMethod
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def self.get
      HttpMethod.new('GET')
    end

    def self.post
      HttpMethod.new('POST')
    end

    def self.put
      HttpMethod.new('PUT')
    end

    def self.delete
      HttpMethod.new('DELETE')
    end

    def self.patch
      HttpMethod.new('PATCH')
    end

    def self.all_possibles_values
      Set['GET',
          'POST',
          'PUT',
          'DELETE',
          'PATCH']
    end

    def self.from_s(value)
      case value
        when 'GET' then HttpMethod.get
        when 'POST' then HttpMethod.post
        when 'PUT' then HttpMethod.put
        when 'DELETE' then HttpMethod.delete
        when 'PATCH' then HttpMethod.patch
        else nil
      end
    end

    def self.valid?(value)
      HttpMethod.all_possibles_values.include? value
    end

    def not_get?
      @value != 'GET'
    end

    def not_post?
      @value != 'POST'
    end

    def not_put?
      @value != 'PUT'
    end

    def not_delete?
      @value != 'DELETE'
    end

    def not_patch?
      @value != 'PATCH'
    end

    def get?
      @value == 'GET'
    end

    def post?
      @value == 'POST'
    end

    def put?
      @value == 'PUT'
    end

    def delete?
      @value == 'DELETE'
    end

    def patch?
      @value == 'PATCH'
    end

    def to_json(*a)
      @value
    end

    def to_s
      @value
    end
  end
end
