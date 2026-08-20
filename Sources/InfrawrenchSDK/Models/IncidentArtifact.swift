/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentArtifact: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case freeze
        case moment
        case slack
        case statusPage
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "freeze": self = .freeze
            case "moment": self = .moment
            case "slack": self = .slack
            case "status-page": self = .statusPage
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .freeze: return "freeze"
            case .moment: return "moment"
            case .slack: return "slack"
            case .statusPage: return "status-page"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .freeze,
            .moment,
            .slack,
            .statusPage,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case created
        case failed
        case closed
        case closeFailed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "created": self = .created
            case "failed": self = .failed
            case "closed": self = .closed
            case "close_failed": self = .closeFailed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .created: return "created"
            case .failed: return "failed"
            case .closed: return "closed"
            case .closeFailed: return "close_failed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .created,
            .failed,
            .closed,
            .closeFailed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum RefId: Codable, Hashable, Sendable {
        case string(String)
        case string2(String)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
                return
            }
            if let value = try? container.decode(String.self) {
                self = .string2(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .string2(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var id: String
    /// Which side effect of declaring this artefact records.
    public var kind: Kind
    /// `failed` is a stored state, not an error: declaring writes the incident
    /// first and attempts each opted-in side effect afterwards, so a Slack outage
    /// costs the announcement and never the incident. A failed artefact carries
    /// its error and can be retried.
    ///
    /// `close_failed` is the other half and is deliberately distinct: the
    /// artefact **was** created and resolving could not put it away, so the
    /// change freeze is still in force or the public notice still reports an
    /// outage. Retrying a `failed` artefact re-creates it; retrying a
    /// `close_failed` one re-closes it. Collapsing the two would either strand
    /// the incident with a live freeze nothing can lift, or open a second freeze.
    public var status: Status
    /// Human label — the freeze name, the destination count.
    public var label: String?
    /// Freeze id, notice id, Slack channel id…
    public var refId: RefId?
    /// Second half of a compound reference — a Slack message ts, a window width.
    public var refSecondary: String?
    /// Why it failed. Null unless `status` is `failed` or `close_failed`.
    public var error: String?
    public var request: IncidentArtifactRequest?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        kind: Kind,
        status: Status,
        label: String? = nil,
        refId: RefId? = nil,
        refSecondary: String? = nil,
        error: String? = nil,
        request: IncidentArtifactRequest? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.kind = kind
        self.status = status
        self.label = label
        self.refId = refId
        self.refSecondary = refSecondary
        self.error = error
        self.request = request
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
