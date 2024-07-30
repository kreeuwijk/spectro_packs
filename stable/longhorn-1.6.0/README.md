
# Longhorn

Longhorn is a lightweight distributed block storage system for cloud native storage Kubernetes that allows you to replicate storage to Kubernetes clusters. Once Longhorn is installed, it adds persistent volume support to the Kubernetes cluster using containers and microservices.

Longhorn creates a dedicated storage controller for each block device volume and replicates the volume across multiple nodes.

## Pre-requisites:
A minimum of 1 nodes in the Kubernetes cluster, 4 vCPUs per node, 4 GiB per node

Kubernetes compatibility - Supported on Kubernetes v1.21.0 & above

This pack is to be installed only in `longhorn-system` namespace only, the field is read-only.

When using with microk8s, set the value of parameter `csi.kubeletRootDir` to `/var/snap/microk8s/common/var/lib/kubelet`. For regular k8s, the default `/var/lib/kubelet` is used. In case it is different in your setup, please update the value accordingly.

## CloudType:
* MaaS
* Edge-Native

## Upgrade

Upgrade from 1.5.x to 1.6.0 is supported. Donwgrade is not supported by longhorn. Please refer - https://longhorn.io/docs/1.6.0/deploy/upgrade/ for upgrade and downgrade compatibility.

One known issue is seen when upgrading where `instance-manager` and `engine-image` pods with older version are also running alongwith the new version. Please refer - https://longhorn.io/kb/troubleshooting-some-old-instance-manager-pods-are-still-running-after-upgrade/

## Parameters

### Image Settings

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.csi.attacher.repository | string | `"longhornio/csi-attacher"` | Repository for the CSI attacher image. When unspecified, Longhorn uses the default value. |
| image.csi.attacher.tag | string | `"v4.4.2"` | Tag for the CSI attacher image. When unspecified, Longhorn uses the default value. |
| image.csi.livenessProbe.repository | string | `"longhornio/livenessprobe"` | Repository for the CSI liveness probe image. When unspecified, Longhorn uses the default value. |
| image.csi.livenessProbe.tag | string | `"v2.12.0"` | Tag for the CSI liveness probe image. When unspecified, Longhorn uses the default value. |
| image.csi.nodeDriverRegistrar.repository | string | `"longhornio/csi-node-driver-registrar"` | Repository for the CSI Node Driver Registrar image. When unspecified, Longhorn uses the default value. |
| image.csi.nodeDriverRegistrar.tag | string | `"v2.9.2"` | Tag for the CSI Node Driver Registrar image. When unspecified, Longhorn uses the default value. |
| image.csi.provisioner.repository | string | `"longhornio/csi-provisioner"` | Repository for the CSI Provisioner image. When unspecified, Longhorn uses the default value. |
| image.csi.provisioner.tag | string | `"v3.6.2"` | Tag for the CSI Provisioner image. When unspecified, Longhorn uses the default value. |
| image.csi.resizer.repository | string | `"longhornio/csi-resizer"` | Repository for the CSI Resizer image. When unspecified, Longhorn uses the default value. |
| image.csi.resizer.tag | string | `"v1.9.2"` | Tag for the CSI Resizer image. When unspecified, Longhorn uses the default value. |
| image.csi.snapshotter.repository | string | `"longhornio/csi-snapshotter"` | Repository for the CSI Snapshotter image. When unspecified, Longhorn uses the default value. |
| image.csi.snapshotter.tag | string | `"v6.3.2"` | Tag for the CSI Snapshotter image. When unspecified, Longhorn uses the default value. |
| image.longhorn.backingImageManager.repository | string | `"longhornio/backing-image-manager"` | Repository for the Backing Image Manager image. When unspecified, Longhorn uses the default value. |
| image.longhorn.backingImageManager.tag | string | `"master-head"` | Tag for the Backing Image Manager image. When unspecified, Longhorn uses the default value. |
| image.longhorn.engine.repository | string | `"longhornio/longhorn-engine"` | Repository for the Longhorn Engine image. |
| image.longhorn.engine.tag | string | `"master-head"` | Tag for the Longhorn Engine image. |
| image.longhorn.instanceManager.repository | string | `"longhornio/longhorn-instance-manager"` | Repository for the Longhorn Instance Manager image. |
| image.longhorn.instanceManager.tag | string | `"master-head"` | Tag for the Longhorn Instance Manager image. |
| image.longhorn.manager.repository | string | `"longhornio/longhorn-manager"` | Repository for the Longhorn Manager image. |
| image.longhorn.manager.tag | string | `"master-head"` | Tag for the Longhorn Manager image. |
| image.longhorn.shareManager.repository | string | `"longhornio/longhorn-share-manager"` | Repository for the Longhorn Share Manager image. |
| image.longhorn.shareManager.tag | string | `"master-head"` | Tag for the Longhorn Share Manager image. |
| image.longhorn.supportBundleKit.repository | string | `"longhornio/support-bundle-kit"` | Repository for the Longhorn Support Bundle Manager image. |
| image.longhorn.supportBundleKit.tag | string | `"v0.0.33"` | Tag for the Longhorn Support Bundle Manager image. |
| image.longhorn.ui.repository | string | `"longhornio/longhorn-ui"` | Repository for the Longhorn UI image. |
| image.longhorn.ui.tag | string | `"master-head"` | Tag for the Longhorn UI image. |
| image.openshift.oauthProxy.repository | string | `"quay.io/openshift/origin-oauth-proxy"` | Repository for the OAuth Proxy image. This setting applies only to OpenShift users. |
| image.openshift.oauthProxy.tag | float | `4.14` | Tag for the OAuth Proxy image. This setting applies only to OpenShift users. Specify OCP/OKD version 4.1 or later. The latest stable version is 4.14. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy that applies to all user-deployed Longhorn components, such as Longhorn Manager, Longhorn driver, and Longhorn UI. |

