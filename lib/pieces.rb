require_relative './coordinate'
require_relative './piece'

module Pieces
  module ValidMoves
    one_step_forward = ->(current_position, proposed_position) { current_position.add(Coordinate.new(0, 1)).eql?(proposed_position) }
    PAWN = [one_step_forward]

    vertical = ->(current_position, proposed_position) { current_position.y_coordinate == proposed_position.y_coordinate }
    horizontal = ->(current_position, proposed_position) { current_position.x_coordinate == proposed_position.x_coordinate }
    ROOK = [vertical, horizontal]

    two_half_one_up_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-2, 1)).eql?(proposed_position) }
    two_half_two_up_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-1, 2)).eql?(proposed_position) }
    two_half_one_up_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(2, 1)).eql?(proposed_position) }
    two_half_two_up_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(1, 2)).eql?(proposed_position) }
    two_half_one_down_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-2, -1)).eql?(proposed_position) }
    two_half_two_down_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-1, -2)).eql?(proposed_position) }
    two_half_one_down_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(2, -1)).eql?(proposed_position) }
    two_half_two_down_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(1, -2)).eql?(proposed_position) }
    KNIGHT = [two_half_one_up_left,
              two_half_two_up_left,
              two_half_one_up_right,
              two_half_two_up_right,
              two_half_one_down_left,
              two_half_two_down_left,
              two_half_one_down_right,
              two_half_two_down_right]

    left_diagonal = ->(current_position, proposed_position) do
      result = current_position.subtract(proposed_position)
      result.x_coordinate.abs == result.y_coordinate.abs
    end
    right_diagonal = ->(current_position, proposed_position) do
      result = current_position.subtract(proposed_position)
      result.x_coordinate == result.y_coordinate
    end
    BISHOP = [left_diagonal, right_diagonal]

    one_step_backward = ->(current_position, proposed_position) { current_position.add(Coordinate.new(0, -1)).eql?(proposed_position) }
    one_step_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-1, 0)).eql?(proposed_position) }
    one_step_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(1, 0)).eql?(proposed_position) }
    one_step_right_diagonal_up  = ->(current_position, proposed_position) { current_position.add(Coordinate.new(1, 1)).eql?(proposed_position) }
    one_step_right_diagonal_down  = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-1, -1)).eql?(proposed_position) }
    one_step_left_diagonal_up  = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-1, 1)).eql?(proposed_position) }
    one_step_left_diagonal_down  = ->(current_position, proposed_position) { current_position.add(Coordinate.new(1, -1)).eql?(proposed_position) }
    KING = [
        one_step_forward,
        one_step_backward,
        one_step_right,
        one_step_left,
        one_step_right_diagonal_up,
        one_step_right_diagonal_down,
        one_step_left_diagonal_up,
        one_step_left_diagonal_down
    ]

    QUEEN = [
        left_diagonal,
        right_diagonal,
        vertical,
        horizontal
    ]
  end

  def self.create_pawn(position, set)
    Piece.new("pawn", position, set, ValidMoves::PAWN)
  end

  def self.create_rook(position, set)
    Piece.new("rook", position, set, ValidMoves::ROOK)
  end

  def self.create_knight(position, set)
    Piece.new("knight", position, set, ValidMoves::KNIGHT)
  end

  def self.create_bishop(position, set)
    Piece.new("bishop", position, set, ValidMoves::BISHOP)
  end

  def self.create_king(position, set)
    Piece.new("king", position, set, ValidMoves::KING)
  end

  def self.create_queen(position, set)
    Piece.new("queen", position, set, ValidMoves::QUEEN)
  end

  white_pawns = (0...8).map { |ind| Pieces.create_pawn(Coordinate.new(ind, 6), Piece::Set::WHITE) }
  black_pawns = (0...8).map { |ind| Pieces.create_pawn(Coordinate.new(ind, 1), Piece::Set::BLACK) }

  black_leads = [
      Pieces.create_rook(Coordinate.new(0, 0), Piece::Set::BLACK),
      Pieces.create_rook(Coordinate.new(7, 0), Piece::Set::BLACK),
      Pieces.create_knight(Coordinate.new(1, 0), Piece::Set::BLACK),
      Pieces.create_knight(Coordinate.new(6, 0), Piece::Set::BLACK),
      Pieces.create_bishop(Coordinate.new(2, 0), Piece::Set::BLACK),
      Pieces.create_bishop(Coordinate.new(5, 0), Piece::Set::BLACK),
      Pieces.create_queen(Coordinate.new(3, 0), Piece::Set::BLACK),
      Pieces.create_king(Coordinate.new(4, 0), Piece::Set::BLACK),
  ]
  white_leads = [
      Pieces.create_rook(Coordinate.new(0, 7), Piece::Set::WHITE),
      Pieces.create_rook(Coordinate.new(7, 7), Piece::Set::WHITE),
      Pieces.create_knight(Coordinate.new(1, 7), Piece::Set::WHITE),
      Pieces.create_knight(Coordinate.new(6, 7), Piece::Set::WHITE),
      Pieces.create_bishop(Coordinate.new(2, 7), Piece::Set::WHITE),
      Pieces.create_bishop(Coordinate.new(5, 7), Piece::Set::WHITE),
      Pieces.create_queen(Coordinate.new(3, 7), Piece::Set::WHITE),
      Pieces.create_king(Coordinate.new(4, 7), Piece::Set::WHITE),
  ]

  INITIAL_SEED = [
      white_pawns,
      black_pawns,
      white_leads,
      black_leads
  ].flatten

end