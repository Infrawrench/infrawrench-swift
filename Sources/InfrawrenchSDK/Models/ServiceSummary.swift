/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ServiceSummary: Codable, Hashable, Sendable {
    public struct Cost: Codable, Hashable, Sendable {
        public struct Total: Codable, Hashable, Sendable {
            public var currency: String
            public var amount: Double

            public init(
                currency: String,
                amount: Double
            ) {
                self.currency = currency
                self.amount = amount
            }
        }

        public struct ByProvider: Codable, Hashable, Sendable {
            public var pluginId: String
            public var currency: String
            public var amount: Double

            public init(
                pluginId: String,
                currency: String,
                amount: Double
            ) {
                self.pluginId = pluginId
                self.currency = currency
                self.amount = amount
            }
        }

        public var windowDays: Int
        /// False when the cost warehouse could not be read; never read that as
        /// zero.
        public var available: Bool
        public var totals: [Total]
        public var byProvider: [ByProvider]
        public var costedMembers: Int

        public init(
            windowDays: Int,
            available: Bool,
            totals: [Total],
            byProvider: [ByProvider],
            costedMembers: Int
        ) {
            self.windowDays = windowDays
            self.available = available
            self.totals = totals
            self.byProvider = byProvider
            self.costedMembers = costedMembers
        }
    }

    public struct Slo2: Codable, Hashable, Sendable {
        public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case exhausted
            case fastBurn
            case slowBurn
            case ok
            case unknown
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "exhausted": self = .exhausted
                case "fast_burn": self = .fastBurn
                case "slow_burn": self = .slowBurn
                case "ok": self = .ok
                case "unknown": self = .unknown
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .exhausted: return "exhausted"
                case .fastBurn: return "fast_burn"
                case .slowBurn: return "slow_burn"
                case .ok: return "ok"
                case .unknown: return "unknown"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Status] = [
                .exhausted,
                .fastBurn,
                .slowBurn,
                .ok,
                .unknown,
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
        public var name: String
        public var status: Status
        public var targetPercent: Double
        public var budgetRemaining: Double?

        public init(
            id: String,
            name: String,
            status: Status,
            targetPercent: Double,
            budgetRemaining: Double? = nil
        ) {
            self.id = id
            self.name = name
            self.status = status
            self.targetPercent = targetPercent
            self.budgetRemaining = budgetRemaining
        }
    }

    public struct Runbook2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var enabled: Bool

        public init(
            id: String,
            name: String,
            enabled: Bool
        ) {
            self.id = id
            self.name = name
            self.enabled = enabled
        }
    }

    public struct OnCall: Codable, Hashable, Sendable {
        public struct Current: Codable, Hashable, Sendable {
            public var userId: String
            public var name: String?
            public var email: String?
            public var endsAt: String

            public init(
                userId: String,
                name: String? = nil,
                email: String? = nil,
                endsAt: String
            ) {
                self.userId = userId
                self.name = name
                self.email = email
                self.endsAt = endsAt
            }
        }

        public struct Next: Codable, Hashable, Sendable {
            public var userId: String
            public var name: String?
            public var email: String?

            public init(
                userId: String,
                name: String? = nil,
                email: String? = nil
            ) {
                self.userId = userId
                self.name = name
                self.email = email
            }
        }

        public var scheduleId: String
        public var scheduleName: String
        public var enabled: Bool
        public var current: Current?
        public var next: Next?

        public init(
            scheduleId: String,
            scheduleName: String,
            enabled: Bool,
            current: Current? = nil,
            next: Next? = nil
        ) {
            self.scheduleId = scheduleId
            self.scheduleName = scheduleName
            self.enabled = enabled
            self.current = current
            self.next = next
        }
    }

    public struct Findings: Codable, Hashable, Sendable {
        public struct Posture: Codable, Hashable, Sendable {
            public struct Counts: Codable, Hashable, Sendable {
                public var critical: Int
                public var high: Int
                public var medium: Int
                public var low: Int

                public init(
                    critical: Int,
                    high: Int,
                    medium: Int,
                    low: Int
                ) {
                    self.critical = critical
                    self.high = high
                    self.medium = medium
                    self.low = low
                }
            }

            public var counts: Counts
            /// At most 25, worst first.
            public var items: [ServicePostureFinding]

            public init(
                counts: Counts,
                items: [ServicePostureFinding]
            ) {
                self.counts = counts
                self.items = items
            }
        }

        public struct Orphan: Codable, Hashable, Sendable {
            public var resourceId: String
            public var resourceName: String
            public var reason: String

            public init(
                resourceId: String,
                resourceName: String,
                reason: String
            ) {
                self.resourceId = resourceId
                self.resourceName = resourceName
                self.reason = reason
            }
        }

        public struct Backup: Codable, Hashable, Sendable {
            public var resourceId: String
            public var resourceName: String
            /// `unprotected`, `rpo-breach`, `retention-below-policy`,
            /// `drill-stale`, `drill-failed` or `drill-never`.
            public var kind: String
            public var detail: String

            public init(
                resourceId: String,
                resourceName: String,
                kind: String,
                detail: String
            ) {
                self.resourceId = resourceId
                self.resourceName = resourceName
                self.kind = kind
                self.detail = detail
            }
        }

        public enum Unavailable: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case posture
            case orphans
            case backups
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "posture": self = .posture
                case "orphans": self = .orphans
                case "backups": self = .backups
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .posture: return "posture"
                case .orphans: return "orphans"
                case .backups: return "backups"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Unavailable] = [
                .posture,
                .orphans,
                .backups,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var posture: Posture
        public var orphans: [Orphan]
        public var backups: [Backup]
        public var unavailable: [Unavailable]

        public init(
            posture: Posture,
            orphans: [Orphan],
            backups: [Backup],
            unavailable: [Unavailable]
        ) {
            self.posture = posture
            self.orphans = orphans
            self.backups = backups
            self.unavailable = unavailable
        }
    }

    public struct RecentChange: Codable, Hashable, Sendable {
        public enum ChangeKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case created
            case updated
            case deleted
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "created": self = .created
                case "updated": self = .updated
                case "deleted": self = .deleted
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .created: return "created"
                case .updated: return "updated"
                case .deleted: return "deleted"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [ChangeKind] = [
                .created,
                .updated,
                .deleted,
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
        public var resourceId: String
        public var resourceName: String
        public var pluginId: String
        public var changeKind: ChangeKind
        public var fields: [String]
        public var at: String

        public init(
            id: String,
            resourceId: String,
            resourceName: String,
            pluginId: String,
            changeKind: ChangeKind,
            fields: [String],
            at: String
        ) {
            self.id = id
            self.resourceId = resourceId
            self.resourceName = resourceName
            self.pluginId = pluginId
            self.changeKind = changeKind
            self.fields = fields
            self.at = at
        }
    }

    public var service: Service
    public var memberCount: Int
    /// Trailing member spend, per currency. Respects the caller's cost visibility
    /// scope.
    public var cost: Cost
    public var slos: [Slo2]
    public var runbooks: [Runbook2]
    public var onCall: OnCall?
    public var findings: Findings
    public var recentChanges: [RecentChange]
    public var scorecards: [ScorecardResult]
    public var generatedAt: String

    public init(
        service: Service,
        memberCount: Int,
        cost: Cost,
        slos: [Slo2],
        runbooks: [Runbook2],
        onCall: OnCall? = nil,
        findings: Findings,
        recentChanges: [RecentChange],
        scorecards: [ScorecardResult],
        generatedAt: String
    ) {
        self.service = service
        self.memberCount = memberCount
        self.cost = cost
        self.slos = slos
        self.runbooks = runbooks
        self.onCall = onCall
        self.findings = findings
        self.recentChanges = recentChanges
        self.scorecards = scorecards
        self.generatedAt = generatedAt
    }
}