### Service Settings

| Key | Description |
|-----|-------------|
| service.manager.nodePort | NodePort port number for Longhorn Manager. When unspecified, Longhorn selects a free port between 30000 and 32767. |
| service.manager.type | Service type for Longhorn Manager. |
| service.ui.nodePort | NodePort port number for Longhorn UI. When unspecified, Longhorn selects a free port between 30000 and 32767. |
| service.ui.type | Service type for Longhorn UI. (Options: "ClusterIP", "NodePort", "LoadBalancer", "Rancher-Proxy") |

### StorageClass Settings

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| persistence.backingImage.dataSourceParameters | string | `nil` | Data source parameters of a backing image used in a Longhorn StorageClass. You can specify a JSON string of a map. (Example: `'{\"url\":\"https://backing-image-example.s3-region.amazonaws.com/test-backing-image\"}'`) |
| persistence.backingImage.dataSourceType | string | `nil` | Data source type of a backing image used in a Longhorn StorageClass. If the backing image exists in the cluster, Longhorn uses this setting to verify the image. If the backing image does not exist, Longhorn creates one using the specified data source type. |
| persistence.backingImage.enable | bool | `false` | Setting that allows you to use a backing image in a Longhorn StorageClass. |
| persistence.backingImage.expectedChecksum | string | `nil` | Expected SHA-512 checksum of a backing image used in a Longhorn StorageClass. |
| persistence.backingImage.name | string | `nil` | Backing image to be used for creating and restoring volumes in a Longhorn StorageClass. When no backing images are available, specify the data source type and parameters that Longhorn can use to create a backing image. |
| persistence.defaultClass | bool | `true` | Setting that allows you to specify the default Longhorn StorageClass. |
| persistence.defaultClassReplicaCount | int | `3` | Replica count of the default Longhorn StorageClass. |
| persistence.defaultDataLocality | string | `"disabled"` | Data locality of the default Longhorn StorageClass. (Options: "disabled", "best-effort") |
| persistence.defaultFsType | string | `"ext4"` | Filesystem type of the default Longhorn StorageClass. |
| persistence.defaultMkfsParams | string | `""` | mkfs parameters of the default Longhorn StorageClass. |
| persistence.defaultNodeSelector.enable | bool | `false` | Setting that allows you to enable the node selector for the default Longhorn StorageClass. |
| persistence.defaultNodeSelector.selector | string | `""` | Node selector for the default Longhorn StorageClass. Longhorn uses only nodes with the specified tags for storing volume data. (Examples: "storage,fast") |
| persistence.migratable | bool | `false` | Setting that allows you to enable live migration of a Longhorn volume from one node to another. |
| persistence.nfsOptions | string | `""` | Set NFS mount options for Longhorn StorageClass for RWX volumes |
| persistence.reclaimPolicy | string | `"Delete"` | Reclaim policy that provides instructions for handling of a volume after its claim is released. (Options: "Retain", "Delete") |
| persistence.recurringJobSelector.enable | bool | `false` | Setting that allows you to enable the recurring job selector for a Longhorn StorageClass. |
| persistence.recurringJobSelector.jobList | list | `[]` | Recurring job selector for a Longhorn StorageClass. Ensure that quotes are used correctly when specifying job parameters. (Example: `[{"name":"backup", "isGroup":true}]`) |
| persistence.removeSnapshotsDuringFilesystemTrim | string | `"ignored"` | Setting that allows you to enable automatic snapshot removal during filesystem trim for a Longhorn StorageClass. (Options: "ignored", "enabled", "disabled") |

