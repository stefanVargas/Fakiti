//
//  HomeViewController.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 16/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities

protocol HomeViewControllerInput {
    
    var userResponse: HomeHolderModel.FetchData.Response { get set }
}

class HomeViewController: UIViewController {

    //MARK: Atributes

    //UI
    typealias VF = VisualFormatter

    let titleView = TitleView()
    let collectionContainer = CollectionContainerView()
    
    // Pattern Structure
    var interactor: HomeInteractorInput?
    var router: HomeRouter?
    
    
    // MARK: HomeViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        setupViews()
    }
    
    
    // MARK: Setup
    
    func setupViews( )  {
        let sizeHandler = SizeHandler(view: self.view)
        let viewHeight = sizeHandler.quarterFrame(dimension: .height)
        self.view.backgroundColor = .darkBackGroundColor
        self.view.addSubview(titleView)
        self.view.addSubview(collectionContainer)
        
        self.view.setupConstraints(pattern: VF.fullHorTotal, views: titleView)
        self.view.setupConstraints(pattern: VF.fullHorTotal, views: collectionContainer)
        self.view.setupConstraints(pattern: "V:|-48-[v0(\(viewHeight))]-8-[v1(\(viewHeight))]", views: titleView, collectionContainer)
        
    }
    
    private func configure()
    {
        let viewController = self
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        //      interactor.presenter = presenter
        //      router.viewController = viewController
        //      router.dataStore = interactor
    }

}
