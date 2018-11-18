//
//  Coordinator.swift
//  ERNiftyExtensions
//
//  Created by Ephraim Russo on 11/18/18.
//

import Foundation

public protocol Coordinating: class {
    
    /**
     The child Coordinators being managed by this Coordinator
     */
    var childCoordinators: [Coordinating] { get }
    
    /**
     Add child coordinator to childCoordinators array
     - parameter coordinator: Coordinator to add.
     */
    func add(childCoordinator coordinator: Coordinating)
    
    /**
     Remove child coordinator to childCoordinators array
     - parameter coordinator: Coordinator to remove.
     */
    func remove(childCoordinator coordinator: Coordinating)
    
    /**
     The start method is where the Coordinator executes its setup logic to manage its UIViewController.
     This should only be called once in the entire lifetime of the Coordinator instance.
     Calling this more than once results in a forced fatalError.
     Must call super.
     */
    func start()
}

/**
 The AbstractCoordinator is an abstract class instantiates and defines all the variables and methods that are common in all
 of its subclasses. Not intended to be instantiated directly.
 */
open class Coordinator: Coordinating {

    public init() {
        
        guard type(of: self) != Coordinator.self else {
            fatalError("AbstractCoordinator instances cannot be created. Use subclasses instead")
        }
    }
    
    // MARK: Stored Properties
    /**
     Instance variable of an array of childCoordinators
     */
    private var _childCoordinators: [Coordinating] = []
    
    /**
     Boolean to trigger a crash if start method is called multiple times in the lifetime of the instance.
     */
    public private(set) var hasStarted: Bool = false
    
    // MARK: Computed Properties
    public var childCoordinators: [Coordinating] { return self._childCoordinators }
    
    // MARK: Instance Methods
    open func start() {
        switch self.hasStarted {
        case true:
            fatalError(
                """
                \(#function) has already been called once in the lifetime of this coordinator.
                \(#function) is only intended to be called once.
                """
            )
            
        case false:
            self.hasStarted = true
        }
    }
    
    public func add(childCoordinator coordinator: Coordinating) {
        self._childCoordinators.append(coordinator)
    }
    
    public func remove(childCoordinator coordinator: Coordinating) {
        self._childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
}
