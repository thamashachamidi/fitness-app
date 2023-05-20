//
//  CustomScheduleViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-19.
//

import UIKit

struct Workout {
    var name: String
    var durationMinutes: Int
}

struct Schedule {
    var workouts: [Workout]
    let restDays: Int
}

class CustomScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    var schedule: Schedule!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Schedule"
        
        //  workouts list creation
        let strengthTraining = Workout(name: "Strength Training", durationMinutes: 60)
        let cardio = Workout(name: "Cardio Workout", durationMinutes: 45)
        let flexibility = Workout(name: "Flexibility Training", durationMinutes: 30)
        
        // schedule make
        schedule = Schedule(workouts: [strengthTraining, cardio, flexibility], restDays: 2)
        
        // Configuration table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        //   plus icon
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkout))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let workout = schedule.workouts[indexPath.row]
        cell.textLabel?.text = "\(workout.name): \(workout.durationMinutes) minutes"
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            schedule.workouts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
   
    @objc func addWorkout() {
        let alert = UIAlertController(title: "Add Workout", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Workout Name"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Duration (minutes)"
            textField.keyboardType = .numberPad
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self, weak alert] _ in
            guard let self = self, let alert = alert else { return }
            
            if let nameTextField = alert.textFields?.first, let durationTextField = alert.textFields?.last,
               let name = nameTextField.text, let durationText = durationTextField.text,
               let duration = Int(durationText) {
                let newWorkout = Workout(name: name, durationMinutes: duration)
                self.schedule.workouts.append(newWorkout)
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
}
