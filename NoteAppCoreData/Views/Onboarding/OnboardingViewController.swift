//
//  OnboardingViewController.swift
//  NoteAppCoreData
//
//  Created by Ada on 8/13/21.
//

import UIKit
import Lottie

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()
        
        slides = [
            OnboardingSlide(title: "Let's talk about loss", description: "We hope the features of this app will be an outlet for emotions, or a self-reflective journal. A daily journaling app might provide foundation in a time where it feels like the ground is caving in beneath your feet...", image: #imageLiteral(resourceName: "IMG_4177")),
            OnboardingSlide(title: "“Grief changes shape, but it never ends” -Keanu Reeves", description: "This app removes the idea of linear 'progress', and the pressure that grief is supposed go away at the 'end'... the emotions that come with loss come and go, similar to the ebbs and flow of waves crashing on the beach shore.", image: #imageLiteral(resourceName: "IMG_4176")),
            OnboardingSlide(title: "How to use this app", description: "1) Every day, enter the title (optional), entry (optional), and your 'wavelength' (required; and up to your interpretation :) ) \n 2) Enjoy a meditating wave animation and sounds after each submission", image: #imageLiteral(resourceName: "IMG_4178")),
            OnboardingSlide(title: "Ted Lasso", description: "'It's funny to think about the things in your life that make you cry just knowing that they existed. Then become the same thing that make you cry knowing that they're now gone...'", image: #imageLiteral(resourceName: "MWtzbtpHLT-4"))
        ]
        
        pageControl.numberOfPages = slides.count
    }
    
    func lottieAnimation() {
        let animationView = AnimationView(name: "lf30_editor_pgwz1u0d")
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        //bigger y, lower the image
        animationView.frame = CGRect(x: -40, y: 450, width: 575, height: 325)
//        animationView.center = view.center
        
    }
    
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            
            // PERSISTENCE !!!
            UserDefaults.standard.hasOnboarded = true
            //UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
    
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
