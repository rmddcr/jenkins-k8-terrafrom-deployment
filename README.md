# Getting Started

---

### Prerequisite

- **helm**
- **minikube or AKS cluster**
- **kubectl**
- 

#### Jenkins server setup

1. Install prerequisite first
2. If you are using minikube setup update the `main.tf ` file line 10 to 
`file("minikube-values.yaml"),`

3. Update the Load balancer public ip to the correct value in `main.tf` line no 37. If you are using minikube change `main.tf` line no 15 to empty string 
`value = ""`. IF you are using ingress service to expose the ui then change the helm arguments accordingly.

4. Setup the kubernetes credentials locally. I have pointed the relevant providers to `~/.kube/config` path

5. once setup run `terrafrom init` and `terraform apply`. When prompted type yes to approve the provisioning process.


### Accessing  the server 

Go to the path `http://${Loadbalancer_public_ip}:8080/` and login using the credentials.If you use the minikube use the nodeport local ip with 8080 port 
  - adminUser: "admin"
  - adminPassword: "kXKpX96W9c6GlNK888TyaQ"

The requested job has already been configured in the server as widgets-resources-build
with default-agent
Once the job is triggered it will automatically provision an agent pod and do the build process according to the job description. Once finished it will terminate the above pod
You can use the command `kubectl get pods -n jenkins --watch` monitor the above process

I have setup an sample job which clones the repo and install the dependencies this can be extended as required easily 


### Resource clean up

- You can run command `terraform apply` clean up the created resources in the jenkins namespace.
