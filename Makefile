SHELL := /bin/bash
## Default values
init=DefaultS
scenario=1
goal=AuthA
tls=NoTls

## Flags
#   -DOPTIMIZED_DH_MODEL        -- Use optimized DH model (faster verification).
#   -DRELAXED_LPA               -- Choose relaxed LPA that does minimal checks on data it passes through.
#   -DR1 DR2 DR3 DR7 DR8        -- Enable recommendations from the paper.
flags="-DOPTIMIZED_DH_MODEL"
## Flag automatically enabled for selected goals in the list below:
#   -DSEPARATE_ATTACKER_EUICC   -- Model attacker-controlled eUICC as a separate process (faster verification).

# Source file
model_source=rsp.pv

## All models
scenarios=1 2 3 4 5 6 7 8 9 10 11
auth_goals=A B Bp C D E F G I J K
sec_goals=W X Y Z
separate_attacker_euicc_for_goals=A Bp C E F G I J K W X Y Z
separate_attacker_euicc_for_scenarios=2 3 5 6
model_variants=rsp_defaultS rsp_code

## Print usage
usage:
	@echo 'TARGETS:'
	@echo ' usage           - display this help and exit'
	@echo ' models          - create all models'
	@echo ' clean [host]    - delete generated files'
	@echo ' verify [host]   - run one query in one model'
	@echo ' ps [host]       - show status of running queries'
	@echo ' retrieve [host] - retrieve results from host'
	@echo ' results_table   - combine results into a table'
	@echo ''
	@echo 'OPTIONS:'
	@echo ' [host]          - execute command on remote host'

