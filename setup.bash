#!/bin/bash
# setup two webservers 
helm install -n wordpress bitnami/wordpress &&
helm install -n nging bitnami/nginx 