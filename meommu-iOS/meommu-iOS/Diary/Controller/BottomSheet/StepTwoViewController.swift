//
//  StepTwoViewController.swift
//  meommu-iOS
//
//  Created by 이예빈 on 2023/09/26.
//

import UIKit
import PanModal


class StepTwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        registerXib()
        
        steptwoTableVlew.delegate = self
        steptwoTableVlew.dataSource = self

        
    }
    
    // 3단계 바텀시트 생성하기
    @IBOutlet var steptwoNextButton: UIButton!
    
    @IBAction func OnClick_steptwoNextButton(_ sender: Any) {
        
    }
    
    // -----------------------------------------
    // 2단계 바텀 시트 설정하기

    
    // TableView 설정
    @IBOutlet var steptwoTableVlew: UITableView!
    
    var detailData: [String] = ["산책을 오래 했어요", "산책 중 맛있는 간식을 많이 먹었어요", "산책 중 친한 강아지를 만나 대화 했어요", "걸음을 아주 천천히 걸었어요", "나만의 문장 추가하기"]
    
    let cellName = "StepTwoTableViewCell"
    let cellReuseIdentifire = "StepTwoCell"
    
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        steptwoTableVlew.register(nibName, forCellReuseIdentifier: cellReuseIdentifire)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return detailData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = steptwoTableVlew.dequeueReusableCell(withIdentifier: cellReuseIdentifire, for: indexPath) as! StepTwoTableViewCell
        cell.detailLabel.text = detailData[indexPath.section]
        
        // cell 선택 시 배경 컬러 없애기
        cell.selectionStyle = .none
        
        return cell
    }
    
    // cell 선택 시 배경색 변경
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! StepTwoTableViewCell
        cell.contentView.backgroundColor = UIColor(named: "primaryA")
        cell.detailLabel.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! StepTwoTableViewCell
        cell.contentView.backgroundColor = UIColor(named: "BlueGray400")
        cell.detailLabel.textColor = UIColor(named: "BlueGray200")
    }
    
}

extension StepTwoViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    // 짧은 형태의 높이 설정
    var shortFormHeight: PanModalHeight {
        return .contentHeight(519)  // 바텀 시트의 높이 설정
    }
    
    // 긴 형태의 높이 설정
    var longFormHeight: PanModalHeight {
        //위에서부터 떨어지게 설정
        return .maxHeightWithTopInset(293)
    }
    
    // 상단 코너를 둥글게 설정
    var shouldRoundTopCorners: Bool {
        return true
    }
    
    // 상단 코너의 반경을 설정
    var cornerRadius: CGFloat {
        return 20.0  // 둥근 모서리 설정
    }
    
    // 최상단 스크롤 불가
    var anchorModalToLongForm: Bool {
        return false
    }
}
