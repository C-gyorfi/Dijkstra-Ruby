# frozen_string_literal: true

require './lib/dijkstra'

describe Dijkstra do
  it 'can be initialized' do
    expect(Dijkstra.new).to be_truthy
  end
end
