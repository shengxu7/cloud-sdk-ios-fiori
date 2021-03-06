//
//  LineChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/13/20.
//

import SwiftUI

struct LineChart: View {
    @EnvironmentObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(axisDataSource: DefaultAxisDataSource(),
                    chartView: LinesView(),
                    indicatorView: LineIndicatorView())
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LineChart()
                    .environmentObject($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
