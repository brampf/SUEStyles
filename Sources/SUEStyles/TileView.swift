/*
 
 Copyright (c) <2020>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */

import SwiftUI

public struct Tile<C: View> : View {
    
    @Environment(\.colorScheme) var scheme
    
    var title : String?
    var hue : Double = Double.random(in: 0...1)
    var content: (() -> C)
    
    public init(_ name: String? = nil, hue: Double = Double.random(in: 0...1), content: @escaping () -> C) {
        self.title = name
        self.hue = hue
        self.content = content
    }
    
    public var body : some View {
        
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .top, spacing: 0){
                Text(title ?? "").font(.title).bold()
                Spacer()
            }.foregroundColor(.white).padding(.horizontal, 15)
            content().foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.vertical)
        }.padding(5).background(background)
            //.shadow(color: ccolor, radius: 3)
            .padding([.horizontal,.top],6)
        
    }
    
    var textColor : Color {
        if scheme == .light {
            return Color.white
        } else {
            return Color.black
        }
    }
    
    var background : some View {
        VStack(spacing: 0){
            LinearGradient(gradient: Gradient(colors: [ccolor,bcolor]), startPoint: .top, endPoint: .bottom).frame(height: 50)
            Rectangle().foregroundColor(bcolor)
        }.cornerRadius(25)
    }
    
    var acolor : Color {
        return Color(hue: hue, saturation: 1, brightness: 1)
    }
    
    var bcolor : Color {
        return Color(hue: hue, saturation: 0.8, brightness: 0.9)
    }
    
    var ccolor : Color {
        return Color(hue: hue, saturation: 1, brightness: 0.8)
    }
    
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Tile("Test", hue: 0.23) {
                Text("Hello World")
            }.previewDisplayName("With Title").previewLayout(.fixed(width: 300, height: 300))
            Tile(hue: 0.45) {
                Text("What?")
            }.previewDisplayName("Without Title").previewLayout(.fixed(width: 300, height: 300))
        }
    }
}
