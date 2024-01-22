
# Local Path Provisioner

### Description:
Local Path Provisioner provides a way for the Kubernetes users to utilize the local storage in each node. Based on the user configuration, the Local Path Provisioner will create either `hostPath` or `local` based persistent volume on the node automatically. It utilizes the features introduced by Kubernetes [Local Persistent Volume feature](https://kubernetes.io/blog/2018/04/13/local-persistent-volumes-beta/), but makes it a simpler solution than the built-in `local` volume feature in Kubernetes.

## Compare to built-in Local Persistent Volume feature in Kubernetes

### Pros
Dynamic provisioning the volume using [hostPath](https://kubernetes.io/docs/concepts/storage/volumes/#hostpath) or [local](https://kubernetes.io/docs/concepts/storage/volumes/#local).
* Currently the Kubernetes [Local Volume provisioner](https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner) cannot do dynamic provisioning for the local volumes.
* Local based persistent volumes are an experimental feature ([example usage](examples/pvc-with-local-volume/pvc.yaml)).

### Cons
1. No support for the volume capacity limit currently.
    1. The capacity limit will be ignored for now.


## Kubernetes compatibility
Kubernetes v1.12+.


## CloudType:
* mass
* edge
* edge-native
* libvirt


## References:

[Github](https://github.com/rancher/local-path-provisioner/tree/v0.0.25)
