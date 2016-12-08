import Foundation

class Converter {
    
    func convertDataToArrays(code: String) -> [[String]] {
        
        var mainArray = [[String]]()
        var charArray = [String]()
        
        for (i, c) in code.characters.enumerated() {
            if c == "\n" {
                mainArray.append(charArray)
                
                charArray = [String]()
            }
            if c != "\n" {
                charArray.append(String(c))
            }
        }
        mainArray.append(charArray)
        return mainArray
    }
}
