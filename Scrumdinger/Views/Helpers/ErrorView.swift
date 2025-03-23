//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 23.03.2025.
//

import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Text("An error has occurred")
                    .font(.title)
                    .padding(.bottom)
                
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private let radius: CGFloat = 16
}

enum SampleError: Error {
    case errorRequired
}


#Preview {
    ErrorView(errorWrapper: .wrapper)
}
