# frozen_string_literal: true

require './lib/find_best_route'

describe FindBestRoute do
  it 'exists' do
    expect(FindBestRoute).to be_truthy
  end

  it 'can handle when the start or destination is nil' do
    expect(FindBestRoute.execute(start: nil, destination: nil)).to eq({ route: [], cost: nil })
    expect(FindBestRoute.execute(start: Node.new(name: 'Dummy'), destination: nil)).to eq({ route: [], cost: nil })
  end

  fit 'returns the route and the cost when both start and destination present' do
    a = Node.new('A')
    b = Node.new('B')
    a.targets << { target: b, cost: 1 }
    expect(FindBestRoute.execute(start: a, destination: b)).to eq({ route: %w[A B], cost: 1 })
  end
end
