//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Melissa  Garrett on 3/5/18.
//  Copyright © 2018 MelissaGarrett. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    
    var imageReceived: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = imageReceived {
            title = imageToLoad
            image.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped() {
        // share an array, but just one image in this case
        let vc = UIActivityViewController(activityItems: [image.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
