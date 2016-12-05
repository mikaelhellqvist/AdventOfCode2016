import Foundation

class Converter {
    
    func convertToArrayFrom(string: String) -> [String] {
        
        var stringToConvert = string
        stringToConvert = stringToConvert.replacingOccurrences(of: " ", with: "")
        let array = stringToConvert.components(separatedBy: ",")
        
        return array
    }
}
