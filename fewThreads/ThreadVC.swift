//
//  ThreadVC.swift
//  fewThreads
//
//  Created by Monika Piesyk on 18/10/2022.
//

import Foundation
import UIKit

class ThreadVC: UIViewController {
    
    var textView:UITextView?
    
    let threadCount = 2
    let iterationCount = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView = UITextView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        view.addSubview(textView!)

        addThreads()
    }
    
    private func updateText(newText:String) {
        textView!.text += newText
    }
    
    private func addThreads() {
        
        for _ in 0..<threadCount{
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                
                for _ in 0..<self!.iterationCount {
                    let time = UInt32.random(in: 0...1000)
                    let threadId = Thread.current
                    sleep(time / 100)
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.updateText(newText: String("\(threadId):\(time)\n"))
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                    self!.updateText(newText: String("Done\n"))
                }
            }
        }
    }
}
