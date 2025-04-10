# **AI-Powered Fruit Identification App**  

### **Overview**  
The **AI-Powered Fruit Identification App** is an **iOS application** that leverages **machine learning** to accurately identify fruits and provide **instant nutritional information**. Using a **CoreML model trained with CreateML** on a **10,000+ image dataset from Kaggle**, the app achieves over **90% accuracy** in fruit classification. It integrates with the **CalorieNinja API** to fetch real-time **calories, macronutrients, and vitamins** based on the identified fruit. Users can scan fruits in real-time using their **camera** or upload images from their **photo library** for instant analysis.  

### **Features**  
✅ **Real-time Fruit Recognition:** Uses a **CoreML model** trained on a large dataset for high-accuracy classification.  
✅ **Instant Nutritional Insights:** Fetches **calories, protein, fats, carbohydrates, and vitamins** using **CalorieNinja API**.  
✅ **Camera & Photo Library Support:** Allows users to **capture a photo** or **upload an image** for fruit detection.  
✅ **Fast On-Device Inference:** Optimized for **under 2-second** classification using **CoreML**.  
✅ **Offline Mode:** Fruit classification runs **entirely on-device**, with API calls for nutritional data.  
✅ **Modern UI:** Designed with **SwiftUI** for a seamless and intuitive user experience.  

### **Technology Stack**  
- **SwiftUI** – For a responsive and user-friendly interface.  
- **CoreML** – Integrates the trained fruit classification model for on-device inference.  
- **CreateML** – Used to train the model on a **10,000+ image dataset from Kaggle**.  
- **Vision Framework** – For real-time image analysis and object detection.  
- **CalorieNinja API** – Fetches detailed nutritional information based on the recognized fruit.  


### **How It Works**  
1️⃣ Open the app and scan a fruit using the **camera** or select an image from the **photo library**.  
2️⃣ The image is analyzed using the **CoreML fruit classification model**.  
3️⃣ The app queries **CalorieNinja API** to fetch **nutritional data**, including calories, macronutrients, and vitamins.  
4️⃣ Users can **save scanned fruits** for future reference and dietary tracking.  

### **Setup & Installation**  
1. Clone this repository.
2. Open the project in **Xcode** and install dependencies.  
3. Ensure **CoreML, Vision, and API networking** are properly configured.  
4. Build and run the app on a **physical iOS device** for best results.  


This **now accurately includes the CalorieNinja API integration** while keeping the structure professional and informative. Let me know if you need any further refinements! 🚀🍏
