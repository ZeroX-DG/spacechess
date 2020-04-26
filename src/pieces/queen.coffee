import Piece from './piece'
import QueenModel from '../../assets/pieces/queen.stl'

class Queen extends Piece
  constructor: (@color, @x, @y) ->
    super(QueenModel)

export default Queen
