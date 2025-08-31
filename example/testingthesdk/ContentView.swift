import SwiftUI
import anchoriumlinkframework

struct ContentView: View {
    @State private var filamentViewController: FilamentArViewController?
    @State private var isSpawnEnabled = false
    let sequence = ARSequence()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AnchoriumLinkView(
                viewController: $filamentViewController,
                clientId: Bundle.main.clientId,
                clientSecret: Bundle.main.clientSecret
            )
            .edgesIgnoringSafeArea(.all)
            
            // Your button overlay stays the same...
            HStack(spacing: 20) {
                // Enable Spawn
                Button(action: {
                    print("Changing spawn status")
                    isSpawnEnabled.toggle()
                    filamentViewController?.enableSpawn = isSpawnEnabled
                }) {
                    VStack {
                        Image(systemName: isSpawnEnabled ? "checkmark.circle.fill" : "plus.circle")
                            .font(.largeTitle)
                        Text(isSpawnEnabled ? "Spawn On" : "Enable Spawn")
                            .font(.caption)
                    }
                    .foregroundColor(isSpawnEnabled ? .green : .white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                }
                
                // Set character file name
                Button(action: {
                    Task {
                        filamentViewController?.setModelFileName("roth") }
                })
                {
                    Text("Set Charater")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                }
                
                // Host Anchor
                Button(action: {
                    Task {
                            if let anchorId = await filamentViewController?.hostAnchor() {
                                UserDefaults.standard.set(anchorId, forKey: "lastHostedAnchorId")
                                Toast.show("Anchor hosted! ID: \(anchorId)")
                            } else {
                                Toast.show("Failed to host anchor")
                            }
                        }
                }) {
                    Text("Host Anchor")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                }
                
                // Set Plot
                Button(action: {
                    Task {
                            if let anchorId = UserDefaults.standard.string(forKey: "lastHostedAnchorId") {
                                // Create sequence(s)
                                let sequences = [
                                    ARSequence(
                                        NSNumber(value: 2),
                                        rotationDegrees: NSNumber(value: 0),
                                        turnDirection: .faceCamera,
                                        walkMeters: NSNumber(value: 0),
                                        audioAssetPath: "reception.mp3"
                                    )
                                ]
                                
                                do {
                                    // Create plot (if init throws)
                                    let plot = ARPlot(anchorId, sequences: sequences)
                                    
                                    // Await API call → returns plotId
                                        if let plotId = try await filamentViewController?.setPlot(plot) {
                                            // Save to local storage
                                            UserDefaults.standard.set(plotId, forKey: "lastPlotId")

                                            // Show success toast
                                            Toast.show("✅ Plot set successfully with ID: \(plotId)")
                                        } else {
                                            Toast.show("⚠️ Plot set but no ID returned")
                                        }
                                } catch {
                                    Toast.show("Failed to set plot: \(error.localizedDescription)")
                                }
                            } else {
                                Toast.show("No anchor ID found in local storage")
                            }
                        }

                }) {
                    Text("Set Plot")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                }
                
                // Run Plot
                Button(action: {
                    Task {
                            if let plotId = UserDefaults.standard.string(forKey: "lastPlotId") {
                                do {
                                    filamentViewController?.runPlot(plotId)
                                    Toast.show("▶️ Running plot with ID: \(plotId)")
                                }
                            } else {
                                Toast.show("⚠️ No plot ID found in local storage")
                            }
                        }
                }) {
                    Text("Run Plot")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                }
            }
            .padding(.bottom, 30)
        }
    }
}


