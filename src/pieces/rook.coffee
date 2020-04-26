import * as THREE from 'three'
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader.js'
import RookModel from '../../assets/pieces/rook.stl'

class Rook
  constructor: (color, cb) ->
    loader = new STLLoader()
    loader.load RookModel, (geometry) ->
      material = new THREE.MeshPhongMaterial {
        color: color
        specular: 0x555555
        shininess: 20
      }
      mesh = new THREE.Mesh geometry, material
      mesh.position.set 0, -13, 0
      mesh.rotation.set (-Math.PI / 2), 0, 0
      mesh.castShadow = true
      mesh.scale.set 0.5, 0.5, 0.5
      cb(mesh)

export default Rook
