//
//  RoomViewTwo.swift
//  SmartHome
//
//  Created by Lars Nicodemus on 09.10.24.
//

import SwiftUI

struct RoomViewTwo: View {
    var body: some View {
        ZStack {
            // Background wall
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray5))
                .frame(height: 200)
                .overlay(
                    ZStack {
                        // Left wall
                        Path { path in
                            path.move(to: CGPoint(x: 10, y: 40))
                            path.addLine(to: CGPoint(x: 60, y: 0))
                            path.addLine(to: CGPoint(x: 60, y: 150))
                            path.addLine(to: CGPoint(x: 10, y: 190))
                            path.closeSubpath()
                        }
                        .fill(Color(UIColor.systemGray4))
                        
                        // Window
                        Path { path in
                            path.move(to: CGPoint(x: 100, y: 30))
                            path.addLine(to: CGPoint(x: 200, y: 30))
                            path.addLine(to: CGPoint(x: 200, y: 100))
                            path.addLine(to: CGPoint(x: 100, y: 100))
                            path.closeSubpath()
                        }
                        .fill(Color.blue.opacity(0.3))
                        .overlay(
                            Path { path in
                                path.move(to: CGPoint(x: 150, y: 30))
                                path.addLine(to: CGPoint(x: 150, y: 100))
                                path.move(to: CGPoint(x: 100, y: 65))
                                path.addLine(to: CGPoint(x: 200, y: 65))
                            }
                            .stroke(Color.white, lineWidth: 2)
                        )
                        
                        // Door
                        Path { path in
                            path.move(to: CGPoint(x: 230, y: 40))
                            path.addLine(to: CGPoint(x: 290, y: 40))
                            path.addLine(to: CGPoint(x: 290, y: 160))
                            path.addLine(to: CGPoint(x: 230, y: 160))
                            path.closeSubpath()
                        }
                        .fill(Color.brown)
                        .overlay(
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 10, height: 10)
                                .offset(x: 90, y: 5)
                        )
                    }
                )
                .padding([.leading, .trailing], 25)
            
            // Floor
            Path { path in
                path.move(to: CGPoint(x: 100, y: 170))
                path.addLine(to: CGPoint(x: 315, y: 170))
                path.addLine(to: CGPoint(x: 290, y: 210))
                path.addLine(to: CGPoint(x: 50, y: 212))
                path.closeSubpath()
            }
            .fill(Color(UIColor.systemGray4))
            
            // Carpet
            Path { path in
                path.move(to: CGPoint(x: 167, y: 170))
                path.addLine(to: CGPoint(x: 271, y: 170))
                path.addLine(to: CGPoint(x: 255, y: 195))
                path.addLine(to: CGPoint(x: 145, y: 195))
                path.closeSubpath()
            }
            .fill(Color.red)
        }
        .frame(width:350, height: 220)
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    RoomViewTwo()
}
