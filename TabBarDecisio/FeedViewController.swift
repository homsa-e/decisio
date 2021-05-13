//
//  FeedViewController.swift
//  TabBarDecisio
//
//  Created by Александр Егоров on 26.04.2021.
//

import UIKit
import PinLayout

class FeedViewController : UIViewController {
    private let feed = UITableView()
    override func viewDidLoad(){
        super.viewDidLoad()
        feed.register(FeedViewCell.self, forCellReuseIdentifier: "FeedViewCell")
        feed.dataSource = self
        feed.delegate = self
        view.backgroundColor = .cyan
        tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "tray.full"), selectedImage: UIImage(systemName: "tray.full.fill"))
        feed.backgroundColor = .white
        view.addSubview(feed)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        feed.pin.all()
    }
    
    @objc
    func didTapDoneButton(){
        print(123)
    }
    
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedViewCell", for: indexPath) as? FeedViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}


final class FeedViewCell : UITableViewCell{
    private let titleLabel = UILabel()
    private let subtitleLable = UILabel()
    private let upButton = UIButton()
    private let downButton = UIButton()
    private let enterView = UIImageView()
    private let commentButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        upButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        downButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        commentButton.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        upButton.backgroundColor = .clear
        upButton.layer.cornerRadius = 20
        upButton.layer.borderWidth = 1
        upButton.layer.borderColor = UIColor.black.cgColor
        upButton.addTarget(self, action: #selector(didTapUpButton), for: .touchDown)
        upButton.addTarget(self, action: #selector(didTapUpButton), for: .touchUpInside)
        downButton.backgroundColor = .clear
        downButton.layer.cornerRadius = 20
        downButton.layer.borderWidth = 1
        downButton.layer.borderColor = UIColor.black.cgColor
        commentButton.backgroundColor = .clear
        commentButton.layer.cornerRadius = 20
        commentButton.layer.borderWidth = 1
        commentButton.layer.borderColor = UIColor.black.cgColor
        titleLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        subtitleLable.font = .systemFont(ofSize: 14)
        subtitleLable.textColor = UIColor.gray.withAlphaComponent(0.5)
        backgroundColor = UIColor.white
        titleLabel.text = "Тема спора"
        subtitleLable.text = "Краткое описание"
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.cyan.withAlphaComponent(0.1)
        
        selectionStyle = .none
        
        [titleLabel, subtitleLable, upButton, downButton, commentButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin
            .horizontally(12)
            .vertically(5)
        
        titleLabel.pin
            .top(20).hCenter().sizeToFit()
        
        subtitleLable.pin
            .below(of: titleLabel).hCenter().marginTop(10)
            .sizeToFit()
        
        upButton.pin
            .bottom(20).left(15).size(40)
        
        downButton.pin.right(of: upButton).bottom(20).marginLeft(15).size(40)
        
        commentButton.pin.bottom(20).right(15).size(40)
        
        
    }
    
    @objc
    func didTapUpButton(){
        print("User tapped upButton")
        upButton.backgroundColor = .blue
    }
    
}
