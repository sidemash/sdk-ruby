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
  class StreamSquareSize
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def self.s
      StreamSquareSize.new('S')
    end

    def self.m
      StreamSquareSize.new('M')
    end

    def self.l
      StreamSquareSize.new('L')
    end

    def self.xl
      StreamSquareSize.new('XL')
    end

    def self.xxl
      StreamSquareSize.new('XXL')
    end

    def self.all_possibles_values
      Set['S',
          'M',
          'L',
          'XL',
          'XXL']
    end

    def self.from_s(value)
      case value
        when 'S' then StreamSquareSize.s
        when 'M' then StreamSquareSize.m
        when 'L' then StreamSquareSize.l
        when 'XL' then StreamSquareSize.xl
        when 'XXL' then StreamSquareSize.xxl
        else nil
      end
    end

    def self.valid?(value)
      StreamSquareSize.all_possibles_values.include? value
    end

    def not_s?
      @value != 'S'
    end

    def not_m?
      @value != 'M'
    end

    def not_l?
      @value != 'L'
    end

    def not_xl?
      @value != 'XL'
    end

    def not_xxl?
      @value != 'XXL'
    end

    def s?
      @value == 'S'
    end

    def m?
      @value == 'M'
    end

    def l?
      @value == 'L'
    end

    def xl?
      @value == 'XL'
    end

    def xxl?
      @value == 'XXL'
    end

    def to_json(*a)
      @value
    end

    def to_s
      @value
    end
  end
end
