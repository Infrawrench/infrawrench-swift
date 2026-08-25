/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentDiffEntry: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case onlyInA
        case onlyInB
        case changed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "only-in-a": self = .onlyInA
            case "only-in-b": self = .onlyInB
            case "changed": self = .changed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .onlyInA: return "only-in-a"
            case .onlyInB: return "only-in-b"
            case .changed: return "changed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .onlyInA,
            .onlyInB,
            .changed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The pairing key both sides matched on — the resource type plus the
    /// resource name with environment words removed. Stable across runs.
    public var key: String
    public var resourceTypeId: String
    public var resourceTypeName: String
    /// Whether the slot exists on side A only, side B only, or on both with a
    /// field divergence. Matched pairs that agree are counted in the type summary
    /// rather than listed.
    public var status: Status
    public var a: EnvironmentDiffResourceRef?
    public var b: EnvironmentDiffResourceRef?
    /// Field divergences. Empty unless `status` is `changed`.
    public var changes: [EnvironmentDiffFieldChange]
    /// Divergences hidden by the identity filter (ids, links, addresses,
    /// timestamps). Always 0 when `includeIdentityFields` was requested.
    public var suppressedCount: Int

    public init(
        key: String,
        resourceTypeId: String,
        resourceTypeName: String,
        status: Status,
        a: EnvironmentDiffResourceRef? = nil,
        b: EnvironmentDiffResourceRef? = nil,
        changes: [EnvironmentDiffFieldChange],
        suppressedCount: Int
    ) {
        self.key = key
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.status = status
        self.a = a
        self.b = b
        self.changes = changes
        self.suppressedCount = suppressedCount
    }
}