## Create all models
.PHONY: models
models:
	rm -rf ./models/*
	mkdir -p ./models
	for model in ${model_variants}; do \
	  flags=${flags}; \
		if [ "$$model" = 'rsp_defaultS' ]; then \
			init="DefaultS"; \
			flags=$$flags' -DDEFAULTS'; \
		elif [ "$$model" = 'rsp_code' ]; then \
			init="Code"; \
			flags=$$flags' -DCODE'; \
		fi; \
		for scenario in ${scenarios}; do \
			for tls in Tls NoTls; do \
				F=$$flags; \
				if [ "$$tls" = 'Tls' ]; then \
					F=$$F' -DUSE_TLS'; \
				fi; \
				# Reachability \
				f=$$F; \
				f=$$f' -DSEPARATE_ATTACKER_EUICC'; \
				cpp $$f -DREACH -P ${model_source} ./models/rsp-$$init-Scenario$$scenario-Reach-$$tls.pv; \
				# Authentication \
				for auth_goal in ${auth_goals}; do \
					f=$$F; \
					for separate_attacker in ${separate_attacker_euicc_for_goals}; do \
						if [[ "$$separate_attacker" == "$$auth_goal" ]]; then \
							f=$$f' -DSEPARATE_ATTACKER_EUICC'; \
						fi; \
				  done; \
					for separate_attacker_scenario in ${separate_attacker_euicc_for_scenarios}; do \
						if [[ "$$separate_attacker_scenario" == "$$scenario" ]]; then \
							f=$$f' -DSEPARATE_ATTACKER_EUICC'; \
						fi; \
				  done; \
					cpp $$f -DSCENARIO_$$scenario -DAUTH_$$auth_goal -P ${model_source} ./models/rsp-$$init-Scenario$$scenario-Auth$$auth_goal-$$tls.pv; \
				done; \
				# Secrecy \
				for sec_goal in ${sec_goals}; do \
					f=$$F; \
					for separate_attacker in ${separate_attacker_euicc_for_goals}; do \
						if [[ "$$separate_attacker" == "$$sec_goal" ]]; then \
							f=$$f' -DSEPARATE_ATTACKER_EUICC'; \
						fi; \
				  done; \
					for separate_attacker_scenario in ${separate_attacker_euicc_for_scenarios}; do \
						if [[ "$$separate_attacker_scenario" == "$$scenario" ]]; then \
							f=$$f' -DSEPARATE_ATTACKER_EUICC'; \
						fi; \
				  done; \
					cpp $$f -DSCENARIO_$$scenario -DSEC_$$sec_goal -P ${model_source} ./models/rsp-$$init-Scenario$$scenario-Sec$$sec_goal-$$tls.pv; \
				done; \
			done; \
		done; \
	done;

## Delete generated files
clean:
	read -p "Delete models? [y/n]: " del_models; \
	if [ $$del_models = "y" ] || [ $$del_models = "Y" ]; then \
		if [ "${host}" != "none" ]; then \
			ssh ${host} "rm -rf ~/models/"; \
		else \
			rm -rf ./models; \
		fi; \
	fi; \
	read -p "Delete logs? [y/n]: " del_logs; \
	if [ $$del_logs = "y" ] || [ $$del_logs = "Y" ]; then \
		if [ "${host}" != "none" ]; then \
			ssh ${host} "rm -rf ~/logs/"; \
		else \
			rm -rf ./logs; \
		fi; \
	fi; \

# Default values
oom=none
host=none

## Run one query in one model
verify:
	if [ "${host}" != "none" ]; then \
		ssh ${host} "mkdir -p ~/models"; \
		ssh ${host} "mkdir -p ~/logs"; \
		scp ./models/rsp-${init}-Scenario${scenario}-${goal}-${tls}.pv ${host}:~/models/; \
		if [ "${oom}" != "none" ]; then \
			ssh -n -f ${host} "proverif ~/models/rsp-${init}-Scenario${scenario}-${goal}-${tls}.pv > ./logs/rsp-${init}-Scenario${scenario}-${goal}-${tls}.log & echo ${oom} > /proc/\$$!/oom_score_adj &"; \
		else \
			ssh -n -f ${host} "proverif ~/models/rsp-${init}-Scenario${scenario}-${goal}-${tls}.pv > ./logs/rsp-${init}-Scenario${scenario}-${goal}-${tls}.log &"; \
		fi; \
	else \
		mkdir -p ./logs; \
		if [ "${oom}" != "none" ]; then \
			proverif ./models/rsp-${init}-Scenario${scenario}-${goal}-${tls}.pv > ./logs/rsp-${init}-Scenario${scenario}-${goal}-${tls}.log & echo $(oom) > /proc/$$!/oom_score_adj; \
		else \
			proverif ./models/rsp-${init}-Scenario${scenario}-${goal}-${tls}.pv > ./logs/rsp-${init}-Scenario${scenario}-${goal}-${tls}.log & echo; \
		fi; \
	fi;

## Show status of running queries
ps:
	if [ "${host}" != 'none' ]; then \
		echo "Running:"; \
		ssh ${host} 'ps -o pid,size,%mem,command ax | grep proveri\\\\f | sort -k4'; \
		echo; \
		ssh ${host} 'free -h'; \
		echo; \
		echo "Completed:"; \
		ssh ${host} 'for file in `find logs/*.log`; do grep -oP "(true)|(false)|(cannot be proved)|(\d+ rules)" $$file | echo "  "$$file" ("`tail -n 1`")"; done'; \
	else \
		ps -o pid,size,%mem,command ax | grep proveri\\\\f | sort -k4; \
		free -h; \
	fi;

## Retrieve results from host
retrieve:
	if [ "${host}" != "none" ]; then \
		mkdir -p ./logs/${host}; \
		read -p "Overwrite local logs? [y/n]: " overwrite_logs; \
		if [ $$overwrite_logs = "y" ] || [ $$overwrite_logs = "Y" ]; then \
			rsync -a ${host}:~/logs/*.log ./logs/${host}/; \
		else \
			rsync -a --ignore-existing ${host}:~/logs/*.log ./logs/${host}/; \
		fi; \
		for log in ./logs/${host}/*.log; do \
			res=`tail -4 $$log | grep -oP "(true\.)|(false\.)|(cannot be proved\.)|(still contradicts the query\.)"`; \
			if [ "$$res" != '' ]; then \
				cp $$log ./logs/; \
			fi; \
		done; \
	fi;

## Combine results into a table
results_table:
	read -p "Combine results? [y/n]: " combine_results; \
	if [ $$combine_results = "y" ] || [ $$combine_results = "Y" ]; then \
		python3 -c "import utils; utils.results_table_combined(combine=True)"; \
	else \
		python3 -c "import utils; utils.results_table_combined(combine=False)"; \
	fi;
