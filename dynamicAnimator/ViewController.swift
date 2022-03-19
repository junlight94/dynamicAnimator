//
//  ViewController.swift
//  dynamicAnimator
//
//  Created by Junyoung Lee on 2022/03/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var outView: UIView!
    
    var dynamic = UIDynamicAnimator()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //MARK: refernceView outView로 설정
        dynamic = UIDynamicAnimator(referenceView: outView)
        
        //MARK: 중력 설정
        let gravity = UIGravityBehavior(items: [orangeView])
        
        //MARK: 충돌 설정
        let collision = UICollisionBehavior(items: [orangeView])
        //설정된 referenceView 경계와 충돌 설정
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //MARK: 탄성 설정
        let behavior = UIDynamicItemBehavior(items: [orangeView])
        // 값이 높을 수록 탄성 up
        behavior.elasticity = 0.7
        
        //MARK: 설정한 애니메이션 추가
        dynamic.addBehavior(gravity)
        dynamic.addBehavior(collision)
        dynamic.addBehavior(behavior)
        
    }


}

