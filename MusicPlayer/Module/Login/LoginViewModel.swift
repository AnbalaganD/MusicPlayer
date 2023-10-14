//
//  LoginViewModel.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 03/10/23.
//

import Foundation
import GoogleSignIn

final class LoginViewModel {
    func signInWithGoogle(_ viewController: UIViewController) {
        GIDSignIn.sharedInstance.signIn(
            withPresenting: viewController
        ) { signInResult, error in
            print(signInResult)
            print(error)
        }

//        GIDSignIn.sharedInstance.signOut()
//        GIDSignIn.sharedInstance.disconnect()
    }
}
