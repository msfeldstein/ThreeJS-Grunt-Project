setup (scene) ->
  r = () ->
    Math.random() * -200 + 100
  for i in [0..100]
    boid = new Boid
    boid.position.set(r(), r(), 0)
    boid.velocity.set(r() / 1000, r() / 1000, 0)
    scene.add(boid)

render (scene) ->
  Boid.updateAll()