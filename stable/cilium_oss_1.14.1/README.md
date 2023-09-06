# Cilium:
Cilium is a networking, observability, and security solution with an eBPF-based dataplane. It provides a simple flat Layer 3 network with the ability to span multiple clusters in either a native routing or overlay mode. It is L7-protocol aware and can enforce network policies on L3-L7 using an identity based security model that is decoupled from network addressing.

# Kubernetes versions supported:
Above 1.16

# Cloud types supported:
* VMware vSphere
* OpenStack
* MAAS
* Edge Native
* AWS

## Note:

	AWS is supported only with static placement. 

	Prerequites:

	Security group is created directly on AWS with the desired ingress/egress rules and attached to VPC. Please refer to cilium doc for the ports required. 
	<https://docs.cilium.io/en/stable/operations/system_requirements/#firewall-rules>

# References:
<https://cilium.io/>

<https://github.com/cilium/cilium>
