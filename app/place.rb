class Place
  def initialize(lat, long, name, link)
    @name = name
    @coordinate = CLLocationCoordinate2D.new
    @coordinate.latitude = lat
    @coordinate.longitude = long
    @url = NSURL.alloc.initWithString(link)
  end

  def title; @name; end
  def coordinate; @coordinate; end
  def url; @url; end

  All = [
    Place.new(34.750155, -86.664172, 'Burger King', 'http://en.wikipedia.org/wiki/Burger_King'),
    Place.new(34.740155, -86.664172, 'Starbucks', 'http://en.wikipedia.org/wiki/Starbucks')
  ]
end
