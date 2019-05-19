module TrailsHelper
  def trail_image(trail)
    return trail.image if trail.image.attached?
    'https://bit.ly/2X0evGc'
  end
end
