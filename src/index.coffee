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
  board.setup(scene, render)
  orbit = new OrbitControls camera, renderer.domElement
  orbit.update()
  orbit.addEventListener 'change', render
  # lights
  topLight = new THREE.DirectionalLight 0xfff8e3, 1
  bottomLeftLight = new THREE.DirectionalLight 0xfff8e3
  bottomRightLight = new THREE.DirectionalLight 0xfff8e3
  bottomFrontLight = new THREE.DirectionalLight 0xfff8e3
  bottomBackLight = new THREE.DirectionalLight 0xfff8e3

  bottomLeftLight.position.set 0, -100, 50
  bottomRightLight.position.set 0, -100, -50
  bottomFrontLight.position.set 50, -100, 0
  bottomBackLight.position.set -50, -100, 0

  scene.add topLight
  scene.add bottomLeftLight
  scene.add bottomRightLight
  scene.add bottomFrontLight
  scene.add bottomBackLight

render = ->
  renderer.render(scene, camera)

setup()
render()
