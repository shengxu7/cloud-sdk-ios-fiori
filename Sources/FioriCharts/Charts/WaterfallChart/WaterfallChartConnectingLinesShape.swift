//
//  WaterfallChartConnectingLinesShape.swift
//  
//
//  Created by Xu, Sheng on 12/9/20.
//

import SwiftUI

struct WaterfallChartConnectingLinesShape: Shape {
    let path: [[[Path]]]
    let seriesIndex: Int
    let startIndex: Int
    let endIndex: Int
    
    func path(in rect: CGRect) -> Path {
        guard seriesIndex >= 0, startIndex >= 0, startIndex <= endIndex, path.count > seriesIndex, !path[seriesIndex].isEmpty, path[seriesIndex].count > endIndex else {
            return Path()
        }
        
        var seriesPath = Path()
        for index in startIndex ... endIndex {
            let categoryPath = path[seriesIndex][index]
            
            if let linePath = categoryPath.last {
                seriesPath.addPath(linePath)
            }
        }
        
        return seriesPath
            .applying(CGAffineTransform(scaleX: rect.size.width, y: rect.size.height))
    }
}
