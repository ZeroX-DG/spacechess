import Piece from './piece'
import BishopModel from '../../assets/pieces/bishop.stl'

class Bishop extends Piece
  constructor: (@color, @x, @y) ->
    super(BishopModel)
  
export default Bishop
