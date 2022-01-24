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
  class StreamSquareService
    def initialize(auth)
      @_type = 'StreamSquareService'
      @auth = auth
    end

    def create(form)
      remote = Http.post('/' + Http.version + '/stream-squares', form.to_json, "", {}, @auth)
      StreamSquare.from_hash(remote)
    end

    def get(id)
      remote = Http.get('/' + Http.version + '/stream-squares/' + id, "", {}, @auth)
      StreamSquare.from_hash(remote)
    end

    def list(form = nil)
      qs = form.nil? ? ListForm.empty.to_query_string : form.to_query_string
      remote = Http.list('/' + Http.version + '/stream-squares', qs, {}, @auth)
      StreamSquareRestCollection.from_hash(remote)
    end

    def update(form)
      remote = Http.patch('/' + Http.version + '/stream-squares/' + form.id, form.to_json, "", {}, @auth)
      StreamSquare.from_hash(remote)
    end

    def delete(id)
      Http.delete('/' + Http.version + '/stream-squares/' + id, nil, "", {}, @auth)
    end

    def to_s
      'StreamSquareService(auth=' + @auth.to_s + ')'
    end
  end
end
