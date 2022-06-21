import Foundation

class PortalRegistry {
  
  static var _registry: PortalRegistry?
  
  static func create() -> PortalRegistry {
    if (PortalRegistry._registry == nil) {
      PortalRegistry._registry = PortalRegistry()
    }
    return PortalRegistry._registry!
  }
  
  private var destinations = NSMapTable<NSString, PortalDestination>(keyOptions: .strongMemory, valueOptions: .weakMemory)
  private var origins = NSMapTable<NSString, PortalOrigin>(keyOptions: .strongMemory, valueOptions: .weakMemory)
}

// MARK: target

extension PortalRegistry {
  func put(destination: PortalDestination) {
    destinations.setObject(destination, forKey: destination.name)
  }
  
  func get(name: NSString) -> PortalDestination? {
    return destinations.object(forKey: name)
  }
  
  func remove(destination: PortalDestination) {
    destinations.removeObject(forKey: destination.name)
  }
}

// MARK: source

extension PortalRegistry {
  func put(origin: PortalOrigin) {
    origins.setObject(origin, forKey: origin.destination)
  }
  
  func get(destinationName: NSString) -> PortalOrigin? {
    return origins.object(forKey: destinationName)
  }
  
  func remove(origin: PortalOrigin) {
    origins.removeObject(forKey: origin.destination)
  }
}
