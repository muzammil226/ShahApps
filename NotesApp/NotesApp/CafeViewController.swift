//
//  CafeViewController.swift
//  NotesApp
//
//  Created by CKM1 on 3/7/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import UIKit

class CafeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
// Changes in the notes app
	@IBOutlet weak var menuCV:UICollectionView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func closeTap(_ sender:UIButton){
		self.dismiss(animated: true, completion:nil)
	}

	
	//MARK:- UICOLLECTIVE DELEGATES
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell:MenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
		cell.lblTitle.text = "Menu"
		
		if indexPath.row % 2 == 0{
			cell.contentView.backgroundColor = UIColor.lightGray
		}else {
			cell.contentView.backgroundColor = UIColor.darkGray
			
		}
		return cell
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		
	}
}
