require 'rspec'

require_relative '../lib/comp_ii'

describe 'Comp_ii' do

  let(:ii) { Comp_ii.new }
  let(:player_move) { [1] }
  let(:player_moves2) { [1, 2, 5] }
  let(:player_moves3) { [1, 4, 8] }

  it 'returned or not move' do

    expect([2, 4, 5]).to include(ii.comp_ii(player_move))

  end

  it 'returned or not move' do

    expect([3, 8]).to include(ii.comp_ii(player_moves2))
    expect([6, 7]).to include(ii.comp_ii(player_moves3))
  end
end