import * as THREE from 'three'
import BoardTexture from '../assets/board.png'
import Rook from './pieces/rook'

class Board
  setup: (scene, render) ->
    # board
    texture = new THREE.TextureLoader().load(BoardTexture, render)
    geometry = new THREE.BoxBufferGeometry(200, 2, 200)
    material = new THREE.MeshPhongMaterial({ map: texture, shininess: 30 })
    @boardBox = new THREE.Mesh(geometry, material)
    scene.add @boardBox

    # pieces
    new Rook 0x282828, (rookPiece) ->
      scene.add rookPiece
      render()

export default Board
