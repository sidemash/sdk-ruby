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
  class CreateStreamSquareForm
    attr_reader :is_elastic
    attr_reader :size
    attr_reader :hook
    attr_reader :description
    attr_reader :foreign_data
    attr_reader :play_domain_name
    attr_reader :publish_domain_name

    def initialize(is_elastic,
                   size,
                   hook,
                   description = nil,
                   foreign_data = nil,
                   play_domain_name = nil,
                   publish_domain_name = nil)
      @_type = 'CreateStreamSquareForm'
      @is_elastic = is_elastic
      @size = size
      @hook = hook
      @description = description
      @foreign_data = foreign_data
      @play_domain_name = play_domain_name
      @publish_domain_name = publish_domain_name
    end

    def self._type
      'CreateStreamSquareForm'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      CreateStreamSquareForm.from_hash(h)
    end

    def to_remote
      result = {}
      result[:isElastic] = @is_elastic
      result[:size] = @size.to_s
      result[:hook] = @hook.to_remote
      result[:description] = @description unless @description.nil?
      result[:foreignData] = @foreign_data unless @foreign_data.nil?
      result[:playDomainName] = @play_domain_name unless @play_domain_name.nil?
      result[:publishDomainName] = @publish_domain_name unless @publish_domain_name.nil?
      result
    end

    def to_hash
      result = {}
      result[:is_elastic] = @is_elastic
      result[:size] = @size.to_s
      result[:hook] = @hook.to_hash
      result[:description] = @description unless @description.nil?
      result[:foreign_data] = @foreign_data unless @foreign_data.nil?
      result[:play_domain_name] = @play_domain_name unless @play_domain_name.nil?
      result[:publish_domain_name] = @publish_domain_name unless @publish_domain_name.nil?
      result
    end

    def self.from_remote(h)
      CreateStreamSquareForm.new(h['isElastic'],
                                 StreamSquareSize.from_s(h['size']),
                                 Hook.from_remote(h['hook']),
                                 h['description'].nil? ? h['description'] : nil,
                                 h['foreignData'].nil? ? h['foreignData'] : nil,
                                 h['playDomainName'].nil? ? h['playDomainName'] : nil,
                                 h['publishDomainName'].nil? ? h['publishDomainName'] : nil)
    end

    def self.from_hash(h)
      CreateStreamSquareForm.new(h['is_elastic'],
                                 StreamSquareSize.from_s(h['size']),
                                 Hook.from_hash(h['hook']),
                                 h['description'].nil? ? h['description'] : nil,
                                 h['foreign_data'].nil? ? h['foreign_data'] : nil,
                                 h['play_domain_name'].nil? ? h['play_domain_name'] : nil,
                                 h['publish_domain_name'].nil? ? h['publish_domain_name'] : nil)
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('CreateStreamSquareForm(is_elastic=' + @is_elastic +
                              ', size=' + @size.to_s +
                              ', hook=' + @hook.to_s +
                              ', description=' + @description +
                              ', foreign_data=' + @foreign_data +
                              ', play_domain_name=' + @play_domain_name +
                              ', publish_domain_name=' + @publish_domain_name + ')')
    end
  end
end
