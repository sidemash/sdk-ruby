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
  class ListForm
    attr_reader :where
    attr_reader :limit
    attr_reader :order_by

    def initialize(where = nil, limit = nil, order_by = nil)
      @_type = 'ListForm'
      @where = where
      @limit = limit
      @order_by = order_by
    end

    def self._type
      'ListForm'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      ListForm.from_hash(h)
    end

    def to_remote
      result = {}
      result[:where] = @where unless @where.nil?
      result[:limit] = @limit unless @limit.nil?
      result[:orderBy] = @order_by unless @order_by.nil?
      result
    end

    def to_hash
      result = {}
      result[:where] = @where unless @where.nil?
      result[:limit] = @limit unless @limit.nil?
      result[:order_by] = @order_by unless @order_by.nil?
      result
    end

    def self.from_remote(h)
      ListForm.new(h['where'].nil? ? h['where'] : nil,
                   h['limit'].nil? ? h['limit'] : nil,
                   h['orderBy'].nil? ? h['orderBy'] : nil)
    end

    def self.from_hash(h)
      ListForm.new(h['where'].nil? ? h['where'] : nil,
                   h['limit'].nil? ? h['limit'] : nil,
                   h['order_by'].nil? ? h['order_by'] : nil)
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def self.empty
      ListForm.new(nil, nil, nil)
    end

    def to_query_string
      if @where.nil? && @limit.nil? && @order_by.nil?
        ''
      else
        '?' + [
            @where.nil? ? nil : 'where=' + @where,
            @limit.nil? ? nil : 'limit=' + @limit,
            @order_by.nil? ? nil : 'orderBy=' + @order_by].filter(&:nil?).join('&')
      end
    end

    def to_s
      ('ListForm(where=' + @where +
                ', limit=' + @limit +
                ', order_by=' + @order_by + ')')
    end
  end
end
