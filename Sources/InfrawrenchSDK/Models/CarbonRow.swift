/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CarbonRow: Codable, Hashable, Sendable {
    public enum GridBasis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ccf
        case ember2024
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ccf": self = .ccf
            case "ember-2024": self = .ember2024
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ccf: return "ccf"
            case .ember2024: return "ember-2024"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [GridBasis] = [
            .ccf,
            .ember2024,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// vCPUs per unit.
    public var vcpus: Double
    /// Units the figure covers (node count); 1 for one machine.
    public var count: Int
    public var region: String
    /// The coefficient table the region resolved in: `aws`, `gcp`, `azure`,
    /// `hetzner`...
    public var grid: String
    /// Grams CO2e per kWh used for this row: the published figure, not a band.
    public var gridIntensity: Double
    /// What the grid figure describes, e.g. `Germany`.
    public var gridZone: String
    /// `ccf`: Cloud Carbon Footprint's per-region table. `ember-2024`: Ember's
    /// 2024 lifecycle figure for the country.
    public var gridBasis: GridBasis
    /// Datacentre overhead used: regional where published, else fleet.
    public var pue: Double
    public var kwh: Double
    public var kgCo2e: Double
    public var resourceId: String
    public var displayName: String
    public var pluginId: String
    public var resourceTypeId: String
    public var accountId: String
    public var accountName: String?

    public init(
        vcpus: Double,
        count: Int,
        region: String,
        grid: String,
        gridIntensity: Double,
        gridZone: String,
        gridBasis: GridBasis,
        pue: Double,
        kwh: Double,
        kgCo2e: Double,
        resourceId: String,
        displayName: String,
        pluginId: String,
        resourceTypeId: String,
        accountId: String,
        accountName: String? = nil
    ) {
        self.vcpus = vcpus
        self.count = count
        self.region = region
        self.grid = grid
        self.gridIntensity = gridIntensity
        self.gridZone = gridZone
        self.gridBasis = gridBasis
        self.pue = pue
        self.kwh = kwh
        self.kgCo2e = kgCo2e
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.accountName = accountName
    }
}
