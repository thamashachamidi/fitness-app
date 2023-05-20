//
//  WorkoutViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-16.
//
import UIKit


//exercise card cell code
class ExerciseCardCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //title for the cards
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    //small descrtpion for the card
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 3
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        applyCardStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    //cards styling code
    private func applyCardStyling() {
        backgroundColor = .gray
        layer.cornerRadius = 8
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
    
    func configure(with exercise: Exercise) {
        imageView.image = UIImage(named: exercise.imageName)
        titleLabel.text = exercise.name
        descriptionLabel.text = exercise.description
    }
}

class WorkoutViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(ExerciseCardCell.self, forCellWithReuseIdentifier: "ExerciseCardCell")
        return collectionView
    }()
    
    var exercises: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Workout"
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        //current exercise list
        exercises = [
            Exercise(name: "Walking", description: "Walking helps improve heart and lung health, enhancing overall cardiovascular fitness.", imageName: "walking"),
            Exercise(name: "Push up", description: "One of the great benefits of push-ups is that they require no equipment and can be done anywhere. Whether you're at home, at the gym, or traveling, push-ups offer a convenient and accessible exercise option.", imageName: "pushup"),
            Exercise(name: "Cardio", description: "Cardio exercise has been linked to better sleep quality. It can help regulate sleep patterns, promote relaxation, and reduce insomnia symptoms, leading to more restful and rejuvenating sleep.", imageName: "cardio"),
            Exercise(name: "Lunges", description: "Leg Strength and Muscle Development", imageName: "lunge"),
            Exercise(name: "Pull-ups", description: "Increases Overall Body Strength", imageName: "pullups")
        ]
        
        //loadmore btn
        let loadMoreButton = UIBarButtonItem(title: "Load More", style: .plain, target: self, action: #selector(loadMoreButtonTapped))
        navigationItem.rightBarButtonItem = loadMoreButton
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExerciseCardCell", for: indexPath) as? ExerciseCardCell else {
            fatalError("Failed to dequeue ExerciseCardCell")
        }
        
        let exercise = exercises[indexPath.item]
        cell.configure(with: exercise)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let exercise = exercises[indexPath.item]
        showExerciseDetailsPopup(for: exercise)
    }
    
    private func showExerciseDetailsPopup(for exercise: Exercise) {
        let popupViewController = ExercisePopupViewController(exercise: exercise)
        popupViewController.modalPresentationStyle = .overCurrentContext
        present(popupViewController, animated: true, completion: nil)
    }
    
    @objc private func loadMoreButtonTapped() {
        // array of adding more cards
        let additionalExercises = [
            Exercise(name: "Squats", description: "Builds Leg Muscles", imageName: "squate"),
            Exercise(name: "Plank", description: "Strengthens Core Muscles", imageName: "Plank"),
            Exercise(name: "Cycling", description: "Improves Cardiovascular Fitness", imageName: "cycling"),
            Exercise(name: "Yoga", description: "Increases Flexibility and Balance", imageName: "Yoga"),
            Exercise(name: "Jumping Jacks", description: "Full-Body Cardio Exercise", imageName: "Jumping Jacks"),
            Exercise(name: "Burpees", description: "High-Intensity Full-Body Exercise", imageName: "Burpees")
        ]
        exercises.append(contentsOf: additionalExercises)
        
        collectionView.reloadData()
    }
}

struct Exercise {
    let name: String
    let description: String
    let imageName: String
}

class ExercisePopupViewController: UIViewController {
    let exercise: Exercise
    
    init(exercise: Exercise) {
        self.exercise = exercise
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        applyPopupStyling()
    }
    
    private func setupViews() {
        view.backgroundColor = .clear
        
        //adding pop up view to , see the card more clearly
        let popupView = UIView()
        popupView.backgroundColor = .white
        popupView.layer.cornerRadius = 8
        popupView.layer.masksToBounds = true
        view.addSubview(popupView)
        
        popupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.widthAnchor.constraint(equalToConstant: 300),
            popupView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        //close btn for the card pop up
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: popupView.bottomAnchor, constant: 16),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //pop up will shows the exercise image and the content
        let exerciseImageView = UIImageView(image: UIImage(named: exercise.imageName))
        exerciseImageView.contentMode = .scaleAspectFit
        popupView.addSubview(exerciseImageView)
        
        exerciseImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseImageView.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 16),
            exerciseImageView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 16),
            exerciseImageView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -16),
            exerciseImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.text = exercise.name
        popupView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: exerciseImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -16)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = exercise.description
        popupView.addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -16)
        ])
    }
    
    //adding pop up style
    private func applyPopupStyling() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    //close btn configuration
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
