//
//  ContentView.swift
//  CollectionViewSample
//
//  Created by Balraj Verma on 10/27/20.
//

import SwiftUI

struct ImagesArray : Identifiable {
    var id : Int
    let title, imageUrl : String
}

struct HarmonyCollectionView: View {
    var showPageIndicator: Bool = false
    let images:[ImagesArray] = [
        ImagesArray(id: 0, title: "Zero", imageUrl: "0"),
        ImagesArray(id: 1, title: "First", imageUrl: "1"),
        ImagesArray(id: 2, title: "Second", imageUrl: "2"),
        ImagesArray(id: 3, title: "Third", imageUrl: "3"),
        ImagesArray(id: 4, title: "Forth", imageUrl: "4")
    ]
    
    var body: some View {
        var isFirstRowHorizontalscrollable = true
        GeometryReader { geo in
            List() {
                ForEach(images.indices) { item in
                    if item == 0  && isFirstRowHorizontalscrollable {
                        Group {
                            ScrollView(.horizontal, showsIndicators: true, content: {
                                HStack(spacing: 40){
                                    ForEach(images, id: \.id) { image in
                                        ImageViewWithTitle(image: image)
                                    }
                                }
                                .padding(10)
                            })
                        }
                    }
//                    ForEach(0..<images.count) { _ in // number of rows
//                        HStack {
//                            ForEach(0..<images.count) { _ in
//                                                        Image("\(images[item].imageUrl)")
//                                                            .resizable()
//                                                            .cornerRadius(7)
//                                                            .padding(10)
//                                                            .frame(width: 100, height: 100, alignment: .center)
//                                                            .onTapGesture(perform: {
//                                                                print("-->",images[item].title)
//                                                            })
//                                                        Text("\(images[item].title)")
//                                                            .fontWeight(.bold)
//                                                    }
//                        }
//                    }
                    
                    VStack(){
                        Image("\(images[item].imageUrl)")
                            .resizable()
                            .cornerRadius(7)
                            .padding(10)
                            .frame(width: 100, height: 100, alignment: .center)
                            .onTapGesture(perform: {
                                print("-->",images[item].title)
                            })
                        Text("\(images[item].title)")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}


struct TableViewScroller: View {
    var imageArray = [ImagesArray]()
    var body: some View {
        List(0..<imageArray.count) { image in
            VStack(){
                Image("\(image)")
                    .resizable()
                .padding(10)
                    .frame(width: 100, height: 100, alignment: .center)
                Text("Hello")
                .fontWeight(.bold)
            }
        }

    }
}

struct ImageViewWithTitle: View {
    let image: ImagesArray
    var body: some View {
        ZStack {
            Image(image.imageUrl)
                .resizable()
                .frame(width:100 , height:100 )
                .cornerRadius(12)
                .onTapGesture(perform: {
                    print(image.imageUrl)
                })
            
            Text(image.title)
                .baselineOffset(-80)
                .foregroundColor(Color.white)
                .font(.headline)
                .fontWeight(.bold)
                .onTapGesture(perform: {
                    print(image.title)
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HarmonyCollectionView()
    }
}
 
