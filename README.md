# ProVerif models of the Consumer Remote SIM Provisioning (RSP) Protocol
Remote SIM provisioning (RSP) for consumer devices is a protocol for downloading the mobile subscriber credentials to a secure element in the mobile device, so that they can be used for authentication between the device and mobile network.

The RSP specification supports two different approaches to profile ordering and download initialization: (1) default server, and (2) activation code. The ProVerif models in this directory model and analyze both approaches.

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
The models have been tested with version 2.04. of [ProVerif](https://bblanche.gitlabpages.inria.fr/proverif/). Instructions for installation and usage can be found in the [manual](https://bblanche.gitlabpages.inria.fr/proverif/manual.pdf).

__Create all models__:
```bash
$ make models
```
__Delete generated files__:
```bash
$ make clean [host]
```
__Run one query in one model__:
```bash
$ make verify [host]
```
__Show status of running queries__:
```bash
$ make ps [host]
```
__Retrieve results from host__:
```bash
$ make retrieve [host]
```
## Parsing the logs
The logs can be parsed and summarized into a Markdown table with the following command:

```bash
$ make results_table
```
