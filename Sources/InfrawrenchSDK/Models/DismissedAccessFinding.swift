/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DismissedAccessFinding: Codable, Hashable, Sendable {
    public enum RuleId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case accessReviewStalePrincipal
        case accessReviewAdminPrincipal
        case accessReviewKeyPastRotation
        case accessReviewNoRecordedOwner
        case accessReviewNoMfa
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "access-review:stale-principal": self = .accessReviewStalePrincipal
            case "access-review:admin-principal": self = .accessReviewAdminPrincipal
            case "access-review:key-past-rotation": self = .accessReviewKeyPastRotation
            case "access-review:no-recorded-owner": self = .accessReviewNoRecordedOwner
            case "access-review:no-mfa": self = .accessReviewNoMfa
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .accessReviewStalePrincipal: return "access-review:stale-principal"
            case .accessReviewAdminPrincipal: return "access-review:admin-principal"
            case .accessReviewKeyPastRotation: return "access-review:key-past-rotation"
            case .accessReviewNoRecordedOwner: return "access-review:no-recorded-owner"
            case .accessReviewNoMfa: return "access-review:no-mfa"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [RuleId] = [
            .accessReviewStalePrincipal,
            .accessReviewAdminPrincipal,
            .accessReviewKeyPastRotation,
            .accessReviewNoRecordedOwner,
            .accessReviewNoMfa,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case critical
        case high
        case medium
        case low
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "critical": self = .critical
            case "high": self = .high
            case "medium": self = .medium
            case "low": self = .low
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .critical: return "critical"
            case .high: return "high"
            case .medium: return "medium"
            case .low: return "low"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .critical,
            .high,
            .medium,
            .low,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Infrawrench resource id the finding is on.
    public var resourceId: String
    /// Which rule was raised. Half of a dismissal's key, alongside the resource
    /// id. The `access-review:` prefix is reserved so these can share the posture
    /// dismissal store without colliding with plugin-declared posture rule ids.
    public var ruleId: RuleId
    public var title: String
    /// How bad the finding is. `critical` and `high` findings ride the posture
    /// alert window; `medium` and `low` are review work surfaced on the access
    /// review screen and in the weekly digest only.
    public var severity: Severity
    /// Why this principal is flagged, in a sentence.
    public var reason: String
    public var principal: AccessPrincipal
    public var dismissal: AccessReviewDismissal

    public init(
        resourceId: String,
        ruleId: RuleId,
        title: String,
        severity: Severity,
        reason: String,
        principal: AccessPrincipal,
        dismissal: AccessReviewDismissal
    ) {
        self.resourceId = resourceId
        self.ruleId = ruleId
        self.title = title
        self.severity = severity
        self.reason = reason
        self.principal = principal
        self.dismissal = dismissal
    }
}
