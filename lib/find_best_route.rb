# frozen_string_literal: true

class FindBestRoute
  def self.execute(start:, destination:)
    result = { route: [], cost: nil }
    return result if start.nil? || destination.nil?

    result[:route] << start.name
    result = search_nodes(start&.targets, result, destination.name)

    if result[:route][-1] == destination.name
      result
    else
      { route: [], cost: nil }
    end
  end

  def self.search_nodes(nodes, result, destination_name)
    return result if result[:route][-1] == destination_name

    nodes&.each do |node|
      return result if node[:target].nil?

      result[:route] << node[:target].name
      result[:cost].nil? ? result[:cost] = node[:cost] : result[:cost] += node[:cost]
      search_nodes(node[:target].targets, result, destination_name) if node[:target].targets
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
