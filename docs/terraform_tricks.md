# Terraform tricks

There are some usefull tricks.

## Troubleshooting

```bash
TF_LOG_PATH=1.log TF_LOG=JSON terraform apply -var-file=secrets.tfvars
```

## View terraform graphs

1. install [VScode SVG Viewer extension](https://marketplace.visualstudio.com/items?itemName=cssho.vscode-svgviewer)
2. install `sudo yum install -y graphviz`
3. run  `terraform graph | dot -Tsvg > graph.svg`

## Links

* [Terraform refactoring](https://ryaneschinger.com/blog/terraform-state-move/)
