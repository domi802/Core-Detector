//
//  ContentView.swift
//  CorelmageSwiftUIIntegration
//
//  Created by Dominik Woźniak on 15/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    let images = ["cat1","dog","tree","mountains"]
    @State private var selectedImage = ""
    @ObservedObject private var ImageDetectionVM: ImageDetectionViewModel
    private var imageDetectionManager: ImageDetectionManager
    
    init(){
        self.imageDetectionManager = ImageDetectionManager()
        self.ImageDetectionVM = ImageDetectionViewModel(manager: self.imageDetectionManager)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView([.horizontal]){
                    HStack{
                        ForEach(self.images,id: \.self){name in
                            Image(name)
                                .resizable()
                                .frame(width:300, height:300)
                                .padding()
                                .onTapGesture {
                                    self.selectedImage = name
                                }.border(Color.black, width: self.selectedImage == name ? 10 : 0)
                        }
                    }
                }
                Button("Detect"){
                    self.ImageDetectionVM.detect(self.selectedImage)
                }.padding()
                    .background(.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Text(self.ImageDetectionVM.predictionLabel)
            }
            .navigationBarTitle("Core ML")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
