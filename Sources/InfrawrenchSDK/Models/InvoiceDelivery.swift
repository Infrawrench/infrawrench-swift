/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The last delivery attempt, or null when none has been made — including on an
/// invoice marked sent by a deployment with no mail provider. “A person released
/// this” and “we delivered it” are different claims, and this field is only ever
/// the second.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct InvoiceDelivery: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case succeeded
        case partial
        case failed
        case noTargets
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "succeeded": self = .succeeded
            case "partial": self = .partial
            case "failed": self = .failed
            case "no_targets": self = .noTargets
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .succeeded: return "succeeded"
            case .partial: return "partial"
            case .failed: return "failed"
            case .noTargets: return "no_targets"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .succeeded,
            .partial,
            .failed,
            .noTargets,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `pending` means an attempt was claimed and its outcome never recorded —
    /// the process died mid-send, so whether the customer received it is unknown.
    /// It is not a failure and is never retried automatically.
    public var status: Status
    /// The addresses this attempt was made to, as the customer record had them
    /// then.
    public var recipients: [String]
    /// How many the mail provider accepted.
    public var delivered: Int
    public var attemptedAt: String
    /// The last attempt that reached at least one address, or null when none ever
    /// has. Never cleared by a later failure — it is a fact about the past, and
    /// it is what decides whether sending again is a retry or a second copy.
    public var deliveredAt: String?
    public var attempts: Int
    public var error: String?

    public init(
        status: Status,
        recipients: [String],
        delivered: Int,
        attemptedAt: String,
        deliveredAt: String? = nil,
        attempts: Int,
        error: String? = nil
    ) {
        self.status = status
        self.recipients = recipients
        self.delivered = delivered
        self.attemptedAt = attemptedAt
        self.deliveredAt = deliveredAt
        self.attempts = attempts
        self.error = error
    }
}
