#!/bin/sh

# Setup sudo
echo "ALL ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# Common packages
yum install -y distribution-gpg-keys epel-release
yum update -y
yum install -y  krb5-workstation \
                ipa-client \
                libpam-ccreds \
                auth-client-config \
                kstart \
                curl \
                less \
                sudo \
                screen \
                zsh \
                which \
                emacs-nox \
                git \
                bzip2 bzip2-devel \
                libzip libzip-devel gzip \
                snappy snappy-devel \
                lzo lzo-devel \
                lz4 lz4-devel \
                java-1.8.0-openjdk-devel \
                openssl-devel \
                python36 python36-devel \
                python36-pip python36-setuptools python36-requests

yum groups
yum groupinstall -y "Development tools"
