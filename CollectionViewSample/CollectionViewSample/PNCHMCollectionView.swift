//
//  PNCHMCollectionView.swift
//  CollectionViewSample
//
//  Created by Balraj Verma on 10/27/20.
//

import SwiftUI


public struct PNCHMCollectionView<PassedCollection, Content>: View where PassedCollection : RandomAccessCollection, Content : View, PassedCollection.Element : Identifiable {
    
    private let isScrollable: Bool
    private let showScrollIndicators: Bool
    private let dataElement: [PassedCollection.Element]
    private let cell: (PassedCollection.Element) -> Content // Return a content cell at row indexpath
    private let thisRowHorizontalScrolls: Bool
    private let scrollHorizontalAtRow: Int // MARK:- Make sure this number is not big than the passed element array count do the case handling there. else app can crash.
    
    //MARK: try pager view 
    public init(_ dataElement: PassedCollection, isScrollable: Bool = true, showScrollIndicators: Bool = false, thisRowHorizontalScrolls: Bool = false, scrollHorizontalAtRow: Int = -1, content: @escaping (PassedCollection.Element) -> Content) {
      self.dataElement = dataElement.map { $0 }
      self.cell = content
      self.isScrollable = isScrollable
      self.showScrollIndicators = showScrollIndicators
      self.thisRowHorizontalScrolls = thisRowHorizontalScrolls
      self.scrollHorizontalAtRow = scrollHorizontalAtRow
    }
    
    public var body: some View {
        GeometryReader { geo in
            List() {
                ForEach(dataElement.indices) { item in
                    if (item == scrollHorizontalAtRow && (thisRowHorizontalScrolls == true && scrollHorizontalAtRow <= dataElement.count)) {
                        Group {
                            ScrollView(.horizontal, showsIndicators: showScrollIndicators, content: {
                                HStack(spacing: 40){
                                    ForEach(dataElement, id: \.id) { image in
                                        ImageViewWithTitle(image: image as! ImagesArray)

                                    }
                                }
                                .padding(10)
                            })
                        }
                    }
                    VStack(){
                        if let imageName = (dataElement[item] as? ImagesArray)?.imageUrl {
                            Image("\(imageName)")
                                .resizable()
                                .cornerRadius(7)
                                .padding(10)
                                .frame(width: 100, height: 100, alignment: .center)
                                .onTapGesture(perform: {
                                    print(dataElement[item])
                                })
                        }
                        
                        Text("\((dataElement[item] as? ImagesArray)!.title)")
                            .fontWeight(.bold)
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
                    

                }
            }
        }
    }
    

}

