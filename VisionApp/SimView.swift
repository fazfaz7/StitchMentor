//
//  SimView.swift
//  VisionApp
//
//  Created by Sofía Cantú on 28/11/23.
//

import SwiftUI
import WebKit

struct WebViewWithGIF: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = Bundle.main.url(forResource: urlString, withExtension: "gif") {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewWithGIF
        
        init(_ parent: WebViewWithGIF) {
            self.parent = parent
        }
    }
}


struct SquareVideo: View {
    var gifName: String

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 420, height: 220)
                .cornerRadius(20)
                .shadow(radius: 5)

            WebViewWithGIF(urlString: gifName)
                .frame(width: 420, height: 220)
                .cornerRadius(20)
        }
    }
}

struct SimView: View {
    var body: some View {
            // Full background image
            Image("pielSola.0001")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    // Small image on the top left corner
                    //Image("pielSola")
                    SquareVideo(gifName: "closeUpPunto")
                        //.resizable()
                        .frame(width: 420, height: 220) // Ajusta el tamaño según sea necesario
                        .border(Color.white, width: 4)
                        .padding(.top, 44) // Normalmente, el tamaño del área segura superior es de 44pts
                        .padding(.leading, 16), // Acolchado agregado desde el borde principal
                    alignment: .topLeading
                )
        
        /*WindowGroup {
            ContentView()
               .background(.pink.opacity(0.8))
        }
        
        ImmersiveSpace(id: "Immersive") {
            ImmersiveView()
        }*/
        }
        /*WindowGroup {
            ContentView()
               .background(.pink.opacity(0.8))
        }
        
        ImmersiveSpace(id: "Immersive") {
            ImmersiveView()
        }*/
    
}

#Preview {
    SimView()
}
