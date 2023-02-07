//
//  Walker.swift
//  Memento
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

internal class Walker {

    internal init(current: Coordinate, target: Coordinate) {
        self.current = current
        self.target = target
    }

    internal func walk(with action: String) {
        self.actionList.append(action)

        if action == "UP" {
            self.current.addY(diff: +1)
        } else if action == "RIGHT" {
            self.current.addX(diff: +1)
        } else if action == "DOWN" {
            self.current.addY(diff: -1)
        } else if action == "LEFT" {
            self.current.addX(diff: -1)
        }
    }

    internal func createMemento() -> Memento {
        Memento(coordinate: self.current, actionList: self.actionList)
    }

    internal func restore(with memento: Memento) {
        self.current = memento.coordinate
        self.actionList = memento.actionList
    }

    internal var remainingDistance: Double {
        let xSquare = pow(Double((self.current.x - self.target.x)), 2.0)
        let ySquare = pow(Double((self.current.y - self.target.y)), 2.0)
        return sqrt(Double(xSquare) + Double(ySquare))
    }

    internal var description: String {
        self.actionList.map { "\($0)" }.joined(separator: " ")
    }

    private var current: Coordinate
    private let target: Coordinate
    private var actionList = Array<String>()

}

extension Walker {

    internal class Memento {
        internal init(coordinate: Coordinate, actionList: Array<String>) {
            self.coordinate = coordinate
            self.actionList = actionList
        }

        internal let coordinate: Coordinate
        internal let actionList: Array<String>
    }

}

internal struct Coordinate {

    private(set) var x: Int
    private(set) var y: Int

    internal mutating func addX(diff: Int) {
        self.x += diff
    }

    internal mutating func addY(diff: Int) {
        self.y += diff
    }

}
