//
//  ContentView.swift
//  Power Plan
//
//  Created by Matisse Petereyns on 26/11/2025.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Calculators", systemImage: "bolt.fill")
                }
            ReferenceView()
                .tabItem {
                    Label("Reference", systemImage: "book")
                }
        }
    }
}

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HeroHeader()
                    CalculationCard(title: "Ohm's Law", subtitle: "Solve for voltage, current, resistance, or power", icon: "triangle") {
                        NavigationLink(destination: OhmsLawCalculatorView()) {
                            Text("Open Ohm's Law")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    CalculationCard(title: "Power & Load", subtitle: "Single and three-phase power with power factor", icon: "powerplug.fill") {
                        NavigationLink(destination: PowerCalculatorView()) {
                            Text("Open Power Calculator")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    CalculationCard(title: "Voltage Drop", subtitle: "Estimate drop based on conductor and load", icon: "arrow.down.to.line") {
                        NavigationLink(destination: VoltageDropView()) {
                            Text("Open Voltage Drop")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Power Plan")
        }
    }
}

struct HeroHeader: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: [.accentColor.opacity(0.85), .blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack(alignment: .leading, spacing: 8) {
                Label("Electrician Toolkit", systemImage: "bolt.circle.fill")
                    .foregroundStyle(.white)
                    .font(.title2.bold())
                Text("Advanced calculators for sizing loads, validating runs, and checking energy costs.")
                    .foregroundStyle(.white.opacity(0.9))
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                HStack {
                    Label("Offline ready", systemImage: "antenna.radiowaves.left.and.right.slash")
                    Label("Pro formulas", systemImage: "function")
                }
                .font(.footnote)
                .foregroundStyle(.white.opacity(0.8))
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 180)
    }
}

struct CalculationCard<Content: View>: View {
    let title: String
    let subtitle: String
    let icon: String
    let content: Content

    init(title: String, subtitle: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 36, height: 36)
                    .background(Color.accentColor.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            content
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(.ultraThinMaterial))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.15), lineWidth: 1)
        )
    }
}

struct OhmsLawCalculatorView: View {
    @State private var voltage: String = ""
    @State private var current: String = ""
    @State private var resistance: String = ""
    @State private var power: String = ""
    @State private var resultMessage: String = "Provide any two values to solve the rest."

    var body: some View {
        Form {
            Section(header: Text("Inputs")) {
                NumericField(title: "Voltage (V)", value: $voltage)
                NumericField(title: "Current (A)", value: $current)
                NumericField(title: "Resistance (Ω)", value: $resistance)
                NumericField(title: "Power (W)", value: $power)
            }

            Section {
                Button(action: computeOhmsLaw) {
                    Label("Calculate", systemImage: "equal")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text("Results")) {
                Text(resultMessage)
                    .font(.body)
            }
        }
        .navigationTitle("Ohm's Law")
    }

    private func computeOhmsLaw() {
        let v = Double(voltage)
        let i = Double(current)
        let r = Double(resistance)
        let p = Double(power)

        let knownCount = [v, i, r, p].compactMap { $0 }.count
        guard knownCount >= 2 else {
            resultMessage = "Enter at least two known values."
            return
        }

        var voltageValue = v
        var currentValue = i
        var resistanceValue = r
        var powerValue = p

        if let v = voltageValue, let i = currentValue {
            resistanceValue = v / i
            powerValue = v * i
        } else if let v = voltageValue, let r = resistanceValue {
            currentValue = v / r
            powerValue = v * (currentValue ?? 0)
        } else if let v = voltageValue, let p = powerValue {
            currentValue = p / v
            resistanceValue = v / (currentValue ?? 0)
        } else if let i = currentValue, let r = resistanceValue {
            voltageValue = i * r
            powerValue = pow(i, 2) * r
        } else if let i = currentValue, let p = powerValue {
            voltageValue = p / i
            resistanceValue = (voltageValue ?? 0) / i
        } else if let r = resistanceValue, let p = powerValue {
            currentValue = sqrt(p / r)
            voltageValue = (currentValue ?? 0) * r
        }

        func format(_ value: Double?, unit: String) -> String {
            guard let value else { return "–" }
            return "\(value.rounded(toPlaces: 3)) \(unit)"
        }

        resultMessage = [
            "Voltage: \(format(voltageValue, unit: "V"))",
            "Current: \(format(currentValue, unit: "A"))",
            "Resistance: \(format(resistanceValue, unit: "Ω"))",
            "Power: \(format(powerValue, unit: "W"))"
        ].joined(separator: "\n")
    }
}

struct PowerCalculatorView: View {
    enum Phase: String, CaseIterable, Identifiable {
        case single = "Single-phase"
        case three = "Three-phase"

        var id: String { rawValue }
    }

