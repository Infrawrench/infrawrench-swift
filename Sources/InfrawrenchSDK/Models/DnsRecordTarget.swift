/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DnsRecordTarget: Codable, Hashable, Sendable {
    public enum Classification: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case owned
        case dangling
        case external
        case notAnalysed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "owned": self = .owned
            case "dangling": self = .dangling
            case "external": self = .external
            case "not-analysed": self = .notAnalysed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .owned: return "owned"
            case .dangling: return "dangling"
            case .external: return "external"
            case .notAnalysed: return "not-analysed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Classification] = [
            .owned,
            .dangling,
            .external,
            .notAnalysed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The target as stored, lowercased with any trailing dot removed.
    public var value: String
    /// What can be said about a record target from synced state alone. `owned` —
    /// the value is an identity of a synced resource. `dangling` — the value
    /// falls inside a provider namespace this workspace manages (an S3 endpoint,
    /// a `*.vercel.app` alias) and no synced resource claims it, which is the
    /// subdomain-takeover signature. `external` — the value points somewhere
    /// there is no declaration for; not a finding. `not-analysed` — the record
    /// type carries no host target that is reasoned about (TXT, MX, SOA, CAA,
    /// SRV).
    public var classification: Classification
    public var resource: DnsTargetResource?
    public var service: DnsTargetService?

    public init(
        value: String,
        classification: Classification,
        resource: DnsTargetResource? = nil,
        service: DnsTargetService? = nil
    ) {
        self.value = value
        self.classification = classification
        self.resource = resource
        self.service = service
    }
}
