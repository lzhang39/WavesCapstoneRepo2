//
//  GraphViewController.swift
//  NoteAppCoreData
//
//  Created by Ada on 8/17/21.
//

import UIKit
import Charts
import TinyConstraints
import CoreData

import Lottie



var selectedJournal : Note!
//var one = selectedJournal.id
//var two = selectedJournal.wavelength

class GraphViewController: UIViewController, ChartViewDelegate {
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemTeal
        
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(5, force: false)
        yAxis.labelTextColor = .white
        yAxis.labelPosition = .outsideChart
        yAxis.axisLineColor = .white
        
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(10, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        setData()
        lottieAnimation()

    }
    func lottieAnimation(){
        let animationView = AnimationView(name: "68988-boating")
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        //bigger y, lower the image
        animationView.frame = CGRect(x: -130, y: 545, width: 600, height: 400)
//        animationView.center = view.center
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    func setData() {
        
//        print("******************************************************************")
//        print(notesLists)
//        print("******************************************************************")
//        let yValues: [ChartDataEntry] = Global.nots.enumerated().map{(index,note) -> ChartDataEntry in
//            return ChartDataEntry(x:Double(index+1), y:Double(note.wavelength)!)
//        }
        
        let set1 = LineChartDataSet(entries: yValues, label: "Entries")
        set1.mode = .cubicBezier
        
        //set1.drawCirclesEnabled = false
        set1.lineWidth = 3
        
        let data = LineChartData(dataSet: set1)
        //data.setDrawValues(false)
        lineChartView.data = data
    }
    
    

    
    
    //x - days, y - Wavelength
    //
    
    
//    let numbers = [7, 8, 9, 10]
//    let array: [(Int, Int)] = numbers.enumerated().map { ($0, $1) }
    

//    let yValues: [ChartDataEntry] = noteList.enumerated().map{(index,note) -> ChartDataEntry in
//        return ChartDataEntry(x:Double(index+1), y:Double(note.wavelength)!)
//    }
    
    
    //all journal entries
    //        SCROLLING feature for large datasets
    
    //allEntries.enumerate().map { ...}
    
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 1.0, y: 40.0),
        ChartDataEntry(x: 2.0, y: 25.0),
        ChartDataEntry(x: 3.0, y: 0.0),
        ChartDataEntry(x: 4.0, y: 50.0),
        ChartDataEntry(x: 5.0, y: 0.0),
        ChartDataEntry(x: 6.0, y: 40.0),

        ChartDataEntry(x: 7.0, y: 10.0),
        ChartDataEntry(x: 8.0, y: 10.0),
        ChartDataEntry(x: 9.0, y: 50.0),
        ChartDataEntry(x: 9.0, y: 50.0),
        ChartDataEntry(x: 10.0, y: 0.0),

    ]
}





//var selectedJournal : Note!
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    Wavelength = selectedJournal.wavelength
//    JournalID = selectedJournal.id
//
//
//}
//
//
//var yourValue: Float {
//        get {
//
//            return NSNumberFormatter().numberFromString(selectedJournal.text!)!.floatValue
//        }
//
//        set {
//            selectedJournal.text = "\(newValue)"
//        }
//
    

