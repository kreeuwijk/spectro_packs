# Istio

Istio is an open source service mesh that layers transparently onto existing distributed applications.

We install following components of Istio:

**Gateway plugin** has been added and is disabled by default. It can be enabled from presets.

**Kiali dashboard** plugin is also added and disabled by default. It can be enabled from presets.

## Prerequisites

- Kubernetes cluster with version 1.27 and higher.
- All cloud types are supported

## Parameters

| Name | Description | Type | Default Value | Required |
| --- | --- | --- | --- | --- |
| istiod.cni.enabled | this customization is used to enable or disable the istio CNI deployment. | Boolean | `false` | yes |
| istiod.gateway.enabled | this customization is used to enable or disable the istio gateway deployment. | Boolean | `false` | yes |
| istiod.pilot.image | image tag for istio pilot application | string | `istio-pilot` | yes |
| istiod.global.hub | image url path for istiod | string | - | yes |
| istiod.global.tag | image tag version for istiod | string | 1.26.0 | yes |
| istiod.proxy.image | image tag for istio proxy container | string | `istio-proxyv2` | yes |
| istiod.proxy.tracer | Specify which tracer to use. One of: zipkin, lightstep, datadog, stackdriver. | string | `zipkin` | yes |
| istiod.proxy-init.image | image tag for istio proxy init container | string | `istio-proxyv2` | yes |
| kiali.enabled | this customization is used to enable or disable the kiali deployment. | Boolean | `false` | yes |
| kiali.external_services.prometheus.url | promethues url to scrape metrics from istio proxy containers | string | http://prometheus.istio-system:9090/ | yes |

## Upgrade
- To upgrade or downgrade pack, please uninstall the pack and remove the crds using following command and then proceed installing the new pack.

```kubectl get crd -oname | grep --color=never 'istio.io' | xargs kubectl delete```

## Usage
After installing the istio pack on the cluster, create a namespace with `istio-injection=enabled` label and deploy application into that namespace. Check if the istio proxy sidecar container is getting created in all the pods. Use kiali dashboard to check the trafic routing to those pods. Kiali requires Prometheus to generate the topology graph, show metrics, calculate health and for several other features. If Prometheus is missing or Kiali can’t reach it, Kiali won’t work properly.

Please configure the following property to allow kiali to access the prometheus server:

```kiali-server.spec.external_services.prometheus.url```

Default value is - `http://prometheus.istio-system:9090/`

### Note:
- You don’t need to expose Prometheus outside the cluster. It is enough to provide the Kubernetes internal service URL. 
- Kiali dashboard can be accessed using the following command:

```kubectl port-forward svc/kiali 20001:20001 -n istio-system```

## References
- [Istio](https://istio.io/latest/docs/setup/getting-started/)

- [Kiali](https://v1-65.kiali.io/docs/installation/quick-start/)

- [Github Istio](https://github.com/istio/istio)

- [Github Kiali](https://github.com/kiali/kiali)
