# Kubernetes API Server

The Kubernetes API Server, or kube-apiserver, plays a pivotal role within a Kubernetes cluster. It acts as the central hub for all interactions with the cluster, serving as the primary entry point for communication between users, administrators, and the cluster itself.

Kube-apiserver receives incoming API requests, thoroughly validates them to ensure they conform to cluster policies and security measures, and then processes them accordingly. It acts as a bridge between various components of the Kubernetes control plane and the underlying etcd data store, effectively translating API requests into actions that affect the cluster's state.

Furthermore, kube-apiserver serves a crucial function in security by handling authentication and authorization, determining who has access to the cluster and what actions they are permitted to perform. It supports multiple authentication methods, including client certificates, bearer tokens, and service account tokens, enabling administrators to enforce robust security measures.

In essence, kube-apiserver is the command center of a Kubernetes cluster, facilitating all external and internal interactions, enforcing security, and ensuring that the cluster operates according to defined policies and configurations. It is a critical component that enables the management, control, and orchestration of containerized applications within the Kubernetes ecosystem.
---

Kubernetes Repository: https://github.com/kubernetes/kubernetes
OpenShift Repository: https://github.com/openshift/kubernetes

Command Options: https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/
---

The inbuilt API Services and API Resources are below:
~~~ kubectl get apiservices
NAME                                   SERVICE   AVAILABLE   AGE
v1.                                    Local     True        52s
v1.admissionregistration.k8s.io        Local     True        52s
v1.apiextensions.k8s.io                Local     True        52s
v1.apps                                Local     True        52s
v1.authentication.k8s.io               Local     True        52s
v1.authorization.k8s.io                Local     True        52s
v1.autoscaling                         Local     True        52s
v1.batch                               Local     True        52s
v1.certificates.k8s.io                 Local     True        52s
v1.coordination.k8s.io                 Local     True        52s
v1.discovery.k8s.io                    Local     True        52s
v1.events.k8s.io                       Local     True        52s
v1.networking.k8s.io                   Local     True        52s
v1.node.k8s.io                         Local     True        52s
v1.policy                              Local     True        52s
v1.rbac.authorization.k8s.io           Local     True        52s
v1.scheduling.k8s.io                   Local     True        52s
v1.storage.k8s.io                      Local     True        52s
v1beta1.storage.k8s.io                 Local     True        52s
v1beta2.flowcontrol.apiserver.k8s.io   Local     True        52s
v2.autoscaling                         Local     True        52s
~~~

~~~ kubectl api-resources
NAME                              SHORTNAMES   APIVERSION                             NAMESPACED   KIND
bindings                                       v1                                     true         Binding
componentstatuses                 cs           v1                                     false        ComponentStatus
configmaps                        cm           v1                                     true         ConfigMap
endpoints                         ep           v1                                     true         Endpoints
events                            ev           v1                                     true         Event
limitranges                       limits       v1                                     true         LimitRange
namespaces                        ns           v1                                     false        Namespace
nodes                             no           v1                                     false        Node
persistentvolumeclaims            pvc          v1                                     true         PersistentVolumeClaim
persistentvolumes                 pv           v1                                     false        PersistentVolume
pods                              po           v1                                     true         Pod
podtemplates                                   v1                                     true         PodTemplate
replicationcontrollers            rc           v1                                     true         ReplicationController
resourcequotas                    quota        v1                                     true         ResourceQuota
secrets                                        v1                                     true         Secret
serviceaccounts                   sa           v1                                     true         ServiceAccount
services                          svc          v1                                     true         Service
mutatingwebhookconfigurations                  admissionregistration.k8s.io/v1        false        MutatingWebhookConfiguration
validatingwebhookconfigurations                admissionregistration.k8s.io/v1        false        ValidatingWebhookConfiguration
customresourcedefinitions         crd,crds     apiextensions.k8s.io/v1                false        CustomResourceDefinition
apiservices                                    apiregistration.k8s.io/v1              false        APIService
controllerrevisions                            apps/v1                                true         ControllerRevision
daemonsets                        ds           apps/v1                                true         DaemonSet
deployments                       deploy       apps/v1                                true         Deployment
replicasets                       rs           apps/v1                                true         ReplicaSet
statefulsets                      sts          apps/v1                                true         StatefulSet
tokenreviews                                   authentication.k8s.io/v1               false        TokenReview
localsubjectaccessreviews                      authorization.k8s.io/v1                true         LocalSubjectAccessReview
selfsubjectaccessreviews                       authorization.k8s.io/v1                false        SelfSubjectAccessReview
selfsubjectrulesreviews                        authorization.k8s.io/v1                false        SelfSubjectRulesReview
subjectaccessreviews                           authorization.k8s.io/v1                false        SubjectAccessReview
horizontalpodautoscalers          hpa          autoscaling/v2                         true         HorizontalPodAutoscaler
cronjobs                          cj           batch/v1                               true         CronJob
jobs                                           batch/v1                               true         Job
certificatesigningrequests        csr          certificates.k8s.io/v1                 false        CertificateSigningRequest
leases                                         coordination.k8s.io/v1                 true         Lease
endpointslices                                 discovery.k8s.io/v1                    true         EndpointSlice
events                            ev           events.k8s.io/v1                       true         Event
flowschemas                                    flowcontrol.apiserver.k8s.io/v1beta2   false        FlowSchema
prioritylevelconfigurations                    flowcontrol.apiserver.k8s.io/v1beta2   false        PriorityLevelConfiguration
ingressclasses                                 networking.k8s.io/v1                   false        IngressClass
ingresses                         ing          networking.k8s.io/v1                   true         Ingress
networkpolicies                   netpol       networking.k8s.io/v1                   true         NetworkPolicy
runtimeclasses                                 node.k8s.io/v1                         false        RuntimeClass
poddisruptionbudgets              pdb          policy/v1                              true         PodDisruptionBudget
clusterrolebindings                            rbac.authorization.k8s.io/v1           false        ClusterRoleBinding
clusterroles                                   rbac.authorization.k8s.io/v1           false        ClusterRole
rolebindings                                   rbac.authorization.k8s.io/v1           true         RoleBinding
roles                                          rbac.authorization.k8s.io/v1           true         Role
priorityclasses                   pc           scheduling.k8s.io/v1                   false        PriorityClass
csidrivers                                     storage.k8s.io/v1                      false        CSIDriver
csinodes                                       storage.k8s.io/v1                      false        CSINode
csistoragecapacities                           storage.k8s.io/v1                      true         CSIStorageCapacity
storageclasses                    sc           storage.k8s.io/v1                      false        StorageClass
volumeattachments                              storage.k8s.io/v1                      false        VolumeAttachment
~~~