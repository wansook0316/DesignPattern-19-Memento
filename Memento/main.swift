//
//  main.swift
//  Memento
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

internal func main() {

    let start = Coordinate(x: 0, y: 0)
    let destination = Coordinate(x: 10, y: 10)

    let walker = Walker(current: start, target: destination)
    let actions = ["UP", "RIGHT", "DOWN", "LEFT"]

    var minDistance = Double.greatestFiniteMagnitude
    var memento: Walker.Memento?

    while true {
        let action = actions[Int.random(in: 0..<actions.count)]

        walker.walk(with: action)

        let remainDistance = walker.remainingDistance
        print(remainDistance)

        if remainDistance == .zero {
            break
        }

        // 거리가 작아지면 저장함
        if minDistance > remainDistance {
            minDistance = remainDistance
            memento = walker.createMemento()
        // 거리가 커지는 경우 이전 상태를 불러옴
        } else if let memento {
            walker.restore(with: memento)
        }
    }

    print("walker's path: \(walker.description)")

}

main()
