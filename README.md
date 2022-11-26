# Zeus

[Terraformed](https://www.terraform.io/), [Circled](https://circleci.com/), deployment of a [Kubernetes](https://kubernetes.io/) cluster w/ installs from [Helm.sh](https://helm.sh/):
1. [Argo CD](https://argo-cd.readthedocs.io/en/stable/) for Continuous Delivery operated over a K8s cluster.
2. [Argo Workflows](https://argoproj.github.io/argo-workflows/) for orchestrated DAG-based ML pipelines.

The octopus should be wired to an exploitation K8S cluster to apply its [GitOps](https://about.gitlab.com/topics/gitops/) magic.
