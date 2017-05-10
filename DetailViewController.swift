//
//  DetailViewController.swift
//  Lesson 3
//
//  Created by Ori Cohen on 4/22/17.
//  Copyright © 2017 Ori Cohen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var restaurantImage = ""
    var restaurantName = ""
    var restaurantLocation = ""
    var restaurantType = ""
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var labelRestaurantNames: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelType: UILabel!
    
    override func viewDidLoad() {
        restaurantImageView.image = UIImage(named: restaurantImage)
        labelRestaurantNames?.text = restaurantName
        labelLocation?.text = restaurantLocation
        labelType?.text = restaurantType
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
