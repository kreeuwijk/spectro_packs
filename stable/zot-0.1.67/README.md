# Zot Config Pack

The Zot configuration pack enables the deployment of the Zot OCI-native container image registry within your Kubernetes cluster using Palette. Zot is a lightweight, scalable, and secure OCI-native container registry that supports Docker and OCI image formats.

## Prerequisites

- **Persistent Storage**: Ensure that persistent storage is available for Zot by enabling persistence in the configuration.
- **Registry Password**: A password must be provided for securing the registry (`registryPassword` is mandatory).
- **Air-Gapped Environments**: If operating in an air-gapped environment, modify the `kube-apiserver-arg` section in your configuration to remove `AlwaysPullImages` from the `-enable-admission-plugins` option.

  - Example:
    ```yaml
    - -enable-admission-plugins=NamespaceLifecycle,ServiceAccount,NodeRestriction
    ```

## Parameters

Configure the following parameters in the `values.yaml` file to customize your Zot deployment:

| Name                               | Description                                                  | Type    | Default Value | Required |
|------------------------------------|--------------------------------------------------------------|---------|---------------|----------|
| `replicaCount`                     | Number of replicas for Zot deployment.                      | Integer | `1`           | No       |
| `image.repository`                 | Repository for the Zot image.                               | String  | `us-docker.pkg.dev/palette-images/edge/ghcr.io/project-zot/zot` | No       |
| `image.tag`                         | Tag for the Zot image.                                      | String  | `v2.1.2`      | No       |
| `image.pullPolicy`                  | Image pull policy.                                          | String  | `IfNotPresent` | No       |
| `service.type`                      | Type of service (`ClusterIP`, `NodePort`).                  | String  | `NodePort`    | No       |
| `service.port`                      | Service port for Zot.                                       | Integer | `5000`        | No       |
| `service.nodePort`                  | NodePort value if using `NodePort`.                         | Integer | `30003`       | No       |
| `persistence`                       | Enable persistent storage for Zot.                          | Boolean | `true`        | No       |
| `pvc.storage`                        | Storage size for the persistent volume.                     | String  | `60Gi`        | No       |
| `pvc.accessMode`                     | Volume access mode.                                         | String  | `ReadWriteMany` | No       |
| `pvc.storageClassName`               | Storage class name.                                         | String  | `null`        | No       |
| `ingress.enabled`                   | Enable ingress for Zot.                                     | Boolean | `false`       | No       |
| `ingress.className`                 | Ingress class name.                                         | String  | `nginx`       | No       |
| `log.level`                         | Log level for Zot.                                          | String  | `debug`       | No       |
| `extensions.cve.updateInterval`     | Interval for CVE updates.                                   | String  | `2h`          | No       |
| `extensions.ui.enable`              | Enable Zot UI.                                              | Boolean | `true`        | No       |
| `extensions.search.enable`          | Enable search functionality.                                | Boolean | `true`        | No       |
| `tls.auto.commonName`               | Common name for auto-generated TLS cert.                    | String  | `{{.spectro.system.cluster.kubevip}}` | No       |
| `tls.custom.enabled`                | Enable custom TLS certificates.                            | Boolean | `false`       | No       |
| `registryPassword`                  | Password for securing the registry.                        | String  | Required      | Yes      |

## Usage

### 1. Configuring Storage

Ensure persistent storage is enabled by setting:

```yaml
persistence: true
pvc:
  storage: 60Gi
  accessMode: ReadWriteMany
  storageClassName: "your-storage-class"  # Optional
```

### 2. Exposing Zot via NodePort

```yaml
service:
  type: NodePort
  port: 5000
  nodePort: 30003
```

### 3. Enabling Ingress (Optional)

```yaml
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: chart-example.local
      paths:
        - path: /
```

### 4. Configuring Logging

```yaml
log:
  level: debug  # Options: debug, info, warn, error, panic, fatal
```

### 5. Setting the Registry Password

Since `registryPassword` is mandatory, make sure to set it before deploying:

```yaml
registryPassword: "your-secure-password"
```

### 6. Enabling Garbage Collection

To enable automatic garbage collection for unused images:

```yaml
storage:
  rootDirectory: "/var/lib/registry"
  gc: true
  gcDelay: "1h"
  gcInterval: "24h"
```

### 7. Configuring TLS

For auto-generated TLS certificates:

```yaml
tls:
  auto:
    commonName: "your-registry-domain.com"
```

For custom TLS certificates:

```yaml
tls:
  custom:
    enabled: true
    cert: "base64-encoded-certificate"
    key: "base64-encoded-private-key"
    ca: "base64-encoded-ca-certificate"
```

### Applying Configuration Changes

After updating the `values.yaml` file with your configurations, apply the changes using Palette's deployment tools.

## Additional Resources

- [Zot Documentation](https://zotregistry.io/)
- [Zot GitHub Repository](https://github.com/project-zot/zot)
- [OCI Registry Specification](https://github.com/opencontainers/distribution-spec)
- [Docker Registry HTTP API V2](https://docs.docker.com/registry/spec/api/)