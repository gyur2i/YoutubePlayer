//
//  ViewController.swift
//  YoutubePlayer
//
//  Created by 김규리 on 2022/02/14.
//

import UIKit
import YouTubePlayerFramework

class ViewController: UIViewController {
    
    var myView = CustomView() // CustomView 객체 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myView = addCustomView()
        
        // 뷰 레이아웃 설정
        myView.frame = CGRect(x: 0, y: 44, width: 414, height: 233)
        myView.playerView.frame = CGRect(x: 0, y: 44, width: 414, height: 233)
        myView.slProgressPlay.frame = CGRect(x: 0, y: 195, width: 414, height: 39)
        myView.btnFullScreen.frame = CGRect(x: 366, y: 163, width: 48, height: 38)
        myView.lblCurrentTime.frame = CGRect(x: 8, y: 172, width: 50, height: 21)
        myView.lblEndTime.frame = CGRect(x: 73, y: 172, width: 50, height: 21)
        // 슬라이더 thumb 크기, 색상 조절
        myView.changeSlThumbImage(color: .white, size: 10)

        view.addSubview(myView.playerView)
        view.addSubview(myView)
        myView.addSubview(myView.slProgressPlay)
        myView.addSubview(myView.btnFullScreen)
        myView.addSubview(myView.lblCurrentTime)
        myView.addSubview(myView.lblEndTime)
        
        
        myView.setVideoId(videoId: "4twjalDVMEo")
        myView.setIsControlled(isControlled: true)
        myView.loadVideo()

        // 1초 간격으로 setCurrentTime 함수 실행
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setCurrentTime), userInfo: nil, repeats: true)
        
        // UITapGestureRecognizer 클래스 상수 touch 선언
        let touch = UITapGestureRecognizer(target: self, action: #selector(doTouch(_:)))
        myView.addGestureRecognizer(touch)
    }
    

    // 탭 제스처가 인식 되었을 때 실행할 함수
    @objc func doTouch(_ touch: UITapGestureRecognizer) {
        myView.doTouch()
    }
    
    // 동영상 재생 상황에 따라 slider를 움직이기 위한 함수
    @objc func setCurrentTime() {
        myView.setCurrentTime()
    }
    

}

extension ViewController {
    // CustomView.xib의 뷰를 불러오고 리턴하는 함수
    func addCustomView() -> CustomView {
        var customView: CustomView!

        if let copyView = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?.first as? CustomView {
            customView = copyView
            customView.frame = self.view.bounds
            view.addSubview(customView)
        }
        
        customView.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha: 0.0)

        return customView
    }
    
}
