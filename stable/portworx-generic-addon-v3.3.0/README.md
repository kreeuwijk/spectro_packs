# Portworx-Generic-addon 
A Kubernetes data-services platform designed to provide persistent storage, data protection, disaster recovery, and other capabilities for containerized applications. 

## Prerequisites

- Kubernetes version between 1.21 and 1.32.
- Maximum supported minor version is 1.32
- Minimum of 3 storage nodes are required.
- Additional installation requirements can be found in the official Portworx documentation [Installation Prerequisites](https://docs.portworx.com/portworx-enterprise/platform/prerequisites#installation-prerequisites).
- Supported target platforms
  - Amazon Web Services
  - Amazon Elastic Kubernetes Service (EKS)
  - Microsoft Azure
  - Azure Kubernetes Service (AKS)
  - Google Cloud Platform
  - Google Kubernetes Engine (GKE)
  - VMware vSphere
  - Canonical MAAS
  - OpenStack

## Usage

To create a `StorageClass` of your choice, use the pack's values.yaml `charts.portworx-generic.storageClass` parameter section. To make a storageClass as a default storageClass, set the parameter `charts.portworx-generic.storageClass.isDefaultStorageClass` to `true` in `charts.portworx-generic.storageClass` section of pack's values.yaml. By default, the storageClass `spectro-storage-class` is created and used as the default storageClass.

## Licensing
License of type `Portworx Essentials` has reached end of life. So this software (any version) using that license stops working on May 1, 2025.
This pack also supports `Portworx CSI` license, to be used with Kubevirt
The default option is `Portworx Enterprise` license, which runs in 30-day trial mode when no license is provided. 


> 💡 **Tip:**
Check out the [Palette Backup and Restore Documentation](https://docs.spectrocloud.com/clusters/cluster-management/backup-restore/) to learn how to backup and restore your cluster.

### Snapshot Creation

The Portworx generic pack supports snapshots by default. Snapshot creation requires the cluster profile to have the [Volume-Snapshot-controller](https://docs.spectrocloud.com/integrations/packs/?pack=volume-snapshot-controller) pack. You can add the Volume-Snapshot-controller pack to the cluster profile as an addon pack. Refer to the [Volume-Snapshot-controller](https://docs.spectrocloud.com/integrations/packs/?pack=volume-snapshot-controller) README for more information.

## References:

- [Portworx Documentation](https://docs.portworx.com/)

- [Palette Backup and Restore Documentation](https://docs.spectrocloud.com/clusters/cluster-management/backup-restore/)
