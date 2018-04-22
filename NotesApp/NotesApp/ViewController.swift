//
//  ViewController.swift
//  NotesApp
//
//  Created by CKM1 on 3/5/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import UIKit



enum Mode{
	
	case new
	case save
	case editing
	case none
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

	
	@IBOutlet weak var tableView:UITableView!
	@IBOutlet weak var btnAddNotes:UIButton!
	@IBOutlet weak var txtView: UITextView!
	var mode:Mode?

	var arrayOfNotes:[String] = ["In addition to the Genius Bar for hardware repairs",
								 "In addition to the Genius Bar for hardware repairs, you have more immediate support options. Get your questions answered by an expert via phone, chat, email, or even Twitter. From setting up your device to recovering your Apple ID to replacing the screen, Apple Support has you covered.",
								 "you have more immediate support options. Get your questions answered by an expert via phone, chat, email, or even Twitter. From setting up your device to recovering your Apple ID to replacing the screen, Apple Support has you covered.",
								 "Apple Support has you covered."]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mode = Mode.none
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	@IBAction func newNotesTap(_ sender:UIButton){
		
		if mode == Mode.new {
			
			return
		}
		mode = Mode.new
		self.arrayOfNotes.append("New Note")
		self.txtView.text = ""
		self.arrayOfNotes.reverse()
		self.tableView.reloadData()
		let indexPath:IndexPath = IndexPath(row:0,section:0)
		self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
		self.txtView.becomeFirstResponder()
	}
	@IBAction func deleteNoteTap(_ sender:UIButton){
		
	}
	
	@IBAction func cafetap(_ sender:UIButton){
		
		
		let cafeView:CafeViewController = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier:"CafeView") as! CafeViewController
		self.present(cafeView, animated: true, completion:nil)
		
	}
	@IBAction func saveNotesTap(_ sender:UIButton){
		
		mode = Mode.save
		self.arrayOfNotes[0] = self.txtView.text
		self.tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return arrayOfNotes.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell:NotesCell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NotesCell
		cell.lblNotes.text = arrayOfNotes[indexPath.row]
		return cell
		
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		self.txtView.resignFirstResponder()
		self.txtView.text = arrayOfNotes[indexPath.row]
		let cell:NotesCell = tableView.cellForRow(at: indexPath) as! NotesCell
		cell.setSelected(true, animated:true)
		
		
	}

	
	func textViewDidEndEditing(_ textView: UITextView) {
		
		print("Notes are saved when .....")
		mode = Mode.save
		self.arrayOfNotes[0] = self.txtView.text
		self.tableView.reloadData()
		
	}

}

