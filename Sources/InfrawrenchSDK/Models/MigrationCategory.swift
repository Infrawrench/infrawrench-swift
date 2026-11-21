/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What a resource is across providers, as its plugin declares it. Resources are
/// matched to the target's type of the same category.
public enum MigrationCategory: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case vm
    case kubernetesCluster
    case kubernetesNodePool
    case managedPostgres
    case managedMysql
    case managedRedis
    case managedMongodb
    case objectStorage
    case blockVolume
    case fileStorage
    case loadBalancer
    case containerApp
    case serverlessFunction
    case containerRegistry
    case staticIp
    case dnsZone
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "vm": self = .vm
        case "kubernetes-cluster": self = .kubernetesCluster
        case "kubernetes-node-pool": self = .kubernetesNodePool
        case "managed-postgres": self = .managedPostgres
        case "managed-mysql": self = .managedMysql
        case "managed-redis": self = .managedRedis
        case "managed-mongodb": self = .managedMongodb
        case "object-storage": self = .objectStorage
        case "block-volume": self = .blockVolume
        case "file-storage": self = .fileStorage
        case "load-balancer": self = .loadBalancer
        case "container-app": self = .containerApp
        case "serverless-function": self = .serverlessFunction
        case "container-registry": self = .containerRegistry
        case "static-ip": self = .staticIp
        case "dns-zone": self = .dnsZone
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .vm: return "vm"
        case .kubernetesCluster: return "kubernetes-cluster"
        case .kubernetesNodePool: return "kubernetes-node-pool"
        case .managedPostgres: return "managed-postgres"
        case .managedMysql: return "managed-mysql"
        case .managedRedis: return "managed-redis"
        case .managedMongodb: return "managed-mongodb"
        case .objectStorage: return "object-storage"
        case .blockVolume: return "block-volume"
        case .fileStorage: return "file-storage"
        case .loadBalancer: return "load-balancer"
        case .containerApp: return "container-app"
        case .serverlessFunction: return "serverless-function"
        case .containerRegistry: return "container-registry"
        case .staticIp: return "static-ip"
        case .dnsZone: return "dns-zone"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [MigrationCategory] = [
        .vm,
        .kubernetesCluster,
        .kubernetesNodePool,
        .managedPostgres,
        .managedMysql,
        .managedRedis,
        .managedMongodb,
        .objectStorage,
        .blockVolume,
        .fileStorage,
        .loadBalancer,
        .containerApp,
        .serverlessFunction,
        .containerRegistry,
        .staticIp,
        .dnsZone,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
