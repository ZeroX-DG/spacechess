import Piece from './piece'
import KnightModel from '../../assets/pieces/knight.stl'

class Knight extends Piece
  constructor: (@color, @x, @y) ->
    super(KnightModel)
  
export default Knight
