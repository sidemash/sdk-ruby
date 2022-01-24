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
  class UTCDateTime
    attr_reader :iso8601
    attr_reader :timestamp

    def initialize(iso8601, timestamp)
      @_type = 'UTCDateTime'
      @iso8601 = iso8601
      @timestamp = timestamp
    end

    def self._type
      'UTCDateTime'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      UTCDateTime.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:iso8601] = @iso8601
      result[:timestamp] = @timestamp.to_remote
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:iso8601] = @iso8601
      result[:timestamp] = @timestamp.to_hash
      result
    end

    def self.from_remote(h)
      UTCDateTime.new(h['iso8601'],
                      Timestamp.from_remote(h['timestamp']))
    end

    def self.from_hash(h)
      UTCDateTime.new(h['iso8601'],
                      Timestamp.from_hash(h['timestamp']))
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('UTCDateTime(iso8601=' + @iso8601 +
                   ', timestamp=' + @timestamp.to_s + ')')
    end
  end
end
