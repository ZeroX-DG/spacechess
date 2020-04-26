import Piece from './piece'
import PawnModel from '../../assets/pieces/pawn.stl'

class Pawn extends Piece
  constructor: (@color, @x, @y) ->
    super(PawnModel)

export default Pawn
