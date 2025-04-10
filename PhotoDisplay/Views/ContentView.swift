import SwiftUI
import Vision
import CoreML

struct ContentView: View {
    @StateObject private var viewModel = ImageViewModel()
    @State private var isNavigationActive = false
    @State var service = DataService()
    @State var output : String = ""
    let model = try? fruitsIdentifier(configuration: MLModelConfiguration())
    @State var nutrients : DataModel = DataModel(items: [item]())
    @State private var navigationPath = NavigationPath()
    @State var quantity : String = ""
    @State private var isAnimate : Bool = false
    var body: some View {
        
        NavigationStack(path: $navigationPath){
            ZStack{
                
                Image("fruitWall2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                        
                        if let image = viewModel.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 300)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .opacity(0.6)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 300)
                        }
                        
                        HStack {
                            Button(action: viewModel.showCamera) {
                                Text("📷")
                                    .font(.title)
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            Button(action: viewModel.showPhotoPicker) {
                             Text("🌄")
                                    .font(.title)
                            }
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding()
            
                    HStack{
                        Text("Quantity:")
                            .font(.title)
                            .bold()
                        
                        TextField("in grams", text: $quantity)
                            .textFieldStyle(.roundedBorder)
                            .background(Color.gray)
                            .frame(width: 100)
                            .padding()
                    }
                   
                      
                    Button{
                        let image = viewModel.image
                        
                        let resizedImage = image?.resizeTo(to: CGSize(width: 229, height: 229))
                        
                        guard let buffer = resizedImage?.toCVPixelBuffer() else {
                            return
                        }
                        
                        do{
                            let prediction = try model?.prediction(image: buffer)
                            
                            output = prediction?.target ?? "no output"
                            //print(prediction?.target ?? "no output")
                        }
                        catch{
                            print(error)
                        }
                        
                        Task{
                            nutrients = await service.getData(query: output, grams: quantity)
                            navigationPath.append("NutrientsView")
                        }
                        
                    }label: {
                        
                        VStack{
                            ZStack{
                                
                                
                                    
                                    Text("🔍 Analyze")
                                        .frame(width: isAnimate ? 200 : 150
                                               ,height:60)
                                        .font(.title2)
                                        .foregroundStyle(.white)
                                        .background(isAnimate ? Color.accentColor : Color.orange)
                                        .cornerRadius(20)
                                
                                
                            }
                            .offset(y: isAnimate ? 0 : 40)
                        }.animation(.easeIn(duration: 2).repeatForever(), value: isAnimate)
                       
                    }.onAppear{
                        isAnimate.toggle()
                    }
                        
                    }
                .navigationDestination(for: String.self) { destination in
                    if destination == "NutrientsView" {
                        NutrientsView(nutrients: $nutrients, image: viewModel.image)
                                    }
                }
            }
       
        }
        .sheet(isPresented: $viewModel.showingImagePicker) {
            ImagePicker(selectedImage: $viewModel.image, sourceType: viewModel.sourceType)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

