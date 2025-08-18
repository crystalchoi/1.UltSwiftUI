//
//  CalculatorView.swift
//  hello
//
//  Created by crystal on 8/18/25.
//

import SwiftUI

struct CalculatorView: View {
    
   @State var textResult : String = "0"
    
    var body: some View {
        VStack {
           
            
            
            Spacer()
            
            Text(textResult).foregroundColor(.white)
                .font(.system(size:60))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button {
                    textResult = "0"
                } label: {
                    CalculatorButtonLayout(text: "AC", textColor: .white, backgroundColor: Color(uiColor: .gray).opacity(0.85) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "+/-", textColor: .white, backgroundColor: Color(uiColor: .gray).opacity(0.85) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "%", textColor: .white, backgroundColor: Color(uiColor: .gray).opacity(0.85) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "/", textColor: .white, backgroundColor: Color(uiColor: .orange) )
                }
            }
            HStack(spacing: 20) {
                Button {
                    textResult = "1"
                } label: {
                    CalculatorButtonLayout(text: "1", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                }
                Button {
                    textResult = "2"
                    
                } label: {
                    CalculatorButtonLayout(text: "2", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "3", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "x", textColor: .white, backgroundColor: Color(uiColor: .orange) )
                }
            }
            HStack(spacing: 20) {
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "4", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "5", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "6", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "-", textColor: .white, backgroundColor: Color(uiColor: .orange) )
                }
            }
            HStack(spacing: 20) {
                
                CalculatorButtonLayout(text: "7", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                CalculatorButtonLayout(text: "8", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                CalculatorButtonLayout(text: "9", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
                CalculatorButtonLayout(text: "+", textColor: .white, backgroundColor: Color(uiColor: .orange) )
            }
            HStack(spacing: 20) {
                CalculatorButtonLayout(text: "0", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), width: 180)
                CalculatorButtonLayout(text: ",", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
        
                CalculatorButtonLayout(text: "=", textColor: .white, backgroundColor: Color(uiColor: .orange) )
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct CalculatorButtonLayout: View {
    let text: String
    let textColor: Color
    let backgroundColor: Color
    var width: CGFloat = 80
    var height: CGFloat = 80
    
    var body: some View {
        ZStack {
            if width == height {
                Circle().foregroundColor(backgroundColor)
            } else {
                Capsule().foregroundColor(backgroundColor)
            }
            Text(text).font(.largeTitle).fontWeight(.semibold).foregroundColor(textColor)
        }
        .frame(width: width, height: height, alignment: .center )
    }
}

#Preview {
    CalculatorView()
}
