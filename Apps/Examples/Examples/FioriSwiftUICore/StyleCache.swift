//
//  StyleCache.swift
//  Examples
//
//  Created by Stadelman, Stan on 9/28/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import FioriSwiftUICore
//import AnyCodable

//struct StyleSheet: Decodable {
//    let palette: [String: Color]
//
//    let styles2: [String: AnyDecodable]
//    let styles4: [String: TextStyle]
//
//    let styles5: [String: AnyViewModifier]
//
//    private enum CodingKeys: CodingKey {
//        case palette, styles
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let keyPairMap = try container.decode([String: String].self, forKey: .palette)
//        self.palette = try keyPairMap.mapValues({ try Color(hexCode: $0) })
//
//
//        self.styles2 = try container.decode([String: AnyDecodable].self, forKey: .styles)
//        self.styles4 = try container.decode([String: TextStyle].self, forKey: .styles)
//        self.styles5 = [:]
//    }
//}

//public class StyleCache: ObservableObject {
////    var userDefaults: UserDefaults = UserDefaults()
//    static let shared = StyleCache()
//    var styles: StyleSheet!
//    init() {
//        do {
//            styles = try JSONDecoder().decode(StyleSheet.self, from: jsonData)
//
//            print(styles.palette.map(\.value))
//            print(styles.styles2.map(\.key))
//
//        } catch {
//            print(error)
//        }
//    }
//
////    subscript<T: IStyle>(dynamicMember string: String) -> T? {
////        if let style = styles.styles[string] {
////            return style.value as? T
////        } else {
////            let components = string.components(separatedBy: ":")
////            let value: AnyIStyle? = components.reduce(into: nil) { prev, next in
////                guard let accumulator = prev else {
////                    prev = styles.styles[next]
////                    return
////                }
////                if let style = styles.styles[next] {
////                    prev = accumulator.value
////                }
////            }
////        }
////
////    }
//}

struct ObjectItemStyle {
    
    let titleStyle: TextStyle
    let detailImageStyle: ImageStyle
    
    let _accentColor: Color?
    let _background: Color?
}



