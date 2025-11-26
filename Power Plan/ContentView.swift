//
//  ContentView.swift
//  Power Plan
//
//  Created by Matisse Petereyns on 26/11/2025.
//

import SwiftUI
import Foundation

enum AppearanceMode: String, CaseIterable, Identifiable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"

    var id: String { rawValue }

    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }

    var displayName: String {
        switch self {
        case .system:
            NSLocalizedString("appearance.system", comment: "System appearance option")
        case .light:
            NSLocalizedString("appearance.light", comment: "Light appearance option")
        case .dark:
            NSLocalizedString("appearance.dark", comment: "Dark appearance option")
        }
    }
}

enum LanguageOption: String, CaseIterable, Identifiable {
    case system
    case english = "en"
    case dutch = "nl"

    var id: String { rawValue }

    var locale: Locale? {
        switch self {
        case .system:
            return nil
        case .english, .dutch:
            return Locale(identifier: rawValue)
        }
    }

    var displayName: String {
        switch self {
        case .system:
            NSLocalizedString("language.system", comment: "Follow device language")
        case .english:
            NSLocalizedString("language.english", comment: "English language")
        case .dutch:
            NSLocalizedString("language.dutch", comment: "Dutch language")
        }
    }
}

private enum L10n {
    static let calculators = NSLocalizedString("tab.calculators", comment: "Calculators tab title")
    static let planning = NSLocalizedString("tab.planning", comment: "Planning tab title")
    static let reference = NSLocalizedString("tab.reference", comment: "Reference tab title")
    static let appTitle = NSLocalizedString("nav.title", comment: "Main navigation title")

    static let heroTitle = NSLocalizedString("hero.title", comment: "Hero title")
    static let heroSubtitle = NSLocalizedString("hero.subtitle", comment: "Hero subtitle")
    static let heroOffline = NSLocalizedString("hero.offline", comment: "Offline badge")
    static let heroFormulas = NSLocalizedString("hero.formulas", comment: "Pro formulas badge")

    static let ohmsTitle = NSLocalizedString("card.ohms.title", comment: "Ohm's law card title")
    static let ohmsSubtitle = NSLocalizedString("card.ohms.subtitle", comment: "Ohm's law card subtitle")
    static let ohmsButton = NSLocalizedString("card.ohms.button", comment: "Open ohms calculator")

    static let powerTitle = NSLocalizedString("card.power.title", comment: "Power card title")
    static let powerSubtitle = NSLocalizedString("card.power.subtitle", comment: "Power card subtitle")
    static let powerButton = NSLocalizedString("card.power.button", comment: "Open power calculator")

    static let wattTitle = NSLocalizedString("card.watt.title", comment: "Watt card title")
    static let wattSubtitle = NSLocalizedString("card.watt.subtitle", comment: "Watt card subtitle")
    static let wattButton = NSLocalizedString("card.watt.button", comment: "Open watt calculator")

    static let protectionTitle = NSLocalizedString("card.protection.title", comment: "Protective device card title")
    static let protectionSubtitle = NSLocalizedString("card.protection.subtitle", comment: "Protective device card subtitle")
    static let protectionButton = NSLocalizedString("card.protection.button", comment: "Open protective device calculator")

    static let planningTitle = NSLocalizedString("card.planning.title", comment: "Planning card title")
    static let planningSubtitle = NSLocalizedString("card.planning.subtitle", comment: "Planning card subtitle")
    static let planningButton = NSLocalizedString("card.planning.button", comment: "Open planning")

    static let dropTitle = NSLocalizedString("card.drop.title", comment: "Voltage drop title")
    static let dropSubtitle = NSLocalizedString("card.drop.subtitle", comment: "Voltage drop subtitle")
    static let dropButton = NSLocalizedString("card.drop.button", comment: "Open voltage drop")

    static let inputs = NSLocalizedString("section.inputs", comment: "Inputs section")
    static let results = NSLocalizedString("section.results", comment: "Results section")
    static let circuit = NSLocalizedString("section.circuit", comment: "Circuit section title")
    static let load = NSLocalizedString("section.load", comment: "Load section title")
    static let run = NSLocalizedString("section.run", comment: "Run section title")
    static let appearance = NSLocalizedString("section.appearance", comment: "Appearance section title")
    static let language = NSLocalizedString("section.language", comment: "Language section title")

