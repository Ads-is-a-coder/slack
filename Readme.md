# About Script

This is a configuration script that installs all dependencies required to run a PHP application on a Ubuntu/Debian based system

## Getting Started

A copy of this code will setup configured Apache server on Linux. See Prequisties and Installation instructions to check compatibility


### Prerequisites

* SSH Access to remote server.
* Public IP or connected to private network to be able to access the server.
* User on remote server with permissions to install/delete packages.
* Local Linux system or WSL on Linux to be able to run shell script.


### Installation

```
ssh username@hostname 'bash -s' < bootstrap.sh create
```

Specific to exercise

```
ssh root@34.236.143.249 'bash -s' < bootstrap.sh create
ssh root@54.167.39.34 'bash -s' < bootstrap.sh create
```

### Deletion 

```
ssh username@hostname 'bash -s' < bootstrap.sh delete
```

## Testing notes

```
curl -sv http://34.236.143.249
curl -sv http://54.167.39.34
```