let jsonData: Data = """
{
"palette": {
    "@samprimary1": "#ff0000",
    "@samprimary2": "#0040ff",
    "@samprimary3": "#33cc33",
    "@samprimary4": "#cc6600",
    "@samprimary5": "#ffbb33",
    "@samprimary6": "#A65395",
    "@samprimary7": "#9BE1FF",
    "@samprimary8": "#42CCC8",
    "@samprimary9": "#B0D450",
    "@samprimary10": "#895600",
    "@samprimary11": "#6A6D70",
    
    "@samblue1": "#3333cc",
    "@samblue2": "#7070db",
    "@samblue3": "#adadeb",
    "@samblue4": "#3678af",
    
    "@samred1": "#ff0000",
    "@samred2": "#ff3333",
    "@samred3": "#ff6666",
    "@samred4": "#D9364C",
    "@samred5": "#BB0000",
    
    "@samgreen1": "#339966",
    "@samgreen2": "#39ac63",
    "@samgreen3": "#79d2a6",
    "@samgreen4": "#107E3E",
    
    "@samblack": "#000000",
    "@samgridblack": "#32363A",
    
    "@sambackground1": "#ffe6e6",
    "@sambackground2": "#e6f0ff",
    "@sambackground3": "#ffd9cc",
    "@sambackground4": "#cce0ff",
    "@sambackground5": "#ffc6b3",
    "@sambackground6": "#b3d1ff",
    "@sambackground7": "#ffb399",
    "@sambackground8": "#80b3ff",
    "@sambackground9": "#ff9f80",
    "@sambackground10": "#66a3ff",
    
    "@samBackgroundLightGrey": "#f2f2f2",
    "@samBackgroundLightGrey": "#f2f2f2",
    "@samBackgroundWhite": "#ffffff",
    
    "@samFootnotePrimary": "#76767B",
    "@samCaptionBlack": "#3F3A3A",
    
    "@samKPIFontColor": "#76767B",
    "@mdkBlue1": "#3333cc"
},
"styles": {
"FormCellLabelCritical": {
    "font-color": "@samprimary1",
    "font-name": "boldSystem",
    "font-size": 14
},
"FormCellLabelStandard": {
    "font-color": "@samprimary2",
    "font-name": "thinSystem",
    "font-size": 12
},
"FormCellValueCritical": {
    "font-color": "@samprimary9",
    "font-name": "boldSystem",
    "font-size": 16
},
"FormCellValueStandard": {
    "font-color": "@samprimary10",
    "font-name": "thinSystem",
    "font-size": 12
},
"FormCellLabelPropertyStandard": {
    "font-color": "@samred1",
    "font-name": "italicSystem",
    "font-size": 14
},
"FormCellLabelPropertyCritical": {
    "font-color": "@samblue1",
    "font-name": "boldSystem",
    "font-size": 14
},
"FormCellValuePropertyStandard": {
    "font-color": "@samred2",
    "font-name": "italicSystem",
    "font-size": 12
},
"FormCellValuePropertyCritical": {
    "font-color": "@samblue2",
    "font-name": "boldSystem",
    "font-size": 12
},
"FormCellLabelPickerStandard": {
    "font-color": "@samred1",
    "font-name": "italicSystem",
    "font-size": 14
},
"FormCellLabelPickerCritical": {
    "font-color": "@samblue1",
    "font-name": "boldSystem",
    "font-size": 14
},
"FormCellValuePickerStandard": {
    "font-color": "@samred2",
    "font-name": "italicSystem",
    "font-size": 12
},
"FormCellValuePickerCritical": {
    "font-color": "@samblue2",
    "font-name": "boldSystem",
    "font-size": 12
},
"FormCellBackgroundCritical": {
    "background-color": "@sambackground1",
    "tint-color": "@sambackground3",
    "font-color": "@samprimary3",
    "font-name": "italicSystem",
    "font-size": 14
},
"FormCellBackgroundStandard": {
    "background-color": "@sambackground2",
    "tint-color": "blue",
    "font-color": "@samprimary4",
    "font-name": "thinSystem",
    "font-size": 12
},
"FormCellBackgroundCriticalTitle": {
    "background-color": "@samgreen1",
    "tint-color": "purple",
    "font-color": "@samprimary3",
    "font-name": "italicSystem",
    "font-size": 12
},
"FormCellBackgroundStandardTitle": {
    "background-color": "@samgreen3",
    "tint-color": "@samgreen1",
    "font-color": "@samprimary4",
    "font-name": "thinSystem",
    "font-size": 10
},
"FormCellSwitchStandard": {
    "on-tint-color": "@samblue3",
    "tint-color": "@sambackground8",
    "thumb-tint-color": "brown"
},
"FormCellSwitchCritical": {
    "on-tint-color": "@samred3",
    "tint-color": "@sambackground7",
    "thumb-tint-color": "yellow"
},
"FormCellNoteTextCritical": {
    "font-color": "@samred3",
    "font-name": "boldSystem",
    "font-size": 14
},
"FormCellNoteTextStandard": {
    "font-color": "@samblue3",
    "font-name": "thinSystem",
    "font-size": 12
},
"FormCellTitleTextCritical": {
    "font-color": "@samred2",
    "font-name": "boldSystem",
    "font-size": 14
},
"FormCellTitleTextStandard": {
    "font-color": "@samblue2",
    "font-name": "thinSystem",
    "font-size": 12
},
"FormCellBackgroundNotEditable": {
    "background-color": "@samBackgroundWhite"
},
"FormCellBackgroundEditable": {
    "background-color": "@samBackgroundWhite"
},
"ObjectCellStyleBlack": {
    "font-color": "@samblack"
},
"ObjectCellStyleRed": {
    "tint-color": "@samred4"
},
"FootnotePrimary": {
    "font-color": "@samFootnotePrimary"
},
"ResetRed": {
    "font-color": "@samred4"
},
"FormCellButton": {
    "font-color": "@samblue4"
},
"FormCellReadOnlyEntry": {
    "font-color": "#76767B"
},
"GrayText": {
    "font-color": "@samFootnotePrimary"
},
"FormCellTextEntry": {
    "font-color": "#3F3A3A"
},
"Color_2A6D3C": {
    "font-color": "#3A835B"
},
"Color_0000": {
    "font-color": "#000000"
},
"Color_DE890D": {
    "font-color": "#FFA325"
},
"Color_930A0A": {
    "font-color": "#D9364C"
},
"Color_AFD149": {
    "font-color": "#3A835B"
},
"GridTableTextBlack": {
    "font-color": "@samgridblack"
},
"GridTableTextBlackLarge": {
    "font-color": "@samgridblack",
    "font-size": 16
},
"GridTableHeaderText": {
    "font-color": "#6A6D70"
},
"GridTableRowText": {
    "font-color": "#393E42",
    "font-size": 14
},
"ObjectHeaderKPITintColor": {
    "tint-color": "@samBackgroundWhite",
    "font-color": "@samBackgroundWhite"
},

"ObjectHeaderKPICaption": {
    "font-size": 30,
    "font-color": "@samBackgroundWhite",
    "font-style": "UIFontTextStyleBody"
},

"RejectedRed": {
    "font-color": "@samred5"
},

"AcceptedGreen": {
    "font-color": "@samgreen4"
},

"KPIHeaderTintNoLinkColor": {
    "tint-color": "@mdkBlue1",
    "font-color": "@samKPIFontColor"
},

"SignatureCaptureFormCellValue": {
    "font-color": "@samprimary11"
}
}
}
""".data(using: .utf8)!
