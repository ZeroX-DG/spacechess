import * as THREE from 'three'
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader.js'

class Piece
  constructor: (@model) ->
  generateMesh: () ->
    loader = new STLLoader()
    new Promise (resolve) =>
      loader.load @model, (geometry) =>
        material = new THREE.MeshPhongMaterial {
          color: @color
          specular: 0x555555
          shininess: 20
        }
        @mesh = new THREE.Mesh geometry, material
        @mesh.position.set (-76 + @y * 22.3), -13, 76 - @x * 22.3
        @mesh.rotation.set (-Math.PI / 2), 0, (Math.PI/ 2)
        @mesh.scale.set 0.5, 0.5, 0.5
        resolve(@mesh)

export default Piece
