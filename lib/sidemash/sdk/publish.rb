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
  class Publish
    attr_reader :rtmp

    def initialize(rtmp)
      @_type = 'Publish'
      @rtmp = rtmp
    end

    def self._type
      'Publish'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      Publish.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:rtmp] = @rtmp.to_remote
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:rtmp] = @rtmp.to_hash
      result
    end

    def self.from_remote(h)
      Publish.new(PublishRtmp.from_remote(h['rtmp']))
    end

    def self.from_hash(h)
      Publish.new(PublishRtmp.from_hash(h['rtmp']))
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      'Publish(rtmp=' + @rtmp.to_s + ')'
    end
  end
end
