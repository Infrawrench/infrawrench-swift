/*
 * InfrawrenchSDK v1.74.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExtendedSupportListResponse: Codable, Hashable, Sendable {
    public struct Counts: Codable, Hashable, Sendable {
        public var endOfLife: Int
        public var surcharged: Int
        public var unsupported: Int
        public var upcoming: Int

        public init(
            endOfLife: Int,
            surcharged: Int,
            unsupported: Int,
            upcoming: Int
        ) {
            self.endOfLife = endOfLife
            self.surcharged = surcharged
            self.unsupported = unsupported
            self.upcoming = upcoming
        }

        private enum CodingKeys: String, CodingKey {
            case endOfLife = "end-of-life"
            case surcharged = "surcharged"
            case unsupported = "unsupported"
            case upcoming = "upcoming"
        }
    }

    public struct Billing: Codable, Hashable, Sendable {
        public struct Account2: Codable, Hashable, Sendable {
            public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case read
                case failed
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "read": self = .read
                    case "failed": self = .failed
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .read: return "read"
                    case .failed: return "failed"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Status] = [
                    .read,
                    .failed,
                ]

                public init(from decoder: any Decoder) throws {
                    self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    try container.encode(rawValue)
                }
            }

            public var accountId: String
            public var accountName: String
            public var status: Status
            public var error: String?

            public init(
                accountId: String,
                accountName: String,
                status: Status,
                error: String? = nil
            ) {
                self.accountId = accountId
                self.accountName = accountName
                self.status = status
                self.error = error
            }
        }

        public var windowDays: Int
        public var accounts: [Account2]
        public var unattributed: [UnattributedExtendedSupportCharge]

        public init(
            windowDays: Int,
            accounts: [Account2],
            unattributed: [UnattributedExtendedSupportCharge]
        ) {
            self.windowDays = windowDays
            self.accounts = accounts
            self.unattributed = unattributed
        }
    }

    /// Most urgent first, then largest surcharge.
    public var findings: [ExtendedSupportFinding]
    public var totalCount: Int
    public var counts: Counts
    /// What surcharged and end-of-life findings cost now.
    public var currentMonthly: [ExtendedSupportTotal]
    /// What upcoming findings will add once they start.
    public var upcomingMonthly: [ExtendedSupportTotal]
    public var leadDays: Int
    /// Present when billed charges were read for at least one account.
    public var billing: Billing?
    public var generatedAt: String

    public init(
        findings: [ExtendedSupportFinding],
        totalCount: Int,
        counts: Counts,
        currentMonthly: [ExtendedSupportTotal],
        upcomingMonthly: [ExtendedSupportTotal],
        leadDays: Int,
        billing: Billing? = nil,
        generatedAt: String
    ) {
        self.findings = findings
        self.totalCount = totalCount
        self.counts = counts
        self.currentMonthly = currentMonthly
        self.upcomingMonthly = upcomingMonthly
        self.leadDays = leadDays
        self.billing = billing
        self.generatedAt = generatedAt
    }
}
