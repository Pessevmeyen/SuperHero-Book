//
//  DetailsViewController.swift
//  SuperKahramanKitabi
//
//  Created by Furkan Eruçar on 31.03.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    var secilenKahramanIsmi = ""
    var secilenKahramanGorselIsmi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: secilenKahramanGorselIsmi) // imageView burada, 2. viewController'a koyduğumuz imageView, fakat biz ismini imageView olarak yazdık, başka bi isim de olabilirdi, appledan bağımsız yani. image ise fotoğraf koymak için. Burda UIImage, fotoğraflar hangi isimdeyse ona göre çağıracak.
        label.text = secilenKahramanIsmi // label'de gene aynı şekilde 2. vc'ye koyduğumuz label'in ismi. Biz gene label verdik ama başka bir şey de koyabilirdik. text burda yazı koymak için. seçtiğimiz kahramanın ismi neyse altta onu yazdırıcak.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
