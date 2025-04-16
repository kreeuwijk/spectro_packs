# Hitachi Storage Plug-in for Containers

The Kubevirt CSI driver is made for a guest cluster deployed on top of kubevirt VMs, and enables it to get its persistent data
from the underlying, infrastructure cluster. This CSI driver is deployed on the guest cluster.


## Prerequisites

- A host Kubevirt cluster.
- A guest Kubernetes cluster deployed with Kubevirt VMs, using Palette Agent Mode.


## Parameters

To deploy the Kubevirt CSI Driver pack, you need to set, at minimum, the following parameters in the pack's YAML.

| Name | Description | Type | Default Value | Required |
| --- | --- | --- | --- | --- |


Review the [README](https://github.com/kubevirt/csi-driver/blob/main/README.md) for more details. 

## Upgrade

To update the Kubevirt CSI Driver, deploy a newer version of the pack.


## Usage

To use the Kubevirt CSI Driver pack, first create a new [infrastructure cluster profile](https://docs.spectrocloud.com/profiles/cluster-profiles/create-cluster-profiles/create-infrastructure-profile/), select Edge Native for the Infrastructure Provider and when you get to the Storage pack, search for the **Kubevirt CSI Driver** pack in the Palete Community Registry. Then configure the sections in the pack YAML:

```yaml
```

Once you have confiogured the pack, you can deploy a cluster with it.

In order to use this CSI for snapshots, the following `VolumeSnapshotClass` can be created (manually, not part of this pack), through deploying the Volume Snapshot Controller pack:
```
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
  name: kubevirt-csi-snapclass
driver: csi.kubevirt.io
deletionPolicy: Delete
```

Review the [information](https://github.com/kubevirt/csi-driver/blob/main/docs/snapshot-driver-config.md) on how to map snapshot classes to those in the host Kubevirt cluster.

## References

- [Kubevirt CSI driver Github](https://github.com/kubevirt/csi-driver)
- [Storage classes and Snapshot classes mapping](https://github.com/kubevirt/csi-driver/blob/main/docs/snapshot-driver-config.md)