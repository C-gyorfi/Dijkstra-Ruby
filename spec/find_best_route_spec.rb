# frozen_string_literal: true

require './lib/find_best_route'

describe FindBestRoute do
  it 'exists' do
    expect(FindBestRoute).to be_truthy
  end

  it 'can handle when the start or destination is nil' do
    node = Node.new(name: 'Dummy')
    expect(FindBestRoute.execute(start: nil, destination: nil)).to eq({ route: [], cost: nil })
    expect(FindBestRoute.execute(start: nil, destination: node)).to eq({ route: [], cost: nil })
    expect(FindBestRoute.execute(start: node, destination: nil)).to eq({ route: [], cost: nil })
  end

  it 'returns the route and the cost when both start and destination present' do
    a = Node.new('A')
    b = Node.new('B')
    a.targets << { target: b, cost: 1 }
    expect(FindBestRoute.execute(start: a, destination: b)).to eq({ route: %w[A B], cost: 1 })
  end

  it 'can return the cost between 3 nodes' do
    a = Node.new('A')
    b = Node.new('B')
    c = Node.new('C')
    a.targets << { target: b, cost: 1 }
    b.targets << { target: c, cost: 1 }
    expect(FindBestRoute.execute(start: a, destination: c)).to eq({ route: %w[A B C], cost: 2 })
  end

  it 'can return the cost between 4 nodes' do
    a = Node.new('A')
    b = Node.new('B')
    c = Node.new('C')
    d = Node.new('D')
    a.targets << { target: b, cost: 1 }
    b.targets << { target: c, cost: 1 }
    c.targets << { target: d, cost: 2 }
    expect(FindBestRoute.execute(start: a, destination: d)).to eq({ route: %w[A B C D], cost: 4 })
  end
end
