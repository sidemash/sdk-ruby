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
  class SecureAndNonSecure
    attr_reader :secure
    attr_reader :non_secure_on80
    attr_reader :non_secure

    def initialize(secure, non_secure_on80, non_secure)
      @_type = 'SecureAndNonSecure'
      @secure = secure
      @non_secure_on80 = non_secure_on80
      @non_secure = non_secure
    end

    def self._type
      'SecureAndNonSecure'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      SecureAndNonSecure.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:secure] = @secure
      result[:nonSecureOn80] = @non_secure_on80
      result[:nonSecure] = @non_secure
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:secure] = @secure
      result[:non_secure_on80] = @non_secure_on80
      result[:non_secure] = @non_secure
      result
    end

    def self.from_remote(h)
      SecureAndNonSecure.new(h['secure'],
                             h['nonSecureOn80'],
                             h['nonSecure'])
    end

    def self.from_hash(h)
      SecureAndNonSecure.new(h['secure'],
                             h['non_secure_on80'],
                             h['non_secure'])
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('SecureAndNonSecure(secure=' + @secure +
                          ', non_secure_on80=' + @non_secure_on80 +
                          ', non_secure=' + @non_secure + ')')
    end
  end
end
