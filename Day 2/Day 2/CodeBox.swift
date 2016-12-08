import Foundation

enum Direction:Int {
    case U = 1
    case D
    case L
    case R
}

protocol KeyPaddable {
    var k: String {get}
}

struct Key: KeyPaddable {
    internal var k: String
}

extension Key: Equatable {}

func ==(lhs: Key, rhs: Key) -> Bool {
    return lhs.k == rhs.k
}

class CodeBox {
    
    var codeSheet: [[String]]
    var keyPad: [[KeyPaddable]]
    var isSimple: Bool
    
    init(codeSheet: [[String]], isSimple: Bool) {
        self.codeSheet = codeSheet
        self.isSimple = isSimple
        
        if isSimple {
            keyPad = [[Key(k: "1"),Key(k: "2"),Key(k: "3")],
                      [Key(k: "4"),Key(k: "5"),Key(k: "6")],
                      [Key(k: "7"),Key(k: "8"),Key(k: "9")]]
        } else {
            keyPad = [[Key(k: "X"),Key(k: "X"),Key(k: "1"),Key(k: "X"),Key(k: "X")],
                      [Key(k: "X"),Key(k: "2"),Key(k: "3"),Key(k: "4"),Key(k: "X")],
                      [Key(k: "5"),Key(k: "6"),Key(k: "7"),Key(k: "8"),Key(k: "9")],
                      [Key(k: "X"),Key(k: "A"),Key(k: "B"),Key(k: "C"),Key(k: "X")],
                      [Key(k: "X"),Key(k: "X"),Key(k: "D"),Key(k: "X"),Key(k: "X")]]
        }
    }
    
    convenience init() {
        self.init(codeSheet: [[""]], isSimple: true)
    }
    
    func crackCode() -> [KeyPaddable] {
        var code = [KeyPaddable]()
        var row : Int
        var col : Int
        
        if isSimple {
            row = 1
            col = 1
        } else {
            row = 2
            col = 0
        }
        
        
        
        for codeHints in codeSheet {

            if codeHints.count > 0 {
                
                for codeHint in codeHints {
                    
                    let rows = keyPad.count-1
                    let rowColumns = keyPad[row].count-1
                    
                    switch codeHint {
                    case "U":
                        if row > 0 {
                            
                            let tryKey : Key = keyPad[row-1][col] as! Key
                            if tryKey.k != "X" {
                                row -= 1
                            }
                            
                        }
                    case "D":
                        if row < rows {
                            let tryKey : Key = keyPad[row+1][col] as! Key
                            if tryKey.k != "X" {
                                row += 1
                            }
                        }
                    case "L":
                        if col > 0 {
                            let tryKey : Key = keyPad[row][col-1] as! Key
                            if tryKey.k != "X" {
                                col -= 1
                            }
                        }
                    case "R":
                        if col < rowColumns {
                            let tryKey : Key = keyPad[row][col+1] as! Key
                            if tryKey.k != "X" {
                                col += 1
                            }
                        }
                    default:
                        break
                    }
                }
                code.append(keyPad[row][col])
            }
        }
        return code
    }
}
