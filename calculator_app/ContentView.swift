import SwiftUI

struct CalcButton: View {
    let title: String
    let bg: Color
    var textColor: Color = .white
    
    var body: some View {
        Button(action: {}) {
            Text(title)
                .font(.system(size: 26))
                .foregroundColor(textColor)
                .frame(width: 75, height: 55)
                .background(bg)
                .cornerRadius(8)
        }
    }
}

struct ContentView: View {
    @State private var expression = "0"
    
    let turquouse = Color(red: 0.0, green: 0.7, blue: 0.75)
    let gray = Color(red: 0.28, green: 0.32, blue: 0.36)
    let beige = Color(red: 0.75, green: 0.75, blue: 0.72)
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.35, green: 0.4, blue: 0.45),
                    Color(red: 0.25, green: 0.28, blue: 0.32)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0){
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(expression)
                        .font(.system(size: 24))
                        .foregroundColor(.white.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        CalcButton(title: "AC", bg: turquouse)
                        CalcButton(title: "+/-", bg: turquouse)
                        CalcButton(title: "%", bg: turquouse)
                        CalcButton(title: "÷", bg: turquouse)
                    }
                    
                    HStack(spacing: 4) {
                        CalcButton(title: "7", bg: gray)
                        CalcButton(title: "8", bg: gray)
                        CalcButton(title: "9", bg: gray)
                        CalcButton(title: "x", bg: gray)
                    }
                    
                    HStack(spacing: 4) {
                        CalcButton(title: "4", bg: gray)
                        CalcButton(title: "5", bg: gray)
                        CalcButton(title: "6", bg: gray)
                        CalcButton(title: "-", bg: gray)
                    }
                    
                    HStack(spacing: 4) {
                        CalcButton(title: "1", bg: gray)
                        CalcButton(title: "2", bg: gray)
                        CalcButton(title: "3", bg: gray)
                        CalcButton(title: "+", bg: gray)
                    }
                    
                    HStack(spacing: 4) {
                        CalcButton(title: "<", bg: gray)
                        CalcButton(title: "0", bg: gray)
                        CalcButton(title: ".", bg: gray)
                        CalcButton(title: "=", bg: beige, textColor: .black)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ContentView()
}
