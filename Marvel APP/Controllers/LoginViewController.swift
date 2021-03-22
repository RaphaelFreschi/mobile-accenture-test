//
//  LoginViewController.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 21/03/21.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func login(_ sender: Any) {
        
        if !isValidEmail(self.email.text!) || email.text == "" {
            createAlert(title: "Atenção", msg: "Email inválido")
        } else if !isValidPassword(self.password.text!) || password.text == "" {
            createAlert(title: "Atenção", msg: "A senha deve conter no mínimo 6 caracteres, um numúero e uma letra maiúscula")
        }else {
            self.user.email = email.text!
            self.user.password = password.text!
            
            self.performSegue(withIdentifier: "loginToList", sender: nil)
            
        }
    
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,}$"
        
        let passwordPred = NSPredicate(format: "SELF MATCHES %@ ", passwordRegEx)
        print("\(passwordPred)")
        return passwordPred.evaluate(with: password)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}

extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func createAlert(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
