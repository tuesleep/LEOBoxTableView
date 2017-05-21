//
//  ViewController.swift
//  LEOBoxTableView
//
//  Created by leonardo-hammer on 05/21/2017.
//  Copyright (c) 2017 leonardo-hammer. All rights reserved.
//

import UIKit
import LEOBoxTableView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let cellReuseId = "BoxCell"
	weak var boxTableView: LEOBoxTableView!
	
	var datas = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationController?.navigationBar.isTranslucent = false
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit))
		
		for i in 0..<10 {
			datas.append("LEOTableViewCell \(i)")
		}
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		let tableView = LEOBoxTableView(frame: view.bounds, style: .grouped)
		tableView.separatorStyle = .none
		tableView.boxInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(LEOBoxTableViewCell.self, forCellReuseIdentifier: cellReuseId)
		
		view.addSubview(tableView)
		boxTableView = tableView
	}

	func edit() {
		boxTableView.setEditing(!boxTableView.isEditing, animated: true)
		
		if boxTableView.isEditing {
			navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(edit))
		} else {
			navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit))
		}
	}
	
	// MARK: - UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return datas.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath)
		
		cell.textLabel?.text = datas[indexPath.section]
		cell.accessoryType = .disclosureIndicator
		
		return cell
	}
	
	// MARK: - UITableViewDelegate
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 90
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		if section == tableView.numberOfSections - 1 {
			return 8
		}
		
		return 4
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 0 {
			return 8
		}
		return 4
	}
	
	func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
		return .delete
	}
	
	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		return [UITableViewRowAction(style: .destructive, title: "Delete", handler: { (action, indexPath) in
			self.datas.remove(at: indexPath.section)
			
			tableView.beginUpdates()
			tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
			tableView.endUpdates()
		})]
	}
	
	// MARK: - Others
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
