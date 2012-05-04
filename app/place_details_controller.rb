class PlaceDetailsController < UIViewController
  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end

  def showDetailsForPlace(place)
    navigationItem.title = place.title
    request = NSURLRequest.requestWithURL(place.url)
    view.loadRequest(request)
  end 
end
