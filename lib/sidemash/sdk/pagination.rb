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
  class Pagination
    attr_reader :self_url
    attr_reader :prev_url
    attr_reader :next_url
    attr_reader :started_time
    attr_reader :nb_items_on_this_page
    attr_reader :page
    attr_reader :nb_items_per_page

    def initialize(self_url,
                   prev_url,
                   next_url,
                   started_time,
                   nb_items_on_this_page,
                   page,
                   nb_items_per_page)
      @_type = 'Pagination'
      @self_url = self_url
      @prev_url = prev_url
      @next_url = next_url
      @started_time = started_time
      @nb_items_on_this_page = nb_items_on_this_page
      @page = page
      @nb_items_per_page = nb_items_per_page
    end

    def self._type
      'Pagination'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      Pagination.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:selfUrl] = @self_url
      result[:prevUrl] = @prev_url unless @prev_url.nil?
      result[:nextUrl] = @next_url unless @next_url.nil?
      result[:startedTime] = @started_time.to_remote
      result[:nbItemsOnThisPage] = @nb_items_on_this_page
      result[:page] = @page
      result[:nbItemsPerPage] = @nb_items_per_page
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:self_url] = @self_url
      result[:prev_url] = @prev_url unless @prev_url.nil?
      result[:next_url] = @next_url unless @next_url.nil?
      result[:started_time] = @started_time.to_hash
      result[:nb_items_on_this_page] = @nb_items_on_this_page
      result[:page] = @page
      result[:nb_items_per_page] = @nb_items_per_page
      result
    end

    def self.from_remote(h)
      Pagination.new(h['selfUrl'],
                     h['prevUrl'].nil? ? h['prevUrl'] : nil,
                     h['nextUrl'].nil? ? h['nextUrl'] : nil,
                     UTCDateTime.from_remote(h['startedTime']),
                     h['nbItemsOnThisPage'],
                     h['page'],
                     h['nbItemsPerPage'])
    end

    def self.from_hash(h)
      Pagination.new(h['self_url'],
                     h['prev_url'].nil? ? h['prev_url'] : nil,
                     h['next_url'].nil? ? h['next_url'] : nil,
                     UTCDateTime.from_hash(h['started_time']),
                     h['nb_items_on_this_page'],
                     h['page'],
                     h['nb_items_per_page'])
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('Pagination(self_url=' + @self_url +
                  ', prev_url=' + @prev_url +
                  ', next_url=' + @next_url +
                  ', started_time=' + @started_time.to_s +
                  ', nb_items_on_this_page=' + @nb_items_on_this_page +
                  ', page=' + @page +
                  ', nb_items_per_page=' + @nb_items_per_page + ')')
    end
  end
end
