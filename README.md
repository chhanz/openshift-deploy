# openshift-deploy

# Deploy openshift origin 
 - File Location
~~~bash
├── README.md
├── conf
│   ├── docker
│   │   ├── daemon.json
│   │   └── docker-storage-setup          // For v3.9
│   ├── inventory
│   │   ├── inventory-poc-310
│   │   ├── inventory-poc-311-localhost    // all-in-one inventory
│   │   └── inventory-poc-39
│   └── sample
│       ├── README.md
│       ├── sample.png
│       └── sample.war
└── script
    └── prerequisites_install_script.sh     // For v3.9
~~~
 - Add inventory file
 - Add Sample War File
 - docker-storage-setup file (v3.9)
 - docker insecure-registries config file - daemon.json

## Test Date
 - 2019.06.05
