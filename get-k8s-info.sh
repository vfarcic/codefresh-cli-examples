export CURRENT_CONTEXT=$(kubectl config current-context)

export CURRENT_CLUSTER=$(kubectl config view -o go-template="{{\$curr_context := \"$CURRENT_CONTEXT\" }}{{range .contexts}}{{if eq .name \$curr_context}}{{.context.cluster}}{{end}}{{end}}")

export HOST=$(kubectl config view -o go-template="{{\$cluster_context := \"$CURRENT_CLUSTER\"}}{{range .clusters}}{{if eq .name \$cluster_context}}{{.cluster.server}}{{end}}{{end}}")

export SECRET_NAME=$(kubectl get sa codefresh -n codefresh -o go-template="{{range .secrets}}{{.name}}{{end}}")

export CERTIFICATE=$(kubectl get secret -n codefresh -o go-template='{{index .data "ca.crt" }}' $SECRET_NAME)

export TOKEN=$(kubectl get secret -n codefresh -o go-template='{{index .data "token" }}' $SECRET_NAME)

export CURRENT_CONTEXT=devops-catalog

