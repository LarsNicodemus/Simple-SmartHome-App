//
//  PopOverView.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 20.11.24.
//

import SwiftUI

struct PopOverView: View {
    var body: some View {
            HStack{
                    
                VStack{
                        ForEach(PopupSelection.allCases) { selection in

                                        Image(systemName: selection.symbolName1)
                        }
                    }
                .padding(.trailing)
                VStack(alignment: .leading){
                    ForEach(PopupSelection.allCases) { selection in

                        Text(selection.rawValue)
                    }
                }
                }
            
            .padding()
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PopOverView()
}
