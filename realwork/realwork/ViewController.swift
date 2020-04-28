//
//  ViewController.swift
//  realwork
//
//  Created by Nathan Ngobale on 2020/02/04.
//  Copyright © 2020 Nathan Ngobale. All rights reserved.
//

import UIKit
import AVKit
import NLibrary
import FirebaseAnalytics
import CoreData

class ViewController: UIViewController {
    weak var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        self.appDelegate = appDelegate
//        context = self.appDelegate?.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "UserPreferences", in: context!)
//        let newUserPref = NSManagedObject(entity: entity!, insertInto: context!)
//        newUserPref.setValue("#eee902ff", forKey: "color")
//        appDelegate.saveContext()
    }

    override func loadView() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        self.appDelegate = appDelegate
        context = self.appDelegate?.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserPreferences")
        request.returnsObjectsAsFaults = false
        do {
            guard let result = try context!.fetch(request) as? [NSManagedObject] else {
                return
            }
            if result.isEmpty {
                createUserPreferenceObject()
            }
            for data in result {
                if let hexCode1 = data.value(forKey: "color1") as? String,
                    let hexCode2 = data.value(forKey: "color2") as? String {
                    GraphicColors.primary = HexToUIColor(hexcode: hexCode1).color
                    GraphicColors.secondary = HexToUIColor(hexcode: hexCode2).color
                }
            }
        } catch {
            fatalError("Error could not print out value")
        }
        super.loadView()
    }

    func createUserPreferenceObject() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        self.appDelegate = appDelegate
        context = self.appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserPreferences", in: context!)
        let newUserPref = NSManagedObject(entity: entity!, insertInto: context!)
        newUserPref.setValue("#eee902ff", forKey: "color1")
        newUserPref.setValue("#939393ff", forKey: "color2")
        appDelegate.saveContext()
    }

    @IBAction func btnOnboard(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "OnBoardingID") as? UIPageViewController
        if let destinationVC = destinationVC {
            present(destinationVC, animated: true, completion: nil)
        }
    }

    @IBAction func btnToDashboard(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DashboardTab", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier:
            "DashboardTabID") as? UITabBarController
        if let destinationVC = destinationVC {
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
            present(destinationVC, animated: true, completion: nil)
        }
// TO DO: enquire either tab bar in container or container in tab bar
//        let storyboard = UIStoryboard(name: "DashboardTab", bundle: nil)
//        let destinationVC = storyboard.instantiateViewController(withIdentifier:
//            "MusicControllerID") as? UIViewController
//        if let destinationVC = destinationVC {
//            destinationVC.modalPresentationStyle = .fullScreen
//            destinationVC.modalTransitionStyle = .crossDissolve
//            present(destinationVC, animated: true, completion: nil)
//        }
    }
}

struct SwiftFourMusicResults: Decodable {
    let resultCount: Int
}
