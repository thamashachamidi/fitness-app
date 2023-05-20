//
//  HomeViewController.swift
//  Ffitness app
//
//  Created by Thamasha Chamidi on 2023-05-16.
//
import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Featured Workouts"
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(WorkoutCell.self, forCellWithReuseIdentifier: "WorkoutCell")
        return collectionView
    }()
    
    let quoteView: QuoteView = {
        let view = QuoteView()
        view.backgroundColor = .systemPurple
        return view
    }()
    
    var featuredWorkouts: [FeaturedWorkout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        
        loadFeaturedWorkouts()
        
        view.addSubview(descriptionLabel)
        view.addSubview(collectionView)
        view.addSubview(quoteView)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            
            quoteView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            quoteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            quoteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            quoteView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let quote = "This is a motivational quote that inspires you to achieve your fitness goals."
        quoteView.configure(with: quote)
    }
    
    func loadFeaturedWorkouts() {
       
        featuredWorkouts = [
            FeaturedWorkout(name: "HIIT", image: "HIIT", description: "High-intensity interval training (HIIT) is a popular workout that alternates between intense bursts of exercise and short recovery periods.", duration: "Duration: 30 minutes"),
            FeaturedWorkout(name: "Yoga Flow", image: "Yoga flow", description: "Yoga flow is a dynamic sequence of yoga poses that helps improve flexibility, strength, and balance.", duration: "Duration: 60 minutes"),
            FeaturedWorkout(name: "Strength Training", image: "Strength Training", description: "Strength training involves exercises that target specific muscle groups to build strength and increase muscle mass.", duration: "Duration: 45 minutes"),
            FeaturedWorkout(name: "Cardio Blast", image: "workout4", description: "Cardio blast is a high-intensity cardio workout that helps improve cardiovascular fitness and burn calories.", duration: "Duration: 40 minutes")
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredWorkouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCell", for: indexPath) as? WorkoutCell else {
            fatalError("Failed to dequeue WorkoutCell")
        }
        
        let workout = featuredWorkouts[indexPath.item]
        cell.configure(with: workout)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let workout = featuredWorkouts[indexPath.item]
        let cardViewController = CardViewController(workout: workout)
        navigationController?.pushViewController(cardViewController, animated: true)
    }
}

struct FeaturedWorkout {
    let name: String
    let image: String
    let description: String
    let duration: String
}

class WorkoutCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)
        ])
    }
    
    func configure(with workout: FeaturedWorkout) {
        imageView.image = UIImage(named: workout.image)
        titleLabel.text = workout.name
    }
}

class CardViewController: UIViewController {
    
    let workout: FeaturedWorkout
    
    init(workout: FeaturedWorkout) {
        self.workout = workout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = workout.name
        
        let cardView = CardView(workout: workout)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
}

class CardView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    init(workout: FeaturedWorkout) {
        super.init(frame: .zero)
        setupViews()
        configure(with: workout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(durationLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            durationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            durationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            durationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with workout: FeaturedWorkout) {
        imageView.image = UIImage(named: workout.image)
        titleLabel.text = workout.name
        descriptionLabel.text = workout.description
        durationLabel.text = workout.duration
    }
}

class QuoteView: UIView {
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(quoteLabel)
        
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: topAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            quoteLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with quote: String) {
        quoteLabel.text = quote
    }
}

    
