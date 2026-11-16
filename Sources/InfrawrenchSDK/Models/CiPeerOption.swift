/*
 * InfrawrenchSDK v1.113.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.113.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiPeerOption: Codable, Hashable, Sendable {
    public struct Credential: Codable, Hashable, Sendable {
        public var description: String
        public var shortLived: Bool
        public var namespaces: Bool

        public init(
            description: String,
            shortLived: Bool,
            namespaces: Bool
        ) {
            self.description = description
            self.shortLived = shortLived
            self.namespaces = namespaces
        }
    }

    public struct Executor: Codable, Hashable, Sendable {
        public struct Kind: Codable, Hashable, Sendable {
            public enum Kind2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case vm
                case container
                case build
                case host
                case cluster
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "vm": self = .vm
                    case "container": self = .container
                    case "build": self = .build
                    case "host": self = .host
                    case "cluster": self = .cluster
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .vm: return "vm"
                    case .container: return "container"
                    case .build: return "build"
                    case .host: return "host"
                    case .cluster: return "cluster"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Kind2] = [
                    .vm,
                    .container,
                    .build,
                    .host,
                    .cluster,
                ]

                public init(from decoder: any Decoder) throws {
                    self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    try container.encode(rawValue)
                }
            }

            public struct Defaults: Codable, Hashable, Sendable {
                public var machine: String?
                public var image: String?
                public var region: String?

                public init(
                    machine: String? = nil,
                    image: String? = nil,
                    region: String? = nil
                ) {
                    self.machine = machine
                    self.image = image
                    self.region = region
                }
            }

            /// The spec allows several shapes here. Decoding tries the branches
            /// in spec order, so the most specific match wins.
            public enum TypicalStartSeconds: Codable, Hashable, Sendable {
                public enum TypicalStartSecondsTypicalStartSeconds: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                    case infinity
                    case infinity2
                    case naN
                    /// A value the API added after this SDK was generated. Kept
                    /// rather than rejected, so a new server-side value cannot
                    /// break decoding.
                    case unrecognized(String)

                    public init(rawValue: String) {
                        switch rawValue {
                        case "Infinity": self = .infinity
                        case "-Infinity": self = .infinity2
                        case "NaN": self = .naN
                        default: self = .unrecognized(rawValue)
                        }
                    }

                    public var rawValue: String {
                        switch self {
                        case .infinity: return "Infinity"
                        case .infinity2: return "-Infinity"
                        case .naN: return "NaN"
                        case .unrecognized(let value): return value
                        }
                    }

                    /// Every value the spec declares. `unrecognized` is deliberately absent.
                    public static let allKnownCases: [TypicalStartSecondsTypicalStartSeconds] = [
                        .infinity,
                        .infinity2,
                        .naN,
                    ]

                    public init(from decoder: any Decoder) throws {
                        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                    }

                    public func encode(to encoder: any Encoder) throws {
                        var container = encoder.singleValueContainer()
                        try container.encode(rawValue)
                    }
                }

                case double(Double)
                case typicalStartSeconds(TypicalStartSecondsTypicalStartSeconds)
                /// A shape none of the branches above matched.
                case other(JSONValue)

                public init(from decoder: any Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    if let value = try? container.decode(Double.self) {
                        self = .double(value)
                        return
                    }
                    if let value = try? container.decode(TypicalStartSecondsTypicalStartSeconds.self) {
                        self = .typicalStartSeconds(value)
                        return
                    }
                    self = .other(try container.decode(JSONValue.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .double(let value): try container.encode(value)
                    case .typicalStartSeconds(let value): try container.encode(value)
                    case .other(let value): try container.encode(value)
                    }
                }
            }

            /// The spec allows several shapes here. Decoding tries the branches
            /// in spec order, so the most specific match wins.
            public enum MinimumBillingSeconds: Codable, Hashable, Sendable {
                public enum MinimumBillingSecondsMinimumBillingSeconds: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                    case infinity
                    case infinity2
                    case naN
                    /// A value the API added after this SDK was generated. Kept
                    /// rather than rejected, so a new server-side value cannot
                    /// break decoding.
                    case unrecognized(String)

                    public init(rawValue: String) {
                        switch rawValue {
                        case "Infinity": self = .infinity
                        case "-Infinity": self = .infinity2
                        case "NaN": self = .naN
                        default: self = .unrecognized(rawValue)
                        }
                    }

                    public var rawValue: String {
                        switch self {
                        case .infinity: return "Infinity"
                        case .infinity2: return "-Infinity"
                        case .naN: return "NaN"
                        case .unrecognized(let value): return value
                        }
                    }

                    /// Every value the spec declares. `unrecognized` is deliberately absent.
                    public static let allKnownCases: [MinimumBillingSecondsMinimumBillingSeconds] = [
                        .infinity,
                        .infinity2,
                        .naN,
                    ]

                    public init(from decoder: any Decoder) throws {
                        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                    }

                    public func encode(to encoder: any Encoder) throws {
                        var container = encoder.singleValueContainer()
                        try container.encode(rawValue)
                    }
                }

                case double(Double)
                case minimumBillingSeconds(MinimumBillingSecondsMinimumBillingSeconds)
                /// A shape none of the branches above matched.
                case other(JSONValue)

                public init(from decoder: any Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    if let value = try? container.decode(Double.self) {
                        self = .double(value)
                        return
                    }
                    if let value = try? container.decode(MinimumBillingSecondsMinimumBillingSeconds.self) {
                        self = .minimumBillingSeconds(value)
                        return
                    }
                    self = .other(try container.decode(JSONValue.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .double(let value): try container.encode(value)
                    case .minimumBillingSeconds(let value): try container.encode(value)
                    case .other(let value): try container.encode(value)
                    }
                }
            }

            public var kind: Kind2
            public var label: String
            public var defaults: Defaults
            public var typicalStartSeconds: TypicalStartSeconds?
            public var minimumBillingSeconds: MinimumBillingSeconds?
            public var gpus: Bool?
            public var machineSuggestions: [String]?
            /// What `cloud.region` means for this kind, when it is not a region.
            public var regionLabel: String?

            public init(
                kind: Kind2,
                label: String,
                defaults: Defaults,
                typicalStartSeconds: TypicalStartSeconds? = nil,
                minimumBillingSeconds: MinimumBillingSeconds? = nil,
                gpus: Bool? = nil,
                machineSuggestions: [String]? = nil,
                regionLabel: String? = nil
            ) {
                self.kind = kind
                self.label = label
                self.defaults = defaults
                self.typicalStartSeconds = typicalStartSeconds
                self.minimumBillingSeconds = minimumBillingSeconds
                self.gpus = gpus
                self.machineSuggestions = machineSuggestions
                self.regionLabel = regionLabel
            }
        }

        public struct HelpLink: Codable, Hashable, Sendable {
            public var label: String
            public var url: String

            public init(
                label: String,
                url: String
            ) {
                self.label = label
                self.url = url
            }
        }

        public var kinds: [Kind]
        public var helpLink: HelpLink?

        public init(
            kinds: [Kind],
            helpLink: HelpLink? = nil
        ) {
            self.kinds = kinds
            self.helpLink = helpLink
        }
    }

    public var pluginId: String
    public var pluginName: String
    public var credential: Credential?
    public var executor: Executor?
    /// The credential a job is lent, as the resource's provider declares it.
    public var lends: String
    /// What that credential reaches beyond the resource.
    public var reach: String
    /// How long it lasts once lent.
    public var lifetime: String
    public var unavailable: String?
    public var unreachable: String?

    public init(
        pluginId: String,
        pluginName: String,
        credential: Credential? = nil,
        executor: Executor? = nil,
        lends: String,
        reach: String,
        lifetime: String,
        unavailable: String? = nil,
        unreachable: String? = nil
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.credential = credential
        self.executor = executor
        self.lends = lends
        self.reach = reach
        self.lifetime = lifetime
        self.unavailable = unavailable
        self.unreachable = unreachable
    }
}
