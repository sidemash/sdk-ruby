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
  class StreamSquare
    attr_reader :id
    attr_reader :url
    attr_reader :status
    attr_reader :is_elastic
    attr_reader :size
    attr_reader :play_domain_name
    attr_reader :publish_domain_name
    attr_reader :publish
    attr_reader :hook
    attr_reader :description
    attr_reader :foreign_data

    def initialize(id,
                   url,
                   status,
                   is_elastic,
                   size,
                   play_domain_name,
                   publish_domain_name,
                   publish,
                   hook,
                   description,
                   foreign_data)
      @_type = 'StreamSquare'
      @id = id
      @url = url
      @status = status
      @is_elastic = is_elastic
      @size = size
      @play_domain_name = play_domain_name
      @publish_domain_name = publish_domain_name
      @publish = publish
      @hook = hook
      @description = description
      @foreign_data = foreign_data
    end

    def self._type
      'StreamSquare'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      StreamSquare.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:id] = @id
      result[:url] = @url
      result[:status] = @status.to_s
      result[:isElastic] = @is_elastic
      result[:size] = @size.to_s
      result[:playDomainName] = @play_domain_name unless @play_domain_name.nil?
      result[:publishDomainName] = @publish_domain_name unless @publish_domain_name.nil?
      result[:publish] = @publish.to_remote
      result[:hook] = @hook.to_remote
      result[:description] = @description unless @description.nil?
      result[:foreignData] = @foreign_data unless @foreign_data.nil?
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:id] = @id
      result[:url] = @url
      result[:status] = @status.to_s
      result[:is_elastic] = @is_elastic
      result[:size] = @size.to_s
      result[:play_domain_name] = @play_domain_name unless @play_domain_name.nil?
      result[:publish_domain_name] = @publish_domain_name unless @publish_domain_name.nil?
      result[:publish] = @publish.to_hash
      result[:hook] = @hook.to_hash
      result[:description] = @description unless @description.nil?
      result[:foreign_data] = @foreign_data unless @foreign_data.nil?
      result
    end

    def self.from_remote(h)
      StreamSquare.new(h['id'],
                       h['url'],
                       InstanceStatus.from_s(h['status']),
                       h['isElastic'],
                       StreamSquareSize.from_s(h['size']),
                       h['playDomainName'].nil? ? h['playDomainName'] : nil,
                       h['publishDomainName'].nil? ? h['publishDomainName'] : nil,
                       Publish.from_remote(h['publish']),
                       Hook.from_remote(h['hook']),
                       h['description'].nil? ? h['description'] : nil,
                       h['foreignData'].nil? ? h['foreignData'] : nil)
    end

    def self.from_hash(h)
      StreamSquare.new(h['id'],
                       h['url'],
                       InstanceStatus.from_s(h['status']),
                       h['is_elastic'],
                       StreamSquareSize.from_s(h['size']),
                       h['play_domain_name'].nil? ? h['play_domain_name'] : nil,
                       h['publish_domain_name'].nil? ? h['publish_domain_name'] : nil,
                       Publish.from_hash(h['publish']),
                       Hook.from_hash(h['hook']),
                       h['description'].nil? ? h['description'] : nil,
                       h['foreign_data'].nil? ? h['foreign_data'] : nil)
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('StreamSquare(id=' + @id +
                    ', url=' + @url +
                    ', status=' + @status.to_s +
                    ', is_elastic=' + @is_elastic +
                    ', size=' + @size.to_s +
                    ', play_domain_name=' + @play_domain_name +
                    ', publish_domain_name=' + @publish_domain_name +
                    ', publish=' + @publish.to_s +
                    ', hook=' + @hook.to_s +
                    ', description=' + @description +
                    ', foreign_data=' + @foreign_data + ')')
    end
  end
end
