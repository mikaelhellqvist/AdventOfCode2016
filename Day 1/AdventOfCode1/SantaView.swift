import UIKit

class SantaView: UIView {
    var points : [Point]!
    var journeyPoints : [Point] = []
    var index = 0
    var timer: Timer!
    let offset = 100
    
    func startJourney() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.refresh), userInfo: nil, repeats: true);
    }
    
    func refresh() {
        if index < points.count {
            journeyPoints.append(points[index])
            self.setNeedsDisplay()
        } else {
            timer.invalidate()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        for (index,point) in journeyPoints.enumerated() {
            if index == 0 {
                aPath.move(to: CGPoint(x:point.x+offset, y:point.y+offset))
            } else {
                aPath.addLine(to: CGPoint(x:point.x+offset, y:point.y+offset))
            }
        }

        index += 1
        UIColor.red.set()
        aPath.stroke()
    }
}
