setup (scene) ->
  VIEW_ANGLE = 75
  ASPECT = window.innerWidth / window.innerHeight
  NEAR = 0.1
  FAR = 10000
  camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR)
  camera.position.z = 300
  camera.position.y = 80
  scene.add(camera)
  window.camera = camera