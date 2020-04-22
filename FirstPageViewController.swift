//
//  FirstPageViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/11/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
import CoreLocation
import FirebaseUI
import GoogleSignIn

class FirstPageViewController: UIViewController {
    
    @IBOutlet var tableView: UIView!
    var authUI: FUIAuth!

    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        
        tableView.isHidden = true
    
        // Do any additional setup after loading the view.
    }
 

      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          signIn()
      }

    func signIn() {
           let providers: [FUIAuthProvider] = [
               FUIGoogleAuth(),
           ]
           if authUI.auth?.currentUser == nil {
               self.authUI?.providers = providers
               let loginViewController = authUI.authViewController()
               loginViewController.modalPresentationStyle = .fullScreen
               present(loginViewController, animated: true, completion: nil)
           } else {
               tableView.isHidden = false
            playSound(soundName: "sound", audioPlayer: &audioPlayer)
             
           }
       }
       
    @IBAction func swipeUp(_ sender: Any) {
        
        performSegue(withIdentifier: "ShowPage", sender: nil)
        
    }
    @IBAction func signOutPressed(_ sender: Any) {
        do {
                try authUI!.signOut()
                print("^^^ Successfully signed out!")
                tableView.isHidden = true
                signIn()
            } catch {
                tableView.isHidden = true
                print("*** ERROR: Couldn't sign out")
            }
        }
    }


func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
    if let sound = NSDataAsset(name: soundName) {
        do {
            try audioPlayer = AVAudioPlayer(data: sound.data)
            audioPlayer.play()
        } catch {
            print("ERROR: Data from \(soundName) could not be played as an audio file")
        }
    } else {
        print("ERROR: Could not load data from file \(soundName)")
    }
}

extension FirstPageViewController: FUIAuthDelegate {
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication =
            options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication:
            sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if let user = user {
            tableView.isHidden = false
            print("^^^ We signed in with the user \(user.email ?? "unknown e-mail")")
        }
    }
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        
        // Create an instance of the FirebaseAuth login view controller
        let loginViewController = FUIAuthPickerViewController(authUI: authUI)
        
        // Set background color to white
        loginViewController.view.backgroundColor = UIColor.systemYellow
        
        // Create a frame for a UIImageView to hold our logo
        let marginInsets: CGFloat = 32 // logo will be 16 points from L and R margins
        let imageHeight: CGFloat = 500 // the height of our logo
        let imageY = CGFloat(150) // places bottom of UIImageView in the center of the login screen
        let logoFrame = CGRect(x: self.view.frame.origin.x + marginInsets, y: imageY, width: self.view.frame.width - (marginInsets*2), height: imageHeight)
        
        // Create the UIImageView using the frame created above & add the "logo" image
        let logoImageView = UIImageView(frame: logoFrame)
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit // Set imageView to Aspect Fit
        loginViewController.view.addSubview(logoImageView) // Add ImageView to the login controller's main view
        return loginViewController
    }
    
}

