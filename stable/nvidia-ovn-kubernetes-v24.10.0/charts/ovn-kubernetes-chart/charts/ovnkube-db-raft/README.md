# ovnkube-db-raft

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Helm chart to build raft based ovnkube db

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dbCheckerLogLevel | int | `4` |  |
| logFileMaxAge | int | `5` |  |
| logFileMaxBackups | int | `5` |  |
| logFileMaxSize | int | `100` |  |
| nbElectionTimer | int | `1000` |  |
| nbLogLevel | string | `"-vconsole:info -vfile:info"` |  |
| nbRaftPort | int | `6643` |  |
| replicas | int | `3` |  |
| sbElectionTimer | int | `1000` |  |
| sbLogLevel | string | `"-vconsole:info -vfile:info"` |  |
| sbRaftPort | int | `6644` |  |