    static let ohmsHeader = NSLocalizedString("nav.ohms", comment: "Ohm's law navigation title")
    static let powerHeader = NSLocalizedString("nav.power", comment: "Power calculator title")
    static let wattHeader = NSLocalizedString("nav.watt", comment: "Watt calculator title")
    static let dropHeader = NSLocalizedString("nav.drop", comment: "Voltage drop title")
    static let protectionHeader = NSLocalizedString("nav.protection", comment: "Protective device title")
    static let planningHeader = NSLocalizedString("nav.planning", comment: "Panel planning title")
    static let referenceHeader = NSLocalizedString("nav.reference", comment: "Reference title")
    static let settingsHeader = NSLocalizedString("nav.settings", comment: "Settings title")

    static let provideTwo = NSLocalizedString("ohms.prompt", comment: "Prompt for Ohm's law inputs")
    static let enterTwo = NSLocalizedString("ohms.validation", comment: "Validation for two values")
    static func voltage(_ value: String) -> String { String(format: NSLocalizedString("ohms.result.voltage", comment: "Voltage result"), value) }
    static func current(_ value: String) -> String { String(format: NSLocalizedString("ohms.result.current", comment: "Current result"), value) }
    static func resistance(_ value: String) -> String { String(format: NSLocalizedString("ohms.result.resistance", comment: "Resistance result"), value) }
    static func power(_ value: String) -> String { String(format: NSLocalizedString("ohms.result.power", comment: "Power result"), value) }
    static func ohmsCalculateButton() -> String { NSLocalizedString("ohms.button.calculate", comment: "Calculate button label") }

    static let phase = NSLocalizedString("power.phase", comment: "Phase label")
    static let singlePhase = NSLocalizedString("power.singlePhase", comment: "Single phase option")
    static let threePhase = NSLocalizedString("power.threePhase", comment: "Three phase option")
    static let powerFactor = NSLocalizedString("power.factor", comment: "Power factor label")
    static func estimatePower() -> String { NSLocalizedString("power.button.estimate", comment: "Estimate power button") }
    static let enterCircuit = NSLocalizedString("power.prompt", comment: "Prompt for circuit inputs")
    static let invalidPowerInputs = NSLocalizedString("power.validation", comment: "Invalid power inputs message")
    static func powerResult(_ watts: Double, _ kw: Double) -> String { String(format: NSLocalizedString("power.result.power", comment: "Power result"), watts, kw) }
    static func breakerResult(_ amps: Double) -> String { String(format: NSLocalizedString("power.result.breaker", comment: "Breaker sizing"), amps) }
    static func apparentResult(_ va: Double) -> String { String(format: NSLocalizedString("power.result.apparent", comment: "Apparent power"), va) }

    static let calculateWatts = NSLocalizedString("watt.button.calculate", comment: "Calculate watts button")
    static let enterWattPrompt = NSLocalizedString("watt.prompt", comment: "Prompt for watt inputs")
    static let invalidWattInputs = NSLocalizedString("watt.validation", comment: "Invalid watt inputs")
    static func realPower(_ watts: Double, _ kw: Double) -> String { String(format: NSLocalizedString("watt.result.real", comment: "Real power"), watts, kw) }
    static func assumingPF(_ pf: Double) -> String { String(format: NSLocalizedString("watt.result.pf", comment: "Assuming power factor"), pf) }

    static let estimateDrop = NSLocalizedString("drop.button.estimate", comment: "Estimate drop button")
    static let enterDropPrompt = NSLocalizedString("drop.prompt", comment: "Prompt for drop inputs")
    static let invalidDropInputs = NSLocalizedString("drop.validation", comment: "Invalid drop inputs")
    static func dropResult(_ volts: Double) -> String { String(format: NSLocalizedString("drop.result.voltage", comment: "Voltage drop result"), volts) }
    static func dropPercent(_ percent: Double) -> String { String(format: NSLocalizedString("drop.result.percent", comment: "Percent drop"), percent) }
    static func dropResistance(_ resistance: Double) -> String { String(format: NSLocalizedString("drop.result.resistance", comment: "Loop resistance"), resistance) }

