class CompII
  FOUR_MOVE = {[1, 5, 7, 8] => 3, [3, 5, 8, 9] => 1, [1, 2, 5, 7] => 9,
               [2, 3, 5, 9] => 7, [4, 5, 7, 9] => 3, [5, 6, 7, 9] => 1,
               [1, 3, 4, 5] => 9, [1, 3, 5, 6] => 7, [1, 4, 5, 8] => 9,
               [3, 5, 6, 8] => 1, [2, 3, 4, 5] => 7, [4, 5, 8, 9] => 3,
               [2, 4, 5, 7] => 3, [2, 5, 6, 9] => 7, [1, 2, 5, 6] => 9,
               [5, 6, 7, 8] => 3, [2, 5, 7, 9] => 3, [1, 5, 6, 7] => 9,
               [1, 3, 5, 8] => 7, [3, 4, 5, 9] => 1, [3, 4, 5, 8] => 7,
               [2, 4, 5, 9] => 1, [2, 5, 6, 7] => 3, [1, 5, 6, 8] => 9,
               [1, 3, 4, 8] => 6, [1, 6, 7, 8] => 2, [2, 6, 7, 9] => 1,
               [2, 3, 4, 9] => 8}

  FOUR_MOVE2 = {[1, 5, 7, 8] => 9, [3, 5, 8, 9] => 7, [1, 2, 5, 7] => 3,
                [2, 3, 5, 9] => 1, [4, 5, 7, 9] => 1, [5, 6, 7, 9] => 3,
                [1, 3, 4, 5] => 1, [1, 3, 5, 6] => 9, [2, 5, 7, 9] => 1,
                [1, 5, 6, 7] => 3, [1, 3, 5, 8] => 9, [3, 4, 5, 9] => 7,
                [1, 3 ,4 ,8] => 9, [1, 6, 7, 8] => 3, [2, 6, 7, 9] => 4,
                [2, 3, 4, 9] => 8}

  THREE_MOVE = {[1, 2, 5] => 8, [1, 4, 5] => 6, [2, 3, 5] => 8,
                [3, 5, 6] => 4, [5, 6, 9] => 4, [5, 8, 9] => 2,
                [5, 7, 8] => 2, [4, 5, 7] => 6, [1, 5, 7] => 3,
                [3, 5, 9] => 1, [1, 2, 4] => 3, [2, 3, 6] => 1,
                [4, 7, 8] => 1, [6, 8, 9] => 3, [1, 7, 8] => 4,
                [2, 4, 7] => 1, [2, 5, 7] => 8, [2, 5, 9] => 8,
                [1, 5, 8] => 2, [3, 5, 8] => 2, [3, 6, 8] => 9,
                [2, 6, 9] => 3, [3, 4, 5] => 6, [4, 5, 9] => 1,
                [1, 5, 6] => 4, [5, 6, 7] => 4, [1, 2, 9] => 3,
                [1, 4, 9] => 7, [2, 3, 7] => 1, [3, 6, 7] => 9,
                [1, 6, 9] => 3, [1, 8, 9] => 7, [3, 4, 7] => 1,
                [3, 7, 8] => 9, [2, 4, 5] => 8, [2, 5, 6] => 4,
                [4, 5, 8] => 2, [5, 6, 8] => 2, [1, 3, 5] => 7,
                [5, 7, 9] => 1, [1, 3, 4] => 2, [2, 3, 9] => 6,
                [6, 7, 9] => 8}

  TWO_MOVE = {[1, 2] => 3, [1, 4] => 7, [1, 5] => 9, [1, 3] => 2, [1, 7] => 4,
              [1, 9] => 5, [2, 3] => 1, [3, 6] => 9, [3, 5] => 7, [3, 9] => 6,
              [3, 7] => 5, [4, 7] => 1, [7, 8] => 9, [5, 7] => 3, [7, 9] => 8,
              [5, 9] => 1, [6, 9] => 3, [8, 9] => 7, [4, 5] => 6, [5, 6] => 4,
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
      comp_move = TWO_MOVE[pl_moves.sort]
    when 3
      comp_move = THREE_MOVE[pl_moves.sort]
    when 4
      comp_move = FOUR_MOVE[pl_moves.sort]
        if comp_move == nil
          comp_move = FOUR_MOVE2[pl_moves.sort]
        end
    end

    if @comp_moves.include?(comp_move) || comp_move == nil
      comp_move = ((1..9).to_a - @comp_moves - pl_moves).sample
    end

    @comp_moves.push(comp_move)

    return comp_move
  end
end