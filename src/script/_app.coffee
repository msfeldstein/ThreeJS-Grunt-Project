clock = controls = renderer = scene = camera = light = lightSphere = null

setupFunctions = []
renderFunctions = []
setup = (f) ->
  setupFunctions.push(f)
render = (f) ->
  renderFunctions.push(f)

$ ->
  $container = $("#container")
  WIDTH = window.innerWidth
  HEIGHT = window.innerHeight

  renderer = new THREE.WebGLRenderer(antialias: true)
  renderer.shadowMapType = THREE.PCFShadowMap;
  renderer.shadowMapEnabled = true
  renderer.setSize(WIDTH, HEIGHT)

  scene = new THREE.Scene
  
  clock = new THREE.Clock

  Boid.initialize()

  for f in setupFunctions
    f(scene)

  $container.append(renderer.domElement)
  animate()

animate = () ->
  for f in renderFunctions
    f(scene)
  Boid.updateAll()
  renderer.render(scene, camera) 
  requestAnimationFrame animate