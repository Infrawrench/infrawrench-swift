/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A provider incident whose span overlaps the window — returned alongside the
/// events so clients can badge events that fall inside it ("during DigitalOcean
/// incident").
public struct MomentIncidentSpan: Codable, Hashable, Sendable {
    public enum Impact: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case maintenance
        case minor
        case major
        case critical
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "maintenance": self = .maintenance
            case "minor": self = .minor
            case "major": self = .major
            case "critical": self = .critical
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .maintenance: return "maintenance"
            case .minor: return "minor"
            case .major: return "major"
            case .critical: return "critical"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Impact] = [
            .maintenance,
            .minor,
            .major,
            .critical,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    public var pluginId: String
    public var pluginName: String
    public var title: String
    public var impact: Impact
    public var startedAt: String
    public var resolvedAt: String?
    public var url: String?

    public init(
        id: String,
        pluginId: String,
        pluginName: String,
        title: String,
        impact: Impact,
        startedAt: String,
        resolvedAt: String? = nil,
        url: String? = nil
    ) {
        self.id = id
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.title = title
        self.impact = impact
        self.startedAt = startedAt
        self.resolvedAt = resolvedAt
        self.url = url
    }
}
