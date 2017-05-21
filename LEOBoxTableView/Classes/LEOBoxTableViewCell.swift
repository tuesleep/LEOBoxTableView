//
//  LEOBoxTableViewCell.swift
//  Pods
//
//  Created by Leonardo Hammer on 21/05/2017.
//
//

import UIKit

open class LEOBoxTableViewCell: UITableViewCell {
	override open var frame: CGRect {
		get {
			return super.frame
		}
		set (newFrame) {
			guard let tableView = superTableView() as? LEOBoxTableView else {
				super.frame = newFrame
				return
			}
			
			let inset = tableView.boxInset
			let width = tableView.frame.width
			let x = newFrame.origin.x + inset.left
			
			let origin = CGPoint(x: x, y: newFrame.origin.y)
			let size = CGSize(width: width - (inset.left + inset.right), height: newFrame.height - (inset.top + inset.bottom))

			super.frame = CGRect(origin: origin, size: size)
		}
	}
	
	override open func awakeFromNib() {
		super.awakeFromNib()
		
		layer.shadowColor = UIColor.lightGray.cgColor
		layer.shadowOpacity = 1.0;
		layer.shadowRadius = 2.0;
		layer.shadowOffset = CGSize(width: 0, height: 0);
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
