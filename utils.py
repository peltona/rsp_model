import os
import re

# Combine results into a table
def results_table_combined(results='./RESULTS.md', combine=False):
  if os.path.exists(results):
    os.remove(results)
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
  with open(results, 'a') as res:
    for model in init:
      res.write(f'## {model}\n')
      res.write("```T : True |  X : False |  ? : Cannot be proved | - : Missing | O : TLS fixes attack | (O) : TLS fixes potential attack | C : \"This clause still contradicts the query.\"```\n\n")
      res.write("```\nCases:\n"\
        "  1: NoTLS\n"\
        "  2: TLS\n"\
        "```\n\n")
      res.write("| Scenario |")
      lines = ['','']
      for goal in goals:
        lines[0] += '{}|'.format(str(goal).center(8, " "))
        lines[1] += ':------:|'
      res.write(lines[0])
      res.write('\n|:--------:|')
      res.write(lines[1])
      for scenario in scenarios if model == "Code" else scenarios[:-2]:
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
                  if result:
                    break
                if not result:
                  if line.rstrip().endswith('contradicts the query.'):
                    r += 'C'
                  else:
                    r += '-'
            else:
              r += '-'
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
          # Write result to table
          if combine:
            res.write(f'  {combined_result}   |')
          else:
            res.write(f'   {r}   |')
      res.write("\n\n")
