# terraform-aws-apache-example

Modulo Terraform per il deploy di Apache HTTP Server su AWS.

## Utilizzo

```hcl
module "apache" {
  source  = "github.com/<tuo-utente>/terraform-aws-apache-example"
  # Inserisci qui le variabili richieste dal modulo
}
```

## Variabili

Consulta il file `variables.tf` per la lista completa delle variabili configurabili.

## Output

Consulta il file `outputs.tf` per la lista completa degli output disponibili.

## Esempio di utilizzo

```hcl
module "apache" {
  source = "github.com/<tuo-utente>/terraform-aws-apache-example"
  # Esempio di variabili
  # instance_type = "t2.micro"
  # vpc_id        = "vpc-xxxxxxx"
}
```

## Requisiti

- Terraform >= 1.0.0
- Provider AWS >= 3.0

## Licenza

Questo modulo è distribuito sotto licenza Apache 2.0. Vedi il file LICENSE per dettagli.

---

> Pubblica questo modulo su Terraform Registry seguendo la [guida ufficiale](https://developer.hashicorp.com/terraform/registry/modules/publishing).
