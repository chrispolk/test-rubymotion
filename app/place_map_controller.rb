class PlaceMapController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Map', image:UIImage.imageNamed('map.png'), tag:1)
    end
    self
  end

  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self
  end

  def viewDidLoad
    view.frame = tabBarController.view.bounds

    # Center on Huntsville.
    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(34.75, -86.66), MKCoordinateSpanMake(3.1, 3.1))
    self.view.setRegion(region)

    Place::All.each { |place| self.view.addAnnotation(place) }
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end    

  ViewIdentifier = 'ViewIdentifier'
  def mapView(mapView, viewForAnnotation:place)
    if view = mapView.dequeueReusableAnnotationViewWithIdentifier(ViewIdentifier)
      view.annotation = place
    else
      view = MKPinAnnotationView.alloc.initWithAnnotation(place, reuseIdentifier:ViewIdentifier)
      view.canShowCallout = true
      view.animatesDrop = true
      button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
      button.addTarget(self, action: :'showDetails:', forControlEvents:UIControlEventTouchUpInside)
      view.rightCalloutAccessoryView = button
    end
    return view 
  end

  def showDetails(sender)
    if view.selectedAnnotations.size == 1
      place = view.selectedAnnotations[0]
      controller = UIApplication.sharedApplication.delegate.place_details_controller
      navigationController.pushViewController(controller, animated:true)
      controller.showDetailsForPlace(place)
    end
  end
end
