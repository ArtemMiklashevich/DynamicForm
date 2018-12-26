//
//  ViewController.swift
//  DynamicForm
//
//  Created by Artem Miklashevich on 12/24/18.
//  Copyright © 2018 Artem Miklashevych. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var contract : Contract!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doIt(_ sender: UIButton) {
        createView()
    }

    func preperingData() {
        let contractDescJSON = readJSONFile(name: "contract.json")
        let jsonData = contractDescJSON.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            contract = try decoder.decode(Contract.self, from: jsonData)
        } catch {
            print("JSON parsing error")
        }
    }
    
    func createView() {
        preperingData()
        createHeader()
        
        var y = 120
        for item in contract.items.item {
            createItemView(y: y, item: item)
            y = y + 60
        }
    }
    
    func createHeader() {
        addLabel(y: 40, text: contract.title)
        addLabel(y: 60, text: String(contract.number))
    }
    
    func createItemView(y: Int, item: Contract.Items.Item) {
        addLabel(y: y, text: item.title)
        addTextBox(y: y + 20, text: item.value)
    }
    
    func readJSONFile(name: String) -> String {
        if let url = Bundle.main.url(forResource: "contract.json", withExtension: nil) {
            do {
                let text = try String(contentsOf: url, encoding: .utf8)
                return text
            }
            catch {}
        }
        return ""
    }
    
    func addLabel(y: Int, text: String) {
        let label : UILabel = UILabel()
        label.text = text
        label.frame = CGRect(x: 16, y: y, width: 220, height: 16)
        //label.backgroundColor = UIColor.lightGray
        self.view.addSubview(label)
    }
    
    func addTextBox(y: Int, text: String) {
        let textBox : UITextField = UITextField(frame: CGRect(x: 16, y: y, width: 220, height: 30))
        textBox.text = text
        textBox.borderStyle = UITextBorderStyle.line
        //textBox.backgroundColor = UIColor.yellow
        textBox.isUserInteractionEnabled = true
        self.view.addSubview(textBox)
    }
    
}