### CSI Settings

| Key | Description |
|-----|-------------|
| csi.attacherReplicaCount | Replica count of the CSI Attacher. When unspecified, Longhorn uses the default value ("3"). |
| csi.kubeletRootDir | kubelet root directory. When unspecified, Longhorn uses the default value. |
| csi.provisionerReplicaCount | Replica count of the CSI Provisioner. When unspecified, Longhorn uses the default value ("3"). |
| csi.resizerReplicaCount | Replica count of the CSI Resizer. When unspecified, Longhorn uses the default value ("3"). |
| csi.snapshotterReplicaCount | Replica count of the CSI Snapshotter. When unspecified, Longhorn uses the default value ("3"). |

### Longhorn Manager Settings

Longhorn consists of user-deployed components (for example, Longhorn Manager, Longhorn Driver, and Longhorn UI) and system-managed components (for example, Instance Manager, Backing Image Manager, Share Manager, CSI Driver, and Engine Image). The following settings only apply to Longhorn Manager.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| longhornManager.log.format | string | `"plain"` | Format of Longhorn Manager logs. (Options: "plain", "json") |
| longhornManager.nodeSelector | object | `{}` | Node selector for Longhorn Manager. Specify the nodes allowed to run Longhorn Manager. |
| longhornManager.priorityClass | string | `"longhorn-critical"` | PriorityClass for Longhorn Manager. |
| longhornManager.serviceAnnotations | object | `{}` | Annotation for the Longhorn Manager service. |
| longhornManager.tolerations | list | `[]` | Toleration for Longhorn Manager on nodes allowed to run Longhorn Manager. |

### Longhorn Driver Settings

Longhorn consists of user-deployed components (for example, Longhorn Manager, Longhorn Driver, and Longhorn UI) and system-managed components (for example, Instance Manager, Backing Image Manager, Share Manager, CSI Driver, and Engine Image). The following settings only apply to Longhorn Driver.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| longhornDriver.nodeSelector | object | `{}` | Node selector for Longhorn Driver. Specify the nodes allowed to run Longhorn Driver. |
| longhornDriver.priorityClass | string | `"longhorn-critical"` | PriorityClass for Longhorn Driver. |
| longhornDriver.tolerations | list | `[]` | Toleration for Longhorn Driver on nodes allowed to run Longhorn components. |

### Longhorn UI Settings

Longhorn consists of user-deployed components (for example, Longhorn Manager, Longhorn Driver, and Longhorn UI) and system-managed components (for example, Instance Manager, Backing Image Manager, Share Manager, CSI Driver, and Engine Image). The following settings only apply to Longhorn UI.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| longhornUI.nodeSelector | object | `{}` | Node selector for Longhorn UI. Specify the nodes allowed to run Longhorn UI. |
| longhornUI.priorityClass | string | `"longhorn-critical"` | PriorityClass for Longhorn UI. |
| longhornUI.replicas | int | `2` | Replica count for Longhorn UI. |
| longhornUI.tolerations | list | `[]` | Toleration for Longhorn UI on nodes allowed to run Longhorn components. |

### References:
[Longhorn](https://longhorn.io/)
[Github](https://github.com/longhorn/longhorn)
