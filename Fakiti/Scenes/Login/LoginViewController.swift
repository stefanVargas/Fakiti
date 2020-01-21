//
//  LoginViewController.swift
//  Fakiti
//
//  Created by Stefan V. de Moraes on 17/01/20.
//  Copyright © 2020 Stefan V. de Moraes. All rights reserved.
//

import UIKit
import StefanUtilities


protocol LoginViewDisplayInput: class
{
  func displayData(viewModel: LoginModel.FetchData.ViewModel)
}


class LoginViewController: UIViewController {
    
    //MARK: Atributes
    var userName: String = String()


    //UI
    typealias VF = VisualFormatter
    
    let startButton = StartButton()
    let customTextField = CustomTextField()
    
    let welcomeLabel: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont(name: UIFont.MainFonts.gillSans.rawValue, size: 18)
        lbl.textColor = UIColor.appWhite
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    let infoLabel: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont(name: UIFont.MainFonts.gillSansLight.rawValue, size: 13)
        lbl.textColor = UIColor.appWhite
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        
        return lbl
    }()
    
    let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
    
    // Pattern Structure
    var interactor: LoginInteractorInput?
    weak var router: LoginRouterOutput?

    
    // MARK: LoginViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupViews()
        
    }
    
    
    // MARK: Setup Methods
    
    func setupViews( )  {
        
        let sizer = SizeHandler(view: self.view)
        let tenPercentH = sizer.percentOfFrame(percent: 10, dimension: .height)
        let quarterH = sizer.quarterFrame(dimension: .height)
        
        self.view.backgroundColor = .darkBackGroundColor

        self.view.addSubview(welcomeLabel)
        self.view.addSubview(infoLabel)
        self.view.addSubview(customTextField)
        self.view.addSubview(startButton)
        
        self.view.setupConstraints(pattern: VF.fullHorDefault, options: NSLayoutConstraint.FormatOptions.alignAllCenterY, views: welcomeLabel)
        self.view.setupConstraints(pattern: VF.fullHorSmall, options: NSLayoutConstraint.FormatOptions.alignAllCenterY, views: infoLabel)
        
        self.view.setupConstraints(pattern: VF.fullHorBig, options: NSLayoutConstraint.FormatOptions.alignAllCenterY, views: customTextField)
        
        self.view.setupConstraints(pattern: VF.fullHorBig, options: NSLayoutConstraint.FormatOptions.alignAllCenterY, views: startButton)
        
        self.view.setupConstraints(pattern: "V:|-(==\(quarterH))-[v0]-16-[v1]-(==\(tenPercentH))-[v2(==\(quarterH/4))]-16-[v3(==\(quarterH/4))]", views: welcomeLabel, infoLabel, customTextField, startButton)
        
        self.customTextField.start()
        self.startButton.start(backgroundColor: .clear, image: nil, interaction: true)
         self.startButton.addTarget(self, action: #selector(continueToNextViewController), for: .touchUpInside)
        
    }
    
    private func configure()
    {
        let viewController = self
        self.customTextField.insideTextField.delegate = viewController
        let presenter = LoginPresenter()
        presenter.loginViewController = viewController
        let interactor = LoginInteractor()
        interactor.presenter = presenter
        interactor.presenter.start()
        viewController.interactor = interactor
    
    }
    
    
    // MARK: Action Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func continueToNextViewController() {
        
        let loginModelRequest =
            LoginModel.FetchData.Request(name: self.userName)
        self.interactor?.fetchUser(resquest: loginModelRequest)
        impactFeedbackgenerator.impactOccurred()
        self.router?.showHomeViewController()
        
    }
    
}


// MARK: END LoginViewController to extensions

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.customTextField.updateGitState(state: .active)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.customTextField.updateGitState(state: .inactive)
        self.userName = self.customTextField.insideTextField.text ?? String()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.userName = self.userName + string
        
        return true

    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.userName = self.customTextField.insideTextField.text ?? String()
        textField.resignFirstResponder()

        return true

    }
}

extension LoginViewController: LoginViewDisplayInput {
    func displayData(viewModel: LoginModel.FetchData.ViewModel) {
        welcomeLabel.text = viewModel.displayedTitle
        infoLabel.text = viewModel.displayedSubTitle
    }
    
}
