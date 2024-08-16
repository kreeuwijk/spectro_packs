# MetalLB:
A load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols.
Offers a network load balancer implementation that integrates with standard network equipment.

## Prerequisites:
MetalLB requires the following to function:
* A Kubernetes cluster, running Kubernetes 1.13.0 or later, that does not already have network load-balancing functionality.
* A cluster network configuration that can coexist with MetalLB.
* Some IPv4 addresses for MetalLB to hand out.
* When using the BGP operating mode, you will need one or more routers capable of speaking BGP.
* When using the L2 operating mode, traffic on port 7946 (TCP & UDP, other port can be configured) must be allowed between nodes, as required by memberlist.

## Parameters:
The addresses parameter applies to the MetalLB pack. You can either specify an entire range of subnet or a specific range of ip to be used for the LB requirements.
Parameter	Description
                  addresses:
                    #- 192.168.10.0/24
                    - 10.10.176.138-10.10.176.139

## Upgrade:
Updates from lower versions to current version are supported.

## Usage:
 This is a  Helm chart based pack and provides an L2 address pool.

## References:
https://metallb.universe.tf/
https://docs.spectrocloud.com/integrations/metallb/
https://github.com/metallb/metallb/tree/v0.14.8