# ProVerif models of the consumer Remote SIM Provisioning (RSP) Protocol
Remote SIM provisioning (RSP) for consumer devices is a protocol for downloading the mobile subscriber credentials to a secure element in the mobile device to be used for authentication between the device and the mobile network.

The RSP specification supports two profile ordering and download initialization approaches: (1) the default server approach and (2) the activation code (ac) approach. The ProVerif models in this directory model and analyze both approaches.

## Naming convention
```
./directory/rsp-init-scenario-goal-tls.format

directory: models | logs
init:      DefaultS | Code
scenario:  Scenario<N>
           N = 1 | 2 | 3 | 4 | 5 | 6 | 6 | 8 | 9 | 10 | 11
goal:      Auth<*> | Sec<^> | Reach
           * = A | B | Bp | C | D | E | F | G | H | I | J | K
           ^ = W | X | Y | Z
tls:       Tls | NoTls
format:    pv | log
```

## Reproducing the results
The models have been tested with [ProVerif](https://bblanche.gitlabpages.inria.fr/proverif/) version 2.04. The scripts are written for Linux and have been tested with Ubuntu 20.04.

__Create all models__:
```bash
$ make models
```
__Create models with all queries in the same file__:
```bash
$ make models_all_queries
```
__Delete generated files__:
```bash
$ make clean [host]
```
__Run one query in one model__:
```bash
$ make verify [host]
```
__Show the status of running queries__:
```bash
$ make ps [host]
```
__Retrieve results from the host__:
```bash
$ make retrieve [host]
```
## Parsing the logs
The logs can be parsed and summarized into a Markdown table with the following command:

```bash
$ make results_table
```
