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
  class InstanceStatus
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def self.initializing
      InstanceStatus.new('Initializing')
    end

    def self.running
      InstanceStatus.new('Running')
    end

    def self.restarting
      InstanceStatus.new('Restarting')
    end

    def self.updating
      InstanceStatus.new('Updating')
    end

    def self.maintaining
      InstanceStatus.new('Maintaining')
    end

    def self.partially_available
      InstanceStatus.new('PartiallyAvailable')
    end

    def self.not_available
      InstanceStatus.new('NotAvailable')
    end

    def self.terminating
      InstanceStatus.new('Terminating')
    end

    def self.terminated
      InstanceStatus.new('Terminated')
    end

    def self.all_possibles_values
      Set['Initializing',
          'Running',
          'Restarting',
          'Updating',
          'Maintaining',
          'PartiallyAvailable',
          'NotAvailable',
          'Terminating',
          'Terminated']
    end

    def self.from_s(value)
      case value
        when 'Initializing' then InstanceStatus.initializing
        when 'Running' then InstanceStatus.running
        when 'Restarting' then InstanceStatus.restarting
        when 'Updating' then InstanceStatus.updating
        when 'Maintaining' then InstanceStatus.maintaining
        when 'PartiallyAvailable' then InstanceStatus.partially_available
        when 'NotAvailable' then InstanceStatus.not_available
        when 'Terminating' then InstanceStatus.terminating
        when 'Terminated' then InstanceStatus.terminated
        else nil
      end
    end

    def self.valid?(value)
      InstanceStatus.all_possibles_values.include? value
    end

    def not_initializing?
      @value != 'Initializing'
    end

    def not_running?
      @value != 'Running'
    end

    def not_restarting?
      @value != 'Restarting'
    end

    def not_updating?
      @value != 'Updating'
    end

    def not_maintaining?
      @value != 'Maintaining'
    end

    def not_partially_available?
      @value != 'PartiallyAvailable'
    end

    def not_not_available?
      @value != 'NotAvailable'
    end

    def not_terminating?
      @value != 'Terminating'
    end

    def not_terminated?
      @value != 'Terminated'
    end

    def initializing?
      @value == 'Initializing'
    end

    def running?
      @value == 'Running'
    end

    def restarting?
      @value == 'Restarting'
    end

    def updating?
      @value == 'Updating'
    end

    def maintaining?
      @value == 'Maintaining'
    end

    def partially_available?
      @value == 'PartiallyAvailable'
    end

    def not_available?
      @value == 'NotAvailable'
    end

    def terminating?
      @value == 'Terminating'
    end

    def terminated?
      @value == 'Terminated'
    end

    def to_json(*a)
      @value
    end

    def to_s
      @value
    end
  end
end
