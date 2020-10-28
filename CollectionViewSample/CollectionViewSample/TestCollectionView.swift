//
//  TestCollectionView.swift
//  CollectionViewSample
//
//  Created by Balraj Verma on 10/27/20.
//

import SwiftUI

struct TestCollectionView: View {
    
    let images:[ImagesArray] = [
        ImagesArray(id: 0, title: "Zero", imageUrl: "0"),
        ImagesArray(id: 1, title: "First", imageUrl: "1"),
        ImagesArray(id: 2, title: "Second", imageUrl: "2"),
        ImagesArray(id: 3, title: "Third", imageUrl: "3"),
        ImagesArray(id: 4, title: "Forth", imageUrl: "4")
    ]
    
    var body: some View {
        
       // PagerView()
        
       PNCHMCollectionView(images, isScrollable: true, showScrollIndicators: true,  thisRowHorizontalScrolls: true, scrollHorizontalAtRow: 1){
        ImageViewWithTitle(image: $0)
      }
    }
}


struct PagerView : View {
    var body: some View {
        TabView {
            ForEach(0..<5) { _ in
                ZStack {
                    Text("Hello")
                        .frame(width: 200, height: 200)
                        .background(Color.red)
                }.clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width  , height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .background(Color.orange)
    }
}



//
//TabView {
//    ForEach(dataElement.indices) {   item  in
//        ZStack {
//            ImageViewWithTitle(image: dataElement[item] as! ImagesArray)
//        }
//    }
//    .padding(.all, 5)
//}
//.frame(width: UIScreen.main.bounds.width , height: 200, alignment: .leading)
//.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//.background(Color.black)
//




struct TestCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TestCollectionView()
    }
}
