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
  class Timestamp
    attr_reader :seconds

    def initialize(seconds)
      @_type = 'Timestamp'
      @seconds = seconds
    end

    def self._type
      'Timestamp'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      Timestamp.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:seconds] = @seconds
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:seconds] = @seconds
      result
    end

    def self.from_remote(h)
      Timestamp.new(h['seconds'])
    end

    def self.from_hash(h)
      Timestamp.new(h['seconds'])
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      'Timestamp(seconds=' + @seconds + ')'
    end
  end
end
