import Foundation

struct Point {
    var x = 0, y = 0
}

enum ParseError:Error {
    case WrongRotation
}

enum Direction: Int {
    case North = 1
    case East
    case South
    case West
}

enum Rotation: Int {
    case L = -1
    case R = 1
}

class PathFinder {
    
    var currentDirection: Direction = .North
    var path : [String]
    var degrees = 0
    var positions = [Point]()
    var trail = [Point]()
    
    init(pathArray: [String]) {
        path = pathArray
    }
    
    func updateDirection(turnRotation: String) throws -> Direction {
        
        guard turnRotation == "R" || turnRotation == "L" else {
            throw ParseError.WrongRotation
        }
        
        let turnValue = (turnRotation == "R") ? Rotation.R.rawValue : Rotation.L.rawValue
        var newDirectionValue = currentDirection.rawValue + turnValue
        
        if newDirectionValue >= Direction.West.rawValue + 1 {
            newDirectionValue = Direction.North.rawValue
        } else if newDirectionValue <= Direction.North.rawValue - 1 {
            newDirectionValue = Direction.West.rawValue
        }
        
        currentDirection = Direction(rawValue: newDirectionValue)!
        
        return (currentDirection)
    }
    
    func calculateDistance() -> (numberOfSteps: Int, firstCircleSteps: Int) {
        
        var xSteps = 0
        var ySteps = 0
        var circleSteps = 0
        var allSteps = [Int]()
        var previousPoint: Point
        
        
        for (index, segment) in path.enumerated() {
            
            var steps = segment
            let turnValue = steps.remove(at: steps.startIndex)
        
            let directionAndDegrees = try! updateDirection(turnRotation: String(turnValue))
            
            switch directionAndDegrees {
            case .North:
                ySteps += Int(steps)!
                break
            case .East:
                xSteps += Int(steps)!
                break
            case .South:
                ySteps -= Int(steps)!
                break
            case .West:
                xSteps -= Int(steps)!
                break
            }
            
            allSteps.append(abs(ySteps) + abs(xSteps))
            
            
            
            let point = Point(x:xSteps, y:ySteps)
            previousPoint = point
            
//            let filtered = positions.filter { $0.x == point.x}.filter { $0.y == point.y}
            let filteredX = positions.filter { $0.x == point.x}
            let filteredY = positions.filter { $0.y == point.y}
            
            if filteredX.count > 0 && filteredY.count > 0 && circleSteps == 0 {
                print("Found it: \(abs(ySteps) + abs(xSteps))")
                print(allSteps)
                circleSteps = allSteps[index]
            }
            
            positions.append(point)
//            print(positions)
        }
        
        let numberOfSteps = abs(ySteps) + abs(xSteps)
        return (numberOfSteps, circleSteps)
    }
    
    // Part II
//    func addTrail(between pointA: Point, pointB: Point) -> [Point] {
//        
//        let diffX = abs(abs(pointA.x) - abs(pointB.x))
//        let diffY = abs(abs(pointA.y) - abs(pointB.y))
//        
//        if diffX > 0 {
//            
//            for i in 0...diffX {
//                let trailPoint = Point(x: i, y: pointA.y)
//                trail.append(trailPoint)
//            }
//            
//        } else {
//            
//            for i in 0...diffY {
//                let trailPoint = Point(x: pointA.x, y: i)
//                trail.append(trailPoint)
//            }
//        }
//        
//        return trail
//    }
    
}
