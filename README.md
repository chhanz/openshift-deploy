# openshift-deploy

# Openshift origin v3.10
 - Add inventory file 
 ~~~bash
# Create an OSEv3 group that contains the masters, nodes, and etcd groups
[OSEv3:children]
masters
nodes
etcd

# Set variables common for all OSEv3 hosts
[OSEv3:vars]
# SSH user, this user should allow ssh based auth without requiring a password
ansible_ssh_user=root

# If ansible_ssh_user is not root, ansible_become must be set to true
#ansible_become=true

openshift_deployment_type=origin
openshift_release="3.10"
openshift_master_default_subdomain=apps.poc.com
ansible_service_broker_install=false

# uncomment the following to enable htpasswd authentication; defaults to AllowAllPasswordIdentityProvider
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider'}]

# host group for masters
[masters]
master.poc.com

# host group for etcd
[etcd]
master.poc.com

# host group for nodes, includes region info
[nodes]
master.poc.com openshift_node_group_name='node-config-master'
worker1.poc.com openshift_node_group_name='node-config-compute'
worker2.poc.com openshift_node_group_name='node-config-infra'
 ~~~
 - Compress ansible directory
 - Add Sample War File

## Test Date
 - 2018.12.30
