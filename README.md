# README #

Repository for Terraform modules

### Reference ###

Terraform modules documentation

https://www.terraform.io/docs/configuration/modules.html

### How to use? ###

You can apply any module to your project:

```
#!go

module "module" {
  source = "git::ssh://repository-url/resource"
}
```

### How to get and update the module? ###

```
#!ssh

terraform get
```

or


```
#!ssh

terraform get -update
```


Ps. 
* Each folder is a module