    static let protectionInputs = NSLocalizedString("protection.inputs", comment: "Protection inputs header")
    static let protectionType = NSLocalizedString("protection.type", comment: "Protection device type label")
    static let protectionInrush = NSLocalizedString("protection.inrush", comment: "Inrush multiplier label")
    static let protectionFault = NSLocalizedString("protection.fault", comment: "Fault current label")
    static let protectionButton = NSLocalizedString("protection.button", comment: "Protection calculate button")
    static func protectionResult(_ breaker: Double, _ fuse: Double, _ isc: Double) -> String {
        String(format: NSLocalizedString("protection.result", comment: "Protection results"), breaker, fuse, isc)
    }
    static let protectionTip = NSLocalizedString("protection.tip", comment: "Protection helper tip")

    static let planningSection = NSLocalizedString("planning.section", comment: "Planning inputs header")
    static let planningDemand = NSLocalizedString("planning.demand", comment: "Demand factor label")
    static let planningContinuous = NSLocalizedString("planning.continuous", comment: "Continuous load label")
    static let planningNonContinuous = NSLocalizedString("planning.nonContinuous", comment: "Non continuous load label")
    static let planningVoltage = NSLocalizedString("planning.voltage", comment: "Service voltage label")
    static let planningSpare = NSLocalizedString("planning.spare", comment: "Spare circuits label")
    static let planningButton = NSLocalizedString("planning.button", comment: "Planning calculate button")
    static func planningResult(_ amps: Double, _ breaker: Double, _ headroom: Int) -> String {
        String(format: NSLocalizedString("planning.result", comment: "Planning result"), amps, breaker, headroom)
    }

    static let offlineReady = NSLocalizedString("badge.offline", comment: "Offline badge")
    static let proFormulas = NSLocalizedString("badge.formulas", comment: "Pro formulas badge")

    static let openSettings = NSLocalizedString("nav.settings.button", comment: "Open settings label")
    static let settingsThemeDescription = NSLocalizedString("settings.theme.description", comment: "Theme description")
    static let settingsThemeLabel = NSLocalizedString("settings.theme.label", comment: "Theme picker label")
    static let languageLabel = NSLocalizedString("settings.language.label", comment: "Language picker label")
    static let languageDescription = NSLocalizedString("settings.language.description", comment: "Language description")

    static let copperResistivity = NSLocalizedString("reference.copper", comment: "Copper resistivity")
    static let pfRange = NSLocalizedString("reference.pfRange", comment: "Power factor range")
    static let threePhaseMultiplier = NSLocalizedString("reference.multiplier", comment: "Three phase multiplier")
    static let quickConstants = NSLocalizedString("reference.quick", comment: "Quick constants header")
    static let tipsHeader = NSLocalizedString("reference.tips", comment: "Usage tips header")
    static let tipOhms = NSLocalizedString("reference.tip.ohms", comment: "Ohms tip")
    static let tipBreaker = NSLocalizedString("reference.tip.breaker", comment: "Breaker tip")
    static let tipDrop = NSLocalizedString("reference.tip.drop", comment: "Voltage drop tip")
    static let tipPlanning = NSLocalizedString("reference.tip.planning", comment: "Planning tip")

    static let ohmsVoltageField = NSLocalizedString("field.voltage", comment: "Voltage field label")
    static let ohmsCurrentField = NSLocalizedString("field.current", comment: "Current field label")
    static let resistanceField = NSLocalizedString("field.resistance", comment: "Resistance field label")
    static let powerField = NSLocalizedString("field.power", comment: "Power field label")
    static let lengthField = NSLocalizedString("field.length", comment: "Length field label")
    static let loadCurrentField = NSLocalizedString("field.loadCurrent", comment: "Load current field label")
    static let supplyVoltageField = NSLocalizedString("field.supplyVoltage", comment: "Supply voltage field label")
    static func conductorArea(_ value: Double) -> String { String(format: NSLocalizedString("field.conductorArea", comment: "Conductor area slider"), value) }
}

struct ContentView: View {
    @AppStorage("appearanceMode") private var appearanceMode: AppearanceMode = .system
    @AppStorage("languagePreference") private var languagePreference: LanguageOption = .system

