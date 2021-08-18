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

    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData() {
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
  
    let yValues: [ChartDataEntry] = [
        
        //SCROLLING feature for large datasets
        ChartDataEntry(x: 1.0, y: 10.0),
        ChartDataEntry(x: 2.0, y: 25.0),
        ChartDataEntry(x: 3.0, y: 0.0),
        ChartDataEntry(x: 4.0, y: 50.0),
        ChartDataEntry(x: 5.0, y: 0.0),
        ChartDataEntry(x: 6.0, y: 15.0),
        
        ChartDataEntry(x: 7.0, y: 15.0),
        ChartDataEntry(x: 8.0, y: 15.0),
        ChartDataEntry(x: 9.0, y: 15.0),
        ChartDataEntry(x: 9.0, y: 15.0),
        ChartDataEntry(x: 10.0, y: 15.0),
        ChartDataEntry(x: 11.0, y: 15.0),
        ChartDataEntry(x: 12.0, y: 15.0),
        ChartDataEntry(x: 13.0, y: 15.0),
        ChartDataEntry(x: 14.0, y: 15.0),
        ChartDataEntry(x: 15.0, y: 8.0),
        
        ChartDataEntry(x: 16.0, y: 15.0),
        ChartDataEntry(x: 17.0, y: 15.0),
        ChartDataEntry(x: 18.0, y: 15.0),
        ChartDataEntry(x: 19.0, y: 15.0),
        ChartDataEntry(x: 20.0, y: 15.0),
        ChartDataEntry(x: 21.0, y: 15.0),
        ChartDataEntry(x: 22.0, y: 15.0),
        ChartDataEntry(x: 23.0, y: 15.0),
        ChartDataEntry(x: 24.0, y: 15.0),
        ChartDataEntry(x: 25.0, y: 8.0)

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
    
    


