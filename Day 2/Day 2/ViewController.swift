import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let code = readFile()
        let converter = Converter()
        let codeHint = converter.convertDataToArrays(code: code)
        
        let codeBoxPartI = CodeBox(codeSheet: codeHint, isSimple: true)
        print(codeBoxPartI.crackCode())
        
        let codeBoxPartII = CodeBox(codeSheet: codeHint, isSimple: false)
        print(codeBoxPartII.crackCode())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    func readFile() -> String {
        let path = Bundle.main.path(forResource: "Code", ofType: "txt")
        let text = try! String(contentsOfFile: path!, encoding: .utf8)
        
        return text
    }
}