    private var resolvedLocale: Locale {
        languagePreference.locale ?? .autoupdatingCurrent
    }

    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label(L10n.calculators, systemImage: "bolt.fill")
                }
            PlanningView()
                .tabItem {
                    Label(L10n.planning, systemImage: "square.split.2x2")
                }
            ReferenceView()
                .tabItem {
                    Label(L10n.reference, systemImage: "book")
                }
        }
        .preferredColorScheme(appearanceMode.colorScheme)
        .environment(\.locale, resolvedLocale)
    }
}

struct DashboardView: View {
    @AppStorage("appearanceMode") private var appearanceMode: AppearanceMode = .system
    @AppStorage("languagePreference") private var languagePreference: LanguageOption = .system

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HeroHeader()
                    CalculationCard(title: L10n.ohmsTitle, subtitle: L10n.ohmsSubtitle, icon: "triangle") {
                        NavigationLink(destination: OhmsLawCalculatorView()) {
                            Text(L10n.ohmsButton)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    CalculationCard(title: L10n.powerTitle, subtitle: L10n.powerSubtitle, icon: "powerplug.fill") {
                        NavigationLink(destination: PowerCalculatorView()) {
                            Text(L10n.powerButton)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                    CalculationCard(title: L10n.wattTitle, subtitle: L10n.wattSubtitle, icon: "w.circle") {
                        NavigationLink(destination: WattCalculatorView()) {
                            Text(L10n.wattButton)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    CalculationCard(title: L10n.dropTitle, subtitle: L10n.dropSubtitle, icon: "arrow.down.to.line") {
                        NavigationLink(destination: VoltageDropView()) {
                            Text(L10n.dropButton)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    CalculationCard(title: L10n.protectionTitle, subtitle: L10n.protectionSubtitle, icon: "shield.lefthalf.filled") {
                        NavigationLink(destination: ProtectiveDeviceView()) {
                            Text(L10n.protectionButton)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    CalculationCard(title: L10n.planningTitle, subtitle: L10n.planningSubtitle, icon: "square.grid.2x2") {
                        NavigationLink(destination: PanelPlannerView()) {
                            Text(L10n.planningButton)
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
            .navigationTitle(L10n.appTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(appearanceMode: $appearanceMode, languagePreference: $languagePreference)) {
                        Label(L10n.openSettings, systemImage: "gearshape")
                    }
                }
            }
        }
    }
}

struct HeroHeader: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: [.accentColor.opacity(0.85), .blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack(alignment: .leading, spacing: 8) {
                Label(L10n.heroTitle, systemImage: "bolt.circle.fill")
                    .foregroundStyle(.white)
                    .font(.title2.bold())
                Text(L10n.heroSubtitle)
                    .foregroundStyle(.white.opacity(0.9))
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                HStack {
                    Label(L10n.heroOffline, systemImage: "antenna.radiowaves.left.and.right.slash")
                    Label(L10n.heroFormulas, systemImage: "function")
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

struct PlanningView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    CalculationCard(title: L10n.planningTitle, subtitle: L10n.planningSubtitle, icon: "square.grid.2x2") {
                        NavigationLink(destination: PanelPlannerView()) {
                            Text(L10n.planningButton)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }

                    CalculationCard(title: L10n.protectionTitle, subtitle: L10n.protectionSubtitle, icon: "shield.lefthalf.filled") {
                        NavigationLink(destination: ProtectiveDeviceView()) {
                            Text(L10n.protectionButton)
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
            .navigationTitle(L10n.planning)
        }
    }
}

struct OhmsLawCalculatorView: View {
    @State private var voltage: String = ""
    @State private var current: String = ""
    @State private var resistance: String = ""
    @State private var power: String = ""
    @State private var resultMessage: String = L10n.provideTwo

    var body: some View {
        Form {
            Section(header: Text(L10n.inputs)) {
                NumericField(title: L10n.ohmsVoltageField, value: $voltage)
                NumericField(title: L10n.ohmsCurrentField, value: $current)
                NumericField(title: L10n.resistanceField, value: $resistance)
                NumericField(title: L10n.powerField, value: $power)
            }

            Section {
                Button(action: computeOhmsLaw) {
                    Label(L10n.ohmsCalculateButton(), systemImage: "equal")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text(L10n.results)) {
                Text(resultMessage)
                    .font(.body)
            }
        }
        .navigationTitle(L10n.ohmsHeader)
    }

    private func computeOhmsLaw() {
        let v = Double(voltage)
        let i = Double(current)
        let r = Double(resistance)
        let p = Double(power)

        let knownCount = [v, i, r, p].compactMap { $0 }.count
        guard knownCount >= 2 else {
            resultMessage = L10n.enterTwo
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
            L10n.voltage(format(voltageValue, unit: "V")),
            L10n.current(format(currentValue, unit: "A")),
            L10n.resistance(format(resistanceValue, unit: "Ω")),
            L10n.power(format(powerValue, unit: "W"))
        ].joined(separator: "\n")
    }
}

struct PowerCalculatorView: View {
    enum Phase: String, CaseIterable, Identifiable {
        case single = "Single-phase"
        case three = "Three-phase"

        var id: String { rawValue }

        var displayTitle: String {
            switch self {
            case .single:
                L10n.singlePhase
            case .three:
                L10n.threePhase
            }
        }
    }

    @State private var phase: Phase = .single
    @State private var voltage: String = "230"
    @State private var current: String = "10"
    @State private var powerFactor: Double = 0.95
    @State private var estimatedPower: String = ""

    var body: some View {
        Form {
            Section(header: Text(L10n.circuit)) {
                Picker(L10n.phase, selection: $phase) {
                    ForEach(Phase.allCases) { option in
                        Text(option.displayTitle).tag(option)
                    }
                }
                .pickerStyle(.segmented)
                NumericField(title: L10n.ohmsVoltageField, value: $voltage)
                NumericField(title: L10n.ohmsCurrentField, value: $current)
                HStack {
                    VStack(alignment: .leading) {
                        Text(L10n.powerFactor)
                            .font(.subheadline)
                        Text(String(format: "%.2f", powerFactor))
                            .foregroundStyle(.secondary)
                    }
                    Slider(value: $powerFactor, in: 0.5...1.0, step: 0.01)
                }
            }

            Section {
                Button(action: calculatePower) {
                    Label(L10n.estimatePower(), systemImage: "bolt.fill")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text(L10n.results)) {
                if estimatedPower.isEmpty {
                    Text(L10n.enterCircuit)
                } else {
                    Text(estimatedPower)
                }
            }
        }
        .navigationTitle(L10n.powerHeader)
    }

    private func calculatePower() {
        guard let voltageValue = Double(voltage), let currentValue = Double(current) else {
            estimatedPower = L10n.invalidPowerInputs
            return
        }

        let multiplier = phase == .single ? 1.0 : sqrt(3.0)
        let powerWatts = multiplier * voltageValue * currentValue * powerFactor
        let powerKW = powerWatts / 1000
        let recommendedBreaker = (currentValue * 1.25).rounded(toPlaces: 2)

        estimatedPower = [
            L10n.powerResult(powerWatts, powerKW),
            L10n.breakerResult(recommendedBreaker),
            L10n.apparentResult(multiplier * voltageValue * currentValue)
        ].joined(separator: "\n")
    }
}

struct WattCalculatorView: View {
    @State private var voltage: String = "230"
    @State private var current: String = "10"
    @State private var powerFactor: Double = 1.0
    @State private var result: String = ""

    var body: some View {
        Form {
            Section(header: Text(L10n.load)) {
                NumericField(title: L10n.ohmsVoltageField, value: $voltage)
                NumericField(title: L10n.ohmsCurrentField, value: $current)
                HStack {
                    VStack(alignment: .leading) {
                        Text(L10n.powerFactor)
                            .font(.subheadline)
                        Text(String(format: "%.2f", powerFactor))
                            .foregroundStyle(.secondary)
                    }
                    Slider(value: $powerFactor, in: 0.5...1.0, step: 0.01)
                }
            }

            Section {
                Button(action: computeWattage) {
                    Label(L10n.calculateWatts, systemImage: "wand.and.sparkles")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text(L10n.results)) {
                if result.isEmpty {
                    Text(L10n.enterWattPrompt)
                } else {
                    Text(result)
                }
            }
        }
        .navigationTitle(L10n.wattHeader)
    }

    private func computeWattage() {
        guard let voltageValue = Double(voltage), let currentValue = Double(current) else {
            result = L10n.invalidWattInputs
            return
        }

        let watts = voltageValue * currentValue * powerFactor
        let kilowatts = watts / 1000

        result = [
            L10n.realPower(watts, kilowatts),
            L10n.assumingPF(powerFactor)
        ].joined(separator: "\n")
    }
}

struct ProtectiveDeviceView: View {
    enum DeviceType: String, CaseIterable, Identifiable {
        case resistive
        case motor

        var id: String { rawValue }

        var title: String {
            switch self {
            case .resistive:
                NSLocalizedString("protection.type.resistive", comment: "Resistive load label")
            case .motor:
                NSLocalizedString("protection.type.motor", comment: "Motor load label")
            }
        }

        var baseFactor: Double {
            switch self {
            case .resistive:
                return 1.25
            case .motor:
                return 1.4
            }
        }
    }

    @State private var deviceType: DeviceType = .resistive
    @State private var runningCurrent: String = "20"
    @State private var inrushMultiplier: Double = 1.8
    @State private var faultCurrent: String = "5"
    @State private var result: String = ""

    var body: some View {
        Form {
            Section(header: Text(L10n.protectionInputs)) {
                Picker(L10n.protectionType, selection: $deviceType) {
                    ForEach(DeviceType.allCases) { type in
                        Text(type.title).tag(type)
                    }
                }
                .pickerStyle(.segmented)

                NumericField(title: L10n.ohmsCurrentField, value: $runningCurrent)

                VStack(alignment: .leading) {
                    Text(L10n.protectionInrush)
                    Slider(value: $inrushMultiplier, in: 1.0...3.0, step: 0.05)
                    Text(String(format: "×%.2f", inrushMultiplier))
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }

                NumericField(title: L10n.protectionFault, value: $faultCurrent)
            }

            Section {
                Button(action: calculateProtection) {
                    Label(L10n.protectionButton, systemImage: "shield.checkered")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text(L10n.results)) {
                if result.isEmpty {
                    Text(L10n.protectionTip)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                } else {
                    Text(result)
                }
            }
        }
        .navigationTitle(L10n.protectionHeader)
    }

    private func calculateProtection() {
        guard let running = Double(runningCurrent), let faultKA = Double(faultCurrent) else {
            result = L10n.invalidWattInputs
            return
        }

        let breaker = running * deviceType.baseFactor * max(1.0, inrushMultiplier / 2)
        let fuse = running * (deviceType == .motor ? 1.75 : 1.5)
        let iscKA = faultKA * inrushMultiplier

        result = L10n.protectionResult(breaker.rounded(toPlaces: 1), fuse.rounded(toPlaces: 1), iscKA.rounded(toPlaces: 2))
    }
}

struct PanelPlannerView: View {
    @State private var phase: PowerCalculatorView.Phase = .single
    @State private var serviceVoltage: String = "230"
    @State private var continuousLoadKW: String = "6"
    @State private var nonContinuousLoadKW: String = "3"
    @State private var demandFactor: Double = 0.8
    @State private var spareCircuits: Int = 4
    @State private var result: String = ""

    var body: some View {
        Form {
            Section(header: Text(L10n.planningSection)) {
                Picker(L10n.phase, selection: $phase) {
                    ForEach(PowerCalculatorView.Phase.allCases) { option in
                        Text(option.displayTitle).tag(option)
                    }
                }
                .pickerStyle(.segmented)

                NumericField(title: L10n.planningVoltage, value: $serviceVoltage)
                NumericField(title: L10n.planningContinuous, value: $continuousLoadKW)
                NumericField(title: L10n.planningNonContinuous, value: $nonContinuousLoadKW)

                VStack(alignment: .leading) {
                    Text(L10n.planningDemand)
                    Slider(value: $demandFactor, in: 0.5...1.0, step: 0.05)
                    Text(String(format: "%.0f%%", demandFactor * 100))
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }

                Stepper(value: $spareCircuits, in: 0...20) {
                    Text(String(format: L10n.planningSpare, spareCircuits))
                }
            }

            Section {
                Button(action: calculatePanel) {
                    Label(L10n.planningButton, systemImage: "dial.medium")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text(L10n.results)) {
                if result.isEmpty {
                    Text(L10n.enterCircuit)
                } else {
                    Text(result)
                }
            }
        }
        .navigationTitle(L10n.planningHeader)
    }

    private func calculatePanel() {
        guard let voltage = Double(serviceVoltage), let continuousKW = Double(continuousLoadKW), let nonContKW = Double(nonContinuousLoadKW) else {
            result = L10n.invalidPowerInputs
            return
        }

        let multiplier = phase == .single ? 1.0 : sqrt(3.0)
        let adjustedKW = (continuousKW * 1.25 + nonContKW) * demandFactor
        let serviceAmps = (adjustedKW * 1000) / (voltage * multiplier)
        let recommendedMain = ceil(serviceAmps / 5.0) * 5.0
        let headroomCircuits = max(0, spareCircuits - Int(ceil(adjustedKW)))

        result = L10n.planningResult(serviceAmps.rounded(toPlaces: 1), recommendedMain.rounded(toPlaces: 0), headroomCircuits)
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
            Section(header: Text(L10n.run)) {
                NumericField(title: L10n.lengthField, value: $lengthMeters)
                NumericField(title: L10n.loadCurrentField, value: $loadCurrent)
                NumericField(title: L10n.supplyVoltageField, value: $supplyVoltage)
                VStack(alignment: .leading) {
                    Text(L10n.conductorArea(conductorArea))
                    Slider(value: $conductorArea, in: 1.5...35, step: 0.5)
                }
            }

            Section {
                Button(action: estimateDrop) {
                    Label(L10n.estimateDrop, systemImage: "arrow.triangle.2.circlepath")
                        .frame(maxWidth: .infinity)
                }
            }

            Section(header: Text(L10n.results)) {
                if resultText.isEmpty {
                    Text(L10n.enterDropPrompt)
                } else {
                    Text(resultText)
                }
            }
        }
        .navigationTitle(L10n.dropHeader)
    }

    private func estimateDrop() {
        guard let length = Double(lengthMeters), let current = Double(loadCurrent), let supplyV = Double(supplyVoltage) else {
            resultText = L10n.invalidDropInputs
            return
        }

        let resistivity = 0.0175 // copper Ω·mm²/m at 20°C
        let roundTripLength = length * 2
        let conductorResistance = (resistivity * roundTripLength) / conductorArea
        let voltageDrop = current * conductorResistance
        let percentDrop = (voltageDrop / supplyV) * 100

        resultText = [
            L10n.dropResult(voltageDrop),
            L10n.dropPercent(percentDrop),
            L10n.dropResistance(conductorResistance)
        ].joined(separator: "\n")
    }
}

struct ReferenceView: View {
    var body: some View {
        List {
            Section(header: Text(L10n.quickConstants)) {
                Label(L10n.copperResistivity, systemImage: "atom")
                Label(L10n.pfRange, systemImage: "bolt.horizontal.circle")
                Label(L10n.threePhaseMultiplier, systemImage: "function")
            }
            Section(header: Text(L10n.tipsHeader)) {
                Text(L10n.tipOhms)
                Text(L10n.tipBreaker)
                Text(L10n.tipDrop)
                Text(L10n.tipPlanning)
            }
        }
        .navigationTitle(L10n.referenceHeader)
    }
}

struct SettingsView: View {
    @Binding var appearanceMode: AppearanceMode
    @Binding var languagePreference: LanguageOption

    var body: some View {
        Form {
            Section(header: Text(L10n.appearance)) {
                Picker(L10n.settingsThemeLabel, selection: $appearanceMode) {
                    ForEach(AppearanceMode.allCases) { mode in
                        Text(mode.displayName).tag(mode)
                    }
                }
                .pickerStyle(.segmented)
                Text(L10n.settingsThemeDescription)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Section(header: Text(L10n.language)) {
                Picker(L10n.languageLabel, selection: $languagePreference) {
                    ForEach(LanguageOption.allCases) { option in
                        Text(option.displayName).tag(option)
                    }
                }
                Text(L10n.languageDescription)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle(L10n.settingsHeader)
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
