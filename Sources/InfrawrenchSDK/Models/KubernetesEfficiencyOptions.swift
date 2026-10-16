/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KubernetesEfficiencyOptions: Codable, Hashable, Sendable {
    public struct Cluster: Codable, Hashable, Sendable {
        public var id: String
        public var name: String

        public init(
            id: String,
            name: String
        ) {
            self.id = id
            self.name = name
        }
    }

    public struct LabelKey: Codable, Hashable, Sendable {
        public enum Group: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case tag
            case k8s
            case k8sPodLabel
            case k8sNodeLabel
            case k8sPvcLabel
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "tag": self = .tag
                case "k8s": self = .k8s
                case "k8s_pod_label": self = .k8sPodLabel
                case "k8s_node_label": self = .k8sNodeLabel
                case "k8s_pvc_label": self = .k8sPvcLabel
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .tag: return "tag"
                case .k8s: return "k8s"
                case .k8sPodLabel: return "k8s_pod_label"
                case .k8sNodeLabel: return "k8s_node_label"
                case .k8sPvcLabel: return "k8s_pvc_label"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Group] = [
                .tag,
                .k8s,
                .k8sPodLabel,
                .k8sNodeLabel,
                .k8sPvcLabel,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public struct Key: Codable, Hashable, Sendable {
            public enum Group2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case tag
                case k8s
                case k8sPodLabel
                case k8sNodeLabel
                case k8sPvcLabel
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "tag": self = .tag
                    case "k8s": self = .k8s
                    case "k8s_pod_label": self = .k8sPodLabel
                    case "k8s_node_label": self = .k8sNodeLabel
                    case "k8s_pvc_label": self = .k8sPvcLabel
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .tag: return "tag"
                    case .k8s: return "k8s"
                    case .k8sPodLabel: return "k8s_pod_label"
                    case .k8sNodeLabel: return "k8s_node_label"
                    case .k8sPvcLabel: return "k8s_pvc_label"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Group2] = [
                    .tag,
                    .k8s,
                    .k8sPodLabel,
                    .k8sNodeLabel,
                    .k8sPvcLabel,
                ]

                public init(from decoder: any Decoder) throws {
                    self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    try container.encode(rawValue)
                }
            }

            public var key: String
            public var group: Group2
            public var name: String

            public init(
                key: String,
                group: Group2,
                name: String
            ) {
                self.key = key
                self.group = group
                self.name = name
            }
        }

        public var group: Group
        public var keys: [Key]

        public init(
            group: Group,
            keys: [Key]
        ) {
            self.group = group
            self.keys = keys
        }
    }

    public var clusters: [Cluster]
    public var regions: [String]
    public var namespaces: [String]
    public var nodePools: [String]
    public var labelKeys: [LabelKey]

    public init(
        clusters: [Cluster],
        regions: [String],
        namespaces: [String],
        nodePools: [String],
        labelKeys: [LabelKey]
    ) {
        self.clusters = clusters
        self.regions = regions
        self.namespaces = namespaces
        self.nodePools = nodePools
        self.labelKeys = labelKeys
    }
}
