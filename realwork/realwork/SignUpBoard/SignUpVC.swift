//
//  SignUpVC.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/03/19.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var edtEmail: UITextField!
    @IBOutlet weak var edtPassword: UITextField!
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        loaderIndicator.transform = transfrom
        loaderIndicator.hidesWhenStopped = true
    }

    @IBAction func btnSignUp(_ sender: Any) {
        loaderIndicator.startAnimating()
        Auth.auth().createUser(withEmail: edtEmail!.text!,
                               password: edtPassword!.text!) { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                self?.showMessagePrompt(title: "Opps!", message: error!.localizedDescription)
              return
            }
            self?.showMessagePrompt(title: "Success", message: "User \(user.email) successfully created")
        }
    }

    func showMessagePrompt(title: String, message: String) {
        loaderIndicator.stopAnimating()
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
