//
//  AuthenticationViewModel.swift
//  DemoFaceID
//
//  Created by Frank Pham on 05.11.21.
//

import Foundation
import LocalAuthentication

class AuthenticationViewModel {
    
    func authenticateWithBiometrics(completion: @escaping () -> Void) {
        let context = LAContext()
        let policy = LAPolicy.deviceOwnerAuthentication
        let reason = "Log in to your account"

        var error: NSError?
        
        context.localizedCancelTitle = "cancel"
        
        if context.canEvaluatePolicy(policy, error: &error) {
            context.evaluatePolicy(policy, localizedReason: reason) { success,error in
                if success {
                    DispatchQueue.main.async {
                        completion()
                    }
                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")
                }
            }
        }
    }
}
