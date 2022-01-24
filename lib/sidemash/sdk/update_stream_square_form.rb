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
  class UpdateStreamSquareForm
    attr_reader :id

    def initialize(id, remove, set)
      @_type = 'UpdateStreamSquareForm'
      @id     = id
      @remove = remove
      @set    = set
    end

    def self.by_id(id)
      UpdateStreamSquareForm.new(id, Set[], {})
    end

    def remove_description
      remove = @remove | Set['description']
      UpdateStreamSquareForm.new(@id, remove, @set)
    end

    def remove_foreign_data
      remove = @remove | Set['foreignData']
      UpdateStreamSquareForm.new(@id, remove, @set)
    end

    def with_is_elastic(is_elastic)
      s = @set.merge(Hash['isElastic', is_elastic])
      UpdateStreamSquareForm.new(@id, @remove, s)
    end

    def with_size(size)
      s = @set.merge(Hash['size', size.to_s])
      UpdateStreamSquareForm.new(@id, @remove, s)
    end

    def with_hook(hook)
      s = @set.merge(Hash['hook', hook.to_hash])
      UpdateStreamSquareForm.new(@id, @remove, s)
    end

    def with_description(description)
      if description.nil?
        self
      else
        s = @set.merge(Hash['description', description])
        UpdateStreamSquareForm.new(@id, @remove, s)
      end
    end

    def with_foreign_data(foreign_data)
      if foreign_data.nil?
        self
      else
        s = @set.merge(Hash['foreignData', foreign_data])
        UpdateStreamSquareForm.new(@id, @remove, s)
      end
    end

    def to_remote
      to_hash
    end

    def to_hash
      result = {}
      result[:id] = @id
      result[:remove] = @remove
      result[:set] = @set.to_hash
      result
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('UpdateStreamSquareForm(id=' + @id +
                              ', remove=' + @remove.to_s +
                              ', set=' + @set.to_s + ')')
    end
  end
end
