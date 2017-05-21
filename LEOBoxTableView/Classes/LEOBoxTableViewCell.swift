//
//  LEOBoxTableViewCell.swift
//  Pods
//
//  Created by Leonardo Hammer on 21/05/2017.
//
//

import UIKit

class LEOBoxTableViewCell: UITableViewCell {
	override var frame: CGRect {
		get {
			return super.frame
		}
		set (newFrame) {
			guard let tableView = superTableView() as? LEOBoxTableView else {
				super.frame = newFrame
				return
			}
			
			let inset = tableView.boxInset
			var x = inset.left
			
			if tableView.isEditing == true || tableView.currentEditingCell != self {
				x = newFrame.origin.x + inset.left
			}
			
			let origin = CGPoint(x: x, y: newFrame.origin.y)
			let size = CGSize(width: tableView.frame.width - (inset.left + inset.right), height: newFrame.height - (inset.top + inset.bottom))

			super.frame = CGRect(origin: origin, size: size)
		}
	}
	
	func superTableView() -> UITableView? {
		for view in sequence(first: self.superview, next: { $0?.superview }) {
			if let tableView = view as? UITableView {
				return tableView
			}
		}
		return nil
	}
}
