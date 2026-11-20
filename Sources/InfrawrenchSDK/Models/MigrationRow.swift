/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationRow: Codable, Hashable, Sendable {
    public struct Specs: Codable, Hashable, Sendable {
        public var vcpus: Double?
        public var memoryGb: Double?
        public var gpuCount: Double?
        public var gpuModel: String?
        public var diskGb: Double?
        public var count: Double

        public init(
            vcpus: Double? = nil,
            memoryGb: Double? = nil,
            gpuCount: Double? = nil,
            gpuModel: String? = nil,
            diskGb: Double? = nil,
            count: Double
        ) {
            self.vcpus = vcpus
            self.memoryGb = memoryGb
            self.gpuCount = gpuCount
            self.gpuModel = gpuModel
            self.diskGb = diskGb
            self.count = count
        }
    }

    public struct Target: Codable, Hashable, Sendable {
        public var resourceTypeId: String
        public var resourceTypeName: String
        public var sizeId: String?
        public var sizeLabel: String?
        public var vcpus: Double?
        public var memoryGb: Double?
        public var gpuCount: Double?
        public var region: String?
        public var regionLabel: String?
        public var cost: MigrationCost?
        public var overridden: Bool

        public init(
            resourceTypeId: String,
            resourceTypeName: String,
            sizeId: String? = nil,
            sizeLabel: String? = nil,
            vcpus: Double? = nil,
            memoryGb: Double? = nil,
            gpuCount: Double? = nil,
            region: String? = nil,
            regionLabel: String? = nil,
            cost: MigrationCost? = nil,
            overridden: Bool
        ) {
            self.resourceTypeId = resourceTypeId
            self.resourceTypeName = resourceTypeName
            self.sizeId = sizeId
            self.sizeLabel = sizeLabel
            self.vcpus = vcpus
            self.memoryGb = memoryGb
            self.gpuCount = gpuCount
            self.region = region
            self.regionLabel = regionLabel
            self.cost = cost
            self.overridden = overridden
        }
    }

    public enum Note: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case noAccount
        case sourceSizeUnknown
        case noSizeMatch
        case noPrice
        case catalogUnavailable
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "no-account": self = .noAccount
            case "source-size-unknown": self = .sourceSizeUnknown
            case "no-size-match": self = .noSizeMatch
            case "no-price": self = .noPrice
            case "catalog-unavailable": self = .catalogUnavailable
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .noAccount: return "no-account"
            case .sourceSizeUnknown: return "source-size-unknown"
            case .noSizeMatch: return "no-size-match"
            case .noPrice: return "no-price"
            case .catalogUnavailable: return "catalog-unavailable"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Note] = [
            .noAccount,
            .sourceSizeUnknown,
            .noSizeMatch,
            .noPrice,
            .catalogUnavailable,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct TargetType: Codable, Hashable, Sendable {
        public var id: String
        public var name: String

        public init(
            id: String,
            name: String
        ) {
            self.id = id
            self.name = name
        }
    }

    public var resourceId: String
    public var displayName: String
    public var pluginId: PluginId
    public var pluginName: String
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var accountId: String
    public var category: MigrationCategory
    public var sourceRegion: String?
    public var sourceArea: MigrationArea?
    public var instanceType: String?
    public var specs: Specs
    /// What it costs now; null when nothing can price it (never 0).
    public var current: MigrationCost?
    public var target: Target
    /// Why the target has no figure, when it has none.
    public var note: Note?
    /// Target sizes for the picker: qualifying first, cheapest first.
    public var candidates: [MigrationSizeOption]
    public var targetTypes: [TargetType]

    public init(
        resourceId: String,
        displayName: String,
        pluginId: PluginId,
        pluginName: String,
        resourceTypeId: String,
        resourceTypeName: String,
        accountId: String,
        category: MigrationCategory,
        sourceRegion: String? = nil,
        sourceArea: MigrationArea? = nil,
        instanceType: String? = nil,
        specs: Specs,
        current: MigrationCost? = nil,
        target: Target,
        note: Note? = nil,
        candidates: [MigrationSizeOption],
        targetTypes: [TargetType]
    ) {
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.accountId = accountId
        self.category = category
        self.sourceRegion = sourceRegion
        self.sourceArea = sourceArea
        self.instanceType = instanceType
        self.specs = specs
        self.current = current
        self.target = target
        self.note = note
        self.candidates = candidates
        self.targetTypes = targetTypes
    }
}
