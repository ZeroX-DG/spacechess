import * as THREE from 'three'
import BoardTexture from '../assets/board.png'

class Board
  setup: (render) ->
    texture = new THREE.TextureLoader().load(BoardTexture, render)
    geometry = new THREE.BoxBufferGeometry(200, 2, 200)
    material = new THREE.MeshBasicMaterial({ map: texture })
    @boardBox = new THREE.Mesh(geometry, material)
    @boardBox

export default Board
