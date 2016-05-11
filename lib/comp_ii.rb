class Comp_ii

  def initialize

    @four_move = {[1, 5, 7, 8] => 3, [3, 5, 8, 9] => 1, [1, 2, 5, 7] => 9,
                  [3, 2, 5, 9] => 7, [7, 4, 5, 9] => 3, [9, 6, 5, 7] => 1,
                  [1, 4, 5, 3] => 9, [3, 6, 5, 1] => 7, [1, 4, 5, 8] => 9,
                  [3, 6, 5, 8] => 1, [2, 3, 4, 5] => 7, [4, 5, 8, 9] => 3,
                  [2, 5, 4, 7] => 3, [2, 5, 6, 9] => 7, [6, 5, 2, 1] => 9,
                  [6, 5, 8, 7] => 3, [2, 5, 7, 9] => 3, [6, 5, 7, 1] => 9,
                  [8, 5, 1, 3] => 7, [4, 5, 3, 9] => 1}

    @four_move2 = {[1,5,7,8] => 9, [3,5,8,9] => 7, [1,2,5,7] => 3,
                   [3,2,5,9] => 1, [7,4,5,9] => 1, [9,6,5,7] => 3,
                   [1,4,5,3] => 1, [3,6,5,1] => 9, [2,5,7,9] => 1,
                   [6,5,7,1] => 3, [8,5,1,3] => 9, [4,5,3,9] => 7}

    @three_move = {[1, 2, 5] => 8, [1, 4, 5] => 6, [3, 2, 5] => 8,
                   [3, 6, 5] => 4, [9, 6, 5] => 4, [9, 8, 5] => 2,
                   [7, 8, 5] => 2, [7, 4, 5] => 6, [1, 5, 7] => 3,
                   [3, 5, 9] => 1, [1, 2, 4] => 3, [2, 3, 6] => 1,
                   [4, 7, 8] => 1, [6, 9, 8] => 3, [1, 4, 8] => 7,
                   [7, 4, 2] => 1, [2, 5, 7] => 8, [2, 5, 9] => 8,
                   [8, 5, 1] => 2, [8, 5, 3] => 2, [3, 6, 8] => 9,
                   [9, 6, 2] => 3, [4, 5, 3] => 6, [4, 5, 9] => 6,
                   [6, 5, 1] => 4, [6, 5, 7] => 4, [1, 2, 9] => 3,
                   [1, 4, 9] => 7, [3, 2, 7] => 1, [3, 6, 7] => 9,
                   [9, 6, 1] => 3, [9, 8, 1] => 7, [7, 4, 3] => 1,
                   [7, 8, 3] => 9, [2, 5, 4] => 6, [2, 5, 6] => 4,
                   [8, 5, 4] => 2, [8, 5, 6] => 2, [1, 5, 3] => 7,
                   [7, 5, 9] => 1}

    @three_move2 = {[1, 5, 7] => 9, [3, 5, 9] => 7, [1, 2, 4] => 7, [2, 3, 6] => 9,
                    [4, 7, 8] => 9, [6, 9, 8] => 7, [2, 5, 4] => 8, [2, 5, 6] => 8,
                    [8, 5, 4] => 6, [8, 5, 6] => 4, [1, 5, 3] => 9, [7, 5, 9] => 3,
                    [4, 5, 9] => 1, [1, 4, 8] => 6, [7, 4, 5] => 3, [7, 8, 5] => 3}

    @two_move = {[1, 2] => 3, [1, 4] => 7, [1, 5] => 9, [1, 3] => 2, [1, 7] => 4,
                 [1, 9] => 5, [3, 2] => 1, [3, 6] => 9, [3, 5] => 7, [3, 9] => 6,
                 [3, 7] => 5, [7, 4] => 1, [7, 8] => 9, [7, 5] => 3, [7, 9] => 8,
                 [9, 5] => 1, [9, 6] => 3, [9, 8] => 7, [4, 5] => 6, [5, 6] => 4}

    @one_move = {[1] => [2, 4, 5], [2] => [1, 3, 5], [3] => [2, 6, 5], [4] => [1, 7, 5],
                 [5] => [1, 2, 3, 4, 6, 7, 8, 9], [6] => [3, 9, 5], [7] => [4, 8, 5],
                 [8] => [7, 9, 5], [9] => [6, 8, 5]}

  end

  def comp_ii(pl_moves)

    @four_move.each do |key, value|
      if key - pl_moves == []
        return value
      end
    end

    @four_move2.each do |key, value|
      if key - pl_moves == []
        return value
      end
    end

    @three_move.each do |key, value|
      if key - pl_moves == []
        return value
      end
    end

    @three_move2.each do |key, value|
      if key - pl_moves == []
        return value
      end
    end

    @two_move.each do |key, value|
      if key - pl_moves == []
        return value
      end
    end

    @one_move.each do |key, value|

      if key - pl_moves == []
        a = value.sample.to_i
        return a
      end
    end
  end
end
