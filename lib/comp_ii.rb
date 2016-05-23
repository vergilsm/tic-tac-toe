class CompII
  FOUR_MOVE = {[1, 5, 7, 8] => 3, [3, 5, 8, 9] => 1, [1, 2, 5, 7] => 9,
               [3, 2, 5, 9] => 7, [7, 4, 5, 9] => 3, [9, 6, 5, 7] => 1,
               [1, 4, 5, 3] => 9, [3, 6, 5, 1] => 7, [1, 4, 5, 8] => 9,
               [3, 6, 5, 8] => 1, [2, 3, 4, 5] => 7, [4, 5, 8, 9] => 3,
               [2, 5, 4, 7] => 3, [2, 5, 6, 9] => 7, [6, 5, 2, 1] => 9,
               [6, 5, 8, 7] => 3, [2, 5, 7, 9] => 3, [6, 5, 7, 1] => 9,
               [8, 5, 1, 3] => 7, [4, 5, 3, 9] => 1, [3, 4, 5, 8] => 7,
               [2, 4, 5, 9] => 1, [2, 5, 6, 7] => 3, [1, 5, 6, 8] => 9}

  THREE_MOVE = {[1, 2, 5] => 8, [1, 4, 5] => 6, [3, 2, 5] => 8,
                [3, 6, 5] => 4, [9, 6, 5] => 4, [9, 8, 5] => 2,
                [7, 8, 5] => 2, [7, 4, 5] => 6, [1, 5, 7] => 3,
                [3, 5, 9] => 1, [1, 2, 4] => 3, [2, 3, 6] => 1,
                [4, 7, 8] => 1, [6, 9, 8] => 3, [7, 8, 1] => 4,
                [7, 4, 2] => 1, [2, 5, 7] => 8, [2, 5, 9] => 8,
                [8, 5, 1] => 2, [8, 5, 3] => 2, [3, 6, 8] => 9,
                [9, 6, 2] => 3, [4, 5, 3] => 6, [4, 5, 9] => 1,
                [6, 5, 1] => 4, [6, 5, 7] => 4, [1, 2, 9] => 3,
                [1, 4, 9] => 7, [3, 2, 7] => 1, [3, 6, 7] => 9,
                [9, 6, 1] => 3, [9, 8, 1] => 7, [7, 4, 3] => 1,
                [7, 8, 3] => 9, [2, 5, 4] => 8, [2, 5, 6] => 4,
                [8, 5, 4] => 2, [8, 5, 6] => 2, [1, 5, 3] => 7,
                [7, 5, 9] => 1, [1, 4, 3] => 2, [2, 3, 9] => 6,
                [6, 9, 7] => 8}

  TWO_MOVE = {[1, 2] => 3, [1, 4] => 7, [1, 5] => 9, [1, 3] => 2, [1, 7] => 4,
              [1, 9] => 5, [3, 2] => 1, [3, 6] => 9, [3, 5] => 7, [3, 9] => 6,
              [3, 7] => 5, [7, 4] => 1, [7, 8] => 9, [7, 5] => 3, [7, 9] => 8,
              [9, 5] => 1, [9, 6] => 3, [9, 8] => 7, [4, 5] => 6, [5, 6] => 4,
              [2, 5] => 8, [5, 8] => 2}

  ONE_MOVE = {[1] => [2, 4, 5], [2] => [1, 3, 5], [3] => [2, 6, 5], [4] => [1, 7, 5],
              [5] => [1, 2, 3, 4, 6, 7, 8, 9], [6] => [3, 9, 5], [7] => [4, 8, 5],
              [8] => [7, 9, 5], [9] => [6, 8, 5]}


  def comp_move(pl_moves)
    @comp_moves ||= []

    comp_move = nil

    case pl_moves.size
    when 1
      comp_move = ONE_MOVE[pl_moves].sample
    when 2
      TWO_MOVE.each do |possible_pl_moves, possible_comp_moves|
        if possible_pl_moves - pl_moves == []
          comp_move = possible_comp_moves
        end
      end
    when 3
      THREE_MOVE.each do |possible_pl_moves, possible_comp_moves|
        if possible_pl_moves - pl_moves == []
          comp_move = possible_comp_moves
        end
      end
    when 4
      FOUR_MOVE.each do |possible_pl_moves, possible_comp_moves|
        if possible_pl_moves - pl_moves == []
          comp_move = possible_comp_moves
        end
      end
    end


    if @comp_moves.include?(comp_move)
      comp_move = ((1..9).to_a - @comp_moves - pl_moves).sample
    end

    @comp_moves << comp_move

    return comp_move
  end
end