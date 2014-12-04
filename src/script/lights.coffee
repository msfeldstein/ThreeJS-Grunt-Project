setup (scene) ->
  light = new THREE.AmbientLight(0x404040)
  scene.add(light)

  light = new THREE.PointLight(color:0x000000)
  light.distance = 300
  light.position.set(10, 10, 100)
  scene.add(light)

  light = new THREE.PointLight(color:0x000000)
  light.distance = 300
  light.position.set(-50, 30, 0)
  scene.add(light)