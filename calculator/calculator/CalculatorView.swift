//
//  CalculatorView.swift
//  hello
//
//  Created by crystal on 8/18/25.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var operation: String = "AC" {
        willSet {
            performOperationWillSet(newValue: newValue, oldValue: self.operation)
        }
        didSet {
            performOperationDidSet(operation: oldValue)
        }
        
    }
    @State var firstNumber: Double = 0 {
        willSet {
            textResult = "\(newValue)"
        }
    }
    @State var secondNumber: Double = 0 {
        willSet {
            textResult = "\(newValue)"
        }
    }
   @State var textResult : String = "0"
    
    var body: some View {
        VStack {
            Text("\(firstNumber)").foregroundColor(.white)
                .font(.system(size:30))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            Text("\(secondNumber)").foregroundColor(.white)
                .font(.system(size:30))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            Text(operation).foregroundColor(.white)
                .font(.system(size:30))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
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
                    textResult = "+"
                    
                } label: {
                    CalculatorButtonLayout(text: "+/-", textColor: .white, backgroundColor: Color(uiColor: .gray).opacity(0.85) )
                }
                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: "%", textColor: .white, backgroundColor: Color(uiColor: .gray).opacity(0.85) )
                }
               OperatorButton(value: "/")
            }
            HStack(spacing: 20) {
                NumberButton(number: 7, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                NumberButton(number: 8, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                NumberButton(number: 9, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                OperatorButton(value: "+")
            }
            HStack(spacing: 20) {
                NumberButton(number: 4, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                NumberButton(number: 5, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                NumberButton(number: 6, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                OperatorButton(value: "-")
        
            }
           
            HStack(spacing: 20) {
                NumberButton(number: 1, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                NumberButton(number: 2, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                NumberButton(number: 3, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                OperatorButton(value: "x")
               
            }
            HStack(spacing: 20) {
                NumberButton(number: 0, operation: operation, firstNumber: $firstNumber, secondNumber: $secondNumber)
                OperatorButton(value: ",")
                OperatorButton(value: "=")

            }
            .preferredColorScheme(.dark)
        }
    }
    
    
    func performOperationWillSet(newValue: String, oldValue: String) {
       print(newValue, oldValue)
        
    }
    func performOperationDidSet(operation: String) {
        if operation == "+" {
            let result = firstNumber + secondNumber
            secondNumber = 0
            firstNumber = result
        } else if operation == "-" {
            let result = firstNumber - secondNumber
            secondNumber = 0
            firstNumber = result
        } else if operation == "x" {
            let result = firstNumber * secondNumber
            secondNumber = 0
            firstNumber = result
        } else if operation == "/" {
            let result = firstNumber / secondNumber
            secondNumber = 0
            firstNumber = result
        }
                
    }
}


struct NumberButton: View {
    var number: Int = 0
    var operation: String
    @Binding var firstNumber: Double
    @Binding var secondNumber: Double

    var body: some View {
        Button {
            if operation == "AC" {
                if firstNumber == 0 {
                    firstNumber = Double(number)
                } else {
                    firstNumber = firstNumber * 10 + Double(number)
                }
            } else {
                if secondNumber == 0 {
                    secondNumber = Double(number)
                } else {
                    secondNumber = secondNumber * 10 + Double(number)
                }
            }
        } label: {
            if number == 0 {
                CalculatorButtonLayout(text: "\(number)", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), width: 180, height: 80 )
            } else {
                CalculatorButtonLayout(text: "\(number)", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75) )
            }
        }
    }
}
struct OperatorButton: View {
    var value: String = ""
    var body: some View {
        Button {
            
        } label: {
                CalculatorButtonLayout(text: value, textColor: .white, backgroundColor: Color(uiColor: .orange) )
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
