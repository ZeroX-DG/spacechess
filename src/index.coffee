import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import Board from './board'

scene = new THREE.Scene()
camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 1, 3000)

camera.position.set 200, 200, 0
camera.lookAt 0, 200, 0

renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
document.body.appendChild(renderer.domElement)

board = new Board()

setup = ->
  boardBox = board.setup(render)
  orbit = new OrbitControls camera, renderer.domElement
  orbit.update()
  orbit.addEventListener 'change', render
  scene.add boardBox

render = ->
  renderer.render(scene, camera)

setup()
render()
