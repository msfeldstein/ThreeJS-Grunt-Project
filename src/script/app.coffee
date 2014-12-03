renderer = scene = camera = null
$ ->
  $container = $("#container")
  WIDTH = window.innerWidth
  HEIGHT = window.innerHeight

  VIEW_ANGLE = 75
  ASPECT = WIDTH / HEIGHT
  NEAR = 0.1
  FAR = 10000

  renderer = new THREE.WebGLRenderer()
  camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR)
  scene = new THREE.Scene

  scene.add(camera)
  camera.position.z = 300
  renderer.setSize(WIDTH, HEIGHT)

  geometry = new THREE.SphereGeometry(50, 16, 16)
  material = new THREE.MeshLambertMaterial({color: 0xCC0000})
  sphere = new THREE.Mesh(geometry, material)
  scene.add(sphere)
  
  light = new THREE.PointLight(0xFFFFFF)
  light.position.x = 10
  light.position.y = 50
  light.position.z = 130
  scene.add(light)


  $container.append(renderer.domElement)
  animate()



animate = () ->
  renderer.render(scene, camera) 
  requestAnimationFrame animate