import * as THREE from 'three'
import BoardTexture from '../assets/board.png'
import Rook from './pieces/rook'
import Knight from './pieces/knight'
import Bishop from './pieces/bishop'
import King from './pieces/king'
import Queen from './pieces/queen'
import Pawn from './pieces/pawn'

class Board
  setup: (scene, render) ->
    # board
    texture = new THREE.TextureLoader().load(BoardTexture, render)
    geometry = new THREE.BoxBufferGeometry(200, 2, 200)
    material = new THREE.MeshPhongMaterial({ map: texture, shininess: 30 })
    @boardBox = new THREE.Mesh(geometry, material)
    scene.add @boardBox

    # generate board
    @board = [
      [[2, 'A'], [3, 'A'], [4, 'A'], [6, 'A'], [5, 'A'], [4, 'A'], [3, 'A'], [2, 'A']]
      [[1, 'A'], [1, 'A'], [1, 'A'], [1, 'A'], [1, 'A'], [1, 'A'], [1, 'A'], [1, 'A']]
      [0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ]
      [0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ]
      [0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ]
      [0       , 0       , 0       , 0       , 0       , 0       , 0       , 0       ]
      [[1, 'B'], [1, 'B'], [1, 'B'], [1, 'B'], [1, 'B'], [1, 'B'], [1, 'B'], [1, 'B']]
      [[2, 'B'], [3, 'B'], [4, 'B'], [6, 'B'], [5, 'B'], [4, 'B'], [3, 'B'], [2, 'B']]
    ]

    @pieces = []

    meshGenerations = []
    for row, y in @board
      for pieceData, x in row
        if pieceData is 0
          continue
        [pieceId, team] = pieceData
        color = if team is 'A' then 0x000 else 0xffffff
        piece = switch pieceId
          when 1 then new Pawn color, x, y
          when 2 then new Rook color, x, y
          when 3 then new Knight color, x, y
          when 4 then new Bishop color, x, y
          when 5 then new Queen color, x, y
          when 6 then new King color, x, y
          else null
        @pieces.push piece
        meshGenerations.push piece.generateMesh()

    Promise.all(meshGenerations).then (meshs) ->
      for mesh in meshs
        scene.add mesh
      render()
export default Board
