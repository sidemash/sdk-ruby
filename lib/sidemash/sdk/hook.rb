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
  class Hook
    def http_call?
      @_type == HttpCall._type
    end

    def ws_call?
      @_type == WsCall._type
    end

    def not_http_call?
      @_type != HttpCall._type
    end

    def not_ws_call?
      @_type != WsCall._type
    end

    def self.from_json(js)
      h = JSON.parse(js)
      Hook.from_hash(h)
    end

    def to_remote
      raise NotImplementedError, 'The implementation lies in the children classes HttpCall, WsCall' 
    end

    def to_hash
      raise NotImplementedError, 'The implementation lies in the children classes HttpCall, WsCall' 
    end

    def self.from_remote(h)
      case h['_type']
        when HookHttpCall._type then HookHttpCall.from_remote(h)
        when HookWsCall._type then HookWsCall.from_remote(h)
        else raise(ArgumentError, "Invalid hash submitted for creating 'Hook'" + " Unexpected '_type' = " + ty)
      end
    end

    def self.from_hash(h)
      case h['_type']
        when HookHttpCall._type then HookHttpCall.from_hash(h)
        when HookWsCall._type then HookWsCall.from_hash(h)
        else raise(ArgumentError, "Invalid hash submitted for creating 'Hook'" + " Unexpected '_type' = " + ty)
      end
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end
  end
end
