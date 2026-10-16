/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SavingsFinding: Codable, Hashable, Sendable {
    public enum Resolution: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case manual
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "manual": self = .manual
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .manual: return "manual"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Resolution] = [
            .manual,
            .resolved,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct RealizedSavings: Codable, Hashable, Sendable {
        public var eventId: String
        public var title: String

        public init(
            eventId: String,
            title: String
        ) {
            self.eventId = eventId
            self.title = title
        }
    }

    /// `<kind>:<sourceId>`, stable across scans; the handle for status changes.
    public var key: String
    public var kind: SavingsFindingKind
    public var sourceId: String
    public var title: String
    public var detail: String?
    public var pluginId: String?
    public var pluginName: String?
    public var accountId: String?
    public var accountName: String?
    public var region: String?
    /// Infrawrench resource id; null for seats.
    public var resourceId: String?
    public var resourceName: String
    public var resourceTypeId: String?
    public var resourceTypeName: String?
    public var tags: [String: String]
    public var monthlySavings: SavingsFindingMoney?
    public var status: SavingsFindingStatus
    public var statusChangedAt: String?
    public var statusChangedBy: SavingsFindingActor?
    public var statusNote: String?
    /// For Completed: `manual` when a person completed it, `resolved` when a scan
    /// stopped reporting it (the resource was removed, resized or is in use
    /// again).
    public var resolution: Resolution?
    /// First observation of this occurrence.
    public var detectedAt: String
    public var lastSeenAt: String
    /// False once a scan stopped reporting it.
    public var present: Bool
    /// The realized savings entry recorded for the fix, when one matches.
    public var realizedSavings: RealizedSavings?

    public init(
        key: String,
        kind: SavingsFindingKind,
        sourceId: String,
        title: String,
        detail: String? = nil,
        pluginId: String? = nil,
        pluginName: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        region: String? = nil,
        resourceId: String? = nil,
        resourceName: String,
        resourceTypeId: String? = nil,
        resourceTypeName: String? = nil,
        tags: [String: String],
        monthlySavings: SavingsFindingMoney? = nil,
        status: SavingsFindingStatus,
        statusChangedAt: String? = nil,
        statusChangedBy: SavingsFindingActor? = nil,
        statusNote: String? = nil,
        resolution: Resolution? = nil,
        detectedAt: String,
        lastSeenAt: String,
        present: Bool,
        realizedSavings: RealizedSavings? = nil
    ) {
        self.key = key
        self.kind = kind
        self.sourceId = sourceId
        self.title = title
        self.detail = detail
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.accountId = accountId
        self.accountName = accountName
        self.region = region
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.tags = tags
        self.monthlySavings = monthlySavings
        self.status = status
        self.statusChangedAt = statusChangedAt
        self.statusChangedBy = statusChangedBy
        self.statusNote = statusNote
        self.resolution = resolution
        self.detectedAt = detectedAt
        self.lastSeenAt = lastSeenAt
        self.present = present
        self.realizedSavings = realizedSavings
    }
}
