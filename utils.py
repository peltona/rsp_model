import os
import re

results='./RESULTS.md'

init = [
  "DefaultS",
  "Code",
]

scenarios = [
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
]

tls = [
  "NoTls",
  "Tls"
]

goals = [
  "Auth A", "Auth B", "Auth Bp", "Auth C", "Auth D", "Auth E",
  "Auth F", "Auth G", "Auth I", "Auth J", "Auth K",
  "Sec W", "Sec X", "Sec Y", "Sec Z",
  "Reach"
]

# Combine results into a table
def results_table_combined():
  if os.path.exists(results):
    os.remove(results)
  with open(results, 'a') as res:
    res.write("```T : True |  X : False |  ? : Cannot be proved | - : Missing " \
               "| O : TLS fixes attack | (O) : TLS fixes potential attack " \
               "| C : \"This clause still contradicts the query.\""\
               "```\n\n")
    for model in init:
      for combine in [True, False]:
        if combine:
          res.write(f"## {model}\n\n")
          res.write("### Combined results\n\n")
        else:
          res.write("### NoTLS/TLS\n\n")
        res.write("| Scenario |")
        lines = ['','']
        for goal in goals:
          lines[0] += '{}|'.format(str(goal).center(8, " "))
          lines[1] += ':------:|'
        res.write(lines[0])
        res.write('\n|:--------:|')
        res.write(lines[1])
        for scenario in scenarios[0:8] + scenarios[9:11] if model == "Code" else scenarios[:-2]:
          res.write('\n|{}|'.format(str(scenario).center(10, " ")))
          for goal in goals:
            query = goal.replace(" ", "").replace("'", "p")
            r = ''
            for t in tls:
              log_file = f'./logs/rsp-{model}-Scenario{scenario}-{query}-{t}.log'
              if os.path.isfile(log_file):
                with open(log_file, 'r') as log:
                  result = False
                  for line in log:
                    if line.rstrip().endswith('is true.'):
                      r += 'T'
                      result = True
                    elif line.rstrip().endswith('is false.'):
                      r += 'X'
                      result = True
                    elif line.rstrip().endswith('cannot be proved.'):
                      r += '?'
                      result = True
                    elif line.rstrip().endswith('contradicts the query.'):
                      r += 'C'
                      result = True
                    if result:
                      break
                  if not result:
                    r += '-'
              else:
                r += '-'
            # Write result to table
            if not combine:
              res.write(f'   {r}   |')
            else:
              combined_result = ''
              ## Same results with and without TLS
              if r[0] == r[1]:
                combined_result += ' {} '.format(r[0])
              ## No attack when TLS is disabled
              elif r[0] == 'T':
                combined_result += ' T '
              ## Attack with TLS enabled
              elif r[1] == 'X':
                combined_result += ' X '
              ## No TLS result
              elif r[1] == 'C':
                combined_result += ' C '
              ## TLS fixes an attack
              elif r[0] == 'X' and r[1] == 'T':
                combined_result += ' O '
              ## TLS fixes a potential attack
              elif ((r[0] == '?') or (r[0] == 'C')) and r[1] == 'T':
                combined_result += '(O)'
              ## Missing results
              else:
                combined_result += ' - '
              res.write(f'  {combined_result}   |')
        res.write("\n\n")
      results_table_time_memory(model=model, f=res)

# Combine results into a table
def results_table_time_memory(model='DefaultS', f=''):
  for t in tls:
    f.write(f"### Memory and time requirements ({t})\n\n")
    f.write("| Scenario |")
    lines = ['','']
    for goal in goals:
      lines[0] += '{}|'.format(str(goal).center(17, " "))
      lines[1] += ':---------------:|'
    f.write(lines[0])
    f.write('\n|:--------:|')
    f.write(lines[1])
    for scenario in scenarios[0:8] + scenarios[9:11] if model == "Code" else scenarios[:-2]:
      f.write('\n|{}|'.format(str(scenario).center(10, " ")))
      for goal in goals:
        query = goal.replace(" ", "").replace("'", "p")
        log_file = f'./logs/rsp-{model}-Scenario{scenario}-{query}-{t}.log'
        if os.path.isfile(log_file):
          with open(log_file, 'r') as log:
            r = ''
            time = 0.0
            for line in log:
              if line.strip().startswith('Command terminated'):
                r = "Killed (C)"
                break
              elif line.strip().startswith('User time (seconds):'):
                time += float(line.split(':')[1].rstrip())
              elif line.strip().startswith('System time (seconds):'):
                time += float(line.split(':')[1].rstrip())
                r += f"{round(time)}s / "
              elif line.strip().startswith('Maximum resident set size (kbytes):'):
                r += f"{round(int(line.split(':')[1]) / 1024)}MB"
            f.write('{}|'.format(r.center(17, " ")))
        else:
          f.write('{}|'.format("-".center(17, " ")))
    f.write('\n\n')