    @State private var phase: Phase = .single
    @State private var voltage: String = "230"
    @State private var current: String = "10"
    @State private var powerFactor: Double = 0.95
    @State private var estimatedPower: String = ""

    var body: some View {
        Form {
            Section(header: Text("Circuit")) {
                Picker("Phase", selection: $phase) {
                    ForEach(Phase.allCases) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(.segmented)
                NumericField(title: "Voltage (V)", value: $voltage)
                NumericField(title: "Current (A)", value: $current)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Power factor")
                            .font(.subheadline)
                        Text(String(format: "%.2f", powerFactor))
                            .foregroundStyle(.secondary)
                    }
                    Slider(value: $powerFactor, in: 0.5...1.0, step: 0.01)
                }
            }

            Section {
                Button(action: calculatePower) {
                    Label("Estimate Power", systemImage: "bolt.fill")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text("Results")) {
                if estimatedPower.isEmpty {
                    Text("Enter circuit details and tap Estimate.")
                } else {
                    Text(estimatedPower)
                }
            }
        }
        .navigationTitle("Power & Load")
    }

    private func calculatePower() {
        guard let voltageValue = Double(voltage), let currentValue = Double(current) else {
            estimatedPower = "Please enter valid voltage and current."
            return
        }

        let multiplier = phase == .single ? 1.0 : sqrt(3.0)
        let powerWatts = multiplier * voltageValue * currentValue * powerFactor
        let powerKW = powerWatts / 1000
        let recommendedBreaker = (currentValue * 1.25).rounded(toPlaces: 2)

        estimatedPower = [
            String(format: "Power: %.2f W (%.2f kW)", powerWatts, powerKW),
            String(format: "Recommended breaker: %.2f A", recommendedBreaker),
            String(format: "Apparent power: %.2f VA", multiplier * voltageValue * currentValue)
        ].joined(separator: "\n")
    }
}

struct VoltageDropView: View {
    @State private var lengthMeters: String = "30"
    @State private var loadCurrent: String = "16"
    @State private var conductorArea: Double = 2.5
    @State private var supplyVoltage: String = "230"
    @State private var resultText: String = ""

    var body: some View {
        Form {
            Section(header: Text("Run")) {
                NumericField(title: "One-way length (m)", value: $lengthMeters)
                NumericField(title: "Load current (A)", value: $loadCurrent)
                NumericField(title: "Supply voltage (V)", value: $supplyVoltage)
                VStack(alignment: .leading) {
                    Text("Conductor area: \(String(format: "%.1f", conductorArea)) mm²")
                    Slider(value: $conductorArea, in: 1.5...35, step: 0.5)
                }
            }

            Section {
                Button(action: estimateDrop) {
                    Label("Estimate Drop", systemImage: "arrow.triangle.2.circlepath")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text("Results")) {
                if resultText.isEmpty {
                    Text("Enter parameters to estimate voltage drop.")
                } else {
                    Text(resultText)
                }
            }
        }
        .navigationTitle("Voltage Drop")
    }

    private func estimateDrop() {
        guard let length = Double(lengthMeters), let current = Double(loadCurrent), let supplyV = Double(supplyVoltage) else {
            resultText = "Please provide valid numeric values."
            return
        }

        let resistivity = 0.0175 // copper Ω·mm²/m at 20°C
        let roundTripLength = length * 2
        let conductorResistance = (resistivity * roundTripLength) / conductorArea
        let voltageDrop = current * conductorResistance
        let percentDrop = (voltageDrop / supplyV) * 100

        resultText = [
            String(format: "Estimated drop: %.2f V", voltageDrop),
            String(format: "Percentage of supply: %.2f%%", percentDrop),
            String(format: "Loop resistance: %.3f Ω", conductorResistance)
        ].joined(separator: "\n")
    }
}

struct ReferenceView: View {
    var body: some View {
        List {
            Section(header: Text("Quick constants")) {
                Label("Copper resistivity: 0.0175 Ω·mm²/m", systemImage: "atom")
                Label("Power factor typical range: 0.8 - 1.0", systemImage: "bolt.horizontal.circle")
                Label("3ϕ power multiplier: √3", systemImage: "function")
            }
            Section(header: Text("Usage tips")) {
                Text("• Use at least two known values in Ohm's Law to solve the circuit.")
                Text("• Power calculator suggests a breaker sized at 125% of load current.")
                Text("• Voltage drop assumes copper conductors at 20°C with round-trip length.")
            }
        }
        .navigationTitle("Reference")
    }
}

struct NumericField: View {
    let title: String
    @Binding var value: String

    var body: some View {
        TextField(title, text: $value)
            .keyboardType(.decimalPad)
            .textInputAutocapitalization(.never)
    }
}

private extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

#Preview {
    ContentView()
}
