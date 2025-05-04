# Quick Azure Dev Environment

Este repositorio contiene código Terraform para aprovisionar rápidamente un entorno de desarrollo en Azure, incluyendo una máquina virtual Linux con acceso SSH, red virtual, subred, IP pública y reglas de seguridad.

## 🔧 Requisitos

- [Terraform](https://developer.hashicorp.com/terraform/install)
- Una cuenta de Azure con permisos para crear recursos

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) (opcional pero recomendado)
- Claves SSH generadas localmente

## 📁 Estructura del proyecto

📁 compute/ # Recursos relacionados con la máquina virtual
📁 github/ # Recursos para la integración con GitHub
📁 modules/ # Módulos reutilizables (si aplican)
📁 network/ # Recursos de red: VNet, Subnet, NSG
📁 .ssh/ # Claves SSH usadas para acceder a la VM
📄 customdata.tpl # Script de configuración inicial (cloud-init)
📄 linux-ssh-script.tpl # Plantilla para conexión SSH (comentada en main.tf)
📄 main.tf # Infraestructura principal modular
📄 outputs.tf # Salidas como la IP pública
📄 providers.tf # Configuración del proveedor (Azure)
📄 _vars.tf # Variables definidas localmente

## 🚀 ¿Qué se crea?

- Resource Group
- Virtual Network y Subnet
- Network Security Group con reglas de acceso
- Public IP
- Network Interface
- Máquina virtual Linux (`Standard_B1s`)
- Asociación de recursos (NIC ↔ NSG, Subnet ↔ NSG)
- Repositorio GitHub (opcional, vía Terraform)

## 🛠️ Instrucciones de uso

1. **Clona el repositorio:**

    ```bash
   git clone https://github.com/Keji-dev/quick-azure-dev-env.git
   cd quick-azure-dev-env

2. **Inicia sesión en Azure con Azure CLI**

    ```bash
    az login

3. **Inicializa Terraform**

    ```bash
    terraform init

4. **Previsualiza los cambios**

    ```bash
    terraform fmt && terraform validate && terraform plan 

5. **Aplica la infraestructura**

    ```bash
    terraform apply

6. **Conéctate a la VM vía SSH**

    ```bash
    ssh -i ~/.ssh/id_rsa adminuser@<IP_PUBLICA>

Puedes obtener la IP con:

    terraform output public_ip_address


🔐 Seguridad
Se permite el acceso SSH solo desde la IP pública especificada en la regla del NSG (193.25.7.148/32).

Las claves SSH deben ser protegidas correctamente y no deben subirse al repositorio.

📝 Notas
custom_data.tpl puede ser usado para aprovisionamiento inicial de la VM.

Se recomienda usar el backend remoto de Terraform (como Azure Storage) para proyectos en equipo.

Terraform mantiene el estado localmente a menos que se configure otro backend.

📜 Licencia
Este proyecto se publica bajo la licencia MIT.

MIT License
Copyright (c) 2025 Keji-dev
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
