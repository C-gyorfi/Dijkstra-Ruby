# frozen_string_literal: true

class FindBestRoute
  def self.execute(start:, destination:)
    result = { route: [], cost: nil }
    start&.targets&.each do |node|
      result[:route] = [start.name, node[:target].name]
      result[:cost] = node[:cost]
    end
    result
  end
end

class Node
  attr_accessor :name, :targets

  def initialize(name = nil, targets = [])
    @name = name
    @targets = targets
  end
end
