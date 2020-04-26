import Piece from './piece'
import KingModel from '../../assets/pieces/king.stl'

class King extends Piece
  constructor: (@color, @x, @y) ->
    super(KingModel)

export default King
