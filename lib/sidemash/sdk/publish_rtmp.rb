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
  class PublishRtmp
    attr_reader :stream_key_prefix
    attr_reader :ip
    attr_reader :domain

    def initialize(stream_key_prefix, ip, domain)
      @_type = 'PublishRtmp'
      @stream_key_prefix = stream_key_prefix
      @ip = ip
      @domain = domain
    end

    def self._type
      'PublishRtmp'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      PublishRtmp.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:streamKeyPrefix] = @stream_key_prefix
      result[:ip] = @ip.to_remote
      result[:domain] = @domain.to_remote
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:stream_key_prefix] = @stream_key_prefix
      result[:ip] = @ip.to_hash
      result[:domain] = @domain.to_hash
      result
    end

    def self.from_remote(h)
      PublishRtmp.new(h['streamKeyPrefix'],
                      SecureAndNonSecure.from_remote(h['ip']),
                      SecureAndNonSecure.from_remote(h['domain']))
    end

    def self.from_hash(h)
      PublishRtmp.new(h['stream_key_prefix'],
                      SecureAndNonSecure.from_hash(h['ip']),
                      SecureAndNonSecure.from_hash(h['domain']))
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('PublishRtmp(stream_key_prefix=' + @stream_key_prefix +
                   ', ip=' + @ip.to_s +
                   ', domain=' + @domain.to_s + ')')
    end
  end
end
