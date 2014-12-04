class Boid extends THREE.Mesh
  @allBoids: []
  @initialize: () ->
    loader = new THREE.JSONLoader()
    loader.load("raw/boid.json", Boid.loaded)
  @loaded: (geometry, materials) ->
    Boid.geometry = geometry
    Boid.materials = materials
    for boid in Boid.allBoids
      boid.geometry = geometry.clone()

  @updateAll: () ->
    for boid in Boid.allBoids
      boid.update()
  
  constructor: () ->
    super()
    Boid.allBoids.push(@)
    @geometry = Boid.geometry || new THREE.Geometry
    @material = new THREE.MeshLambertMaterial(color: 0xFF0000)
    @velocity = new THREE.Vector3
    @scale.set(10,10,10)

  update: () ->
    @velocity.x += .001
    @lookAt(@position.clone().add(@velocity))
    @position.add(@velocity)

