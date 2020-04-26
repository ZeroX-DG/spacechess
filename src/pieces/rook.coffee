import Piece from './piece'
import RookModel from '../../assets/pieces/rook.stl'

class Rook extends Piece
  constructor: (@color, @x, @y) ->
    super(RookModel)

export default Rook
