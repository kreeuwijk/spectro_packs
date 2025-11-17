# Kgateway

* **An ingress/edge router for Kubernetes**: Powered by [Envoy](https://www.envoyproxy.io) and programmed with the [Gateway API](https://gateway-api.sigs.k8s.io/), kgateway is a world-leading Cloud Native ingress.
* **An advanced API gateway**: Aggregate web APIs and apply key functions like authentication, authorization and rate limiting in one place
* **A better waypoint proxy for [ambient mesh](https://ambientmesh.io/)**: Use the same stack for east-west management as you do for north-south.
* **An AI gateway for securing LLM usage**: Protect applications, models, and data from inappropriate access or use, whether you're producing or consuming. Manage traffic to LLM providers, and enrich prompts at a system level.
* **An LLM Gateway utilizing the [Inference Extension](https://gateway-api-inference-extension.sigs.k8s.io/) project**: Intelligently route to AI inference workloads and LLMs in your Kubernetes environment.
* **A model context protocol (MCP) gateway**: Federate MCP tool servers into a single, scalable and secure endpoint.
* **A migration engine for hybrid apps**: Route to backends implemented as microservices, serverless functions or legacy apps. This can help you gradually migrate from legacy code to microservices and serverless, add new functionalities using cloud-native technologies while maintaining a legacy codebase or allow different teams in an organization to choose different architectures.

Kgateway is feature-rich, fast, and flexible. It excels in function-level routing, supports legacy apps, microservices and serverless, offers robust discovery capabilities, integrates seamlessly with open-source projects, and is designed to support hybrid applications with various technologies, architectures, protocols, and clouds.

The project was previously known as Gloo, and has been [production-ready since 2019](https://www.solo.io/blog/announcing-gloo-1-0-a-production-ready-envoy-based-api-gateway). Please see [the migration plan](https://github.com/kgateway-dev/kgateway/issues/10363) for more information and the current status of the change from Gloo to kgateway.


## Prerequisites

- Kubernetes cluster with version 1.31 and higher
- Compatible with Gateway API up to version 1.4.x
- All cloud types are supported

## Parameters

| Name | Description | Type | Default Value | Required |
| --- | --- | --- | --- | --- |

## Usage


### Note:

## References
- [kgateway v2.1.1](https://github.com/kgateway-dev/kgateway/tree/v2.1.1)