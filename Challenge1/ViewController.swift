//
//  ViewController.swift
//  Challenge1
//
//  Created by Melissa  Garrett on 3/5/18.
//  Copyright © 2018 MelissaGarrett. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Country Flags"
        
        // Images stored in new Content directory
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                countries.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = countries[indexPath.row] // display name of file
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            vc.imageReceived = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

