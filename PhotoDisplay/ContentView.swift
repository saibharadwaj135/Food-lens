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
    var body: some View {
        
        NavigationStack(path: $navigationPath){
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
                        Label("Take Photo", systemImage: "camera")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button(action: viewModel.showPhotoPicker) {
                        Label("Choose Photo", systemImage: "photo.on.rectangle")
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                
                Button {
                    
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
                    
                } label: {
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width:150,height: 60)
                            .foregroundStyle(.red)
                        
                        HStack{
                            
                            Image(systemName: "eye")
                                .foregroundStyle(.white)
                            
                            Text("Predict")
                                .foregroundStyle(.white)
                        }
                        
                        
                    }
                }
                
                Text(output)
                    .font(.largeTitle)
                    .bold()
                
                
                
            Button{
                
                Task{
                    nutrients = await service.getData(query: output)
                    navigationPath.append("NutrientsView")
                }
                
            }label: {
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:150,height: 60)
                        .foregroundStyle(.brown)
                    
                    HStack{
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.white)
                        
                        Text("Analyze")
                            .foregroundStyle(.white)
                    }
                }
            }
                
            }
        .navigationDestination(for: String.self) { destination in
            if destination == "NutrientsView" {
                NutrientsView(nutrients: $nutrients, image: viewModel.image)
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

