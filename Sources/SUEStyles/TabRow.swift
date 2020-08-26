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

public struct TabRow<H: Hashable, V: View> : View {
    
    var elements : [H]
    @Binding var selected : H?
    var label : (H) -> V
    
    public init(_ items: [H], selected : Binding<H?> = .constant(nil), label: @escaping (H) -> V){
        self.elements = items
        self._selected = selected
        self.label = label
    }
    
    public var body: some View {
        HStack(spacing: 0){
            ForEach(elements, id: \.self){ element in
                SingleTab(element, isSelected: element == selected, label: label)
                    .onTapGesture(count: 1){
                        self.selected = element
                    }
            }
        }.frame(maxHeight: 25)
    }
}

public struct SingleTab<H: Hashable, V: View> : View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var element : H
    var isSelected : Bool
    var label : (H) -> V
    
    public init(_ item: H, isSelected : Bool, label: @escaping (H) -> V){
        self.element = item
        self.isSelected = isSelected
        self.label = label
    }
    
    public var body: some View {
        VStack(spacing: 0){
            if !isSelected {
                Divider()
            }
            HStack{
                Divider()
                Spacer()
                label(element).font(.caption).foregroundColor(isSelected ? Color.primary : colorScheme == .dark ? Color(white: 0.8) : Color(white: 0.2))
                Spacer()
            }
            if isSelected {
                Divider()
            }
        }.background(isSelected ? Color.clear : Color.gray.opacity(0.3))
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    
    static var items = ["One","Two","Three","Four","Five","Six","Seven"]
    
    @State static var selected : String? = "Four"
    
    @State static var mode : Bool = false
    
    static var previews: some View {
        Group {
            VStack{
                HStack{
                    Spacer()
                    Text("Some Title").font(.caption2).padding(3)
                    Spacer()
                }
                
                TabRow(items, selected: $selected) { item in
                    Label(item, systemImage: "circle")
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Selected: \(selected ?? "N/A")").font(.title)
                        Spacer()
                    }
                    Spacer()
                }
                
            }.preferredColorScheme(.light).previewLayout(.fixed(width: 800, height: 300))
            
            
            VStack{
                HStack{
                    Spacer()
                    Text("Some Title").font(.caption2).padding(3)
                    Spacer()
                }
                
                TabRow(items, selected: $selected) { item in
                    Label(item, systemImage: "circle")
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Selected: \(selected ?? "N/A")").font(.title)
                        Spacer()
                    }
                    Spacer()
                }
                
            }.preferredColorScheme(.dark).previewLayout(.fixed(width: 800, height: 300))
        }
    }
}
