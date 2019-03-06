//
//  DbManager.swift
//  CreateX
//
//  Created by James Lowe on 1/28/19.
//  Copyright © 2019 Chris Truong. All rights reserved.
//

import Foundation
import SQLite3

class DbManager {
	
	
	static var db: OpaquePointer?
	
	public func DbManager() {
		
	}
	

	
	public static func DbAdd() {
		let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
			.appendingPathComponent("Incidents.sqlite")

		//opening the database
		if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
			print("error opening database")
		}

		//creating table
		if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Incidents (id INTEGER PRIMARY KEY AUTOINCREMENT, time TEXT, date TEXT, location TEXT, videoURL TEXT, keyFrame TEXT)", nil, nil, nil) != SQLITE_OK {
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("error creating table: \(errmsg)")
		}
	}
	
	static func saveToDb(violation: Violation) {
		DbAdd()
		
		//getting values from textfields
		//let name = textFieldName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
		//let powerRanking = textFieldPowerRanking.text?.trimmingCharacters(in: .whitespacesAndNewlines)
		
		
		//validating that values are not empty
		if(violation.videoURL.isEmpty){
			//set it to some placeholder
			return
		}
		if(violation.location.isEmpty){
			//set it to some placeholder
			return
		}
		if(violation.time.isEmpty){
			//set it to some placeholder
			return
		}
		if(violation.date.isEmpty){
			//set it to some placeholder
			return
		}
		
		//creating a statement
		var stmt: OpaquePointer?
		
		//the insert query
		let queryString = "INSERT INTO Incidents (time, date, location, videoURL, keyFrame) VALUES (?,?,?,?,?)"
		
		//preparing the query
		if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("error preparing insert: \(errmsg)")
			return
		}
		
		//binding the parameters
		
		if sqlite3_bind_text(stmt, 1, violation.time, -1, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("failure binding name: \(errmsg)")
			return
		}
		
		if sqlite3_bind_text(stmt, 2, violation.date, -1, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("failure binding name: \(errmsg)")
			return
		}

		if sqlite3_bind_text(stmt, 3, violation.location, -1, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("failure binding name: \(errmsg)")
			return
		}
		if sqlite3_bind_text(stmt, 4, violation.videoURL, -1, nil) != SQLITE_OK{
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("failure binding name: \(errmsg)")
			return
		}
		
		//executing the query to insert values
		if sqlite3_step(stmt) != SQLITE_DONE {
			let errmsg = String(cString: sqlite3_errmsg(db)!)
			print("failure inserting hero: \(errmsg)")
			return
		}
		

		//readValues()
		
		//displaying a success message
		print("Incident saved successfully")
	}
	
	
	

}


