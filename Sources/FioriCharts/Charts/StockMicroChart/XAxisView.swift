//
//  XAxisView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct XAxisView: View {
    @EnvironmentObject var model: ChartModel
    
    let textColor = Color(#colorLiteral(red: 0.4376021028, green: 0.4471841455, blue: 0.4600644708, alpha: 1))
    var rect: CGRect
    
    var body: some View {
        let xAxisTitles = calXAxisTitles()
        
        return ZStack {
            if !self.model.categoryAxis.gridlines.isHidden || !self.model.categoryAxis.labels.isHidden {
                ForEach(xAxisTitles) { title in
                    // grid lines
                    if !self.model.categoryAxis.gridlines.isHidden {
                        LineShape(pos1: CGPoint(x: self.calXPosforXAxisElement(dataIndex: title.index, rect: self.rect),
                                                y: 0),
                                  pos2: CGPoint(x: self.calXPosforXAxisElement(dataIndex: title.index, rect: self.rect),
                                                y: self.rect.origin.y))
                            .stroke(Color(hex: self.model.categoryAxis.gridlines.color),
                                    style: StrokeStyle(lineWidth: CGFloat(self.model.categoryAxis.gridlines.width),
                                                       dash: [CGFloat(self.model.categoryAxis.gridlines.dashPatternLength), CGFloat(self.model.categoryAxis.gridlines.dashPatternGap)]))
                    }
                    
                    if !self.model.categoryAxis.labels.isHidden {
                        // category labels
                        Text(title.title)
                            .font(.system(size: CGFloat(self.model.categoryAxis.labels.fontSize)))
                            .foregroundColor(Color(hex: self.model.categoryAxis.labels.color))
                            .position(x: self.calXPosforXAxisElement(dataIndex: title.index, rect: self.rect),
                                      y: self.rect.origin.y + self.rect.size.height / 2)
                    }
                }
            }
            
            // bottom solid line
            if !model.categoryAxis.baseline.isHidden {
                LineShape(pos1: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y),
                          pos2: CGPoint(x: rect.origin.x, y: rect.origin.y))
                    .stroke(Color(hex: self.model.categoryAxis.baseline.color),
                            style: StrokeStyle(
                                lineWidth: CGFloat(self.model.categoryAxis.baseline.width),
                                dash: [CGFloat(self.model.categoryAxis.baseline.dashPatternLength), CGFloat(self.model.categoryAxis.baseline.dashPatternGap)]))
            }
        }
    }
    
    func calXAxisTitles() -> [AxisTitle] {
        let width = rect.size.width
        let startPosInFloat = CGFloat(model.startPos)
        let unitWidth: CGFloat = width * model.scale / CGFloat(StockUtility.numOfDataItmes(model) - 1)
        let startIndex = Int((startPosInFloat / unitWidth).rounded(.up))
        let endIndex = Int(((startPosInFloat + width) / unitWidth).rounded(.down))
        
        var result: [AxisTitle] = []
        
        guard let startDate = getDateAtIndex(startIndex),
            let endDate = getDateAtIndex(endIndex) else {
                return result
        }
        
        let duration = endDate.timeIntervalSince(startDate)
        
        if duration < 60 {
            result = findData(startIndex: startIndex, endIndex: endIndex, component: .second)
        }
        else if duration < 3600 {
            result = findData(startIndex: startIndex, endIndex: endIndex, component: .minute)
        }
        else if duration < 3600 * 24 { // hour
            result = findData(startIndex: startIndex, endIndex: endIndex, component: .hour)
        }
        else if duration < 3600 * 24 * 60 { // day
            result = findData(startIndex: startIndex, endIndex: endIndex, component: .day)
        }
        else if duration < 3600 * 24 * 31 * 14 { // month
            result = findData(startIndex: startIndex, endIndex: endIndex, component: .month)
        }
        else { // year
            result = findData(startIndex: startIndex, endIndex: endIndex, component: .year)
        }
        
        // trim results if there are too many
        if result.count > 6 {
            let ratio = Float(result.count) / 4
            var tmp: [AxisTitle] = []
            for i in 1...5 {
                var index = Int(Float(i) * ratio - 0.5)
                if index >= result.count {
                    index = result.count - 1
                }
                tmp.append(result[index])
            }
            
            return tmp
        }
        
        return result
    }
    
    func findData(startIndex: Int, endIndex: Int, component: Calendar.Component, skipFirst: Bool = true) -> [AxisTitle] {
        var result: [AxisTitle] = []
        
        var prev = -1
        for i in startIndex...endIndex{
            guard let date = getDateAtIndex(i) else { return result }
            let cur = Calendar.current.component(component, from: date)
            if prev == -1 && skipFirst {
                prev = cur
            } else if cur != prev {
                switch component {
                case .month:
                    result.append(AxisTitle(index: i, title: monthAbbreviationFromInt(cur)))
                    
                case .day:
                    let components = Calendar.current.dateComponents([.month, .day], from: date)
                    var title: String = ""
                    if let month = components.month {
                        title.append(String(month))
                    }
                    
                    if let day = components.day {
                        if !title.isEmpty {
                            title.append("/")
                        }
                        title.append(String(day))
                    }
                    
                    result.append(AxisTitle(index: i, title: title))
                    
                case .hour, .minute:
                    let components = Calendar.current.dateComponents([.hour, .minute], from: date)
                    var title: String = ""
                    if let hour = components.hour {
                        title.append(String(hour))
                    }
                    
                    if let minute = components.minute {
                        if !title.isEmpty {
                            title.append(":")
                        }
                        if minute < 10 {
                            title.append("0")
                        }
                        
                        title.append(String(minute))
                    }
                    
                    result.append(AxisTitle(index: i, title: title))
                    
                default:
                    result.append(AxisTitle(index: i, title: String(cur)))
                }
                
                prev = cur
            }
        }
        
        return result
    }
    
    func calXPosforXAxisElement(dataIndex: Int, rect: CGRect) -> CGFloat {
        if dataIndex == 0 {
            return rect.origin.x
        }
        
        let width = rect.size.width    
        let unitWidth: CGFloat = width * model.scale / CGFloat(StockUtility.numOfDataItmes(model) - 1)
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        return rect.origin.x + startOffset + CGFloat(dataIndex - startIndex) * unitWidth
    }
    
    func getDateAtIndex(_ index: Int) -> Date? {
        return StockUtility.categoryValueInDate(model, categoryIndex: index)
    }
    
    func monthAbbreviationFromInt(_ month: Int) -> String {
        let ma = Calendar.current.shortMonthSymbols
        return ma[month - 1]
    }
}

struct XAxisView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) {
                XAxisView(rect: CGRect(x: 0, y: 180, width: 300, height: 20)).environmentObject($0)
            }
            .frame(width:300, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}