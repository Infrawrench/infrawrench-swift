/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A critical or high severity posture check started failing on a resource. Each
/// finding is sent once.
public struct Event_posture_finding_detected_v1: Codable, Hashable, Sendable {
    public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case postureFindingDetected
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "posture.finding.detected": self = .postureFindingDetected
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .postureFindingDetected: return "posture.finding.detected"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Type2] = [
            .postureFindingDetected,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `evt_…`. Unique per event and stable across retries and redeliveries:
    /// dedupe on it.
    public var id: String
    /// Payload schema version of `type`.
    public var version: Int
    /// When the event happened.
    public var createdAt: String
    public var organizationId: String
    public var severity: EventSeverity
    /// The account the event is about; null when it spans several or none.
    public var accountId: String?
    /// The `env`/`environment`/`stage` tag of the resource the event is about;
    /// null when there is none.
    public var environment: String?
    /// One line for a human.
    public var title: String
    /// Deep link into Infrawrench.
    public var url: String?
    /// True only for Send test event.
    public var test: Bool
    public var type: Type2
    public var data: EventData_posture_finding_detected_v1

    public init(
        id: String,
        version: Int,
        createdAt: String,
        organizationId: String,
        severity: EventSeverity,
        accountId: String? = nil,
        environment: String? = nil,
        title: String,
        url: String? = nil,
        test: Bool,
        type: Type2,
        data: EventData_posture_finding_detected_v1
    ) {
        self.id = id
        self.version = version
        self.createdAt = createdAt
        self.organizationId = organizationId
        self.severity = severity
        self.accountId = accountId
        self.environment = environment
        self.title = title
        self.url = url
        self.test = test
        self.type = type
        self.data = data
    }
}
