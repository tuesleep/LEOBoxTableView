//
//  LEOBoxTableView.swift
//  Pods
//
//  Created by Leonardo Hammer on 21/05/2017.
//
//

import UIKit

class LEOBoxTableView: UITableView {
	
	open var boxInset: UIEdgeInsets = UIEdgeInsetsMake(16, 16, 16, 16)
	
    var currentEditingCell: UITableViewCell?
	
	override func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool {
		debugPrint("leo box tableview touch should begin")
		
		return true
	}
	
}
