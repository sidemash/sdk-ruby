

module Sidemash::Sdk
  class HookZoom < Hook
    def initialize()
    end

    def self._type
      'Hook.Zoom'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      HookZoom.from_hash(h)
    end

    def to_remote
      result[:_type] = @_type
    end

    def to_hash
      result[:_type] = @_type
    end

    def self.from_remote(h)
      HookZoom.new()
    end

    def self.from_hash(h)
      HookZoom.new()
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      'HookZoom'
    end
  end
end
