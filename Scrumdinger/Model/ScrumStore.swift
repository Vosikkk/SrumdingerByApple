//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 23.03.2025.
//

import SwiftUI
import Observation

@Observable
final class ScrumStore {
    
    var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
        .appending(path: "scrums.data")
    }
    
    
    func load() async throws {
        
        let task = Task<[DailyScrum], Error> {
            
            let fileURL = try Self.fileURL()
            
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            
            return dailyScrums
        }
        
        let scrums = try await task.value
        
        self.scrums = scrums
    }
    
    
    func save(scrums: [DailyScrum]) async throws {
        
        let task = Task {
            
            let data = try JSONEncoder().encode(scrums)
            
            let outfile = try Self.fileURL()
            
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}


