import Foundation

class Weak<T: AnyObject> {

  // MARK: Lifecycle

  init(_ instance: T) {
    self.instance = instance
  }

  // MARK: Internal

  weak var instance: T?
}
