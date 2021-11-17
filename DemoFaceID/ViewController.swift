//
//  ViewController.swift
//  DemoFaceID
//
//  Created by Frank Pham on 05.11.21.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    private lazy var viewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func faceIDButtonTapped(_ sender: Any) {
        viewModel.authenticateWithBiometrics {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenVC") else {
                print("Empty")
                return
            }
            
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}

