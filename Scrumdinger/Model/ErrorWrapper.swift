//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 23.03.2025.
//

import Foundation


struct ErrorWrapper: Identifiable {
    
    let id: UUID
    let error: Error
    let guidance: String
    
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safety ignore this error")
    }
}
