//
//  LoginViewController.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 03/10/23.
//

import UIKit

final class LoginViewController: UIViewController {
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white

        let googleSignInButton = UIButton(frame: .zero)
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        googleSignInButton.backgroundColor = .yellow
        googleSignInButton.setTitle("Google SignIn", for: .normal)
        googleSignInButton.addTarget(self, action: #selector(signInWithGoogle), for: .touchUpInside)
        view.addSubview(googleSignInButton)

        googleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleSignInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc private func signInWithGoogle() {
        viewModel.signInWithGoogle(self)
    }
}
