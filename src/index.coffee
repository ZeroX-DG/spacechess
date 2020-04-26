import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import Board from './board'

scene = new THREE.Scene()
camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 1, 3000)

camera.position.set 200, 200, 0
camera.lookAt 0, 200, 0

renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
renderer.setClearColor 0x786743
document.body.appendChild(renderer.domElement)

board = new Board()

setup = ->
  board.setup(scene, render)
  orbit = new OrbitControls camera, renderer.domElement
  orbit.update()
  orbit.addEventListener 'change', render
  # lights
  topLeftLight = new THREE.DirectionalLight 0xfff8e3, 0.5
  topRightLight = new THREE.DirectionalLight 0xfff8e3, 0.5
  topLeftLight.position.set -50, 100, 0
  topRightLight.position.set 50, 100, 0

  scene.add topRightLight
  scene.add topLeftLight

render = ->
  renderer.render(scene, camera)

setup()
render()
