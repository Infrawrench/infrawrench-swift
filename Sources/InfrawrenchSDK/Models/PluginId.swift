/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Manifest id of an installed plugin.
public enum PluginId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case anthropic
    case anyscale
    case assemblyai
    case aws
    case azure
    case baseten
    case cartesia
    case circleci
    case clickhouse
    case cloudflare
    case cloudinary
    case cohere
    case confluentCloud
    case coralogix
    case coreweave
    case crusoe
    case cursor
    case databricks
    case datadog
    case deepgram
    case deepseek
    case depot
    case devin
    case digitalocean
    case docker
    case elasticCloud
    case elevenlabs
    case fastly
    case fireworks
    case fly
    case gcp
    case gemini
    case github
    case gladia
    case grafanaCloud
    case groq
    case hetzner
    case kafka
    case kubernetes
    case linode
    case memcached
    case metronome
    case mistral
    case modal
    case mongodb
    case mongodbAtlas
    case mssql
    case mysql
    case neon
    case netlify
    case newrelic
    case openai
    case openrouter
    case opensearch
    case oracleCloud
    case ovh
    case planetscale
    case postgres
    case redis
    case redisCloud
    case replicate
    case revai
    case scaleway
    case sentry
    case snowflake
    case speechmatics
    case ssh
    case tailscale
    case temporalCloud
    case together
    case turso
    case twilio
    case uploadthing
    case vercel
    case workos
    case xai
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "anthropic": self = .anthropic
        case "anyscale": self = .anyscale
        case "assemblyai": self = .assemblyai
        case "aws": self = .aws
        case "azure": self = .azure
        case "baseten": self = .baseten
        case "cartesia": self = .cartesia
        case "circleci": self = .circleci
        case "clickhouse": self = .clickhouse
        case "cloudflare": self = .cloudflare
        case "cloudinary": self = .cloudinary
        case "cohere": self = .cohere
        case "confluent-cloud": self = .confluentCloud
        case "coralogix": self = .coralogix
        case "coreweave": self = .coreweave
        case "crusoe": self = .crusoe
        case "cursor": self = .cursor
        case "databricks": self = .databricks
        case "datadog": self = .datadog
        case "deepgram": self = .deepgram
        case "deepseek": self = .deepseek
        case "depot": self = .depot
        case "devin": self = .devin
        case "digitalocean": self = .digitalocean
        case "docker": self = .docker
        case "elastic-cloud": self = .elasticCloud
        case "elevenlabs": self = .elevenlabs
        case "fastly": self = .fastly
        case "fireworks": self = .fireworks
        case "fly": self = .fly
        case "gcp": self = .gcp
        case "gemini": self = .gemini
        case "github": self = .github
        case "gladia": self = .gladia
        case "grafana-cloud": self = .grafanaCloud
        case "groq": self = .groq
        case "hetzner": self = .hetzner
        case "kafka": self = .kafka
        case "kubernetes": self = .kubernetes
        case "linode": self = .linode
        case "memcached": self = .memcached
        case "metronome": self = .metronome
        case "mistral": self = .mistral
        case "modal": self = .modal
        case "mongodb": self = .mongodb
        case "mongodb-atlas": self = .mongodbAtlas
        case "mssql": self = .mssql
        case "mysql": self = .mysql
        case "neon": self = .neon
        case "netlify": self = .netlify
        case "newrelic": self = .newrelic
        case "openai": self = .openai
        case "openrouter": self = .openrouter
        case "opensearch": self = .opensearch
        case "oracle-cloud": self = .oracleCloud
        case "ovh": self = .ovh
        case "planetscale": self = .planetscale
        case "postgres": self = .postgres
        case "redis": self = .redis
        case "redis-cloud": self = .redisCloud
        case "replicate": self = .replicate
        case "revai": self = .revai
        case "scaleway": self = .scaleway
        case "sentry": self = .sentry
        case "snowflake": self = .snowflake
        case "speechmatics": self = .speechmatics
        case "ssh": self = .ssh
        case "tailscale": self = .tailscale
        case "temporal-cloud": self = .temporalCloud
        case "together": self = .together
        case "turso": self = .turso
        case "twilio": self = .twilio
        case "uploadthing": self = .uploadthing
        case "vercel": self = .vercel
        case "workos": self = .workos
        case "xai": self = .xai
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .anthropic: return "anthropic"
        case .anyscale: return "anyscale"
        case .assemblyai: return "assemblyai"
        case .aws: return "aws"
        case .azure: return "azure"
        case .baseten: return "baseten"
        case .cartesia: return "cartesia"
        case .circleci: return "circleci"
        case .clickhouse: return "clickhouse"
        case .cloudflare: return "cloudflare"
        case .cloudinary: return "cloudinary"
        case .cohere: return "cohere"
        case .confluentCloud: return "confluent-cloud"
        case .coralogix: return "coralogix"
        case .coreweave: return "coreweave"
        case .crusoe: return "crusoe"
        case .cursor: return "cursor"
        case .databricks: return "databricks"
        case .datadog: return "datadog"
        case .deepgram: return "deepgram"
        case .deepseek: return "deepseek"
        case .depot: return "depot"
        case .devin: return "devin"
        case .digitalocean: return "digitalocean"
        case .docker: return "docker"
        case .elasticCloud: return "elastic-cloud"
        case .elevenlabs: return "elevenlabs"
        case .fastly: return "fastly"
        case .fireworks: return "fireworks"
        case .fly: return "fly"
        case .gcp: return "gcp"
        case .gemini: return "gemini"
        case .github: return "github"
        case .gladia: return "gladia"
        case .grafanaCloud: return "grafana-cloud"
        case .groq: return "groq"
        case .hetzner: return "hetzner"
        case .kafka: return "kafka"
        case .kubernetes: return "kubernetes"
        case .linode: return "linode"
        case .memcached: return "memcached"
        case .metronome: return "metronome"
        case .mistral: return "mistral"
        case .modal: return "modal"
        case .mongodb: return "mongodb"
        case .mongodbAtlas: return "mongodb-atlas"
        case .mssql: return "mssql"
        case .mysql: return "mysql"
        case .neon: return "neon"
        case .netlify: return "netlify"
        case .newrelic: return "newrelic"
        case .openai: return "openai"
        case .openrouter: return "openrouter"
        case .opensearch: return "opensearch"
        case .oracleCloud: return "oracle-cloud"
        case .ovh: return "ovh"
        case .planetscale: return "planetscale"
        case .postgres: return "postgres"
        case .redis: return "redis"
        case .redisCloud: return "redis-cloud"
        case .replicate: return "replicate"
        case .revai: return "revai"
        case .scaleway: return "scaleway"
        case .sentry: return "sentry"
        case .snowflake: return "snowflake"
        case .speechmatics: return "speechmatics"
        case .ssh: return "ssh"
        case .tailscale: return "tailscale"
        case .temporalCloud: return "temporal-cloud"
        case .together: return "together"
        case .turso: return "turso"
        case .twilio: return "twilio"
        case .uploadthing: return "uploadthing"
        case .vercel: return "vercel"
        case .workos: return "workos"
        case .xai: return "xai"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PluginId] = [
        .anthropic,
        .anyscale,
        .assemblyai,
        .aws,
        .azure,
        .baseten,
        .cartesia,
        .circleci,
        .clickhouse,
        .cloudflare,
        .cloudinary,
        .cohere,
        .confluentCloud,
        .coralogix,
        .coreweave,
        .crusoe,
        .cursor,
        .databricks,
        .datadog,
        .deepgram,
        .deepseek,
        .depot,
        .devin,
        .digitalocean,
        .docker,
        .elasticCloud,
        .elevenlabs,
        .fastly,
        .fireworks,
        .fly,
        .gcp,
        .gemini,
        .github,
        .gladia,
        .grafanaCloud,
        .groq,
        .hetzner,
        .kafka,
        .kubernetes,
        .linode,
        .memcached,
        .metronome,
        .mistral,
        .modal,
        .mongodb,
        .mongodbAtlas,
        .mssql,
        .mysql,
        .neon,
        .netlify,
        .newrelic,
        .openai,
        .openrouter,
        .opensearch,
        .oracleCloud,
        .ovh,
        .planetscale,
        .postgres,
        .redis,
        .redisCloud,
        .replicate,
        .revai,
        .scaleway,
        .sentry,
        .snowflake,
        .speechmatics,
        .ssh,
        .tailscale,
        .temporalCloud,
        .together,
        .turso,
        .twilio,
        .uploadthing,
        .vercel,
        .workos,
        .xai,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
